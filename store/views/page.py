from store.models import Product
from django.shortcuts import render, get_object_or_404


def home(request):
    products = Product.objects.all()
    return render(request, "home.html", {"products": products})


def product_detail(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    return render(request, "product_detail.html", {"product": product})
