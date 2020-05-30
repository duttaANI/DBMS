LAB 4

savepoint s0;

1.
SELECT course_id,COUNT(*)
FROM Takes
GROUP BY course_id;
!=
SELECT course_id,COUNT(DISTINCT id)
FROM Takes
GROUP BY course_id;

2.
SELECT dept_name
FROM Student
GROUP BY dept_name
HAVING COUNT(*)>2;

3.
SELECT dept_name,COUNT(*)
FROM Course
GROUP BY dept_name;

4.
SELECT dept_name,AVG(salary)
FROM Instructor
GROUP BY dept_name
HAVING AVG(salary)>42000;

5.
SELECT course_id,sec_id,COUNT(*)
FROM Takes
WHERE semester='Spring' AND year=2009
GROUP BY course_id,sec_id;

6.
SELECT course_id
FROM Prereq
ORDER BY course_id;

7.
SELECT *
FROM Instructor
ORDER BY salary DESC;

8.
SELECT MAX(tot_sal)
FROM(SELECT dept_name,SUM(salary) tot_sal FROM Instructor GROUP BY dept_name);

9.
SELECT dept_name,avg_sal
FROM(	SELECT dept_name,AVG(salary) avg_sal
	FROM Instructor
	GROUP BY dept_name)
WHERE avg_sal>42000;

10.
WITH Enroll(course_id,sec_id,enrollment)
AS(	SELECT course_id,sec_id,COUNT(*) enrollment
	FROM Takes
	WHERE semester='Spring' AND year=2010
	GROUP BY course_id,sec_id),
 Max_Enroll(max_enrollment)
AS(	SELECT MAX(enrollment) FROM Enroll)
	SELECT course_id,sec_id,Enroll.enrollment
	FROM Enroll,Max_Enroll
	WHERE Enroll.enrollment=Max_Enroll.max_enrollment;

11.
SELECT i.name
FROM instructor i
WHERE NOT EXISTS (
(SELECT id FROM Student WHERE dept_name='Comp. Sci.')
MINUS
(SELECT takes.id FROM Takes JOIN Teaches USING(course_id,sec_id,semester,year)
WHERE Teaches.id=i.id));

12.
SELECT dept_name
FROM ( 	SELECT dept_name,AVG(salary) avg_sal,COUNT(*) no_of_instructors
	FROM Instructor
	GROUP BY dept_name)
WHERE avg_sal>50000 AND no_of_instructors>5;

13.
WITH Max_budget(mbudget) AS
(SELECT MAX(budget) FROM Department)
	SELECT dept_name 
	FROM Department,Max_budget
	WHERE budget=mbudget;

14.
WITH avg_tot_sal(avgtotsal) AS
(SELECT AVG(SUM(salary)) avgtotsal
FROM Instructor
GROUP BY dept_name),
tot_sal(dept_name,totsal) AS
(SELECT dept_name, SUM(salary) totsal
FROM Instructor
GROUP BY dept_name)
	SELECT dept_name
	FROM tot_sal,avg_tot_sal
	WHERE totsal>avgtotsal;
	
15.
WITH Enroll(course_id,sec_id,enrollment)
AS(	SELECT course_id,sec_id,COUNT(*) enrollment
	FROM Takes
	WHERE semester='Fall' AND year=2009
	GROUP BY course_id,sec_id),
 Max_Enroll(max_enrollment)
AS(	SELECT MAX(enrollment) FROM Enroll)
	SELECT course_id,sec_id,Enroll.enrollment
	FROM Enroll,Max_Enroll
	WHERE Enroll.enrollment=Max_Enroll.max_enrollment;

16.
WITH tot_fin_cred(totfincred) AS
(SELECT SUM(tot_cred) FROM Student WHERE dept_name='Finance'),
tot_dept_cred(dept_name,totdeptcred) AS
(SELECT dept_name,SUM(tot_cred) totdeptcred FROM Student GROUP BY dept_name)
	SELECT dept_name
	FROM tot_dept_cred,tot_fin_cred
	WHERE totdeptcred>totfincred;
	

SAVEPOINT S1;

17.
DELETE FROM Instructor
WHERE dept_name='Finance';

18.
DELETE FROM Course
WHERE dept_name='Comp. Sci.';

19.
INSERT INTO department values ('IT', null,null);
UPDATE Student SET dept_name='IT' WHERE dept_name='Comp. Sci.';

20.
UPDATE Instructor 
        SET salary=
        CASE
	WHEN SALARY>100000 THEN salary+(salary*0.03)
	ELSE salary+(salary*0.05)
        END;


21.??????????????????????????????????????????????????????????????????????????
INSERT INTO Student VALUES (SELECT id, name, dept_nam,0 FROM Instructor);
?????????????????????????????????????????????????????????????????????????????
CORRECT =>
insert into Student (ID, name, dept_name, tot_cred)
select ID, name, dept_name, 0
from Instructor
where not exists (
select 1
from Student
where ID = Instructor.ID
);

22.???????????????????????????????????????????????????????????????????
WITH avg_sal(avgsal) AS
(SELECT AVG(salary) FROM Instructor)	
	DELETE FROM Instructor
	WHERE salary<avg_sal.avgsal;
??????????????????????????????????????????????????????????????????????
CORRECT=>
delete from instructor
where salary< (select avg (salary) from instructor);


//<-----------------------------------------------------------------

18)

CREATE VIEW all_courses AS
select title,course_id
FROM course
WHERE dept_name='Physics';










