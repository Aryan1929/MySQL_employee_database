SELECT 
    first_name, last_name
FROM
    employees;
    
SELECT 
    *
FROM
    employees;    

SELECT 
    dept_no
FROM
    departments;
    
SELECT 
    *
FROM
    departments;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';    
    
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F'; 
    
SELECT 
    *
FROM
    employees
WHERE 
    first_name='Denis' OR first_name='Elvis';     
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' OR first_name = 'Aruna';    
    
SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis' AND (gender = 'F' OR gender='M');     
    
-- AND operator always applies before OR operator, precedence AND > OR    
    
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F' AND (first_name = 'Kellie' OR first_name = 'Aruna');
    
SELECT *
FROM employees
WHERE first_name IN ('Cathie','Mark', 'Nathan');
-- gives all the data whose first_name is either of the three

SELECT *
FROM employees
WHERE first_name NOT IN ('Cathie','Mark', 'Nathan');
-- gives all the data whose first_name is not any of the three    

SELECT *
FROM employees
WHERE first_name IN ('Denis', 'Elvis');

SELECT *
FROM employees
WHERE first_name NOT IN ('John', 'Mark', 'Jacob');
        
SELECT *
FROM employees
WHERE first_name LIKE ('%ar');       
-- % shows for a sequence of characters, can be applied before after and both sides 

SELECT *
FROM employees
WHERE first_name LIKE ('Mar_');       
-- _ shows for a single characters, can be applied before after and both sides 

SELECT *
FROM employees
WHERE first_name NOT LIKE ('Mar%');   
-- NOT LIKE does the exact opposite of LIKE

SELECT *
FROM employees
WHERE first_name LIKE ('Mark%');

SELECT *
FROM employees
WHERE hire_date LIKE ('2000%');

SELECT *
FROM employees
WHERE emp_no LIKE ('1000_');

Select *
FROM employees
WHERE first_name LIKE ('%Jack%');

Select *
FROM employees
WHERE first_name NOT LIKE ('%Jack%');

Select *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '2000-01-01';
-- between and helps tto find values between two specific values
-- NOT BETWEEN is just the opposite operation of BETWEEN

SELECT *
FROM salaries
WHERE salary BETWEEN '66000' AND '70000';

SELECT *
FROM salaries
WHERE emp_no NOT BETWEEN '10004' AND '10012';

SELECT *
FROM departments
WHERE dept_no BETWEEN 'd003' AND 'd006';

SELECT *
FROM employees
WHERE first_name IS NOT NULL;

SELECT *
FROM employees
WHERE first_name IS NULL;

SELECT *
FROM departments
WHERE dept_no IS NOT NULL;

SELECT *
FROM employees
WHERE first_name <> 'Mark';
-- <> and != both work as not equal to operators


SELECT *
FROM employees
WHERE hire_date >= '2000-01-01';

SELECT *
FROM employees
WHERE hire_date < '1985-02-01';

SELECT *
FROM employees
WHERE gender='F' AND hire_date >= '2000-01-01';

SELECT *
FROM salaries
WHERE salary > '150000';

SELECT DISTINCT gender
FROM employees;

SELECT DISTINCT hire_date
FROM employees;

SELECT count(emp_no)
FROM employees;

SELECT count(first_name)
FROM employees;
-- it gives a count of total number of first names

SELECT count(DISTINCT first_name)
FROM employees;
-- it gives a count of total number of distinct first names

SELECT *
FROM employees
ORDER BY first_name ASC;
-- ASC used for ascending order  

SELECT *
FROM employees
ORDER BY first_name DESC;
-- DSC used for decending order

SELECT *
FROM employees
ORDER BY emp_no DESC;
-- applicable not only for strings but for number as well

SELECT *
FROM employees
ORDER BY first_name, last_name ASC;
-- can be used for multiple column ordering as well

SELECT *
FROM employees
ORDER BY hire_date DESC;

SELECT first_name
FROM employees
GROUP BY first_name;

SELECT first_name, COUNT(first_name) AS names_count
FROM employees
GROUP BY first_name
ORDER BY first_name DESC;

SELECT salary, COUNT(emp_no) AS emps_with_same_salary
FROM salaries
WHERE salary > '80000'
GROUP BY salary
ORDER BY salary ASC;

SELECT first_name, COUNT(first_name) AS names_count
FROM employees
WHERE 
COUNT(first_name) > 250
GROUP BY first_name
ORDER BY first_name;
-- aggregate function cannot be used after WHERE it can be used only after HAVING

SELECT first_name, COUNT(first_name) AS names_count
FROM employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;

