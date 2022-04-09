--Product's table
drop sequence product_seq; 
create sequence product_seq start with 33 increment by 1 minvalue 0;

drop table product_table purge;
create table product_table(
    product_idx  number constraint product_pk primary key,
    product_name varchar2(100) not null,
    product_price number not null,
    category_idx number not null, 
    storage_method varchar2(100), 
    expiration_date varchar2(100), 
    product_img varchar2(100) 
);
delete from product_table; 
commit; 

insert into product_table values(1, 'Baguette', 3000, 1, 'please, Store at room temperature. ', '5 days from the date of manufacture', 'baguettes.png');
insert into product_table values(2,'Chewy bagel', 2500, 1, 'please, Store at room temperature.', '5 days from the date of manufacture', 'begel.png');
insert into product_table values(3,'chestnuts bread', 5000, 1, 'Refrigerated storage', '5 days from the date of manufacture', 'chestnut.png'); 
insert into product_table values(4, 'Almond Cream Cheese', 2000, 1, 'Please, store in a cool place (refrigerated in summer)', '5 days from the date of manufacture', 'cream_cheese_amond.png');
insert into product_table values(5, 'Apple Cream Cheese', 2000, 1, 'Please, store in a cool place (refrigerated in summer)', '5 days from the date of manufacture', 'cream_cheese_apple.png');
insert into product_table values(6, 'Croissant', 1000, 1, 'Please, Store in Room temperature', '5 days from the date of manufacture', 'croissant.png');
insert into product_table values(7, 'Curry', 3000, 1,'Refrigerated storage', '3 days from the date of manufacture', 'curry.png');
insert into product_table values(8, 'Egg Mayo', 1000, 1, 'Refrigerated storage','3 days from the date of manufacture','mayo_egg.png');
insert into product_table values(9,'Melon', 2000, 1, 'Please, Store in Room temperature', '5 days from the date of manufacture','melon_basic.png');
insert into product_table values(10, 'Choco Melon',2000, 1, 'Please, Store in Room temperature', '5 days from the date of manufacture','melon_choco.png');
insert into product_table values(11, 'GreenTea Melon', 2000, 1, 'Please, Store in Room temperature','5 days from the date of manufacture', 'melon_matcha.png');
insert into product_table values(12,'Olive Stick', 2000, 1, 'Please, Store in Room temperature','5 days from the date of manufacture', 'olive_stick.png');
insert into product_table values(13, '食パン', 2500, 1, 'Please, Store in Room temperature', '5 days from the date of manufacture', 'plain_bread.png');
insert into product_table values(14,'Green Tea RollCake', 4000, 1, 'Refrigerated storage','5 days from the date of manufacture', 'roll_greentea.png');
insert into product_table values(15, 'Rice RollCake', 4000, 1, 'Refrigerated storage', '5 days from the date of manufacture', 'roll_rice.png');
insert into product_table values(16, 'RollCake Set(5個/Set)', 10000, 1, 'Refrigerated storage', '5 days from the date of manufacture', 'roll_set.png');
insert into product_table values(17, 'Sesame Manju', 1500, 1, 'Refrigerated storage', '5 days from the date of manufacture', 'sesame.png');
insert into product_table values(18,'Sio', 2000, 1, 'Refrigerated storage', '5 days from the date of manufacture', 'sio.png');
insert into product_table values(19, '焼きそばパン', 4000, 1, 'Refrigerated storage', '5 days from the date of manufacture', 'soba.png');
insert into product_table values(20, 'あんパン', 1500, 1, 'Refrigerated storage', '5 days from the date of manufacture', 'sweet_redbean.png');


insert into product_table values(21, 'Basque Cheesecake', 10000, 2, 'Refrigerated storage', '5 days from the date of manufacture', 'bask_cheese_cake.png');
insert into product_table values(22, 'Chocolate cake and pearls', 35000, 2, 'Refrigerated storage', '5 days from the date of manufacture', 'chocolet_cake.png');
insert into product_table values(23, 'Cream Cheese Cake with fruit', 40000, 2, 'Refrigerated storage', '5 days from the date of manufacture', 'cream_cheese_cake.png');
insert into product_table values(24, 'Mango Cake', 30000, 2, 'Refrigerated storage', '5 days from the date of manufacture', 'mango_cake.png');
insert into product_table values(25, 'Puppy', 8000, 2, 'Refrigerated storage', '5 days from the date of manufacture', 'puggy_cake.png');
insert into product_table values(26, 'Charlie & friends', 40000, 2, 'Refrigerated storage', '5 days from the date of manufacture', 'snoopy_friends_cake.png');
insert into product_table values(27, 'Strawberry cream cake', 30000, 2, 'Refrigerated storage', '5 days from the date of manufacture', 'straw_cake.png');
insert into product_table values(28, 'Butterfly Pie', 2500, 3, 'Please, Store in Room temperature', '5 days from the date of manufacture', 'butterfly_pie.png');
insert into product_table values(29,'Citron Macaroon', 2500, 3, 'Please, Store in Room temperature', '5 days from the date of manufacture', 'macaron_citron.png');
insert into product_table values(30, 'Macaroon(10個/Set)', 20000, 3, 'Please, Store in Room temperature', '5 days from the date of manufacture', 'macaron_set.png');
insert into product_table values(31,'Scone(2個/Set)', 4000, 3, 'Please, Store in Room temperature', '5 days from the date of manufacture', 'scone.png');
insert into product_table values(32, 'Thanks Cookies(10個/Set)', 6000, 3, 'Please, Store in Room temperature', '5 days from the date of manufacture', 'thanks.png'); 

select * from product_table order by product_idx;
commit; 



