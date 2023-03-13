-- SQL ZOO 

-- Tutorial 0.
-- 1. The example uses a WHERE clause to show the population of 'France'. Note that strings (pieces of text that are data) 
-- should be in 'single quotes'; Modify it to show the population of Germany.
-- SELECT population FROM world
--   WHERE name = 'France'

SELECT population FROM world
WHERE name = 'Germany'

-- 2. Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population 
-- for the countries 'Brazil', 'Russia', 'India' and 'China'. Show the name and the population for 'Sweden', 'Norway' 
-- and 'Denmark'.
-- SELECT name, population FROM world
--   WHERE name IN ('Brazil', 'Russia', 'India', 'China');

SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark')

-- 3. Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of 
-- boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the 
-- country and the area for countries with an area between 200,000 and 250,000.
-- SELECT name, area FROM world
--   WHERE area BETWEEN 250000 AND 300000
-- Submit SQLRestore default

SELECT name, area FROM world
  WHERE area BETWEEN 250000 AND 300000
Submit SQLRestore default

-- Tutorial 1. 
  
-- 1. You can use WHERE name LIKE 'B%' to find the countries that start with "B". 
-- The % is a wild-card it can match any characters
-- Find the country that start with Y

-- SELECT name FROM world
--   WHERE name LIKE 'F%' 

SELECT name FROM world
WHERE name LIKE 'Y%'

-- 2. Find the countries that end with y
-- SELECT name FROM world
--   WHERE name LIKE 'T%' 

SELECT name FROM world
WHERE name LIKE '%y'

-- 3. Luxembourg has an x - so does one other country. List them both.
-- Find the countries that contain the letter x
-- SELECT name FROM world
--   WHERE name LIKE 'T%' 

SELECT name FROM world
WHERE name LIKE '%x%'

-- 4. Iceland, Switzerland end with land - but are there others?
-- Find the countries that end with land
-- SELECT name FROM world
--   WHERE name LIKE 'T%' 

SELECT name FROM world
WHERE name LIKE '%land'

-- 5. Columbia starts with a C and ends with ia - there are two more like this.
-- Find the countries that start with C and end with ia
-- SELECT name FROM world
--   WHERE name LIKE 'T%' 

SELECT name FROM world
WHERE name LIKE 'C%ia'

-- 6. Greece has a double e - who has a double o?
-- Find the country that has oo in the name
-- SELECT name FROM world
--   WHERE name LIKE '%ee%' 

SELECT name FROM world
WHERE name LIKE '%oo%'

-- 7. Bahamas has three a - who else?
-- Find the countries that have three or more a in the name
-- SELECT name FROM world
--   WHERE name LIKE 'T%' 

SELECT name FROM world
WHERE name LIKE '%a%a%a%'

-- 8. India and Angola have an n as the second character. You can use the underscore as a single character wildcard.
-- SELECT name FROM world
--  WHERE name LIKE '_n%'
-- ORDER BY name
-- Find the countries that have "t" as the second character.

SELECT name FROM world
WHERE name LIKE '_t%'

-- SELECT name FROM world
--  WHERE name LIKE '_n%'
-- ORDER BY name 

-- 9. Lesotho and Moldova both have two o characters separated by two other characters.
-- Find the countries that have two "o" characters separated by two others.
-- SELECT name FROM world
--  WHERE name LIKE '_n%' 

SELECT name FROM world
WHERE name LIKE '%o__o%'
ORDER BY name

-- 10. Cuba and Togo have four characters names.
-- Find the countries that have exactly four characters.
-- SELECT name FROM world
--  WHERE name LIKE 'Cu%' 
-- Find the Duplicates Game
-- Harder Questions
-- Well done for getting this far.
-- The next questions are optional and only for students who are finding the basic questions too easy.

SELECT name FROM world
WHERE LEN(name) = 4

-- 11. The capital of Luxembourg is Luxembourg. Show all the countries where the capital is the same as the name of the country
-- Find the country where the name is the capital city.
-- SELECT name, capital, continent
--   FROM world
--  WHERE name LIKE '%x%' 