SELECT emp_no, AVG(salary) AS avg_salary
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no; 

SELECT first_name, COUNT(first_name) AS names_count
FROM employees
WHERE hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name ASC; 
-- we cannot have both aggregated and non-aggregated clause together in HAVING (dont mix them)

SELECT emp_no
FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

SELECT *
FROM salaries
ORDER BY salary DESC
LIMIT 10;

SELECT *
FROM employees
ORDER BY emp_no DESC
LIMIT 100;

INSERT INTO employees
(
 birth_date,
 emp_no,
 first_name,
 last_name,
 gender,
 hire_date
)
VALUES
(
  '1973-05-25',
  999902,
  'Patricia',
  'Lawrence',
  'F',
  '2005-01-01'
);
-- even if the order of the columns are changed it would be properly displayed in 

INSERT INTO employees
VALUES
(
  999903,
  '1975-04-12',
  'Patrik',
  'Panther',
  'F',
  '2002-02-01'
);
-- we can skip writing the name of the columns but the values part should be then written in correct order and no value should be skipped

SELECT *
FROM titles
LIMIT 10;

INSERT INTO titles
(
  emp_no,
  title,
  from_date
)
VALUES
(
  999903,
  'Senior Engineer',
  '1997-09-01'
);  
  
SELECT *
FROM titles
ORDER BY emp_no DESC;  

SELECT *
FROM dept_emp
ORDER BY emp_no DESC
LIMIT 10; 

INSERT INTO dept_emp 
(
  emp_no,
  dept_no,
  from_date,
  to_date
)
VALUES
(
  999903,
  'd005',
  '1997-09-01',
  '9999-01-01'
);

CREATE table departments_dup
(
  dep_no CHAR(4) NOT NULL,
  dept_name VARCHAR(40) NOT NULL
);  

INSERT INTO departments_dup
(
  dep_no,
  dept_name
)
SELECT *
FROM departments;

SELECT *
FROM departments_dup
ORDER BY dept_no ASC;

INSERT INTO departments
VALUES
(
  'd010',
  'Business Analysis'
);

SELECT *
FROM departments
ORDER BY dept_no ASC
LIMIT 10;

USE employees;

SELECT *
FROM employees
WHERE emp_no = 999903;

 UPDATE employees
 SET 
     first_name = 'Stella',
     last_name = 'Parkinson',
     birth_date = '1990-12-31',
     gender = 'F'
WHERE emp_no = 999903;     


UPDATE employees
 SET 
     first_name = 'Stessie',
     last_name = 'Parkinson',
     birth_date = '1990-12-31',
     gender = 'F'
WHERE emp_no = 999909;  
-- here this update statement will still run even if there is no emp_no such as 999909 just that no rows will be affected

SELECT *
FROM employees
ORDER BY emp_no DESC
LIMIT 10;   

SELECT *
FROM departments_dup
ORDER BY dep_no;

COMMIT;

UPDATE departments_dup
SET 
	dep_no = 'd011',
    dept_name = 'Quality Control';
-- since here we didnt mention where the data has to be updated all the rows of the table have been updated with the data given

ROLLBACK;
-- ROLLBACK will bring the table back to the phase just before the COMMIT have been used, if COOMIT was never used it will reverse back all changes in the table made
-- once ROLLBACK is used, it cannot be reversed back

COMMIT;

UPDATE departments
SET
    dept_name = 'Data Analysis'
WHERE dept_name = 'Business Analysis';

SELECT *
FROM departments;

COMMIT;

SELECT *
FROM employees
WHERE emp_no = 999903;

DELETE FROM employees
WHERE emp_no = 999903;

ROLLBACK;
COMMIT;

SELECT *
FROM departments_dup
ORDER BY dep_no;

DELETE FROM departments_dup;
-- without putting the where clause using DELETE will delete all the rows from the table selected 

ROLLBACK;
COMMIT;

DELETE FROM departments 
WHERE dept_no = 'd010';

SELECT *
FROM departments;

USE employees;

SELECT *
FROM dept_emp; 

SELECT COUNT(DISTINCT dept_no)
FROM dept_emp;
-- using COUNT(*) will return all rows of table, NULL values included
-- COUNT is applicable on both numeric and non-numeric data while other aggregate functions are applicable only on numeric data

SELECT SUM(salary)
FROM salaries;
-- using SUM(*) will show syntax error


SELECT SUM(salary)
FROM salaries
WHERE from_date > '1997-01-01';


SELECT MAX(salary)
FROM salaries;
-- will give the maximum value of the selected column

SELECT MIN(salary)
FROM salaries;
-- will give the minimum value of the selected column

