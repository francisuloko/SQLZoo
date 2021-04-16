-- SELECT basics
-------------------------------------------------
-- 1. Introducing the world table of countries
SELECT population FROM world
  WHERE name = 'Germany';

-- 2. Scandinavia
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3. Just the right size
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000


-- SELECT names
-------------------------------------------------
-- 1. Find the country that start with Y
SELECT name
  FROM world
 WHERE name LIKE 'Y%'

-- 2. Find the countries that end with y
SELECT name
  FROM world
 WHERE name LIKE '%y'

-- 3. Find the countries that contain the letter x
SELECT name
  FROM world
 WHERE name LIKE '%x%'

-- 4. Find the countries that end with land
SELECT name
  FROM world
 WHERE name LIKE '%land'

-- 5. Find the countries that start with C and end with ia
SELECT name
 FROM world
WHERE name LIKE 'C%ia';

-- 6. Find the country that has oo in the name
SELECT name
  FROM world
 WHERE name LIKE '%oo%'

-- 7. Find the countries that have three or more a in the name
SELECT name
  FROM world
 WHERE name LIKE '%a%a%a%'

-- 8. Find the countries that have "t" as the second character.
SELECT name
  FROM world
 WHERE name LIKE '_t%'
ORDER BY name

-- 9. Find the countries that have two "o" characters separated by two others.
SELECT name
  FROM world
 WHERE name LIKE '%o__o%'

-- 10. Find the countries that have exactly four characters.
SELECT name FROM world
 WHERE length(name) = 4

-- 11. Find the country where the name is the capital city.
SELECT name
  FROM world
 WHERE name = capital

-- 12. Find the country where the capital is the country plus "City".
SELECT name, capital
  FROM world
 WHERE capital LIKE concat(name, '%');

-- 13. Find the capital and the name where the capital includes the name of the country.
SELECT capital, name
  FROM world
 WHERE capital LIKE concat('%', name, '%');

-- 14. Find the capital and the name where the capital is an extension of name of the country.
SELECT capital, name
  FROM world
 WHERE length(name) != length(capital) AND capital LIKE concat('%', name, '%');

-- 15. Show the name and the extension where the capital is an extension of name of the country.
SELECT name, REPLACE(capital, name, '') AS Extension
  FROM world
 WHERE length(name) != length(capital) AND capital LIKE concat('%', name, '%');

 
 -- SELECT from WORLD Tutorial
 ---------------------------------------
-- 1. Introduction
 SELECT name, continent, population FROM world;

-- 2. Large Countries
SELECT name
  FROM world
 WHERE population > 200000000;

-- 3. Per capita GDP
SELECT name, gdp/population
FROM world
WHERE population >= 200000000;

-- 4. South America In millions
SELECT name, population/1000000
FROM world
WHERE continent LIKE 'South America';

-- 5. France, Germany, Italy
SELECT name, population
FROM world
WHERE name in ('France', 'Germany', 'Italy');

-- 6. United
SELECT name
FROM world
WHERE name LIKE '%United%';

-- 7. Two ways to be big
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;

-- 8. One or the other (but not both)
SELECT name, population, area
FROM world
WHERE area > 3000000 XOR population > 250000000;

-- 9. Rounding
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America';

-- 10. Trillion dollar economies
SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp > 1000000000000;

-- 11. Name and capital have the same length
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital);

-- 12. Matching name and capital
SELECT name, capital
FROM world
WHERE name <> capital AND LEFT(name,1) = LEFT(capital,1);

-- 13. All the vowels
SELECT name
   FROM world
WHERE name NOT LIKE '% %' AND name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%';


-- SELECT from Nobel Tutorial
-------------------------------------------
-- 1. Winners from 1950
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

-- 2. 1962 Literature
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';

-- 3. Albert Einstein
SELECT yr, subject
  FROM nobel
  WHERE winner = 'Albert Einstein';

-- 4.Recent Peace Prizes
SELECT winner
  FROM nobel
  WHERE subject = 'Peace' and yr >= 2000;

-- 5.Literature in the "1980's"
SELECT *
  FROM nobel
  WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;

-- 6. Only Presidents
SELECT *
  FROM nobel
  WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama');
-- 7. John
SELECT winner
  FROM nobel
  WHERE winner LIKE 'John%';

-- 8. Chemistry and Physics from different years
SELECT *
  FROM nobel
  WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984);

-- 9. Exclude Chemists and Medics
SELECT *
  FROM nobel
  WHERE yr = 1980 AND NOT subject = 'Chemistry' AND NOT subject = 'Medicine';

-- 10. Early Medicine, Late Literature
SELECT *
  FROM nobel
  WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004);

-- 11. Umlaut
SELECT *
  FROM nobel
  WHERE winner LIKE 'PETER G%';

-- 12. Apostrophe
SELECT *
  FROM nobel
  WHERE winner LIKE 'EUGENE O%';

-- 13. Knights of the realm
SELECT winner, yr, subject
  FROM nobel
  WHERE winner LIKE 'Sir%'
ORDER BY yr DESC;

-- 14. Chemistry and Physics last
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics', 'Chemistry'), subject, winner ASC;


1.
2.
3.
4.
5.
6.
7.
8.
9.
10.
11.
12.
13.
14.
15.


1.
2.
3.
4.
5.
6.
7.
8.
9.
10.
11.
12.
13.
14.
15.


1.
2.
3.
4.
5.
6.
7.
8.
9.
10.
11.
12.
13.
14.
15.


1.
2.
3.
4.
5.
6.
7.
8.
9.
10.
11.
12.
13.
14.
15.


1.
2.
3.
4.
5.
6.
7.
8.
9.
10.
11.
12.
13.
14.
15.


1.
2.
3.
4.
5.
6.
7.
8.
9.
10.
11.
12.
13.
14.
15.
