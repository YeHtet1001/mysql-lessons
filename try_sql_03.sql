create table customer(
id int not null auto_increment PRIMARY KEY,
name VARCHAR(200) not null,
phone varchar(13) not null,
email varchar(60) not null,
address varchar(200) not null,
photo varchar(200),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP 
);
--modify column
alter table product MODIFY column price DECIMAL(10,2) not null;
--insert data
INSERT INTO customer(name,phone,email,address,photo)values('Ye Htet Aung','09886932803','yha.@.22.@gmail.com','Mingalardon Township,Yangon','');
INSERT INTO customer(name,phone,email,address,photo)values('Htet Htoo Aung','09665822371','hha.@.22.@gmail.com','Mingalardon Township,Yangon','hha.jpg');
INSERT INTO customer(name,phone,email,address,photo)values('Hein Min Lwin','09665822372','hml.@.23.@gmail.com','Hlaing Township,Yangon','hml.jpg');
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table product(
id int not null auto_increment PRIMARY KEY,
product varchar(200) not null,
price DOUBLE not null,
description text,
stockQuantity int not null,
category varchar(200),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP 
);
INSERT INTO Product (product, price, description, stockQuantity, category)
VALUES ('Laptop', 1200.99, 'High-performance laptop with 16GB RAM and 512GB SSD', 50, 'Electronics');
INSERT INTO Product (product, price, description, stockQuantity, category)
VALUES ('Smartphone', 799.99, 'Latest smartphone with 128GB storage and 5G support', 100, 'Electronics');
INSERT INTO Product (product, price, description, stockQuantity, category)
VALUES ('Headphones', 199.99, 'Noise-cancelling over-ear headphones with Bluetooth', 75, 'Accessories');
INSERT INTO Product (product, price, description, stockQuantity, category)
VALUES ('Tablet', 499.99, '10-inch tablet with 64GB storage and stylus support', 30, 'Electronics');
INSERT INTO Product (product, price, description, stockQuantity, category)
VALUES ('Smartwatch', 299.99, 'Fitness tracker with heart rate monitor and GPS', 60, 'Wearables');
INSERT INTO Product (product, price, description, stockQuantity, category)
VALUES ('Camera', 899.99, 'Mirrorless camera with 24MP sensor and 4K video recording', 25, 'Photography');
INSERT INTO Product (product, price, description, stockQuantity, category)
VALUES ('Gaming Console', 499.99, 'Next-gen gaming console with 1TB storage', 40, 'Gaming');
INSERT INTO Product (product, price, description, stockQuantity, category)
VALUES ('Printer', 199.99, 'Wireless all-in-one printer with scanning and copying', 35, 'Office Supplies');
INSERT INTO Product (product, price, description, stockQuantity, category)
VALUES ('Monitor', 349.99, '27-inch 4K UHD monitor with HDR support', 20, 'Electronics');
INSERT INTO Product (product, price, description, stockQuantity, category)
VALUES ('Keyboard', 99.99, 'Mechanical gaming keyboard with RGB lighting', 80, 'Accessories');
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table orderItem(
id int not null auto_increment PRIMARY key,
customer_id int not null,
product_id int not NULL,
ordered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN key( customer_id ) REFERENCES customer(id) on DELETE CASCADE,
FOREIGN KEY( product_id ) REFERENCES product(id) on DELETE CASCADE
);
--add column
alter table orderItem add column quantity int not null;
--update data
update orderItem set quantity = 2 where id = 3 ;

insert orderItem( customer_id , product_id ) VALUES ( 1 , 1 );
insert orderItem( customer_id , product_id ) VALUES ( 1 , 7 );
insert orderItem( customer_id , product_id ) VALUES ( 1 , 9 );
insert orderItem( customer_id , product_id ) VALUES ( 1 , 10 );
insert orderItem( customer_id , product_id , quantity ) VALUES ( 2 , 2 , 1);
insert orderItem( customer_id , product_id , quantity ) VALUES ( 2 , 3 ,1);
insert orderItem( customer_id , product_id , quantity ) VALUES ( 2 , 4 ,1);
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--for testing query

select 
p.id,
p.product,
p.price,
p.stockQuantity
from product p
where p.price <= 600;

select 
p.id,
p.product,
p.price,
p.stockQuantity
from product p
where p.price > 600;

select 
o.id,
c.name,
p.product,
p.price,
p.description,
p.category
from 
orderItem o
left join product p 
on o.product_id = p.id
left join customer c
on o.customer_id = c.id ;


select 
( ROW_NUMBER() over(order by c.name)) as No,
c.name,
count(p.product) as total_product,
sum(p.price) as total_price,
count(o.quantity) as total_quantity,
o.ordered_at
from 
orderItem o
left join product p 
on o.product_id = p.id
left join customer c
on o.customer_id = c.id
GROUP by c.name , o.ordered_at ;

select 
p.product ,
sum( o.quantity ) as total
FROM
product p
left join 
orderItem o
on p.id = o.product_id
GROUP by p.product;

select 
c.name,
p.product,
max(p.price) as price,
max(p.category) as category,
sum(o.quantity) as total
FROM
customer c
left join
orderItem o
on c.id = o.customer_id 
left join
product p
on p.id = o.product_id
GROUP BY c.name , p.product , o.quantity
order by o.quantity desc
;

SELECT 
    c.name,
    p.product,
    p.price,
    p.category,
    o.quantity
FROM
    customer c
LEFT JOIN
    orderItem o ON c.id = o.customer_id 
LEFT JOIN
    product p ON p.id = o.product_id
ORDER BY 
    o.quantity DESC;