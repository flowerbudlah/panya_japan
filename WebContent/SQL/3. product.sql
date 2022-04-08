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
insert into product_table values(4, 'アーモンドクリームのチーズ', 2000, 1, '直射日光を避け、涼しい場所に保管（夏期冷蔵保管)', '製造日から5日', 'cream_cheese_amond.png');
insert into product_table values(5, 'りんごクリームのチーズ', 2000, 1, '直射日光を避け、涼しい場所に保管（夏期冷蔵保管)', '製造日から5日', 'cream_cheese_apple.png');
insert into product_table values(6, 'クロワッサン', 1000, 1, '常温保管', '製造日から10日', 'croissant.png');
insert into product_table values(7, 'カレーパン', 2000, 1, '冷蔵保存', '製造日から3日', 'curry.png');
insert into product_table values(8, '卵とマヨネーズ', 1000, 1, '冷蔵保存','製造日から3日','mayo_egg.png');
insert into product_table values(9,'メロンパン', 2000, 1, '常温保管', '製造日から10日','melon_basic.png');
insert into product_table values(10, 'チョコメロンパン',2000, 1, '常温保管', '製造日から10日','melon_choco.png');
insert into product_table values（11,'抹茶メロンパン', 2000, 1, '常温保管','製造日から10日', 'melon_matcha.png');
insert into product_table values(12,'オリーブスティック', 2000, 1, '常温保管','製造日から10日', 'olive_stick.png');
insert into product_table values(13, '食パン', 2500, 1, '常温保管', '製造日から10日', 'plain_bread.png');
insert into product_table values(14,'抹茶ロールケーキ', 4000, 1, '直射日光を避け、涼しい場所に保管（夏期冷蔵保管)','製造日から5日', 'roll_greentea.png');
insert into product_table values(15, '米ロールケーキ', 4000, 1, '直射日光を避け、涼しい場所に保管（夏期冷蔵保管', '製造日から5日', 'roll_rice.png');
insert into product_table values(16, 'ロールケーキセット(5個/Set)', 10000, 1, '直射日光を避け、涼しい場所に保管（夏期冷蔵保管)', '製造日から5日', 'roll_set.png');
insert into product_table values(17, 'ごままんじゅう', 1500, 1, '直射日光を避け、涼しい場所に保管（夏期冷蔵保管)', '製造日から5日', 'sesame.png');
insert into product_table values(18,'塩パン', 2000, 1, '冷蔵保存', '製造日から10日', 'sio.png');
insert into product_table values(19, '焼きそばパン', 4000, 1, '冷蔵保存', '製造日から2日', 'soba.png');
insert into product_table values(20, 'あんパン', 1500, 1, '直射日光を避け、涼しい場所に保管（夏期冷蔵保管)', '製造日から5日', 'sweet_redbean.png');
insert into product_table values(21, 'かごのチーズケーキ', 10000, 2, '冷蔵保存', '製造日から5日', 'bask_cheese_cake.png');
insert into product_table values(22, '王真珠とチョコケーキ', 35000, 2, '冷蔵保存', '製造日から5日', 'chocolet_cake.png');
insert into product_table values(23, '果物チーズケーキ', 40000, 2, '冷蔵保存', '製造日から5日', 'cream_cheese_cake.png');
insert into product_table values(24, 'マンゴー生クリームのケーキ', 30000, 2, '冷蔵保存', '製造日から5日', 'mango_cake.png');
insert into product_table values(25, '可愛い仔犬', 8000, 2, '冷蔵保存', '製造日から5日', 'puggy_cake.png');
insert into product_table values(26, 'チャーリーと友人', 40000, 2, '冷蔵保存', '製造日から5日', 'snoopy_friends_cake.png');
insert into product_table values(27, '苺クリームケーキ', 30000, 2, '冷蔵保存', '製造日から5日', 'straw_cake.png');
insert into product_table values(28, '蝶パイ', 2500, 3, '常温保管', '製造日から10日', 'butterfly_pie.png'）;
insert into product_table values(29,'ゆずマカロン', 2500, 3, '常温保管', '製造日から10日', 'macaron_citron.png');
insert into product_table values(30, 'マカロン(10個/Set)', 20000, 3, '常温保管', '製造日から10日', 'macaron_set.png');
insert into product_table values(31,'スコーン(2個/Set)', 4000, 3, '常温保管', '製造日から10日', 'scone.png');
insert into product_table values(32, 'ありがとな手作りビスケット(10個/Set)', 6000, 3, '常温保管', '製造日から10日', 'thanks.png'); 
select * from product_table order by product_idx;
commit; 
