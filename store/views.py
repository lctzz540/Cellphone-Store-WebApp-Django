from django.contrib.auth.hashers import make_password
from django.contrib import messages
from django.contrib.auth import login, logout
from django.contrib.auth.forms import AuthenticationForm
from .form import UserCreationForm
from django.shortcuts import render, redirect, get_object_or_404
from .models import Product, User, Cart, CartItem
from .backends import CustomUserModelBackend
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_protect
from django.core.mail import send_mail
from django.utils.crypto import get_random_string
from .models import PasswordResetRequest


def home(request):
    products = Product.objects.all()
    return render(request, "home.html", {"products": products})


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
                login(
                    request, user, backend="django.contrib.auth.backends.ModelBackend"
                )
                return redirect("home")
        else:
            print(form.errors)
    else:
        form = AuthenticationForm()
    return render(request, "login.html", {"form": form})


def user_logout(request):
    logout(request)
    return redirect("home")


def product_detail(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    return render(request, "product_detail.html", {"product": product})


@login_required
def cart(request):
    try:
        cart = Cart.objects.get(user=request.user)
        cart_items = cart.cartitem_set.all()
    except Cart.DoesNotExist:
        cart = None
        cart_items = None
        message = "Your cart is empty. Please add items to your cart before proceeding."
        return render(request, "cart.html", {"message": message})

    return render(request, "cart.html", {"cart": cart, "cart_items": cart_items})


@login_required
def add_to_cart(request, product_id):
    user = request.user
    product = get_object_or_404(Product, id=product_id)

    cart, created = Cart.objects.get_or_create(user=user)

    cart_item, item_created = CartItem.objects.get_or_create(cart=cart, product=product)

    if not item_created:
        cart_item.quantity += 1
        cart_item.save()
    return redirect("cart")


@csrf_protect
@login_required
def remove_from_cart(request, cart_item_id):
    cart_item = get_object_or_404(CartItem, id=cart_item_id)

    if cart_item.quantity > 1:
        cart_item.quantity -= 1
        cart_item.save()
    else:
        cart_item.delete()

    return redirect("cart")


@csrf_protect
@login_required
def buy(request, cart_id):
    cart = get_object_or_404(Cart, id=cart_id)
    cart.status = "PENDING"
    cart.save()
    return redirect("cart")


def search_product(request):
    if request.method == "GET":
        product_name = request.GET.get("product_name")
        products = Product.objects.filter(product_name__icontains=product_name)
        return render(request, "search_results.html", {"products": products})


def filter_product(request):
    min_price = request.GET.get("min_price")
    max_price = request.GET.get("max_price")

    products = Product.objects.all()

    if min_price:
        products = products.filter(price_int__gte=int(min_price))

    if max_price:
        products = products.filter(price_int__lte=int(max_price))

    return render(request, "search_results.html", {"products": products})


def search_and_filter(request):
    if request.method == "GET":
        product_name = request.GET.get("product_name")
        min_price = request.GET.get("min_price")
        max_price = request.GET.get("max_price")

        products = Product.objects.all()

        if product_name:
            products = products.filter(product_name__icontains=product_name)

        if min_price:
            products = products.filter(price_int__gte=int(min_price))

        if max_price:
            products = products.filter(price_int__lte=int(max_price))

        return render(request, "search_results.html", {"products": products})


def password_reset_request(request):
    if request.method == "POST":
        email = request.POST.get("email")
        try:
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            # Handle case where email is not found
            return render(
                request, "password_reset_request.html", {"message": "Email not found."}
            )

        # Generate a unique token
        token = get_random_string(length=32)

        # Save the password reset request in the database
        reset_request = PasswordResetRequest(user=user, token=token)
        reset_request.save()

        # Send email with password reset link
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

        # Delete the password reset request from the database
        reset_request.delete()

        messages.success(
            request,
            "Password reset successful. You can now log in with your new password.",
        )
        return redirect("login")

    return render(request, "password_reset.html", {"token": token})
