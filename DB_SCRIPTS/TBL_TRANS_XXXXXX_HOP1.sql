/*THIS IS THE HOP1 TRANSFORMATION AREA, WHERE WE ARE GOING TO MODIFY 
THE EXISTING COLUMNS BASED ON THE REQUIREMENTS DATA*/
USE PROJECT;
DROP TABLE TBL_TRANS_ACTOR_HOP1;
CREATE TABLE TBL_TRANS_ACTOR_HOP1
(actor_id smallint,
first_name varchar(45),
last_name varchar(45),
last_update timestamp
);

Insert into tbl_trans_actor_hop1
select actor_id,
concat(first_name,' ',last_name) as actor_name,
last_update
from tbl_stg_actor;

alter table tbl_trans_actor_hop1
 drop column last_update;
 drop table tnl_trans_address_hop1;
 select * from tbl_trans_actor_hop1;
 
 create table tnl_trans_address_hop1
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

insert into tnl_trans_address_hop1
select address_id,
address,
address2,
district,
city_id,
ifnull(postal_code,0),
ifnull(phone,0),
last_update
from tbl_stg_address;

alter table tnl_trans_address_hop1
drop column address2;

alter table tnl_trans_address_hop1
drop column last_update;

select * from  tnl_trans_address_hop1;

create table tbl_trans_category_hop1
(
category_id tinyint,
name varchar(25),
last_update timestamp
);

insert into tbl_trans_category_hop1
select category_id,
name,
last_update
from tbl_stg_category;

alter table tbl_trans_category_hop1
drop column last_update;

select * from tbl_trans_category_hop1;

create table tbl_trans_country_hop1
(
country_id smallint,
country varchar(50),
last_update timestamp
);

insert into tbl_trans_country_hop1
select country_id,
country,
last_update
from tbl_stg_country;

alter table tbl_trans_country_hop1
drop column last_update;

select * from tbl_trans_country_hop1;

create table tbl_trans_city_hop1
(
city_id smallint,
city varchar(50),
country_id smallint,
last_update timestamp
);

insert into tbl_trans_city_hop1
select city_id,
city,
country_id,
last_update
from tbl_stg_city;

alter table tbl_trans_city_hop1
drop column last_update;

select * from tbl_trans_city_hop1;

create table tbl_trans_customer_hop1
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

insert into tbl_trans_customer_hop1
select 
customer_id,
store_id,
first_name,
last_name,
email,
address_id,
active,
create_date,
last_update
from tbl_stg_customer;

alter table tbl_trans_customer_hop1
drop column create_date,
drop column last_update;

update tbl_trans_customer_hop1
set email= replace(email,'@sakilacustomer.org','@blueboxdvd.com');

select * from tbl_trans_customer_hop1;

alter table tbl_trans_customer_hop1
drop column customer_name;

create table tbl_trans_film_hop1
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

insert into tbl_trans_film_hop1
select 
film_id,
title,
description,
release_year,
language_id,
original_language_id,
rental_duration,
rental_rate,
length,
replacement_cost,
rating,
special_features,
last_update from tbl_stg_film
;

alter table tbl_trans_film_hop1
drop column original_language_id,
drop column last_update;

select * from tbl_trans_film_hop1;

create table tbl_trans_film_actor_hop1
(
actor_id smallint,
film_id smallint,
last_update timestamp
);

insert into tbl_trans_film_actor_hop1
select actor_id,
film_id,
last_update 
from tbl_stg_film_actor;

alter table tbl_trans_film_actor_hop1
drop column last_update;

select * from tbl_trans_film_actor_hop1;

create table tbl_trans_film_category_hop1
(
film_id smallint,
category_id tinyint,
last_update timestamp
);

insert into tbl_trans_film_category_hop1
select film_id,
category_id,
last_update
from tbl_stg_film_category;

alter table tbl_trans_film_category_hop1
drop column last_update;

select * from tbl_trans_film_category_hop1;

create table tbl_trans_inventory_hop1
(
inventory_id mediumint,
film_id smallint,
store_id tinyint,
last_update timestamp
);

insert into tbl_trans_inventory_hop1
select inventory_id,
film_id,
store_id,
last_update
from tbl_stg_inventory;

alter table tbl_trans_inventory_hop1
drop column last_update;

select * from tbl_trans_inventory_hop1;

create table tbl_trans_language_hop1
(
language_id tinyint,
name char(20),
last_update timestamp
);

insert into tbl_trans_language_hop1
select language_id,
name,
last_update
from tbl_stg_language;

alter table tbl_trans_language_hop1
drop column last_update;

select * from tbl_trans_language_hop1;

create table tbl_trans_payment_hop1
(
payment_id smallint,
customer_id smallint,
staff_id tinyint,
rental_id int,
amount decimal(5,2),
payment_date datetime,
last_update timestamp
);
insert into tbl_trans_payment_hop1
select payment_id,
customer_id,
staff_id,
rental_id,
amount,
payment_date,
last_update
from tbl_stg_payment;

alter table tbl_trans_payment_hop1
drop column last_update;

select * from tbl_trans_payment_hop1;

create table tbl_trans_rental_hop1
(rental_id int,
rental_date datetime,
inventory_id mediumint,
customer_id smallint,
return_date datetime,
staff_id tinyint,
last_update timestamp
);

insert into tbl_trans_rental_hop1
select rental_id,
rental_date ,
inventory_id,
customer_id,
return_date,
staff_id,
last_update
from
tbl_stg_rental;

alter table tbl_trans_rental_hop1
drop column last_update;

select * from tbl_trans_rental_hop1;

create table tbl_trans_staff_hop1
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

insert into tbl_trans_staff_hop1
select staff_id,
first_name,
last_name,
address_id,
picture,
email,
store_id,
active,
username,
password,
last_update from tbl_stg_staff;

alter table tbl_trans_staff_hop1
drop column last_update;

create table tbl_trans_store_hop1
(
store_id tinyint,
manager_staff_id tinyint,
address_id smallint,
last_update timestamp
);

insert into tbl_trans_store_hop1
select 
store_id,
manager_staff_id,
address_id,
last_update
from tbl_stg_store;


alter table tbl_trans_store_hop1
drop column last_update;

select * from tbl_trans_store_hop1;