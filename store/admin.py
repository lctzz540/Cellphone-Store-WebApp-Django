from django.contrib import admin
from store.models import User, Product, Cart, CartItem


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
        "payment_method",
        "status",
    )
    list_filter = ("status",)
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

    def get_queryset(self, request):
        queryset = super().get_queryset(request)
        return queryset.exclude(status="NOTCLOSED")


class ProductAdmin(admin.ModelAdmin):
    list_display = ("product_name", "price")


admin.site.register(Product, ProductAdmin)
admin.site.register(User)
admin.site.register(Cart, CartAdmin)
