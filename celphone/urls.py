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
from store.views import (
    home,
    user_login,
    user_logout,
    user_signup,
    cart,
    add_to_cart,
    product_detail,
    remove_from_cart,
    buy,
    search_product,
    filter_product,
    search_and_filter,
    password_reset,
    password_reset_request,
)

urlpatterns = [
    path("admin/", admin.site.urls),
    path("", home, name="home"),
    path("login/", user_login, name="user_login"),
    path("logout/", user_logout, name="user_logout"),
    path("signup/", user_signup, name="signup"),
    path("cart/", cart, name="cart"),
    path("add_to_cart/<int:product_id>/", add_to_cart, name="add_to_cart"),
    path("product-detail/<int:product_id>/", product_detail, name="product_detail"),
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
    path("search/", search_product, name="search_product"),
    path("filter/", filter_product, name="filter_product"),
    path("search/filter/", search_and_filter, name="search_and_filter_product"),
    path(
        "password-reset-request/", password_reset_request, name="password_reset_request"
    ),
    path("password-reset/<str:token>/", password_reset, name="password_reset"),
]
