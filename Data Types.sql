-- CHAR vs VARCHAR
-- CHAR is faster for fixed length text such as state abbreviations,sex,yes/no
-- example 
CREATE TABLE dogs (name CHAR(5), breed VARCHAR(10));

-- INT whole numbers
-- DECIMAL
-- DECIMAL(total number of digits(precision),digits after decimal(scale))
-- 999.99 (5 digits(999.99), 2 digits(.99))
CREATE TABLE items(price DECIMAL(5,2));

-- FLOAT and DOUBLE
-- Store larger numbers using less space, it comes at the cost of precision
-- Data Type | Memory Needed | Precision Issues|
------------------------------------------------
-- FLOAT     | 4 Bytes       | ~7 digits       |
------------------------------------------------
-- DOUBLE    | 8 Bytes       | ~15 digits      |
------------------------------------------------
-- always use decimal unless precision doesn't matter
CREATE TABLE thingies (price FLOAT);
INSERT INTO thingies(price) VALUES (88877665544.45);
+-------------+
| price       |
+-------------+
| 88877700000 |
+-------------+

-- Dates & Times
-- DATA: value with date but no time 'YYYY-MM-DD' format
-- TIME: values with a time but no date 'HH:MM:SS' format
-- DATETIME: values with a date and time 'YYYY-MM-DD HH:MM:SS' format

CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');

-- CURDATE() - gives current date
-- CURTIME() - gives current time
-- NOW() - gives current datetime
INSERT INTO people (name, birthdate, birthtime, birthdt) 
VALUES ('Microwave', CURDATE(), CURTIME(), NOW());

-- Formatting Dates
-- DAY()
-- DAYNAME()
-- DAYOFWEEK()
-- DAYOFYEAR()
-- MONTHNAME()
-- MINUTE()
-- DATE_FORMAT(date, format_mask)
SELECT name, birthtime, DAYOFYEAR(birthtime) FROM people;
SELECT name, birthdate, MONTHNAME(birthdate) FROM people;
SELECT DATE_FORMAT('2009-10-04 22:23:00', '%W %M %Y');

-- Date Math
-- Date Arithmetic
-- DATEDIFF
-- DATE_ADD
-- +/-
SELECT DATEDIFF(NOW(), birthdate) FROM people;
SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;
SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;

-- TIMESTAMPS
-- TIMESTAMP is less space and less range comapres to DATETIME
-- NOW() AND CURRENT_TIMESTAMP are the same

CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
);

-- Data type exercises 

-- 1. What's a good use case for CHAR? 
--    faster for fixed length, save space and good for appreviations

-- 2. Fill in the blanks

CREATE TABLE inventory (
		item_name VARCHAR(50),
		price DECIMAL(8,2),
		quantity INT
);

-- 3. What's the difference between DATETIME and TIMESTAMP?
--    TIMESTAMP less space(memory) and shorter range 

-- 4. Print out the current time

SELECT CURTIME();

-- 5. Print Out the current date (but not time)

SELECT CURDATE();

-- 6. Print out the current day of the week (the number)

SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(NOW(), '%w');

-- 7. Print out the current day of the week

SELECT DATE_FORMAT(NOW(), '%W');
SELECT DAYNAME(NOW());

-- 8. Print out the current day and time using this format:
--    mm/dd/yyyy

SELECT DATE_FORMAT(NOW(), '%m/%d/%Y');

-- 9. Print out the current day and time using this format:
-- January 2nd at 3:15
-- April 1st at 10:18

SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

-- 10. Create a tweets table that stores:
--     The Tweet content
--     A Username
--     Time it was created

CREATE TABLE tweets
(
  content VARCHAR(140),
  username VARCHAR(20),
  created TIMESTAMP DEFAULT NOW()
);






























