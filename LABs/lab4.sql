5)

select distinct course_id from section where course_id in (select course_id
 from section where semester='Fall' and year=2009) and course_id in (select 
course_id  from section where semester='Spring' and year=2010);
op->
COURSE_I
--------
CS-101

6)

select count (takes.id) FROM Takes
wHERE takes.course_id IN 
( select course_id from Teaches WHERE Teaches.id=10101);
op->
COUNT(TAKES.ID)
---------------
             11

7)
select distinct course_id from section
where course_id in ( select course_id from section where semester = 'Fall' and year=2009)
and
course_id not in ( select course_id from section where semester = 'Spring' and year=2010);

COURSE_I
--------
CS-347
PHY-101

8)

select name from student where
name in (select name from instructor);

NAME
--------------------
Brandt

10)

select name from instructor where salary > all( select salary from instructor where dept_name ='Biology');

NAME
--------------
Katz
Singh
Kim
Gold
Wu
Brandt
Einstein


9))

select name from instructor where
salary > some(select salary from instructor 
where Dept_Name = 'Biology');

NAME
------------------
Einstein
Brandt
Wu
Gold
Kim
Singh
Katz

11)

	select dept_name from instructor 
        group by dept_name
        having
        AVG(salary) >= ALL( select AVG(SALARY) FROM Instructor GROUP BY Dept_name)
	; 

op->
DEPT_NAME
---------------
Physics


12)

select dept_name from department where budget < (select avg(  salary) from instructor);
op->
DEPT_NAME
--------------------
History
Physics

13)

select distinct course_id from section  S where
 semester = 'Fall' and year=2009
and exists
(select course_id from section  T where semester = 'Spring' and year=2010 and T.course_id=S.course_id);



COURSE_I
--------
CS-101

14)

select distinct S.id , S.name from student S where 
not exists (( select course_id from course where 
dept_name = 'Biology' ) minus ( select T.id
from takes T where S.id = T.id));


no rows selected

15)




16)


select id from Takes where course_id in
 (select course_id from course where dept_name='Comp. Sci.') group by id
having count(id)>=2;

ID
-----
00128
98765
12345
54321
76543
45678

6 rows selected.

17)

select dept_name,avg_salary from (select dept_name
, avg(salary) as avg_salary  from instructor 
group by dept_name ) where avg_salary > 42000;



DEPT_NAME            AVG_SALARY
-------------------- ----------
Elec. Eng.                80000
Physics                   91000
Comp. Sci.           77333.3333
Finance                   85000
Biology                   72000
History                   61000

6 rows selected.

18)

create VIEW all_courses as select course_id, building, room_number from section where semester='Fall' 
AND Year=2009 and course_id in (select course_id from course where dept_name='Physics'); 


View created.


19)

select * from all_courses;
op->
COURSE_I BUILDING        ROOM_NU
-------- --------------- -------
PHY-101  Watson          100


20)

CREATE VIEW department_total_salary as select dept_name, sum(salary) as total from instructor 
group by dept_name;


View created.

 select * from department_total_salary;

DEPT_NAME                 TOTAL
-------------------- ----------
Elec. Eng.                80000
Physics                  182000
Comp. Sci.               232000
Finance                  170000
Biology                   72000
Music                     40000
History                  122000

7 rows selected.


LAB 4

1) select id from takes group by course_id;




























