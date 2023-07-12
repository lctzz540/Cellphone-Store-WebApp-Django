from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_protect
from django.shortcuts import render, redirect, get_object_or_404
from store.models import Product, Cart, CartItem


@login_required
def cart(request):
    carts = Cart.objects.filter(user=request.user)
    cart_items = []
    if carts.exists():
        for cart in carts:
            cart_items.append(cart.cartitem_set.all())
    else:
        message = "Your cart is empty. Please add items to your cart before proceeding."
        return render(request, "cart.html", {"message": message})

    return render(request, "cart.html", {"carts": carts, "cart_items": cart_items})


@login_required
def add_to_cart(request, product_id):
    user = request.user
    product = get_object_or_404(Product, id=product_id)

    carts = Cart.objects.filter(user=user, status="NOTCLOSED")
    if carts.exists():
        cart = carts.last()
    else:
        cart = Cart.objects.create(user=user)

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
    cart.payment_method = "CASH"
    cart.save()
    return redirect("cart")


@csrf_protect
@login_required
def paypal(request, cart_id):
    cart = get_object_or_404(Cart, id=cart_id)
    cart.status = "PENDING"
    cart.payment_method = "PAYPAL"
    cart.save()
    return redirect("cart")


@login_required
def create_cart(request):
    Cart.objects.create(user=request.user)
    return redirect("cart")


@login_required
def delete_cart(request, cart_id):
    cart = get_object_or_404(Cart, id=cart_id)

    if cart.status == "PENDING":
        cart.delete()

    return redirect("cart")
