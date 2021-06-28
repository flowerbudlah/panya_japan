--1.To create the order table that gives payment function ..
drop table order_table purge;
create table order_table(
    order_idx       varchar2(50) constraint order_pk primary key, 
    member_id       varchar2(100) constraint order_fk references panya_member_table(member_id), 
    paymentPrice    number, --(Total payment price includig the delivery fee)
    sender_name     varchar2(50),  
    sender_address  varchar2(100), 
    sender_postcode number, 
    sender_tel      varchar2(50),
    recipient_name  varchar2(50),
    recipient_address varchar2(100), 
    recipient_postcode number,
    recipient_tel   varchar2(50), 
    order_date      date, 
    memo            varchar2(500), 
    payment_method	varchar2(50), 
    circumstance	varchar2(50)
);


--order details table's sequence
drop sequence order_detail_seq; 
create sequence order_detail_seq start with 1 increment by 1 minvalue 0;
--order details table
drop table order_detail_table purge;
create table order_detail_table(
    order_detail_idx	number constraint detail_pk primary key,
    order_idx			varchar2(50) not null constraint detail_fk references order_table(order_idx) on delete cascade,
    product_idx 		number,
    amount 				number, 
    member_id			varchar2(100)
);

select * from order_table; 
select * from order_detail_table; 

