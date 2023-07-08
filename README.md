# Cellphone Store Web Application

This is a web application for a cellphone store. It allows users to view and search for products, add products to their cart, and perform various actions related to their cart.

## Features

- User authentication: Users can sign up, log in, and log out.
- Data: Crawl product data & add into database, you can also add manually in the admin page.
- Product browsing: Users can view a list of available products and search for products by name or by range of price.
- Cart functionality: Users can add products to their cart, view the contents of their cart, and proceed to checkout.
- Password reset: Users can request a password reset if they forget their password.

## Installation

1. Clone the repository:

   ```shell
   git clone https://gitlab.com/lctzz540/cellphonestore
   ```

   Install the required dependencies:

   ```shell
   pip install -r requirements.txt
   ```

   Set up the database and crawl product data:

   ```shell
   python manage.py migrate
   python crawldata.py
   ```

   Start the development server:

   ```shell
   python manage.py runserver
   ```

   Access the application in your web browser at <http://localhost:8000>.

2. Dump data:
   You can also use data which is crawled by load the `database_dump.sql`. Or you can use it if you have issues about database

3. Add admin:

   Run Command below for adding admin (login to /admin):

   ```shell
   python manage.py createsuperuser
   ```

## Usage

- Sign up for a new account or log in with your existing credentials.
- Browse the list of products and search for specific products by name or by range of price.
- Add products to your cart and view the contents of your cart.
- Proceed to checkout and complete the purchase.
- If you forget your password, you can request a password reset.
