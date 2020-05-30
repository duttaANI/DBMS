 CREATE TABLE EMPLOYEE(
 emp_id      NUMBER(5) ,
 name        VARCHAR(20) not null,
 salary      NUMBER(5) check (salary  > 0),
 dob         DATE,
 primary key(emp_id));


CREATE TABLE BRAND(
bname       VARCHAR(20) ,
opening_hours      NUMBER(2) ,
closing_hours       NUMBER(2) ,
floor       NUMBER(2)  ,
primary key(bname));



CREATE TABLE MALL(
mall_sno      NUMBER(5),
name         VARCHAR(20),
turnover      NUMBER(5),
no_of_floors   NUMBER(1),
primary key(mall_sno));




CREATE TABLE WORKS_FOR(
emp_id      NUMBER(5) ,
bname       VARCHAR(20),
b_attendance   NUMBER(1),
primary key(emp_id,bname),
foreign key (bname) references BRAND on delete cascade ,
foreign key (emp_id) references EMPLOYEE on delete set null); 



CREATE TABLE WORKS_IN(
emp_id      NUMBER(5) ,
mall_sno      NUMBER(5),
e_attendance   NUMBER(1),
primary key(emp_id,mall_sno),
foreign key (emp_id) references EMPLOYEE on delete set null ,
foreign key (mall_sno) references MALL on delete cascade); 




CREATE TABLE PRESENT_IN(
mall_sno     NUMBER(5) ,
bname       VARCHAR(20) ,
primary key(mall_sno,bname),
foreign key (bname) references BRAND on delete set null ,
foreign key (mall_sno) references MALL on delete cascade);





CREATE TABLE CITY(
city_no       NUMBER(2),
name       VARCHAR(20),
population    NUMBER(10),
primary key(city_no));



CREATE TABLE LOCATED_IN(
locality        VARCHAR(20),
city_no       NUMBER(2),
mall_sno      NUMBER(5),
primary key(city_no,mall_sno),
foreign key(city_no) references CITY on delete cascade,
foreign key(mall_sno) references MALL on delete cascade);



CREATE TABLE MANAGER(
mgr_id   NUMBER(5) ,
name        VARCHAR(20) not null,
salary       NUMBER(5) ,primary key(mgr_id));


 CREATE TABLE MANAGES(
 mall_sno     NUMBER(5) ,
 mgr_id   NUMBER(5) ,
 primary key(mgr_id,mall_sno),
 foreign key(mgr_id) references MANAGER on delete cascade,
 foreign key(mall_sno) references MALL on delete cascade);



 CREATE TABLE MGR_CONTACT_NO(
 mgr_id   NUMBER(5),
 contact_no   NUMBER(10),
 primary key(mgr_id,contact_no),
 foreign key(mgr_id) references MANAGER on delete cascade);

