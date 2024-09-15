

CREATE DATABASE college;


USE college;

CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50)
);


SELECT * FROM student;

INSERT INTO student
(rollno, name)
VALUES
(104, "Shyam");

Create database XYZ;

CREATE DATABASE XYZ;

USE XYZ;

CREATE TABLE empinfo (
     Name VARCHAR(50),
     ID INT PRIMARY KEY,
     Salary INT NOT NULL
);

INSERT INTO empinfo 
(Name, ID, Salary)
VALUES
("Adam", 1, 25000),
("Bob", 2, 30000),
("Casey", 3, 40000);

SELECT * FROM empinfo;

CREATE TABLE temp1 (
   id INT UNIQUE
);

INSERT INTO temp1 VALUES (101);
INSERT INTO temp1 VALUES (102);

SELECT * FROM temp1;

CREATE TABLE temp1 (
   id INT,
   name VARCHAR(50),
   age INT,
   city VARCHAR(20),
   PRIMARY KEY (id, name)
);

CREATE TABLE emp (
   id INT,
   salary INT DEFAULT 25000
);

INSERT INTO emp (id) VALUES (101);

SELECT * FROM emp;

CREATE TABLE student1 (
    
    Rollno INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT NOT NULL,
    Grade VARCHAR(1),
    City VARCHAR(20)

);

INSERT INTO stu
(RollNo, Name, Marks, Grade, City)
VALUES
(101, "Anil", 78, "C", "Pune"),
(102, "Bhumika", 93, "A", "Mumbai"),
(103, "Chetan", 85, "B", "Mumbai"),
(104, "Dhruv", 96, "A", "Delhi"),
(105, "Emanuel", 12, "F", "Delhi"),
(106, "Farah", 82, "B", "Delhi");
 
SELECT * FROM student1;
 
SELECT name, marks FROM student1;

SELECT DISTINCT city FROM student1; 

SELECT * FROM student1 WHERE marks > 80;

SELECT * FROM student1 WHERE city = "Mumbai";

SELECT *
FROM student1
WHERE marks + 10 > 100;

SELECT *
FROM student1
WHERE marks = 93;


SELECT *
FROM student1
WHERE marks > 90 AND city = "Mumbai";

SELECT *
FROM student1
WHERE marks BETWEEN 80 AND 90;

SELECT * FROM student1 WHERE city IN ("Delhi", "Mumbai");

SELECT * FROM student1 WHERE city NOT IN ("Delhi", "Mumbai");

SELECT *
FROM student1
ORDER BY city DESC
LIMIT 3;

SELECT max(marks)
FROM student1;

SELECT avg(marks)
FROM student1;
SELECT count(rollno)
FROM student1;

#GroupBy

SELECT city, count(name)
FROM student1
GROUP BY city;

SELECT city, avg(marks)
FROM student1
GROUP BY city
ORDER BY avg(marks) DESC;

CREATE DATABASE payment;

use payment;

CREATE TABLE pay (
  customer_id INT PRIMARY KEY,
   customer VARCHAR(50),
   mode VARCHAR(50),
   city VARCHAR(50)

);

INSERT INTO pay 
(customer_id, customer, mode, city)
VALUES
(101, "Olivia Barrett", "Netbanking", "Portland"),
(102, "Ethan Sinclair", "Credit Card", "Miami"),
(103, "Maya Hernandez", "Credit Card", "Seattle"),
(104, "Liam Donovan", "Netbanking", "Denver"),
(105, "Sophia Nyugen", "Credit Card", "New Orleans"),
(106, "Caleb Foster", "Debit Card", "Minneapolis"),
(107, "Ava Patel", "Debit Card", "Phoenix"),
(108, "Lucas Carter", "Netbanking", "Boston"),
(109, "Isabella Martinez", "Netbanking", "Nashville"),
(110, "Jackson Brooks", "Credit Card", "Boston");

SELECT * FROM pay;

SELECT mode, count(customer)
FROM pay
GROUP BY mode;

USE COLLEGE;

SELECT grade, count(rollno)
FROM student1
GROUP BY grade
ORDER BY grade;

#Having 

SELECT count(name), city
FROM student1
GROUP BY city
HAVING max(marks) > 90;

SELECT DISTINCT city FROM student1;

SELECT city, count(rollno)
FROM student1
GROUP BY city
HAVING MAX(marks) > 90;

#SELECT
#FROM
#WHERE
#GROUP BY
#HAVING
#ORDER BY ASC OR DESC 

SELECT city
From student1
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks) > 93
ORDER BY city ASC;

#TABLE UPDATE

#SAFE MODE
SET SQL_SAFE_UPDATES = 0;

UPDATE student1
SET grade = "O"
WHERE grade = "A";

SELECT * FROM student1;

UPDATE student1
SET marks = 82
WHERE rollno = 105;

UPDATE student1
SET grade = "B"
WHERE marks BETWEEN 80 AND 90;

UPDATE student1
SET marks = marks + 1;

UPDATE student1
SET marks = 12
WHERE rollno = 105;

#DELETE FROM
DELETE FROM student1
WHERE marks < 33;

