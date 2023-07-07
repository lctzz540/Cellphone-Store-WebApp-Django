from django.contrib import admin
from .models import User, Product, Cart, CartItem


class CartItemInline(admin.TabularInline):
    model = CartItem
    extra = 0


class CartAdmin(admin.ModelAdmin):
    list_display = (
        "id",
        "user",
        "get_phone_number",
        "get_address",
        "get_cart_items",
        "get_cart_total",
        "created_at",
        "status",
    )
    list_filter = ("status",)  # Add filter by status
    # Make the status field editable in the list view
    list_editable = ("status",)
    inlines = [CartItemInline]

    def get_phone_number(self, obj):
        return obj.user.phone_number

    get_phone_number.short_description = "Phone Number"

    def get_address(self, obj):
        return obj.user.address

    get_address.short_description = "Address"

    def get_cart_items(self, obj):
        return ", ".join(
            [
                str(item.product.product_name) + " x " + str(item.quantity)
                for item in obj.cartitem_set.all()
            ]
        )

    get_cart_items.short_description = "Cart Items"

    def get_cart_total(self, obj):
        return obj.get_total()

    get_cart_total.short_description = "Total"


class ProductAdmin(admin.ModelAdmin):
    list_display = ("product_name", "price")


admin.site.register(Product, ProductAdmin)
admin.site.register(User)
admin.site.register(Cart, CartAdmin)