SELECT MIN(emp_no)
FROM employees;

SELECT MAX(emp_no)
FROM employees;

SELECT AVG(salary)
FROM salaries;
-- gives trhe avergae value of the numeric data in the given column, generally used with group by clause

SELECT AVG(salary)
FROM salaries
WHERE from_date > '1997-01-01';

SELECT ROUND(AVG(salary))
FROM salaries;
-- it rounds of the value to the neareast intiger

SELECT ROUND(AVG(salary), 2)
FROM salaries;
-- the 2 indicates to round off the value upto two decimal places

SELECT ROUND(AVG(salary))
FROM salaries
WHERE from_date > '1997-01-01';

SELECT dep_no, IFNULL(dept_name, 'Department Name not Provided')
FROM departments_dup;
-- this will show the given name instead of NULL in places where there is no department name

INSERT INTO departments_dup
(
  dep_no,
  dept_name
)
VALUES
(
  'd009',
  'Customer Service'
);

SELECT dep_no, dept_name, COALESCE(dept_manager, det_name, 'N/A') AS Dept_manager
FROM departments_dup
ORDER BY dep_no ASC;
-- Departments table has some error so wont show preper result
-- here COALESCE will give dept_manager if value is not null, if value is null it will give corresponding dept_name and if dept_name is also null it will show NA

SELECT dep_no, dept_name, COALESCE(dep_no, dept_name) AS dept_info
FROM departments_dup
ORDER BY dep_no ASC;

SELECT IFNULL(dep_no, 'N/A') AS dep_no, IFNULL(dept_name, 'Department name not provided') AS dept_name, COALESCE(dep_no, dept_name) AS dept_info
FROM departments_dup
ORDER BY dep_no ASC;

SELECT *
FROM departments_dup;

DROP table departments_dup;

CREATE table departments_dup
( dept_no CHAR(4),
  dept_name VARCHAR(40)
);

INSERT INTO departments_dup
(
  dept_no,
  dept_name
)
SELECT *
FROM departments;

SELECT *
FROM departments_dup;

INSERT INTO departments_dup
(
  dept_name
)  
VALUES
(
  'Public Relations'
);
  
INSERT INTO departments_dup
(
  dept_no
)  
VALUES
(
  'd010'
);

  
INSERT INTO departments_dup
(
  dept_no
)  
VALUES
(
  'd011'
);

DELETE FROM departments_dup
WHERE dept_no = 'd002';

SELECT *
FROM departments_dup;

DROP TABLE IF EXISTS department_manager_dup;

