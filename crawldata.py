from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException
import mysql.connector
import time

options = webdriver.ChromeOptions()
options.binary_location = "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
options.add_argument("--disable-extensions")
options.add_argument("--disable-gpu")
options.add_argument("--headless")

driver = webdriver.Chrome(options=options)

url = "https://cellphones.com.vn/mobile.html"

driver.get(url)
product_list = []
for _ in range(10):
    try:
        driver.find_element(
            By.CLASS_NAME,
            "button.btn-show-more.button__show-more-product",
        ).click()
        time.sleep(1)
    except:
        time.sleep(1)
        continue
for i in range(1000):
    try:
        product_path = (
            '//*[@id="layout-desktop"]/div[3]/div[2]/div/div[6]/div[5]/div/div[1]/div['
        ) + str(i + 1)
        product_info = {}
        product_info["image_link"] = driver.find_element(
            By.XPATH,
            product_path + "]/div[1]/a/div[1]/img",
        ).get_attribute("src")
        product_info["product_name"] = driver.find_element(
            By.XPATH,
            product_path + "]/div[1]/a/div[2]/h3",
        ).text
        product_info["screen"] = driver.find_element(
            By.XPATH,
            product_path + "]/div[1]/a/div[3]/p[1]",
        ).text
        product_info["RAM"] = driver.find_element(
            By.XPATH,
            product_path + "]/div[1]/a/div[3]/p[2]",
        ).text
        product_info["ROM"] = driver.find_element(
            By.XPATH,
            product_path + "]/div[1]/a/div[3]/p[3]",
        ).text
        product_info["price"] = driver.find_element(
            By.XPATH,
            product_path + "]/div[1]/a/div[4]/div/p[1]",
        ).text
    except NoSuchElementException:
        continue
    product_list.append(product_info)

driver.quit()

cnx = mysql.connector.connect(
    host="192.168.1.3",
    user="root",
    password="celphone",
    database="store",
)

# Create a cursor object to interact with the database
cursor = cnx.cursor()

# Check existence and remove duplicates
existing_products = set()
for product in product_list:
    select_query = "SELECT id FROM store_product WHERE product_name = %s"
    cursor.execute(select_query, (product["product_name"],))
    result = cursor.fetchone()
    if result:
        existing_products.add(result[0])
    else:
        insert_query = """
        INSERT INTO store_product (image_link, product_name, screen, RAM, ROM, price, price_int)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        data = (
            product["image_link"],
            product["product_name"],
            product["screen"],
            product["RAM"],
            product["ROM"],
            product["price"],
            int(product["price"].replace(".", "").replace("₫", "")),
        )
        cursor.execute(insert_query, data)

cnx.commit()
cursor.close()
cnx.close()

print(len(product_list))
print("Data saved to MySQL database.")
