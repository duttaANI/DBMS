
/*
EXTRA COMMANDS:
1) command to see all tables : 
SELECT owner, table_name FROM all_tables; 
*/

/* 
NOTE : here order of dropping is important
*/
drop table WORKSIN;
drop TABLE WORKSFOR;
drop table employee;
drop table PRESENTIN;
drop table brand;
drop table manages;
drop table mall;
drop table manager;
drop table locality;
drop TABLE CITY;

/*-------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE EMPLOYEE(
emp_id      NUMBER(5) ,
name        VARCHAR(20) not null,
salary      NUMBER(5) check (salary  > 0),
dob         DATE,
primary key(emp_id)
);



/*-------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE BRAND(
bname       VARCHAR(20) ,
opening_hours      NUMBER(2) ,
closing_hours       NUMBER(2) ,
floor              NUMBER(2) ,
primary key(bname)
);



/*--------------------------------------------------------------------------------------------------------------------*/
/* attendance per month*/

CREATE TABLE WORKSFOR(
emp_id      NUMBER(5) ,
bname       VARCHAR(20),
b_attendance   NUMBER(2),
primary key(emp_id,bname),
foreign key (bname) references BRAND on delete cascade ,
foreign key (emp_id) references EMPLOYEE on delete set null
);
/*emp_id delete hone par baki employee jo same brand ke hain delete nahi hone chahiye*/


/*-------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE CITY(
city_no       NUMBER(2),
name       VARCHAR(20),
population_density    NUMBER(5),
primary key(city_no)
);


/*
NOTE : population density is in " per square kilometers"
*/


/*...........................................................................*/

CREATE TABLE LOCALITY(
locality_id    NUMBER(5),
city_no       NUMBER(2),
name        VARCHAR(20),
area         NUMBER(2),
primary key(locality_id)
);

/*
NOTE : area is in "square kilometers"
*/

/*----------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE MALL(
mall_sno      NUMBER(5),
name         VARCHAR(20),
turnover      NUMBER(5),
no_of_floors   NUMBER(1),
primary key(mall_sno)
);

CREATE TABLE LOCATED_IN(
city_no       NUMBER(2),
mall_sno      NUMBER(5),
primary key(city_no,mall_sno),
foreign key(city_no) references CITY on delete cascade,
foreign key(mall_sno) references MALL on delete cascade);


/*--------------------------------------------------------------------------------------------------------------------*/


CREATE TABLE WORKSIN(
emp_id      NUMBER(5) ,
mall_sno      NUMBER(5),
e_attendance   NUMBER(1),
primary key(emp_id,mall_sno),
foreign key (emp_id) references EMPLOYEE on delete set null ,
foreign key (mall_sno) references MALL on delete cascade
);


/*--------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE PRESENTIN(
mall_sno     NUMBER(5) ,
bname       VARCHAR(20) ,
primary key(mall_sno,bname),
foreign key (bname) references BRAND on delete set null ,
foreign key (mall_sno) references MALL on delete cascade
);


/*--------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE MANAGER(
manager_id   NUMBER(5) ,
name        VARCHAR(20) not null,
salary       NUMBER(5) ,
primary key(manager_id)
);



CREATE TABLE MANAGES(
mall_sno     NUMBER(5) ,
manager_id   NUMBER(5) ,
primary key(manager_id,mall_sno),
foreign key(manager_id) references MANAGER on delete set null,
foreign key(mall_sno) references MALL on delete cascade
);


 CREATE TABLE MGR_CONTACT_NO(
 manager_id   NUMBER(5),
 contact_no   NUMBER(10),
 primary key(manager_id,contact_no),
 foreign key(manager_id) references MANAGER on delete cascade);

/*----------------------------------------------------------------------------------------------------------------------------*/


































































