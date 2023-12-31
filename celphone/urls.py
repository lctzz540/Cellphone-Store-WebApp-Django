"""
URL configuration for celphone project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from store.views.page import home, product_detail
from store.views.cart import (
    cart,
    add_to_cart,
    remove_from_cart,
    buy,
    create_cart,
    delete_cart,
    paypal,
)
from store.views.product import search_product, filter_product, search_and_filter
from store.views.user import (
    user_signup,
    user_login,
    user_logout,
    user_profile,
    password_reset_request,
    password_reset,
)


urlpatterns = [
    path("admin/", admin.site.urls),
    path("", home, name="home"),
    path("login/", user_login, name="user_login"),
    path("logout/", user_logout, name="user_logout"),
    path("signup/", user_signup, name="signup"),
    path("cart/", cart, name="cart"),
    path("add_to_cart/<int:product_id>/", add_to_cart, name="add_to_cart"),
    path("cart/delete/<int:cart_id>/", delete_cart, name="delete_cart"),
    path("product-detail/<int:product_id>/",
         product_detail, name="product_detail"),
    path(
        "remove_from_cart/<int:cart_item_id>/",
        remove_from_cart,
        name="remove_from_cart",
    ),
    path(
        "buy/<int:cart_id>/",
        buy,
        name="buy",
    ),
    path(
        "payment-success/<int:cart_id>/",
        buy,
        name="payment-success",
    ),
    path("search/", search_product, name="search_product"),
    path("filter/", filter_product, name="filter_product"),
    path("search/filter/", search_and_filter,
         name="search_and_filter_product"),
    path(
        "password-reset-request/", password_reset_request, name="password_reset_request"
    ),
    path("password-reset/<str:token>/", password_reset, name="password_reset"),
    path("profile/", user_profile, name="user_profile"),
    path("create-cart/", create_cart, name="create_cart"),
    path("paypal/<int:cart_id>/", paypal, name="paypal"),
]
