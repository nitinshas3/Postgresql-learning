-- create a one to many and many to many relationship in a shopping store context using 4 tables 

-- customers , orders , products , ord_items

-- many to many relationships have 2 tables and a third table to show relationship between them

CREATE TABLE customers (
    cust_id SERIAL PRIMARY KEY,
    cust_name VARCHAR(100) NOT NULL
);

INSERT INTO customers (cust_name)
VALUES
    ('Raju'), ('Sham'), ('Paul'), ('Alex');
CREATE TABLE orders (
    ord_id SERIAL PRIMARY KEY,
    ord_date DATE NOT NULL,
    cust_id INTEGER NOT NULL,
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

INSERT INTO orders (ord_date, cust_id)
VALUES
    ('2024-01-01', 1),  -- Raju first order
    ('2024-02-01', 2),  -- Sham first order
    ('2024-03-01', 3),  -- Paul first order
    ('2024-04-04', 2);  -- Sham second order

CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    ord_id INTEGER NOT NULL,
    p_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (ord_id) REFERENCES orders(ord_id),
    FOREIGN KEY (p_id) REFERENCES products(p_id)
);

INSERT INTO order_items (ord_id, p_id, quantity)
VALUES
    (1, 1, 1),  -- Raju ordered 1 Laptop
    (1, 4, 2),  -- Raju ordered 2 Cables
    (2, 1, 1),  -- Sham ordered 1 Laptop
    (3, 2, 1),  -- Paul ordered 1 Mouse
    (3, 4, 5),  -- Paul ordered 5 Cables
    (4, 3, 1);  -- Sham ordered 1 Keyboard


CREATE TABLE products (
    p_id SERIAL PRIMARY KEY,
    p_name VARCHAR(100) NOT NULL,
    price NUMERIC NOT NULL
);

INSERT INTO products (p_name, price)
VALUES
    ('Laptop', 55000.00),
    ('Mouse', 500),
    ('Keyboard', 800.00),
    ('Cable', 250.00)
;

-- accessing , creating billing table from just numeric tables

select * from order_items oi 
join products p 
ON oi.p_id = p.p_id; -- like if you do * all the columns from all 3 tables whose row match will be shown so be spefiic which column we want 

select p.p_name,oi.quantity from order_items oi 
join products p 
ON oi.p_id = p.p_id;

-- now we got product name and quantity now we need order date also so level up and jin order also 

select p.p_name,oi.quantity,c.cust_name,(oi.quantity*p.price) as total_price from order_items oi 
join products p 
ON oi.p_id = p.p_id
join orders o 
on  oi.ord_id = o.ord_id
join customers c
on  o.cust_id = c.cust_id;

-- so basically there will be many tables and some tables to store the relaionship between them using simple columns like id etc they dont store every detail of other tables , so when we need to show all teh details of their relationship we use these things 

--VIEWS
-- this is a big query so we can save this query with a name by using that name we can run this query anytime 

create view billing_info as 
-- under this the whole query 

--later use 
select * from billing_info;

-- this does not change the data like does not create a new table , just to give query a name , when we use \dv it shows this in views sectino