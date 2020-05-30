
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

/*...........................................................................*/
INSERT INTO EMPLOYEE values ( 7 , 'Joy'    , 10000 , '03-05-2003' );
INSERT INTO EMPLOYEE values ( 2 , 'Pranav' , 20000 , '03-04-1973' );
INSERT INTO EMPLOYEE values ( 3 , 'Aman'  , 30000 , '23-05-1943' );
INSERT INTO EMPLOYEE values ( 4 , 'Shyam' , 40000 , '01-06-1950' );
INSERT INTO EMPLOYEE values ( 5 , 'Satya'  , 40070 , '01-06-1950' );
INSERT INTO EMPLOYEE values ( 6 , 'Atul'   , 34070 , '29-11-1967' );


/*-------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE BRAND(
bname       VARCHAR(20) ,
opening_hours      NUMBER(2) ,
closing_hours       NUMBER(2) ,
floor              NUMBER(2) ,
primary key(bname)
);

/*...........................................................................*/
INSERT INTO BRAND values ( 'Central'    , 9 , 20 );
INSERT INTO BRAND values ( 'Big_Bazaar' , 7 , 20 );


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
/*...........................................................................*/
INSERT INTO WORKSFOR values ( 1 , 'Central'     ,23 );
INSERT INTO WORKSFOR values ( 2 , 'Big_Bazaar'  , 3 );
INSERT INTO WORKSFOR values ( 6 , 'Big_Bazaar'  , 12);
INSERT INTO WORKSFOR values ( 3 , 'Big_Bazaar'  ,4  );
INSERT INTO WORKSFOR values ( 4 , 'Central'     , 30);
INSERT INTO WORKSFOR values ( 5 , 'Central'     , 17);

/*-------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE CITY(
city_no       NUMBER(2),
name       VARCHAR(20),
population_density    NUMBER(5),
primary key(city_no)
);

/*...........................................................................*/
/*
NOTE : population density is in " per square kilometers"
*/
INSERT INTO CITY values ( 1 , 'Mumbai' , 21000 ); 
INSERT INTO CITY values ( 2 , 'Delhi'    , 18000 ); 

/*...........................................................................*/

CREATE TABLE LOCALITY(
locality_id    NUMBER(5),
city_no       NUMBER(2),
name        VARCHAR(20),
area         NUMBER(2),
primary key(locality_id)
);


CREATE TABLE LOCATED_IN(
city_no       NUMBER(2),
mall_sno      NUMBER(5),
primary key(city_no,mall_sno),
foreign key(city_no) references CITY on delete cascade,
foreign key(mall_sno) references MALL on delete cascade);
/*...........................................................................*/
/*
NOTE : area is in "square kilometers"
*/
INSERT INTO LOCALITY values ( 1 , 'Kurla_West' , 1 , 20  );
/*...........................................................................*/


/*--------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE MALL(
mall_sno      NUMBER(5),
name         VARCHAR(20),
turnover      NUMBER(5),
no_of_floors   NUMBER(1),
primary key(mall_sno)
);
/*...........................................................................*/
INSERT INTO MALL values ( 1 , 'Phoenix_Market_City' , 20000 , 3  );

/*...........................................................................*/

/*--------------------------------------------------------------------------------------------------------------------*/


CREATE TABLE WORKSIN(
emp_id      NUMBER(5) ,
mall_sno      NUMBER(5),
e_attendance   NUMBER(1),
primary key(emp_id,mall_sno),
foreign key (emp_id) references EMPLOYEE on delete set null ,
foreign key (mall_sno) references MALL on delete cascade
);
/*...........................................................................*/
INSERT INTO WORKSIN values ( 1 , 1  );
INSERT INTO WORKSIN values ( 2 , 1  );
INSERT INTO WORKSIN values ( 3 , 1  );
INSERT INTO WORKSIN values ( 4 , 1  );
INSERT INTO WORKSIN values ( 5 , 1  );
INSERT INTO WORKSIN values ( 6 , 1  );


/*...........................................................................*/

/*--------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE PRESENTIN(
mall_sno     NUMBER(5) ,
bname       VARCHAR(20) ,
primary key(mall_sno,bname),
foreign key (bname) references BRAND on delete set null ,
foreign key (mall_sno) references MALL on delete cascade
);
/*...........................................................................*/
INSERT INTO PRESENTIN values ( 1 , 'Central'     , 1   );
INSERT INTO PRESENTIN values ( 1 , 'Big_Bazaar'  , 2   );

/*...........................................................................*/

/*--------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE MANAGER(
manager_id   NUMBER(5) ,
name        VARCHAR(20) not null,
salary       NUMBER(5) ,
primary key(manager_id)
);

/*...........................................................................*/
INSERT INTO MANAGER values ( 1 , 'Ashok' , 10000   );

/*...........................................................................*/

CREATE TABLE MANAGES(
mall_sno     NUMBER(5) ,
manager_id   NUMBER(5) ,
primary key(manager_id,mall_sno),
foreign key(manager_id) references MANAGER on delete set null,
foreign key(mall_sno) references MALL on delete cascade
);
/*...........................................................................*/
INSERT INTO MANAGES values ( 1 , 1  );

/*...........................................................................*/

 CREATE TABLE MGR_CONTACT_NO(
 manager_id   NUMBER(5),
 contact_no   NUMBER(10),
 primary key(manager_id,contact_no),
 foreign key(manager_id) references MANAGER on delete cascade);

/*----------------------------------------------------------------------------------------------------------------------------*/


Queries:

Q1: Employee with emp_id = 1 works in which mall ?
=> 
Select name,mall_sno from MALL where mall_sno = (Select mall_sno from WORKSIN where emp_id = 1) ;

Q2: Find all brands where the total salary is greater than the average of the total salary at all brands where mall_sno = 1 ?
=>
with brand_total (bname, value) as
(select bname , sum(salary)
from EMPLOYEE  natural join WORKSFOR  natural join WORKSIN
group by bname,mall_sno having mall_sno = 1),
brand_total_avg(value) as
(select avg(value)
from brand_total)
select bname
from brand_total, brand_total_avg
where brand_total.value >= brand_total_avg.value;

Q3: What is total population of Kurla_West which located in mumbai ?
=> 
select area*population_density as Population from  LOCALITY  inner join CITY using(city_no)
where locality_id = (select locality_id from LOCALITY l where l.name = 'Kurla_West' ) 
and city_no = (select city_no from CITY c where c.name = 'mumbai' ) ;

Q4: How many brands are present in 'Phoenix_Market_City' ?
=>
select count(bname) as tot_brands from brand natural join PRESENTIN where mall_sno = (select mall_sno from mall where name = 'Phoenix_Market_City');

Q5: 

































































