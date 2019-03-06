create database grizzly_store;
use grizzly_store;

 

create table product_management
(
   product_id int not null auto_increment,
   product_name varchar(100),
   product_brand varchar(100),
   product_description varchar(1000),
   product_category varchar(100),
   product_rating real,
   product_price real,
   primary key(product_id)
);
 

alter table product_management auto_increment=1;
drop table product_management;
insert into product_management(product_name,product_brand,product_description,product_category,product_rating,product_price) values ('Trimmer','Philips','Wireless','Personal Care',4.7,1350.00),('Shaver','Braun','Personal Care','Multi-dimensional',4.8,4700.00),('Macbook Pro','Apple','Laptops','Very Compact',4.9,153000.00),('iMac 27"','Apple','Laptops','Professional Laptops',4.7,97000.00),('Micro Pens','Sakura Pigma','Art Supplies','Stylish Looks',4.3,450.00),('Paint Markers','Copic','Art Supplies','Smooth in work',4.2,4200.00);
select * from product_management;
update product_management set product_name='Paint Markers' where product_id=10;
delete from product_management where product_id = 1;

 
create table inventory_management
(
   inventory_buffer int,
   inventory_stock int,
   product_id int references product_management (product_id)
);
 

drop table inventory_management;
insert into inventory_management values (45,34,1),(10,23,2),(5,15,3),(5,12,4),(75,60,5),(60,45,6);
select * from inventory_management;
update inventory_management set inventory_stock = 5 where product_id=2;
 

select p.product_id,p.product_name,p.product_brand,p.product_description,p.product_category,p.product_rating,p.product_price,i.inventory_buffer,i.inventory_stock
from product_management p,inventory_management i
where p.product_id=i.product_id;
 

create table login_user
(
    login_username varchar(50),
    login_password varchar(50),
    login_role varchar(50),
    login_rating varchar(5),
    login_contact varchar(50),
    login_address varchar(50),
    login_status varchar(10),
    primary key(login_username)
);
 

drop table login_user;
insert into login_user values ('Rishabh','Rishabh','Vendor',4.0,'9000000002','M.P.','enabled');
select * from login_user;
select * from login_user where login_username='Pratik';
update login_user set login_status='enabled' where login_username='Rishabh';

