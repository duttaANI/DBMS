19)

select name, length(name) from student;
op->

NAME                 LENGTH(NAME)
-------------------- ------------
Zhang                           5
Shankar                         7
Brandt                          6
Chavez                          6
Peltier                         7

20)

select substr(dept_name,3,3) from department;

op->

SUB
---
olo
mp.
ec.
nan
sto

21)

 select upper(name) from instructor;

op->
UPPER(NAME)
--------------------
SRINIVASAN
WU
MOZART
EINSTEIN
EL SAID
GOLD

22)

 select nvl(grade,0) from takes;

op->NV
--
A
A-
C
A
A
A
B
C+
B-
F

23)

 select salary, 100*round(salary/300) from instructor;

op->
    SALARY 100*ROUND(SALARY/300)
---------- ---------------------
     65000                 21700
     90000                 30000
     40000                 13300
     95000                 31700

24)

 ALTER TABLE  student add (dob date);

 UPDATE  student  SET student.dob = TO_DATE('11/21/2002', 'MM/DD/YYYY');

op->13 rows updated.

 select to_char( student.dob, 'DD-MON-YYYY') from student;
op->
TO_CHAR(STU
-----------
21-NOV-2012
21-NOV-2012
21-NOV-2012
21-NOV-2012
21-NOV-2012


25)

 select name, to_char(student.dob , 'YEAR') from student;
op->

NAME                 TO_CHAR(STUDENT.DOB,'YEAR')
-------------------- ------------------------------------------
Zhang                TWENTY TWELVE
Shankar              TWENTY TWELVE
Brandt               TWENTY TWELVE
Chavez               TWENTY TWELVE

26)

 select name, to_char(student.dob , 'DAY') from student;
op->
NAME                 TO_CHAR(S
-------------------- ---------
Zhang                WEDNESDAY
Shankar              WEDNESDAY
Brandt               WEDNESDAY
Chavez               WEDNESDAY
Peltier              WEDNESDAY

27)

 select name, to_char(student.dob , 'MONTH') from student;
op->
NAME                 TO_CHAR(S
-------------------- ---------
Zhang                NOVEMBER
Shankar              NOVEMBER
Brandt               NOVEMBER
Chavez               NOVEMBER
Peltier              NOVEMBER

28)


 select last_day(student.dob ) ,to_char(last_day( student.dob ),'DAY') from
student;
op->

LAST_DAY( TO_CHAR(L
--------- ---------
30-NOV-12 FRIDAY
30-NOV-12 FRIDAY
30-NOV-12 FRIDAY
30-NOV-12 FRIDAY

29)

 select name,round((sysdate-student.dob)/365 ) from student;
op->
NAME                 ROUND((SYSDATE-STUDENT.DOB)/365)
-------------------- --------------------------------
Zhang                                               7
Shankar                                             7
Brandt                                              7
Chavez                                              7
Peltier                                             7

30)

 select add_months(dob,721),next_day( add_months(dob,721),'saturday') from student;
op->
ADD_MONTH NEXT_DAY(
--------- ---------
21-DEC-72 24-DEC-72
21-DEC-72 24-DEC-72
21-DEC-72 24-DEC-72
21-DEC-72 24-DEC-72

31)

 select name from student where extract(year from dob)=2012;
op->
NAME
--------------------
Zhang
Shankar
Brandt
Chavez
Peltier
Levy

32)

 select name from student where extract(year from dob)< 2015 and extract(year from  dob) > 2000;
op->

NAME
--------------------
Zhang
Shankar
Brandt
Chavez
Peltier
Levy

33)

select name from student where extract(year from dob)+60 = 2072;
op->
NAME
--------------------
Zhang
Shankar
Brandt
Chavez
Peltier
Levy

LAB 3 of manual

1)

 select course_id from takes where (semester='Fall' and year = '2009' ) or (semester='Spring' and year = '2010' );
op->
COURSE_I
--------
CS-101
CS-347
CS-101
CS-315
CS-347
HIS-351
FIN-201

2)

 select course_id from takes where (semester='Fall' and year = '2009' ) intersect select  course_id from takes where (semester='Spring' and year = '2010' );
op->
COURSE_I
--------
CS-101

3)

 select course_id from takes where (semester='Fall' and year = '2009' ) minus  select  course_id from takes where (semester='Spring' and year = '2010' );
op->
COURSE_I
--------
CS-347
PHY-101

4)

 select course.title from course minus select course.title from course,takes  where course.course_id = takes.course_id;
op->
TITLE
--------------------------------------------------
Computational Biology