CREATE TABLE dept (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

# CASCADING 
CREATE TABLE teacher (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

DROP TABLE teacher;


INSERT INTO dept
VALUES
(101, "English"),
(102, "IT");

UPDATE dept
SET id = 111
WHERE id = 101;

SELECT * FROM dept;

INSERT INTO teacher
VALUES 
(101, "Adam", "101"),
(102, "Adam", "102");

SELECT * FROM teacher;

# ALTER

ALTER TABLE student1
ADD COLUMN age INT;

SELECT * FROM student1;

ALTER TABLE student1
DROP COLUMN age;

ALTER TABLE student1
ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE student1
MODIFY COLUMN age VARCHAR(2);

ALTER TABLE student1
CHANGE age stu_age INT;

INSERT INTO student1
(rollno, name, marks, age)
VALUES
(107, "gargi", 68, 22);

ALTER TABLE student1
DROP COLUMN stu_age;

ALTER TABLE student1
RENAME TO stu;

# TRUNCATE

TRUNCATE TABLE stu;

SELECT * FROM stu; 

ALTER TABLE stu
CHANGE name full_name VARCHAR(50);

ALTER TABLE stu
DROP COLUMN grade;

DELETE FROM stu
WHERE marks < 80;

# JOINS OUTER & INNER

CREATE TABLE student2 (
     student_id INT PRIMARY KEY,
     name VARCHAR(50)
);

INSERT INTO student2
VALUES
(101, "Adam"),
(102, "Bob"),
(103, "Casey");

CREATE TABLE course (
     student_id INT PRIMARY KEY,
     course VARCHAR(50)
);

INSERT INTO course
VALUES
(102, "English"),
(105, "Math"),
(103, "Science"),
(107, "Computer Science");


#INNER
SELECT *
FROM student2 as s
INNER JOIN course as c
ON s.student_id = c.student_id;


# CONNECT RIGHT & LEFT FOR JOIN

SELECT *
FROM student2 as s
LEFT JOIN course as c
ON s.student_id = c.student_id;

#UNION


SELECT *
FROM student2 as s
RIGHT JOIN course as c
ON s.student_id = c.student_id;

SELECT *
FROM student2 as s
LEFT JOIN course as c
ON s.student_id = c.student_id
WHERE c.student_id IS NULL
UNION
SELECT *
FROM student2 as s
RIGHT JOIN course as c
ON s.student_id = c.student_id
WHERE s.student_id IS NULL;

#SELF JOIN

DROP TABLE employee;

CREATE TABLE employee (
   id INT PRIMARY KEY,
   name VARCHAR(50),
   manager_id INT
);

INSERT INTO employee 
(id, name, manager_id)
VALUES
(101, "Adam", 103),
(102, "Bob", 104),
(103, "Casey", NULL),
(104, "Donald", 103);

SELECT a.name as manager_name, b.name
FROM employee as a
JOIN employee as b
ON a.student_id = b.manager_id;

SELECT * FROM employee;

SELECT a.name as manage_name, b.name
FROM employee as a
join employee as b
ON a.id = b.manager_id;

# UNION & UNION ALL
SELECT name FROM employee
UNION ALL
SELECT name FROM employee;


CREATE TABLE sub (
     rollno INT PRIMARY KEY,
     name VARCHAR(50),
     marks INT NOT NULL
);

INSERT INTO sub
(rollno, name, marks)
VALUES
(101, "Anil", 78),
(102, "Bhumika", 93),
(103, "Chetan", 85),
(104, "Dhruv", 96),
(105, "Emanuel", 92),
(106, "Farah", 82);

SELECT * FROM sub;

SELECT avg(marks)
FROM sub;

SELECT name, marks
FROM sub
WHERE marks > (SELECT AVG(marks) FROM sub);

SELECT rollno, name
FROM sub
WHERE rollno % 2 = 0;

CREATE TABLE sub1 (
     rollno INT PRIMARY KEY,
     name VARCHAR(50),
     marks INT NOT NULL,
     city VARCHAR(50)
);

INSERT INTO sub1
(rollno, name, marks, city)
VALUES
(101, "Anil", 78, "Pune"),
(102, "Bhumika", 93, "Mumbai"),
(103, "Chetan", 85, "Mumbai"),
(104, "Dhruv", 96, "Dehi"),
(105, "Emanuel", 92, "Delhi"),
(106, "Farah", 82, "Delhi");

SELECT * FROM sub1;

USE college;

SELECT MAX(marks)
FROM (SELECT * FROM sub1 WHERE city = "Mumbai") AS temp;

SELECT MAX(marks)
FROM sub1
WHERE city = "Mumbai";

SELECT MAX(marks)
FROM sub1
WHERE city = "Delhi";

SELECT MAX(marks)
FROM (SELECT * FROM sub1 WHERE city = "Delhi") AS temp;

SELECT (SELECT MAX(marks) FROM sub1), name
FROM sub1;

# VIEWS

CREATE VIEW view1 AS
SELECT rollno, name FROM sub1;

SELECT * FROM view1;


CREATE VIEW view2 AS
SELECT rollno, name, city FROM sub1;

SELECT * FROM view2;

CREATE VIEW view3 AS
SELECT marks, city FROM sub1;

SELECT * FROM view3;

DROP VIEW view1;













 





































































































































































































































