CREATE TABLE dept_manager_dup
(
  emp_no INT(11) NOT NULL,
  dept_no CHAR(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
  );

INSERT INTO dept_manager_dup
SELECT *
FROM dept_manager;

INSERT INTO dept_manager_dup
(
  emp_no,
  from_date
)
VALUES
(999904, '2017-01-01'),
(999905, '2017-01-01'),
(999906, '2017-01-01'),
(999907, '2017-01-01');   

DELETE FROM dept_manager_dup
WHERE dept_no = 'd001';

SELECT *
FROM dept_manager_dup;

       
SELECT *
FROM departments_dup
ORDER BY dept_no;


SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
INNER JOIN
departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;
-- inner joins extract records in which the values of the related column match
-- null values or values appearing in just one of two tables are not displayed

SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, d.dept_no
FROM employees e
INNER JOIN
dept_manager_dup d ON e.emp_no = d.emp_no
ORDER BY emp_no;

SELECT m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM dept_manager_dup m
INNER JOIN
departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;
-- writting INNER JOIN or JOIN is the same thing

SELECT *
FROM dept_manager_dup
ORDER BY dept_no ASC;

SELECT *
FROM departments_dup
ORDER BY dept_no ASC;

INSERT INTO dept_manager_dup
VALUES
(
  '110228',
  'd003',
  '1992-03-21',
  '9999-01-01'
);

INSERT INTO departments_dup
VALUES
(
  'd009',
  'Customer Service'
);

SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
INNER JOIN
departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
JOIN
departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY dept_no;   

set global sql_mode=''; 

DELETE FROM dept_manager_dup
WHERE emp_no = '110228';

DELETE FROM departments_dup
WHERE dept_no = 'd009';

INSERT INTO dept_manager_dup
VALUES
(
  '110228',
  'd003',
  '1992-03-21',
  '9999-01-01'
);

INSERT INTO departments_dup
VALUES
(
  'd009',
  'Customer Service'
);

SELECT d.dept_no, m.emp_no, d.dept_name
FROM departments_dup d
LEFT JOIN
dept_manager_dup m ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;
-- gives 21 rows ie 1 row more than that in case of JOIN, these 1 row ais non matching value of left part ie departments_dup

SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
LEFT JOIN
departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;
-- gives 26 rows ie 6 rows more than that in case of JOIN, these 6 rows are non matching value of left part ie dept_manager_dup
-- LEFT JOIN is same as LEFT OUTER JOIN

SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
LEFT JOIN
departments_dup d ON m.dept_no = d.dept_no
WHERE dept_name IS NULL
GROUP BY m.emp_no
ORDER BY m.dept_no;

SELECT e.EMP_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM employees e
LEFT JOIN 
dept_manager m ON e.emp_no = m.emp_no
WHERE e.last_name = 'Markovitch'
GROUP BY e.emp_no
ORDER BY m.dept_no DESC;

SELECT e.EMP_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM employees e
LEFT JOIN 
dept_manager m ON e.emp_no = m.emp_no
WHERE e.last_name = 'Markovitch'
GROUP BY e.emp_no
ORDER BY m.emp_no DESC;


SELECT e.EMP_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM employees e
RIGHT JOIN 
dept_manager m ON e.emp_no = m.emp_no
GROUP BY e.emp_no
ORDER BY m.dept_no;

SELECT *
FROM dept_manager;


SELECT m.dept_no, m.emp_no, d.dept_name
FROM 
     dept_manager_dup m,
     departments_dup d
WHERE m.dept_no = d.dept_no
ORDER BY m.dept_no;

/*
SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
LEFT JOIN
departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;

The above query gives the same result as this query
*/

USE employees;

SELECT e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM
      employees e,
      dept_manager m
WHERE e.emp_no = m.emp_no
ORDER BY m.dept_no;
-- above query is sahown using old syntax of JOIN.

SELECT e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM 
      employees e
JOIN
      dept_manager m ON e.emp_no = m.emp_no
ORDER BY m.dept_no;

SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM
     employees e
JOIN 
     salaries s ON e.emp_no = s.emp_no
WHERE s.salary > 145000
ORDER BY s.salary ASC;

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');


SELECT e.emp_no, e.first_name, e.last_name, t.title
FROM
     employees e
JOIN
     titles t ON e.emp_no = t.emp_no
WHERE first_name = 'Margareta' AND last_name = 'Markovitch';

SELECT dm.*, d.*
FROM
     dept_manager dm
CROSS JOIN
     departments d
ORDER BY dm.emp_no, d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm,
    departments d
ORDER BY dm.emp_no , d.dept_no;
-- the above query cwill give same result using JOIN instead of CROSS JOIN as well but using JOIN without ON is not a good practice

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE dm.dept_no <> d.dept_no
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    e.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
    JOIN
    employees e ON dm.emp_no = e.emp_no
WHERE dm.dept_no <> d.dept_no
ORDER BY dm.emp_no , d.dept_no;


SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE d.dept_no = 'd009'
ORDER BY d.dept_no;

SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no;

SELECT 
    e.gender, AVG(s.salary) AS avg_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY e.gender;
-- above query shows using joins with aggregate functions

SELECT
       e.first_name,
       e.last_name,
       e.hire_date,
       m.from_date,
       d.dept_name
FROM
       employees e
JOIN 
       dept_manager m ON e.emp_no = m.emp_no
JOIN
       departments d ON m.dept_no = d.dept_no
ORDER BY e.hire_date;
-- using JOIN with more than two tables

SELECT
       e.first_name,
       e.last_name,
       e.hire_date,
       t.title,
       m.from_date,
       d.dept_name
FROM 
      employees e
JOIN dept_manager m ON e.emp_no = m.emp_no
JOIN departments d ON m.dept_no = d.dept_no
JOIN titles t ON e.emp_no = t.emp_no AND m.from_date = t.from_date
ORDER BY e.emp_no;


SELECT d.dept_name, AVG(s.salary) AS avg_salary
FROM 
      employees e
JOIN dept_manager m ON e.emp_no = m.emp_no
JOIN departments d ON m.dept_no = d.dept_no
JOIN salaries s ON e.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY AVG(s.salary) DESC;


SELECT d.dept_name, AVG(s.salary) AS avg_salary
FROM 
      employees e
JOIN dept_manager m ON e.emp_no = m.emp_no
JOIN departments d ON m.dept_no = d.dept_no
JOIN salaries s ON e.emp_no = s.emp_no
GROUP BY d.dept_name
HAVING avg_salary > 60000
ORDER BY AVG(s.salary) DESC;

SELECT e.gender, COUNT(dm.emp_no)
FROM
     employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY e.gender;

DROP TABLE IF EXISTS employees_dup;
CREATE TABLE employees_dup(
emp_no int(11),
birth_date date,
first_name varchar(14),
last_name varchar(16),
gender enum('M', 'F'),
hire_date date );

INSERT INTO employees_dup
SELECT
        e.*
FROM 
        employees e
LIMIT 20;

SELECT *
FROM employees_dup;

INSERT INTO employees_dup VALUES
('10001', '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26');

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = 10001 
UNION ALL SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
    dept_manager m;  


SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = 10001 
UNION SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
    dept_manager m;  

SELECT
    *
FROM
    (SELECT
        e.emp_no,
		e.first_name,
		e.last_name,
		NULL AS dept_no,
		NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT
        NULL AS emp_no,
		NULL AS first_name,
		NULL AS last_name,
		dm.dept_no,
		dm.from_date
    FROM
        dept_manager dm) as a
ORDER BY -a.emp_no DESC;

SELECT 
    *
FROM
    dept_manager;

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);

SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            
USE employees;
            
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
      EXISTS (SELECT 
            *
        FROM
            dept_manager dm
		WHERE dm.emp_no = e.emp_no);


SELECT 
    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            t.emp_no = e.emp_no
                AND title = 'Assistant Engineer');
                
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
		MIN(de.dept_no) AS dept_code,
		(SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10040 AND e.emp_no >= 10021
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS B;


DROP TABLE IF EXISTS emp_manager;

CREATE TABLE emp_manager(
emp_no INT(11) NOT NULL,
dept_no VARCHAR(4) NULL,
manager_no INT(11) NOT NULL);

SELECT 
    C.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
		MIN(de.dept_no) AS dept_code,
		(SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS C
UNION SELECT 
    D.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS D;


INSERT INTO emp_manager
SELECT U.*
FROM 
     (SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
		MIN(de.dept_no) AS dept_code,
		(SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10040 AND e.emp_no >= 10021
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS B
UNION SELECT 
    C.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
		MIN(de.dept_no) AS dept_code,
		(SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS C
UNION SELECT 
    D.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS D) AS U;
                                
SELECT *
FROM emp_manager;  


-- self join starting from here
SELECT
e1.*
FROM emp_manager e1
JOIN
emp_manager e2 On e1.emp_no = e2.manager_no;


SELECT 
    e2.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;


SELECT 
    e1.emp_no, e1.dept_no, e2.manager_no
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;


SELECT DISTINCT
e1.*
FROM emp_manager e1
JOIN
emp_manager e2 On e1.emp_no = e2.manager_no;


SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE
    e2.emp_no IN (SELECT 
            manager_no
        FROM
            emp_manager);


-- Using VIEWS in SQL
CREATE OR REPLACE VIEW v_dept_emp AS
SELECT
emp_no, MAX(from_date) as from_date, MAX(to_date) AS to_date
FROM dept_emp
GROUP BY emp_no;

SELECT
emp_no, MAX(from_date) as from_date, MAX(to_date) AS to_date
FROM dept_emp
GROUP BY emp_no;

CREATE OR REPLACE VIEW v_salary AS
SELECT 
ROUND(AVG(salary),2)
FROM salaries s
JOIN
dept_manager m ON s.emp_no = m.emp_no;


USE employees;

/* Syntax for stored procedures
DELIMITER $$
CREATE PROCEDURE procedure_name(Parameters)
BEGIN
      SELECT *
      FROM employees
      LIMIT 1000;
END$$
DELIMITER ;
*/

USE employees;

DROP PROCEDURE IF EXISTS select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN 
      SELECT *
      FROM employees
      LIMIT 1000;
END$$

DELIMITER ;

-- showing how to invoke a stored procedure
-- CALL database_name.procedure_name;
-- CALL procedure_name;
-- also can directly invoke it from the schema section

CALL employees.select_employees();

CALL select_employees();


DELIMITER $$
CREATE PROCEDURE avg_salary()
BEGIN
      SELECT AVG(salary)
      FROM salaries;
END$$
DELIMITER ;

CALL employees.avg_salary();
CALL avg_salary();

-- to reomove any PROCEDURE use DROP PROCEDURE

DROP PROCEDURE select_employees;

-- creating stored procedures with input parameters

DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_salary(IN p_emp_no INT)
BEGIN
       SELECT e.first_name, e.last_name, s.salary, s.from_date, s.to_date
       FROM employees e
       JOIN salaries s ON e.emp_no = s.emp_no
       WHERE e.emp_no = p_emp_no;
END $$
DELIMITER ;

CALL emp_salary(11300);

DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_avg_salary(IN p_emp_no INT)
BEGIN
       SELECT e.first_name, e.last_name, AVG(s.salary) AS avg_salary
       FROM employees e
       JOIN salaries s ON e.emp_no = s.emp_no
       WHERE e.emp_no = p_emp_no
       GROUP By e.emp_no;
END $$
DELIMITER ;

CALL emp_avg_salary(11300);

-- creating stored procedures with output parameters

DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_avg_salary_out(IN p_emp_no INT, OUT p_avg_salary DECIMAL(10,2))
BEGIN
       SELECT AVG(s.salary) AS avg_salary INTO p_avg_salary
       FROM employees e
       JOIN salaries s ON e.emp_no = s.emp_no
       WHERE e.emp_no = p_emp_no;
END $$
DELIMITER ;


DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_info(IN p_first_name VARCHAR(255), In p_last_name VARCHAR(255), OUT p_emp_no INT)
BEGIN
      SELECT
              e.emp_no INTO p_emp_no
	  FROM employees e
      WHERE e.first_name = p_first_name AND e.last_name = p_last_name;
END $$
DELIMITER ;

-- variables

SET @v_emp_no = 0;
CALL employees.emp_info('Parto', 'Bamford', @v_emp_no);
SELECT @v_emp_no;

SET @v_emp_no = 0;
CALL employees.emp_info('Aruna', 'Journel', @v_emp_no);
SELECT @v_emp_no;

-- using user defined functions or stored functions

DELIMITER $$
USE employees $$
CREATE FUNCTION f_emp_avg_salary(p_emp_no INT) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
DECLARE v_avg_salary DECIMAL(10, 2);
SELECT AVG(s.salary) INTO v_avg_salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.emp_no = p_emp_no;
RETURN v_avg_salary;
END $$
DELIMITER ;

SELECT f_emp_avg_salary(11300);


DELIMITER $$
USE employees $$
CREATE FUNCTION f_emp_info(p_first_name VARCHAR(255), p_last_name VARCHAR(255)) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
DECLARE v_max_from_date DATE;
DECLARE v_salary DECIMAL(10, 2);
SELECT
       MAX(from_date) INTO v_max_from_date
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.first_name = p_first_name AND e.last_name = p_last_name;

SELECT
        salary INTO v_salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.first_name = p_first_name AND e.last_name = p_last_name AND s.from_date = v_max_from_date;
RETURN v_salary;
END $$
DELIMITER ;

USE employees;

SELECT f_emp_info('Aruna', 'Journel');


-- local varibles are valid only between BEGIN and END, and are declaed by DECLARE
-- here v_salary is a local varibale valid onlyin this code

DELIMITER $$
USE employees $$
CREATE FUNCTION f_emp_info(p_first_name VARCHAR(255), p_last_name VARCHAR(255)) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
DECLARE v_max_from_date DATE;
DECLARE v_salary DECIMAL(10, 2);
SELECT
       MAX(from_date) INTO v_max_from_date
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.first_name = p_first_name AND e.last_name = p_last_name;

SELECT
        salary INTO v_salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.first_name = p_first_name AND e.last_name = p_last_name AND s.from_date = v_max_from_date;
RETURN v_salary;
END $$
DELIMITER ;

-- session variables are valid only for the opreating session, and are declared by SET

SET @s_var1=3;

SELECT @s_var1;

-- when @s_var1 is used in a new connection, in the new session upon using SELECT @s_var1; we get null value as its a session variable and only valid in this session
-- global variables are applicable to all the connections in a server, they are indicated as:

SET GLOBAL var_name=value;
SET @@global.var_name=value;

-- any varibale cannot be set as global variables, nly predefined SYSTEM VARIABLES are suitable fot this.Ex:

SET GLOBAL max_connections=1000;

-- local variables can only take user defined variables
-- global variables can only take system variables
-- session variables can take both but in case of system variables(only some specific not all)


-- Index( arranges data in the column of a table in a separate place for quicker operation)

USE employees;

SELECT *
FROM employees
WHERE hire_date > '2000-01-01';

CREATE INDEX i_hire_date ON employees(hire_date);

-- before creating index the above operation took 0.163 sec while after creating the index it took around 0.0013sec

CREATE INDEX i_hire_date ON employees(hire_date);


SELECT *
FROM employees
WHERE first_name = 'Georgi' AND last_name = 'Facello';

CREATE INDEX first_and_last_name ON employees(first_name, last_name);

-- before creating index the above operation took 0.149 sec while after creating the index it took around 0.00096sec

SHOW INDEX FROM employees FROM employees;

-- used to show all the index for employees table in the employees database

ALTER TABLE employees
DROP INDEX i_hire_date;

SELECT *
FROM salaries
WHERE salary > 89000;

CREATE INDEX emp_salary ON salaries(salary);
-- before creating index the above operation took 0.0046 sec while after creating the index it took around 0.0032sec

-- case statement(used to obatin a specific value for a specific coindition)

USE employees;

SELECT
emp_no,
first_name,
last_name,
CASE
     WHEN gender = 'M' THEN 'Male'
     ELSE 'Female'
  END AS gender
FROM
   employees;

SELECT
emp_no,
first_name,
last_name,
CASE gender
   WHEN 'M' THEN 'Male'
   ELSE 'Female'
 END AS gender
FROM employees;

-- the second format is not applicable for comparing NULL and NOT NULL

SELECT
 e.emp_no,
 e.first_name,
 e.last_name,
 CASE
   WHEN dm.emp_no IS NOT NULL THEN 'Manager'
   ELSE 'Employee'
END AS is_manager
FROM
  employees e
    LEFT JOIN dept_manager dm ON dm.emp_no = e.emp_no
WHERE e.emp_no > 109990;

-- another way is using if statements (limitaions: with if we can have only 1 conditional expression but with case we can have multiple conditional expressions)

SELECT
  emp_no,
  first_name,
  last_name,
IF(gender = 'M', 'male', 'Female') AS gender
FROM employees;

SELECT
e.emp_no,
e.first_name,
e.last_name,
MAX(s.salary) - MIN(s.salary) AS salary_difference,
CASE 
  WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'salary was raised more than $30000'
  ELSE 'salary was not raised more than $30000'
END AS salary_raise
FROM
 dept_manager dm
 JOIN employees e ON e.emp_no = dm.emp_no
 JOIN salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;

SELECT
e.emp_no,
e.first_name,
e.last_name,
CASE
  WHEN MAX(de.to_date) > SYSDATE() THEN 'Is still employeed'
  ELSE 'Not an employee anymore'
END AS current_employee
FROM
  employees e 
  JOIN dept_emp de ON de.emp_no = e.emp_no
  GROUP BY de.emp_no
  LIMIT 100;

-- window functions

USE employees;

SELECT
    emp_no,
    dept_no,
    ROW_NUMBER() OVER (ORDER BY emp_no) AS row_num
FROM dept_manager;

SELECT
emp_no,
first_name,
last_name,
ROW_NUMBER() OVER (PARTITION BY first_name ORDER BY last_name) AS row_num
FROM employees;

SELECT
    dm.emp_no,
    salary,
    ROW_NUMBER() OVER () AS row_num1,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num2
FROM
dept_manager dm JOIN salaries s ON dm.emp_no = s.emp_no
ORDER BY 
 row_num1, emp_no, salary ASC;

-- other syntax for using window function

SELECT
  emp_no,
  salary,
  ROW_NUMBER () OVER w AS row_num
FROM salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

SELECT
  emp_no,
  first_name,
  ROW_NUMBER () OVER w AS row_num
FROM employees
WINDOW w AS (PARTITION BY first_name ORDER BY emp_no ASC);

-- application of PARTITION BY and GROUP BY clauses together

-- (1)
SELECT a.emp_no,
	MAX(salary) AS max_salary FROM (
   SELECT
    emp_no, salary, ROW_NUMBER() OVER w AS row_num
   FROM
    salaries
   WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)) a
GROUP BY emp_no;

-- (2)
SELECT a.emp_no,
	MAX(salary) AS max_salary FROM (
   SELECT
    emp_no, salary, ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num
   FROM
    salaries) a
GROUP BY emp_no;

-- (3)
SELECT a.emp_no,
       MAX(salary) AS max_salary FROM (
	SELECT
      emp_no, salary
	FROM
	  salaries) a
GROUP BY emp_no;

-- (4)
SELECT a.emp_no,
	   a.salary AS max_salary FROM (
   SELECT
    emp_no, salary, ROW_NUMBER() OVER w AS row_num
   FROM
    salaries
   WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)) a
WHERE a.row_num = 1;


 -- all above four queries give the same results either by using both PARTITION BY and GROUP By or using any one of both
-- the 4th query is much better as it can help in finding out the other saaries tan highest or lowest by changing the number 1 in last line of query


SELECT
  a.emp_no,
  MIN(salary) AS min_salary FROM(
    SELECT
      emp_no, salary, ROW_NUMBER() OVER w AS row_num
	FROM
      salaries
	WINDOW w AS (PARTITION BY emp_no ORDER BY salary)) a
GROUP BY emp_no;

-- RANK() and DENSE_RANK()

-- incase there are data with same emp_no with same salary then how are they ranked, done as following (they are ranked the same in this case)

-- RANK()
SELECT
  emp_no, salary, RANK() OVER w AS rank_num
FROM
  salaries
WHERE emp_no = 11839
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);
-- here we are more concentarted about the total number of contracts offered so this is the best case for using RANK() as total no. of contracts offered is still 12 and is not wrong
-- the rank after the two similar ranked values will start by +2

-- DENSE_RANK()
SELECT
  emp_no, salary, DENSE_RANK() OVER w AS dense_rank_num
FROM
  salaries
WHERE emp_no = 11839
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);
-- here we are more concentarted about the ranking of the number itslef
-- the rank after two similar ranked values will satrt by +1