SELECT name
FROM world
WHERE name = capital;

-- 12. The capital of Mexico is Mexico City. Show all the countries where the capital has the country together with the word "City".
-- Find the country where the capital is the country plus "City".
-- The concat function
-- SELECT name, concat(name, 'town')
--   FROM world
--  WHERE name LIKE '%ina%' 

SELECT name 
FROM world 
WHERE capital = CONCAT(name, ' City');

-- 13. Find the capital and the name where the capital includes the name of the country.
 
SELECT capital, name
FROM world
WHERE capital LIKE CONCAT(name, '%') OR capital LIKE CONCAT('%', name, '%') OR capital LIKE CONCAT('%', name);

-- 14. Find the capital and the name where the capital is an extension of name of the country.
-- You should include Mexico City as it is longer than Mexico. You should not include Luxembourg as the capital is the same as the country.
 
SELECT capital, name
FROM world
WHERE capital LIKE CONCAT(name, '_%') AND capital <> name;

-- 15. For Monaco-Ville the name is Monaco and the extension is -Ville.
-- Show the name and the extension where the capital is an extension of name of the country.
-- You can use the SQL function REPLACE.

SELECT name, REPLACE(capital, name, '') AS extension FROM world
WHERE capital LIKE CONCAT(name, '%') AND name != capital

-- Tutorial 2. 

-- 1. Read the notes about this table. Observe the result of running this SQL command to show the name, continent and population of all countries. 

SELECT name, continent, population
FROM world;

-- 2. How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros. 

SELECT name
FROM world
WHERE population >= 200000000;

-- 3. Give the name and the per capita GDP for those countries with a population of at least 200 million. 

SELECT name, gdp/population AS per_capita_gdp
FROM world
WHERE population >= 200000000;


-- 4. Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
 
SELECT name, population/1000000 AS population_in_millions
FROM world
WHERE continent = 'South America';

-- 5. Show the name and population for France, Germany, Italy 

SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

-- 6. Show the countries which have a name that includes the word 'United'
 
SELECT name
FROM world
WHERE name LIKE '%United%';

-- 7. Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;

-- 8. Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
-- Australia has a big area but a small population, it should be included.
-- Indonesia has a big population but a small area, it should be included.
-- China has a big population and big area, it should be excluded.
-- United Kingdom has a small population and a small area, it should be excluded.

SELECT name, population, area
FROM world
WHERE (area > 3000000 AND population <= 250000000) OR
      (area <= 3000000 AND population > 250000000);

-- 9. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
-- For South America show population in millions and GDP in billions both to 2 decimal places.
-- Millions and billions
-- Submit SQLRestore default
-- result
-- Play the SELECT card game
SELECT name, ROUND(population/1000000.0, 2) AS population_in_millions, 
       ROUND(gdp/1000000000.0, 2) AS gdp_in_billions
FROM world
WHERE continent = 'South America'

-- 10. Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
-- Show per-capita GDP for the trillion dollar countries to the nearest $1000.

SELECT name, ROUND(gdp/population, -3) AS per_capita_gdp
FROM world
WHERE gdp >= 1000000000000
ORDER BY per_capita_gdp DESC;

-- 11. Greece has capital Athens.
-- Each of the strings 'Greece', and 'Athens' has 6 characters.
-- Show the name and capital where the name and the capital have the same number of characters.
-- You can use the LENGTH function to find the number of characters in a string
-- For Microsoft SQL Server the function LENGTH is LEN

SELECT name, capital
FROM world
WHERE LEN(name) = LEN(capital)

-- 12. The capital of Sweden is Stockholm. Both words start with the letter 'S'.
-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
-- You can use the function LEFT to isolate the first character.
-- You can use <> as the NOT EQUALS operator. 
SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital;

-- 13. Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.
-- Find the country that has all the vowels and no spaces in its name.
-- You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
-- The query shown misses countries like Bahamas and Belarus because they contain at least one 'a' 

SELECT name
FROM world
WHERE name LIKE '%a%'
AND name NOT LIKE '% %'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'

