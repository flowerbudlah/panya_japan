--1. Creating a sequence of the cart table
drop sequence cart_seq; 
CREATE SEQUENCE cart_seq 
START WiTH 1 
INCREMENT BY 1 minvalue 0;
--2.Creating the cart table
DROP TABLE CART_TABLE PURGE; 
CREATE TABLE cart_table(
    cart_idx NUMBER PRIMARY KEY, 
	member_id VARCHAR2(100),
	product_idx number,
    amount NUMBER, 
	regDate DATE DEFAULT SYSDATE
); 
ALTER TABLE cart_table ADD CONSTRAINT cart_fk_member_id FOREIGN KEY (member_id) REFERENCES panya_member_table(member_id) on delete cascade; 
ALTER TABLE cart_table ADD CONSTRAINT cart_fk_product_idx FOREIGN KEY (product_idx) REFERENCES product_table(product_idx) on delete cascade;