SELECT
 emp_no, salary, ROW_NUMBER() OVER w AS row_num
FROM
 salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

-- for total number of salary contracts each manager has ever signed
SELECT
  dm.emp_no,
  COUNT(salary) AS no_of_salary_contracts
FROM
  dept_manager dm JOIN salaries s ON dm.emp_no = s.emp_no
GROUP BY emp_no
ORDER BY emp_no;

SELECT
 emp_no, salary, RANK() OVER w AS rank_num
FROM
 salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

SELECT
 emp_no, salary, DENSE_RANK() OVER w AS dense_rank_num
FROM
 salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

USE employees;

SELECT 
  d.dept_no,
  d.dept_name,
  dm.emp_no,
  RANK () OVER w AS department_salary_ranking,
  s.salary, 
  s.from_date AS salary_from_date,
  s.to_date AS salary_to_date,
  dm.from_date AS dept_manager_from_date,
  dm.to_date AS dept_manager_to_date
FROM
   dept_manager dm 
     JOIN
   salaries s ON s.emp_no = dm.emp_no
   AND s.from_date BETWEEN dm.from_date AND dm.to_date
   AND s.to_date BETWEEN dm.from_date AND dm.to_date
     JOIN
   departments d ON d.dept_no = dm.dept_no 