-- Tutorial 3.
-- SELECT from Nobel Tutorial

-- nobel
-- yr	subject	winner
-- 1960	Chemistry	Willard F. Libby
-- 1960	Literature	Saint-John Perse
-- 1960	Medicine	Sir Frank Macfarlane Burnet
-- 1960	Medicine	Peter Madawar
-- ...

-- This tutorial is concerned with a table of Nobel prize winners:

-- nobel(yr, subject, winner)
-- Using the SELECT statement.

-- Winners from 1950
-- 1. Change the query shown so that it displays Nobel prizes for 1950.
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

-- 2. Show who won the 1962 prize for literature.

-- SELECT winner
--   FROM nobel
--  WHERE yr = 1960
--    AND subject = 'physics'

SELECT winner
FROM nobel
WHERE yr = 1962 AND subject = 'Literature';

-- 3. Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

-- 4. Give the name of the 'peace' winners since the year 2000, including 2000.
SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000;

-- 5. Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.
SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;

-- 6. Show all details of the presidential winners:

-- Theodore Roosevelt
-- Thomas Woodrow Wilson
-- Jimmy Carter
-- Barack Obama
-- SELECT * FROM nobel
--  WHERE yr = 1970
--   AND subject IN ('Cookery',
--                   'Chemistry',
--                   'Literature')
SELECT *
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama') AND subject = 'Peace';

-- 7. Show the winners with first name John
SELECT winner
FROM nobel
WHERE winner LIKE 'John%';

-- 8. Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984);

-- 9. Show the year, subject, and name of winners for 1980 excluding chemistry and medicine
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');

-- 10. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004);

-- 11. Find all details of the prize won by PETER GRÜNBERG
SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG';

-- 12. Find all details of the prize won by EUGENE O'NEILL
SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL';

-- 13. Knights in order
-- List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner;

-- 14. The expression subject IN ('chemistry','physics') can be used as a value - it will be 0 or 1.
-- Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last.
-- SELECT winner, subject, subject IN ('physics','chemistry')
--   FROM nobel
--  WHERE yr=1984
--  ORDER BY subject,winner
SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY CASE 
    WHEN subject IN ('Physics', 'Chemistry') THEN 1 
    ELSE 0 
  END, 
  subject, 
  winner;

-- PART 2
-- Codwars:
-- SQL Basics: Simple WHERE and ORDER BY
SELECT *
FROM people
WHERE age > 50
ORDER BY age DESC;

-- SQL Basics: Simple SUM:
SELECT SUM(age) AS age_sum
FROM people;

-- SQL Basics: Simple MIN / MAX
SELECT MIN(age) AS age_min, MAX(age) AS age_max
FROM people;

-- Find all active students
SELECT *
FROM students
WHERE IsActive = 1;

-- SQL Basics: Simple GROUP BY
SELECT age, COUNT(*) AS people_count
FROM people
GROUP BY age;

-- SQL Basics: Simple HAVING
SELECT age, COUNT(*) as total_people
FROM people
GROUP BY age
HAVING COUNT(*) >= 10

-- PART 3: PRODUCTS QUERYING
-- Write SQL commands to:

-- 1. Add a product to the table with the name of "chair", price of 44.00, and can_be_returned of false.
-- INSERT INTO products (name, price, can_be_returned)
-- VALUES ('chair', 44.00, false);

-- 2. Add a product to the table with the name of "stool", price of 25.99, and can_be_returned of true.
-- INSERT INTO products (name, price, can_be_returned)
-- VALUES ('stool', 25.99, true);

-- 3. Add a product to the table with the name of "table", price of 44.00, and can_be_returned of false.
-- INSERT INTO products (name, price, can_be_returned)
-- VALUES ('table', 44.00, false);

-- 4. Display all of the rows and columsn in the table.
-- SELECT *
-- FROM products;

-- 5. Display all of the names of the products.
-- SELECT name
-- FROM products;

-- 6. Display all of the names and prices of the produts.
-- SELECT name, price
-- FROM products;

