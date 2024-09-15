CREATE DATABASE LEETCODE;

USE LEETCODE;

CREATE TABLE prod ( 

     product_id INT PRIMARY KEY,
     low_fats VARCHAR(50),
     recyclable VARCHAR(50)
);

INSERT INTO prod
(product_id, low_fats, recyclable)
VALUES
(0, "Y", "N"),
(1, "Y", "Y"),
(2, "N", "Y"),
(3, "Y", "Y"),
(4, "N", "N");

SELECT * From prod;

SELECT * 
FROM prod
WHERE low_fats = "Y" AND recyclable = "Y";


