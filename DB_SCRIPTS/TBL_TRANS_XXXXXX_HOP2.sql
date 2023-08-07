/*THIS IS THE HOP2 TRANSFORMATION AREA, WHERE WE ARE GOING TO ADD NEW COLUMNS IN THE TABLE 
BASED ON THE REQUIREMENTS DATA*/

USE PROJECT;
DROP TABLE TBL_TRANS_FILM_HOP2;
CREATE TABLE TBL_TRANS_FILM_HOP2
(
film_id smallint,
title varchar(128),
description text,
release_year year,
language_id tinyint,
rental_duration tinyint,
rental_rate decimal(4,2),
length smallint,
replacement_cost decimal(5,2),
rating varchar(40),
special_features varchar(20)
);

INSERT INTO TBL_TRANS_FILM_HOP2
select
film_id,
title,
description,
release_year,
language_id,
rental_duration,
rental_rate,
length ,
replacement_cost,
rating,
special_features from TBL_TRANS_FILM_HOP1;

select * from tbl_trans_film_hop2;
update  TBL_TRANS_FILM_HOP2
set rating = 'General Audience' where rating = 'G';

update  TBL_TRANS_FILM_HOP2
set rating = 'Parental Guidance' where rating = 'PG';

update  TBL_TRANS_FILM_HOP2
set rating = 'Parents Strongly Cautioned' where rating = 'PG-13';
update  TBL_TRANS_FILM_HOP2
set rating = 'Restricted' where rating = 'R';

update  TBL_TRANS_FILM_HOP2
set rating = 'Adults Only' where rating = 'NC-17';