-- 7. Add a new product - make up whatever you would like!
-- INSERT INTO products (name, price, can_be_returned)
-- VALUES ('lamp', 29.99, true);

-- -- 8. Display only the products that can_be_returned.
-- SELECT *
-- FROM products
-- WHERE can_be_returned = true;

-- 9. Display only the products that have a price less than 44.00.
-- SELECT *
-- FROM products
-- WHERE price < 44.00;

-- 10. Display only the products that have a price in between 22.50 and 99.99.
-- SELECT *
-- FROM products
-- WHERE price BETWEEN 22.50 AND 99.99;

-- 11. There's a sale going on: Everything is $20 off! Update the database accordingly.
-- UPDATE products
-- SET price = price - 20;

-- 12. Because of the sale, everything that costs less than $25 has sold out. Remove all products whose price meets this criteria.
-- DELETE FROM products
-- WHERE price < 20.00;

-- 13. And now the sale is over. For the remaining products, increase their price by $20.
-- UPDATE products
-- SET price = price + 20;

-- 14. There is a new company policy: everything is returnable. update the database accordingly.
-- UPDATE products
-- SET can_be_returned = true;

-- PART 4: GOOGLE PLAY STORE QUERYING 
-- 1. Find the app with an ID of 1880.
playstore=# SELECT app_name 
FROM analytics 
WHERE id = 1880; 

-- 2. Find the ID and app name for all apps that were last updated on August 01, 2018.
SELECT id, app_name 
FROM analytics 
WHERE last_updated = '2018-08-01';

-- 3. Count the number of apps in each category, e.g., "Family | 1972".
SELECT category || ' | ' || COUNT(*) 
FROM analytics 
GROUP BY category;

-- 4. Find the top 5 most-reviewed apps and the number of reviews for each.
SELECT app_name, reviews 
FROM analytics 
ORDER BY reviews 
DESC LIMIT 5;

-- 5. Find the app that has the most reviews with a rating greater than or equal to 4.8.
SELECT app_name, reviews, rating 
FROM analytics 
WHERE rating >= 4.8 
ORDER BY reviews 
DESC LIMIT 1;

-- 6. Find the average rating for each category ordered by the highest rated to lowest rated.
SELECT category, AVG(rating) 
FROM analytics 
GROUP BY category 
ORDER BY AVG(rating) 
DESC;

-- 7. Find the name, price, and rating fo the most expensive app with a rating that's less than 3. 
SELECT app_name, price, rating 
FROM analytics 
WHERE rating < 3 
ORDER BY price 
DESC LIMIT 1;

-- 8. Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first.
SELECT * 
FROM analytics 
WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating 
DESC;

-- 9. Find the names of all apps that are rated less than 3 with at least 10000 reviews.
SELECT app_name 
FROM analytics 
WHERE rating < 3
 
AND reviews >= 10000;

-- 10. Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
SELECT app_name, reviews 
FROM analytics 
WHERE price BETWEEN 0.1 AND 1 ORDER BY reviews 
DESC LIMIT 10;

-- 11. Find the most out of dat app. Hint: You don't need to do it this way, but it's possible to do with a subquery.
SELECT app_name, last_updated
FROM analytics
WHERE last_updated = (SELECT MIN(last_updated) 
FROM analytics);

-- 12. Find the most expensive app (the query is very similar to #11).
SELECT app_name, price 
FROM analytics 
ORDER BY price 
DESC LIMIT 1;

-- 13. Count all the reviews in the Google Play Store.
SELECT SUM(reviews) 
FROM analytics;

-- 14. Find all the categories that have more than 300 apps in them.
SELECT category 
FROM analytics 
GROUP BY category 
HAVING COUNT(*) > 300;

-- 15. Find the app that has the highest proportion of min-installs to reviews, among apps that have been installed at least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion.
SELECT app_name, reviews, min_installs, (min_installs::float / reviews::float) AS proportion
FROM analytics
WHERE min_installs >= 100000
ORDER BY proportion DESC
LIMIT 1;
