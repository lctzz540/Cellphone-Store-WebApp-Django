from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils import timezone


class Product(models.Model):
    id = models.AutoField(primary_key=True)
    image_link = models.CharField(max_length=255)
    product_name = models.CharField(max_length=255)
    screen = models.CharField(max_length=255)
    RAM = models.CharField(max_length=255)
    ROM = models.CharField(max_length=255)
    price = models.CharField(max_length=255)
    price_int = models.IntegerField()


class User(AbstractUser):
    phone_number = models.CharField(max_length=20)
    address = models.TextField()
    groups = models.ManyToManyField(
        "auth.Group",
        related_name="store_user_set",
        blank=True,
        help_text="The groups this user belongs to. A user will get all permissions granted to each of their groups.",
        verbose_name="groups",
    )
    user_permissions = models.ManyToManyField(
        "auth.Permission",
        related_name="store_user_set",
        blank=True,
        help_text="Specific permissions for this user.",
        verbose_name="user permissions",
    )

    @property
    def is_authenticated(self):
        return self.is_active


class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    phone_number = models.CharField(max_length=20)
    address = models.CharField(max_length=255)


class Cart(models.Model):
    STATUS_CHOICES = (
        ("NOTCLOSED", "Not closed"),
        ("PENDING", "Pending"),
        ("CONFIRMED", "Confirmed"),
        ("SHIPPING", "Shipping"),
        ("ALREADY", "Already"),
    )

    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="carts")
    products = models.ManyToManyField(Product, through="CartItem")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    status = models.CharField(
        max_length=20, choices=STATUS_CHOICES, default="NOTCLOSED"
    )

    def __str__(self):
        return f"Cart for {self.user.username}"

    def get_total(self):
        total = 0
        for cart_item in self.cartitem_set.all():
            total += cart_item.get_subtotal()
        return "{:,}₫".format(total).replace(",", ".")


class CartItem(models.Model):
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)

    def __str__(self):
        return f"CartItem: {self.product.name} - Quantity: {self.quantity}"

    def get_subtotal(self):
        price = self.product.price.replace(".", "").replace("₫", "")
        return int(price) * self.quantity

    def get_total(self):
        price = self.product.price.replace(".", "").replace("₫", "")
        total = int(price) * self.quantity
        return "{:,}".format(total).replace(",", ".")


class PasswordResetRequest(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    token = models.CharField(max_length=255)
    timestamp = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return f"Password Reset Request for {self.user.username}"
