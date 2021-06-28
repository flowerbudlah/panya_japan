--1. Before you start this project, You'd better create the new User in the Oracle's sql developer program as below query at first.     
CREATE USER Janpanese IDENTIFIED BY 1111
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;
GRANT CONNECT, RESOURCE, DBA TO Janpanese;
commit; 

--2. The below query is creating a sequence of the member or user table used to join or login with this site. 
drop sequence panya_member_seq; 
create sequence panya_member_seq
start with 1
increment by 1
minvalue 0;

--3. below query is creating a table of the member or user used to join or  login with this site. 
drop table panya_member_table purge;
create table panya_member_table(
	member_idx   number  constraint member_pk primary key,
	member_name  varchar2(50) not null,
	member_id    varchar2(100) unique not null,
	member_pw    varchar2(100) not null, 
	member_email  varchar2(100) unique not null,
	member_tel varchar2(50) not null,
	member_address varchar2(100) not null, 
	postcode number not null, 
	question varchar2(500) not null, 
	answer varchar2(500) not null, 
	registerDate date
);

--joining membership by admin
insert into panya_member_table values(1, '管理者', 'admin', 1111, 'flowerbudlah_project@gmail.com', '+82-10-5824-9508', 'Korean', 111111,'What is your name?', 'leeahyun', sysdate);

