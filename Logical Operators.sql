-- Not Equal 
-- Select books that were not released in 2017
!=

SELECT title FROM books
WHERE year != 2017;

-- Not Like
-- Select books with titles that don't start with 'W'
NOT LIKE

SELECT title FROM books
WHERE title NOT LIKE 'W%';

-- Greater Than
-- Select books released after the year 2000
>
SELECT * FROM books
WHERE released_year > 2000;

-- Greater than or equal to
>=

-- Less than
<
-- Select books released before the year 2000
SELECT * FROM books
WHERE released_year < 2000;

-- Less than or equal to 
<=

-- Logical And
&& 
AND

SELECT  
    title, 
    author_lname, 
    released_year FROM books
WHERE author_lname='Eggers' 
    AND released_year > 2010;

SELECT * 
FROM books
WHERE author_lname='Eggers' 
    AND released_year > 2010 
    AND title LIKE '%novel%';


-- Logical Or
||
OR

SELECT 
    title, 
    author_lname, 
    released_year 
FROM books
WHERE author_lname='Eggers' || released_year > 2010;

Condition 1 && Condition 2
Both sides must be true

Condition 1 || Condition 2
One side must be true


-- Between

BETWEEN X AND Y

SELECT title, released_year FROM books WHERE released_year >= 2004 && released_year <= 2015;

SELECT title, released_year FROM books 
WHERE released_year BETWEEN 2004 AND 2015;

-- Not Between

SELECT title, released_year FROM books 
WHERE released_year NOT BETWEEN 2004 AND 2015;

-- CAST()
SELECT CAST('2017-05-02' AS DATETIME);

SELECT 
    name, 
    birthdt 
FROM people
WHERE 
    birthdt BETWEEN CAST('1980-01-01' AS DATETIME)
    AND CAST('2000-01-01' AS DATETIME);

-- IN

SELECT 
    title, 
    author_lname 
FROM books
WHERE author_lname='Carver' OR
      author_lname='Lahiri' OR
      author_lname='Smith';

SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

SELECT title, released_year FROM books
WHERE released_year IN (2017, 1985);

-- NOT IN

SELECT title, released_year FROM books
WHERE released_year != 2000 AND
      released_year != 2002 AND
      released_year != 2004 AND
      released_year != 2006 AND
      released_year != 2008 AND
      released_year != 2010 AND
      released_year != 2012 AND
      released_year != 2014 AND
      released_year != 2016;

SELECT title, released_year FROM books
WHERE released_year NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016);

SELECT title, released_year FROM books
WHERE released_year >= 2000
AND released_year NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016);

-- Modulo %    

SELECT title, released_year FROM books
WHERE released_year >= 2000 AND
released_year % 2 != 0;

SELECT title, released_year FROM books
WHERE released_year >= 2000 AND
released_year % 2 != 0 ORDER BY released_year;

-- Case Statements

SELECT title, released_year,
       CASE 
         WHEN released_year >= 2000 THEN 'Modern Lit'
         ELSE '20th Century Lit'
       END AS GENRE
FROM books;

SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;

----------------------------------------------------------------

-- Logical Operators Exercises 
SELECT 10 != 10; -- false 0
SELECT 15 > 14 && 99 - 5 <= 94; -- true 1
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10; -- true 1

-- Select all books writeen before 1980 (non inclusive)

SELECT title, released_year FROM books 
WHERE released_year < 1980;

-- Select all books writeen by Eggers Or Chabon

SELECT title author_lname FROM books
WHERE author_lname = 'Eggers' || author_lname = 'Chabon';

SELECT title, author_lname FROM books
WHERE author_lname IN ('Eggers', 'Chabon');

-- Select all book written by Lahiri, Published after 2000

SELECT title, author_lname, released_year FROM books
WHERE author_lname = 'Lahiri' && released_year >= 2000;

-- Select All books with page counts between 100 and 200

SELECT title, pages FROM books
WHERE pages BETWEEN 100 AND 200;

-- Select all books where author_lname starts with a 'C' or and 'S'
SELECT title, author_lname FROM books
WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

SELECT title, author_lname FROM books
WHERE SUBSTR(author_lname,1,1) IN ('C','S');
-- if title contians 'stories' -> Short Stories
-- Just Kids and A Heartbreaking Work -> Memoir
-- Everything Else -> Novel

SELECT title, author_lname,
		CASE 
				WHEN title LIKE '%Stories%' THEN 'Short Stories'
				WHEN title LIKE '%Just Kids%' OR '%A Heartbreaking Work%' THEN 'Memoir'
				ELSE 'Novel'
		END AS TYPE
FROM books;				  

SELECT 
    title, 
    author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title = 'Just Kids' OR title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM books;

-- Bonus: Make this happen

SELECT author_fname, author_lname,
    CASE 
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books 
GROUP BY author_lname, author_fname;














