---#THIS IS THE STAGING AREA, WHERE WE ARE GOING TO DUMP THE FILE'S DATA#
---#CREATE DATABASE PROJECT;
USE PROJECT;

---#drop table tbl_stg_film;
create table tbl_stg_film
(
film_id smallint,
title varchar(128),
description text,
release_year year,
language_id tinyint,
original_language_id tinyint,
rental_duration tinyint,
rental_rate decimal(4,2),
length smallint,
replacement_cost decimal(5,2),
rating varchar(5),
special_features varchar(20),
last_update timestamp
);

---#drop table tbl_stg_film_actor;
create table tbl_stg_film_actor
(
actor_id smallint,
film_id smallint,
last_update timestamp
);

---#drop table tbl_stg_film_category;
create table tbl_stg_film_category
(
film_id smallint,
category_id tinyint,
last_update timestamp
);

---#drop table tbl_stg_film_text;
create table tbl_stg_film_text
(
film_id smallint,
title varchar(255),
description text
);

---#drop table tbl_stg_language;
create table tbl_stg_language
(
language_id tinyint,
name char(20),
last_update timestamp
);

---#drop table tbl_stg_actor;
create table tbl_stg_actor
(
actor_id smallint,
first_name varchar(45),
last_name varchar(45),
last_update timestamp
);

---#drop table tbl_stg_category;
create table tbl_stg_category
(
category_id tinyint,
name varchar(25),
last_update timestamp
);

---#drop table tbl_stg_inventory;
create table tbl_stg_inventory
(
inventory_id mediumint,
film_id smallint,
store_id tinyint,
last_update timestamp
);

---#drop table tbl_stg_rental;
create table tbl_stg_rental
(rental_id int,
rental_date datetime,
inventory_id mediumint,
customer_id smallint,
return_date datetime,
staff_id tinyint,
last_update timestamp
);

---#drop table tbl_stg_store;
create table tbl_stg_store
(
store_id tinyint,
manager_staff_id tinyint,
address_id smallint,
last_update timestamp
);

---#drop table tbl_stg_customer;
create table tbl_stg_customer
(
customer_id smallint,
store_id tinyint,
first_name varchar(45),
last_name varchar(45),
email varchar(50),
address_id smallint,
active boolean,
create_date datetime,
last_update timestamp
);

---#drop table tbl_stg_payment;
create table tbl_stg_payment
(
payment_id smallint,
customer_id smallint,
staff_id tinyint,
rental_id int,
amount decimal(5,2),
payment_date datetime,
last_update timestamp
);

---#drop table tbl_stg_address;
create table tbl_stg_address
(
address_id smallint,
address varchar(50),
address2 varchar(50),
district varchar(20),
city_id smallint,
postal_code varchar(10),
phone varchar(20),
last_update timestamp
);

---#drop table tbl_stg_staff;
create table tbl_stg_staff
(
staff_id tinyint,
first_name varchar(45),
last_name varchar(45),
address_id smallint,
picture blob,
email varchar(50),
store_id tinyint,
active boolean,
username varchar(16),
password varchar(40),
last_update timestamp
);

---#drop table tbl_stg_city;
create table tbl_stg_city
(
city_id smallint,
city varchar(50),
country_id smallint,
last_update timestamp
);

---#drop table tbl_stg_country;
create table tbl_stg_country
(
country_id smallint,
country varchar(50),
last_update timestamp
);

use project;
select * from tbl_stg_film;

select * from tbl_stg_category;
select * from tbl_stg_address;
select * from tbl_stg_actor;
select * from tbl_stg_city;
select * from tbl_stg_country;
select * from tbl_stg_customer;
select * from tbl_stg_film_actor;
select * from tbl_stg_film_category;
select * from tbl_stg_film_text;
select * from tbl_stg_inventory;
select * from tbl_stg_language;
select * from tbl_stg_payment;
select * from tbl_stg_rental;
select * from tbl_stg_staff;
select * from tbl_stg_store;
