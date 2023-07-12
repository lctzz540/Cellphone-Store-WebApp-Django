from django.contrib.auth import login, logout
from django.contrib.auth.forms import AuthenticationForm
from store.backends import CustomUserModelBackend
from django.shortcuts import render, redirect
from store.forms import UserCreationForm, UserProfileForm
from store.models import User, PasswordResetRequest
from django.views.decorators.csrf import csrf_protect
from django.contrib.auth.decorators import login_required
from django.core.mail import send_mail
from django.utils.crypto import get_random_string
from django.contrib import messages
from django.contrib.auth.hashers import make_password


def user_signup(request):
    if request.method == "POST":
        form = UserCreationForm(request.POST)

        if form.is_valid():
            phone_number = form.cleaned_data.get("phone_number", "")
            address = form.cleaned_data.get("address")

            if not phone_number:
                form.add_error("phone_number", "Phone number is required.")

            if form.errors:
                print("Form is not valid:", form.errors)
            else:
                user = User.objects.create_user(
                    username=form.cleaned_data["username"],
                    password=form.cleaned_data["password1"],
                    phone_number=phone_number,
                    address=address,
                )

                login(request, user)

                return redirect("home")
        else:
            print("Form is not valid:", form.errors)
            messages.error(
                request, "Error during signup. Please check the form fields."
            )

    else:
        form = UserCreationForm()
    return render(request, "signup.html", {"form": form})


@csrf_protect
def user_login(request):
    if request.method == "POST":
        form = AuthenticationForm(request, data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get("username")
            password = form.cleaned_data.get("password")
            user = CustomUserModelBackend().authenticate(
                request, username=username, password=password
            )
            if user is not None:
                login(request, user, backend="store.backends.CustomUserModelBackend")
                return redirect("home")
        else:
            print(form.errors)
            messages.error(request, "Invalid username or password")
    else:
        form = AuthenticationForm()
    return render(request, "login.html", {"form": form})


def user_logout(request):
    logout(request)
    return redirect("home")


def password_reset_request(request):
    if request.method == "POST":
        email = request.POST.get("email")
        try:
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            return render(
                request, "password_reset_request.html", {"message": "Email not found."}
            )

        token = get_random_string(length=32)

        reset_request = PasswordResetRequest(user=user, token=token)
        reset_request.save()

        reset_link = f"http://{request.get_host()}/password-reset/{token}"
        send_mail(
            "Password Reset",
            f"Click the link below to reset your password: {reset_link}",
            "sender@example.com",
            [email],
            fail_silently=False,
        )

        return render(
            request,
            "password_reset_request.html",
            {"message": "Password reset link sent."},
        )

    return render(request, "password_reset_request.html")


def password_reset(request, token):
    try:
        reset_request = PasswordResetRequest.objects.get(token=token)
    except PasswordResetRequest.DoesNotExist:
        # Handle case where token is not found
        messages.error(request, "Invalid token.")
        return redirect("password_reset_request")

    if request.method == "POST":
        password = request.POST.get("password")
        confirm_password = request.POST.get("confirm_password")

        if password != confirm_password:
            # Handle case where passwords do not match
            messages.error(request, "Passwords do not match.")
            return redirect("password_reset", token=token)

        user = reset_request.user
        user.password = make_password(password)
        user.save()

        reset_request.delete()

        messages.success(
            request,
            "Password reset successful. You can now log in with your new password.",
        )
        return redirect("user_login")

    return render(request, "password_reset.html", {"token": token})


@login_required
def user_profile(request):
    user = request.user
    if request.method == "POST":
        form = UserProfileForm(request.POST, instance=user)
        if form.is_valid():
            form.save()
            return redirect("user_profile")
    else:
        form = UserProfileForm(instance=user)

    return render(request, "profile.html", {"form": form})