WINDOW w AS (PARTITION BY dm.dept_no ORDER BY s.salary DESC);   


-- VALUE WINDOW FUNCTIONS
-- As ooposed to window functions, value window functions return a value that can be found in the database

-- LAG() returns the value for a specified field of record that preecedes a current row
--  

SELECT *
FROM salaries
WHERE emp_no = 10001;

SELECT
 emp_no,
 salary,
 LAG(salary) OVER w AS previous_salary,
 LEAD(salary) OVER w AS next_salary,
 salary - LAG(salary) OVER w AS diff_current_prvious_salary,
 LEAD(salary) OVER w - salary AS diff_current_next_salary
FROM
 salaries
WHERE
 emp_no = 10001
WINDOW w AS (ORDER BY salary);

-- aggregate functions in context of window functions

SELECT
 s1.emp_no,
 s.salary,
 s.from_date,
 s.to_date
 FROM
  salaries s JOIN 
   (SELECT
       emp_no, MIN(from_date) AS from_date
       FROM salaries
       GROUP BY emp_no) s1 ON s.emp_no =s1.emp_no
	WHERE
     s.from_date = s1.from_date;

SELECT
 de2.emp_no,
 d.dept_no,
 s2.salary,
 AVG(s2.salary) OVER w AS average_salary_per_department
 FROM
   (SELECT
      de.emp_no, de.dept_no, de.from_date, de.to_date
	FROM
      dept_emp de
        JOIN
	  (SELECT
        emp_no, MAX(from_date) AS from_date
        FROM
        dept_emp
        GROUP BY emp_no) de1 ON de1.emp_no = de.emp_no
        WHERE
          de.to_date < '2002-01-01'
          AND de.from_date > '2000-01-01'
          AND de.from_date = de1.from_date) de2
          JOIN
           (SELECT
              s1.emp_no, s.salary, s.from_date, s.to_date
              FROM
               salaries s JOIN
                (SELECT emp_no, MAX(from_date) AS from_date
                FROM salaries
                  GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
				WHERE
                  s.to_date < '2002-01-01'
                  AND s.from_date > '2000-01-01'
                  AND s.from_date = s1.from_date) s2 ON s2.emp_no = de2.emp_no
				JOIN
                  departments d ON d.dept_no = de2.dept_no
                GROUP BY de2.emp_no, d.dept_name
                WINDOW w AS (PARTITION BY de2.dept_no)
                ORDER BY de2.emp_no, salary;  















































































































































































































