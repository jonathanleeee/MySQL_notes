-- COUNT 
-- cannot reply on ID because the ID does not shift when you delete.

SELECT COUNT(*) FROM books;

SELECT COUNT(author_fname) FROM books;

SELECT COUNT(DISTINCT author_fname) FROM books;

SELECT COUNT(DISTINCT author_lname) FROM books;

SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;

SELECT title FROM books WHERE title LIKE '%the%';

SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

-- GROUP BY 
-- summerizes or aggregates identical data into single rows

SELECT title, author_lname FROM books;

SELECT title, author_lname FROM books
GROUP BY author_lname;

SELECT author_lname, COUNT(*) 
FROM books GROUP BY author_lname;


SELECT title, author_fname, author_lname FROM books;

SELECT title, author_fname, author_lname FROM books GROUP BY author_lname;

SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname;

SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;

SELECT released_year FROM books;

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) released') AS year FROM books GROUP BY released_year;

-- MIN and MAX 

SELECT MIN(released_year) 
FROM books;

SELECT MIN(released_year) FROM books;

SELECT MIN(pages) FROM books;

SELECT MAX(pages) 
FROM books;

SELECT MAX(released_year) 
FROM books;

SELECT MAX(pages), title
FROM books; -- this is wrong

-- solution 
-- use sub query
SELECT * FROM books 
WHERE pages = (SELECT Min(pages) 
                FROM books); 

SELECT title, pages FROM books 
WHERE pages = (SELECT Max(pages) 
                FROM books); 

SELECT title, pages FROM books 
WHERE pages = (SELECT Min(pages) 
                FROM books); 

-- OR

SELECT * FROM books 
ORDER BY pages ASC LIMIT 1;

SELECT title, pages FROM books 
ORDER BY pages ASC LIMIT 1;

SELECT * FROM books 
ORDER BY pages DESC LIMIT 1;

-- SUM 

SELECT SUM(pages)
FROM books;

SELECT SUM(released_year) FROM books;

SELECT author_fname,
       author_lname,
       Sum(pages)
FROM books
GROUP BY
    author_lname,
    author_fname;

SELECT author_fname,
       author_lname,
       Sum(released_year)
FROM books
GROUP BY
    author_lname,
    author_fname;

-- AVG

SELECT AVG(released_year) 
FROM books;

SELECT AVG(pages) 
FROM books;

SELECT AVG(stock_quantity) 
FROM books 
GROUP BY released_year;

SELECT released_year, AVG(stock_quantity) 
FROM books 
GROUP BY released_year;

SELECT author_fname, author_lname, AVG(pages) FROM books
GROUP BY author_lname, author_fname;












