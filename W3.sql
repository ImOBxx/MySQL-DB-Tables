CREATE DATABASE W3;

USE W3;

#1
CREATE TABLE country (

    country_id VARCHAR(50),
    country_name VARCHAR(50) NOT NULL,
    region_id INT NOT NULL
);

INSERT INTO country
(country_id, country_name, region_id)
VALUES
('C1', 'India', 1001);

SELECT * FROM country;

#2
CREATE TABLE if not exists country (

    country_id VARCHAR(50),
    country_name VARCHAR(50),
    region_id INT NOT NULL
);

#3
CREATE TABLE IF NOT EXISTS dup_countries
LIKE country;

#4
SELECT * FROM country;

#5
CREATE TABLE country1 (

    country_id VARCHAR(50) NOT NULL,
    country_name VARCHAR(50) NOT NULL,
    region_id INT NOT NULL
);

#6
CREATE TABLE salary (
    job_id INT NOT NULL,
    job_title VARCHAR(50),
    min_salary INT NOT NULL,
    max_salary INT NOT NULL,
    CHECK(max_salary <= 25000)
);

DROP TABLE job_histry;

#7
CREATE TABLE country1 (

    country_id VARCHAR(50) NOT NULL,
    country_name VARCHAR(50) NOT NULL,
    CHECK (country_name IN ('Italy', 'India', 'China')),
    region_id INT NOT NULL
);

#8
CREATE TABLE job_histry (

	employee_id INT NOT NULL,
    start_date INT NOT NULL,
    end_date DATE NOT NULL,
    CHECK (end_date LIKE '--/--/----'),
    job_id INT NOT NULL,
    department_id INT NOT NULL
);

#9
CREATE TABLE coutries1 (
    
    country_id INT NOT NULL,
    country_name VARCHAR(50),
    region_id INT NOT NULL,
    UNIQUE(country_id)

); 

#10
CREATE TABLE salary1 (
    job_id INT NOT NULL UNIQUE,
    job_title VARCHAR(50) DEFAULT ' ',
    min_salary INT NOT NULL DEFAULT 8000,
    max_salary INT NOT NULL DEFAULT NULL
    
    
);

DROP TABLE salary1;

#11
CREATE TABLE coutries2 (
    
    country_id INT NOT NULL UNIQUE PRIMARY KEY,
    country_name VARCHAR(50),
    region_id INT NOT NULL,
    UNIQUE(country_id)
); 

#12
CREATE TABLE coutries3 (
    
    country_id INT NOT NULL UNIQUE auto_increment PRIMARY KEY,
    country_name VARCHAR(50),
    region_id INT NOT NULL,
    UNIQUE(country_id)
); 

#13
CREATE TABLE coutries4 (
    
    country_id INT NOT NULL,
    country_name VARCHAR(50),
    region_id INT NOT NULL,
    UNIQUE(country_id)
); 

#14
CREATE TABLE job_history (

	employee_id INT NOT NULL PRIMARY KEY,
    start_date INT NOT NULL,
    end_date DATE NOT NULL,
    job_id INT NOT NULL,
    department_id INT DEFAULT NULL,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

#15
CREATE TABLE employees2 (

	employee_id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) DEFAULT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NULL,
    phone_number INT NOT NULL DEFAULT NULL,
    hire_date DATE NOT NULL,
    job_id INT NOT NULL,
    salary INT DEFAULT NULL,
    commision INT DEFAULT NULL,
    manager_id INT DEFAULT NULL,
    department_id INT DEFAULT NULL,
    
    FOREIGN KEY(department_id, manager_id) REFERENCES departments(department_id, manager_id)
);

DROP TABLE employees1; 

ENGINE = InnoDB;

#16
CREATE TABLE employees3 (

	employee_id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) DEFAULT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NULL,
    phone_number INT NOT NULL DEFAULT NULL,
    hire_date DATE NOT NULL,
    job_id INT NOT NULL,
    salary INT DEFAULT NULL,
    commision INT DEFAULT NULL,
    manager_id INT DEFAULT NULL,
    department_id INT DEFAULT NULL,
    
    FOREIGN KEY(department_id) REFERENCES departments(department_id),
    FOREIGN KEY(job_id) REFERENCES jobs(job_id)
    
);



























































































































































































































































































































































































































































































