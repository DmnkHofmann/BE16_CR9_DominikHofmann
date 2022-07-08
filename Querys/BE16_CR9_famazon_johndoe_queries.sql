Query 1: What product has each owner bought

SELECT user.username, products.name FROM `user` 
INNER JOIN `carts` on carts.user_id = user.id 
INNER JOIN `cart_products` on cart_products.cart_id = carts.id 
INNER JOIN `products` on cart_products.product_id = products.id

Query 2: What creditcard has a user used 

SELECT user.username, payment.creditcard FROM `user` 
INNER JOIN `carts` on carts.user_id = user.id 
INNER JOIN `orders` on orders.cart_id = carts.id 
INNER JOIN `payment` on orders.payment_id = payment.id

Query 3: Number of orders 

SELECT count(*) from orders;

Query 4: Company countries

SELECT companies.name, adress.country from companies
INNER JOIN `companiy_adresses` on companiy_adresses.company_id = companies.id
INNER JOIN `adress` on adress.id = companiy_adresses.adress_id

Query 5: Get user emails

SELECT user.email FROM user;

Query 6: Get all company products

SELECT products.name as product_name, companies.name FROM products
INNER JOIN `companies` ON companies.id = products.company_id

Query 7: Select Scooter from DB. Hyper Hyper

SELECT * from user where id = 3;







