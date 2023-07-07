from store.models import Product
from django.shortcuts import render


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
