CREATE DATABASE ORG;

SHOW DATABASES;

USE ORG;

CREATE TABLE Worker (
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT(15),
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
); 

DROP TABLE Worker;


INSERT INTO Worker
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(001, 'Monika', 'Arora', 100000, '14-02-20
09.00.00', 'HR'),
(002, 'Niharika', 'Verma', 80000, '14-06-11
09.00.00', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '14-02-20
09.00.00', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '14-02-20
09.00.00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '14-06-11
09.00.00', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '14-06-11
09.00.00', 'Account'),
(007, 'Satish', 'Kumar', 75000, '14-01-20
09.00.00', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '14-04-11
09.00.00', 'Admin');


CREATE TABLE Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT INT(10),
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
ON DELETE CASCADE
);


INSERT INTO Bonus
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001, 5000, '16-02-20'),
(002, 3000, '16-06-11'),
(003, 4000, '16-02-20'),
(001, 4500, '16-02-20'),
(002, 3500, '16-06-11');


CREATE TABLE Title (
WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
ON DELETE CASCADE
);


INSERT INTO Title
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');

SELECT * FROM worker;

Select FIRST_NAME AS WORKER_NAME from Worker;

Select distinct DEPARTMENT from worker;

Select substring(FIRST_NAME,1,3) from Worker;

Select INSTR(FIRST_NAME, BINARY'a') from Worker where
FIRST_NAME = 'Amitabh';

Select LTRIM(FIRST_NAME) from Worker;

Select RTRIM(FIRST_NAME) from Worker;

Select distinct length(DEPARTMENT) from Worker;

Select REPLACE(FIRST_NAME,'a','A') from Worker;

Select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'COMPLETE_NAME'
from Worker;

Select * from Worker order by FIRST_NAME asc;

Select * from Worker order by FIRST_NAME asc,DEPARTMENT desc;

SELECT * FROM Worker where FIRST_NAME in ('Vipul', 'Satish');

SELECT * FROM Worker where FIRST_NAME not in ('Vipul', 'Satish');

SELECT * FROM Worker where DEPARTMENT like 'Admin%'; 

SELECT * FROM Worker where FIRST_NAME like '%a';

SELECT * FROM Worker WHERE FIRST_NAME like '_____h';

SELECT * FROM Worker WHERE SALARY between 100000 and 500000;

SELECT * FROM Worker where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;

SELECT COUNT(*) FROM Worker WHERE DEPARTMENT = 'Admin';

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name,
Salary
FROM worker
WHERE WORKER_ID IN
(SELECT WORKER_ID FROM worker
WHERE Salary BETWEEN 50000 AND 100000);

SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers
FROM worker
GROUP BY DEPARTMENT
ORDER BY No_Of_Workers DESC;

SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) <> 0;

SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) = 0;

SELECT * INTO WorkerClone FROM Worker;

CREATE TABLE WorkerClone LIKE Worker;

SELECT * FROM WorkerClone;

SELECT * FROM Worker
MINUS;
SELECT * FROM Title;

SELECT CURDATE();

SELECT NOW();

SELECT getdate();

SELECT * FROM Worker ORDER BY Salary DESC LIMIT 10;












































































































































































































































