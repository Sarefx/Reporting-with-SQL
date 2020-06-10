select *
from "table"
order by 1 ASC

-- Challenge #1
-- Task #1
select * 
from phone_book 
order by last_name asc, first_name asc
-- Task #2
select *
from books
order by first_published desc
-- Task #3
select *
from books
order by genre, title
-- Challenge completed

-- SELECT * FROM <table> LIMIT <# of rows>;

-- Challenge #2
-- Task #1
select *
from books
where genre = 'Fantasy'
order by first_published asc
limit 5
-- Task #2
select *
from books
where genre = 'Science Fiction'
order by first_published asc
limit 11
-- Challenge completed

-- SELECT * FROM <table> LIMIT <# of rows> OFFSET <skipped rows>;
-- other way of doing it
-- SELCT TOP <skipped rows> * FROM <table>;

-- Challenge #3
-- Task #1
select *
from books
order by title asc
limit 10
offset 10
-- Task #2
select *
from phone_book
order by last_name, first_name
limit 20
offset 40
-- Challenge completed

-- Concatenation Operator: ||

SELECT  first_name || ' ' || last_name AS "Full Name"
FROM customers

-- Challenge #1
-- Task #1
SELECT first_name || ' ' || last_name || ' ' || '<' || email || '>' AS to_field
FROM patrons
-- Task #2
SELECT street || ', ' || city || ', ' || state || ' ' || zip || '. ' || country AS address
FROM addresses 
-- Challenge completed

-- SELECT LENGTH(<column>) AS <alias> FROM <table>;

SELECT  username, LENGTH(username) as length
FROM customers

-- Challenge #2
-- Task #1
SELECT title, LENGTH(title) as longest_length
FROM books
ORDER BY longest_length DESC
LIMIT 1
-- Challenge completed

-- LOWER(<value or column>)
-- UPPER(<value or column>)
SELECT * FROM customers WHERE LOWER(email) = "andrew@teamtreehouse.com"

-- Challenge #3
-- Task #1
SELECT first_name || ' ' || UPPER(last_name) as full_name, library_id
FROM patrons   
-- Challenge completed

-- SUBSTR(<value or column>, <start>, <length>)
SELECT name, SUBSTR(description, 1, 50) || '...' AS short_description, price FROM products

-- Challenge #4
-- Task #1
SELECT SUBSTR(first_name, 1, 1) as initial, last_name
FROM customers      
-- Challenge completed

-- REPLACE(<value or column>, <target>, <replacement>)
SELECT street, city, zip FROM addresses
WHERE REPLACE(state, "California", "CA") = "CA"

-- Challenge #5
-- Task #1
SELECT REPLACE(email, "@", "<at>") AS obfuscated_email
FROM customers
-- Challenge completed

-- COUNT(<column>)
SELECT COUNT(*) FROM customers ORDER BY id DESC LIMIT 1

-- Challenge #1
-- Task #1
SELECT COUNT(*) as "scifi_book_count" FROM books WHERE genre = 'Science Fiction'
-- Task #2
SELECT COUNT(*) as "jk_book_count" FROM books WHERE author = 'J.K. Rowling'
-- Challenge completed

-- SELECT <column> FROM <table> GROUP BY <column>
SELECT category, COUNT(*) AS product_count FROM products GROUP BY category

-- Challenge #2
-- Task #1
SELECT genre, COUNT(*) as "genre_count" FROM books GROUP BY 1
-- Task #2
SELECT COUNT(DISTINCT genre) as "total_genres" FROM books
-- Challenge completed

-- SUM(<column>)
SELECT SUM(cost) AS "total_spend", user_id FROM orders GROUP BY user_id ORDER BY total_spend DESC LIMIT 1

SELECT SUM(cost) AS "total_spend", user_id FROM orders GROUP BY user_id HAVING total_spend > 250 ORDER BY total_spend DESC

-- Challenge #3
-- Task #1
SELECT SUM(rating) AS "starman_total_ratings" FROM reviews WHERE movie_id = 6
-- Challenge completed

-- AVG(<column>)
SELECT AVG(cost) AS "average" FROM orders

-- Challenge #4
-- Task #1
SELECT AVG(rating) AS "average_rating" FROM reviews WHERE movie_id = 6
-- Challenge completed

-- MAX(<numeric column>) MIN(<numeric column>)
SELECT AVG(cost), MAX(cost), MIN(cost), user_id FROM orders GROUP BY user_id

-- Challenge #5
-- Task #1
SELECT MIN(rating) AS "star_min", MAX(rating) AS "star_max" FROM reviews WHERE movie_id = 6
-- Challenge completed

SELECT 5 + 5 -- equals to 10

SELECT name, price * 1.06 AS "Price in Florida" FROM products

-- ROUND(<value>, <decimal places>)

-- Challenge #6
-- Task #1
SELECT name, ROUND(price / 1.4, 2) AS "price_gbp" FROM products 
-- Challenge completed

SELECT DATE("now") -- for SQLite

-- Challenge #1
-- Task #1
SELECT count(*) AS "shipped_today" FROM orders WHERE status = 'shipped' and ordered_on = DATE("now")
-- Challenge completed

-- DATE(<time string>, <modifiers>)
SELECT COUNT(*) FROM orders WHERE ordered_on BETWEEN DATE("now", "-7 days") AND DATE("now", "-1 day")

-- Challenge #2
-- Task #1
SELECT COUNT(*) AS "ordered_yesterday_and_shipped" FROM orders WHERE ordered_on = DATE("now", "-1 day") AND status = 'shipped'
-- Challenge completed

-- STRFTIME(<format string>, <time string>, <modifier>)
SELECT *, STRFTIME("%d/%m/%Y", ordered_on) AS "UK_date" FROM orders

-- Challenge #3
-- Task #1
SELECT title, STRFTIME("%m/%Y", date_released) AS "month_year_released" FROM movies
-- Challenge completed