
LAB 2 
 
 
q7) SELECT constraint_name, constraint_type, table_name FROM user_constraints;

1) 

CREATE TABLE Employee(
EmpNo NUMBER(4) primary key,
EmpName VARCHAR(20) NOT NULL,
Gender CHAR(1) NOT NULL,
Salary NUMBER(6) NOT NULL,
Address VARCHAR(20) NOT NULL,
check(Gender in ('M','F')));

2)

CREATE TABLE Department(
DeptNo NUMBER(4) primary key,
DeptName VARCHAR(10) unique
);

3)

 ALTER TABLE  Employee add (DNo NUMBER(4)) ;

 
 ALTER TABLE  Employee add constraint one foreign key(DNo) references Department
(DeptNo);

4)

 INSERT INTO employee(Empno,empname,gender, salary,address) VALUES (3,'ashk','M'
, 1200, 'mangalore');



 INSERT INTO department VALUES (45, 'cse');
 SELECT * FROM employee;

 UPDATE employee set dno=45 where empname='ashk';
  SELECT * FROM employee;

 INSERT INTO employee(Empno,empname,gender, salary,address) VALUES (4,'ashok','M
', 1200, 'manipal');

 INSERT INTO department VALUES (47, 'eee');


 UPDATE employee set dno=47 where empname='ashok';


5)

 INSERT INTO employee(Empno,empname,gender, salary,address) VALUES (4,'ashok','M
', 12300)
O/P => : not enough values



6)

 DELETE FROM employee where address='mangalore';

7) 
q) HOW TO Delete a constraint?
..
ALTER TABLE EMPLOYEE ADD CONSTRAINT TWO ON DELETE CASCADE (NOT SURE)

8)


9)
---------FOLLOW--------------
in lab:
SQL> @"c:\DDL+drop.sql"
SQL>commit;
in ubuntu vbox:
@"/home/aniruddha/Downloads/smallRelationsInsertFile.sql"
@"/home/aniruddha/Downloads/DDL+drop.sql"
commit
-----------------------------

SELECT name,dept_name FROM student;

10)

 SELECT name FROM instructor WHERE dept_name='Comp. Sci.';

11)

 SELECT course_id FROM course WHERE dept_name='Comp. Sci.' AND credits>3;

12)

 select course_id,title from takes natural join course where takes.id=12345;

13)

 select name from instructor where salary>=40000 and salary<=90000;

14)

 select id from instructor where instructor.id not in ( select id from teaches);

15)

 select student.name,course.title,takes.year from student,course,takes, section
 where course.course_id=takes.course_id and student.id=takes.id and takes.course_id=section.course_id and section.room_number=3128 ;

16)




17)

 select name from instructor where salary > ( select min(salary) from instructor
 where dept_name='Comp. Sci.');

18)

 select name from instructor where dept_name like '%ci%';

19)

 SELECT student.name , LENGTH(name) from student;

20)
SELECT SUBSTR(dept_name,3,3) AS ExtractString FROM department;

21)

SELECT UPPER(Instructor.name) "Uppercase" FROM instructor;

22)

SELECT COALESCE(dept_name , '0') FROM department;
or better is:
select nvl(semester, '1') from teaches;

23)

select instructor.name ,salary, round((salary/3)) from instructor;


