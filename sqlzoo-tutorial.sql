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
-- 1.  Observe the result of running this SQL command to show the name, continent and population of all countries.
 SELECT name, continent, population FROM world;

-- 2.Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
SELECT name
  FROM world
 WHERE population > 200000000;

-- 3. Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, gdp/population
FROM world
WHERE population >= 200000000;

-- 4. Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
SELECT name, population/1000000
FROM world
WHERE continent LIKE 'South America';

-- 5. Show the name and population for France, Germany, Italy
SELECT name, population
FROM world
WHERE name in ('France', 'Germany', 'Italy');

-- 6. Show the countries which have a name that includes the word 'United'
SELECT name
FROM world
WHERE name LIKE '%United%';

-- 7. Show the countries that are big by area or big by population. Show name, population and area.
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;

-- 8. Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
SELECT name, population, area
FROM world
WHERE area > 3000000 XOR population > 250000000;

-- 9. For South America show population in millions and GDP in billions both to 2 decimal places.
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America';

-- 10. Show per-capita GDP for the trillion dollar countries to the nearest $1000.
SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp > 1000000000000;

-- 11. Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital);

-- 12. Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name, capital
FROM world
WHERE name <> capital AND LEFT(name,1) = LEFT(capital,1);

-- 13. Find the country that has all the vowels and no spaces in its name.
SELECT name
   FROM world
WHERE name NOT LIKE '% %' AND name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%';


-- SELECT from Nobel Tutorial
-------------------------------------------
-- 1. Change the query shown so that it displays Nobel prizes for 1950.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

-- 2. Show who won the 1962 prize for Literature.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';

-- 3. Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject
  FROM nobel
  WHERE winner = 'Albert Einstein';

-- 4. Give the name of the 'Peace' winners since the year 2000, including 2000.
SELECT winner
  FROM nobel
  WHERE subject = 'Peace' and yr >= 2000;

-- 5. Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
SELECT *
  FROM nobel
  WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;

-- 6. Show all details of the presidential winners:
SELECT *
  FROM nobel
  WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama');
-- 7. Show the winners with first name John
SELECT winner
  FROM nobel
  WHERE winner LIKE 'John%';

-- 8. Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
SELECT *
  FROM nobel
  WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984);

-- 9. Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
SELECT *
  FROM nobel
  WHERE yr = 1980 AND NOT subject = 'Chemistry' AND NOT subject = 'Medicine';

-- 10. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
SELECT *
  FROM nobel
  WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004);

-- 11. Find all details of the prize won by PETER GRÜNBERG
SELECT *
  FROM nobel
  WHERE winner LIKE 'PETER G%';

-- 12. Find all details of the prize won by EUGENE O'NEILL
SELECT *
  FROM nobel
  WHERE winner = 'EUGENE O''NEILL';

-- 13. List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT winner, yr, subject
  FROM nobel
  WHERE winner LIKE 'Sir%'
ORDER BY yr DESC;

-- 14. Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics', 'Chemistry'), subject, winner ASC;


-- SELECT within SELECT Tutorial
-------------------------------------------------
-- 1. List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

-- 2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name
  FROM world
  WHERE continent = 'Europe' AND gdp/population >
  (SELECT gdp/population
  FROM world
  WHERE name = 'United Kingdom');

-- 3. List the name and continent of countries in the continents containing
-- either Argentina or Australia. Order by name of the country.
SELECT name, continent
  FROM world
  WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))
ORDER BY name;

-- 4. Which country has a population that is more than Canada
-- but less than Poland? Show the name and the population.
SELECT name
  FROM world
  WHERE population > (
    SELECT population FROM world WHERE name = 'Canada') AND
  population < (SELECT population FROM world WHERE name = 'Poland');

-- 5. Show the name and the population of each country in Europe.
-- Show the population as a percentage of the population of Germany.
SELECT name, concat(round(population / (SELECT population
                                          FROM world
                                         WHERE name = 'Germany') * 100), '%') AS percentage
  FROM world
  WHERE continent = 'Europe';

-- 6. Which countries have a GDP greater than every country in Europe?
-- [Give the name only.] (Some countries may have NULL gdp values)
SELECT name
  FROM world
  WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp > 0)

-- 7. Find the largest country (by area) in each continent,
-- show the continent, the name and the area:
SELECT continent, name, area FROM world w1
  WHERE area >= ALL
    (SELECT area FROM world w2
        WHERE w2.continent = w1.continent
          AND area > 0)

-- 8. List each continent and the name of the country
-- that comes first alphabetically.
SELECT continent, name FROM world x WHERE name = all(SELECT TOP(1) name FROM world y WHERE x.continent = y.continent);

-- 9. Find the continents where all countries have a population <= 25000000.
-- Then find the names of the countries associated with these continents. Show name, continent and population.
SELECT name, continent, population FROM world w1
WHERE 25000000 >= ALL(SELECT population FROM world w2 WHERE w1.continent = w2.continent)

-- 10. Some countries have populations more than three times
-- that of any of their neighbours (in the same continent). Give the countries and continents.
SELECT name, continent FROM world x
  WHERE population >= ALL
    (SELECT population * 3 FROM world y
        WHERE y.continent=x.continent AND x.name <> y.name);


-- SUM and COUNT
----------------------------------------------------
-- 1. Show the total population of the world.
SELECT SUM(population) FROM world

-- 2. List all the continents - just once each.
SELECT DISTINCT Continent FROM world;

-- 3. Give the total GDP of Africa
SELECT SUM(gdp) AS African_gdp FROM world where continent = 'Africa'

-- 4. How many countries have an area of at least 1000000
SELECT count(name) from world WHERE Area >= 1000000 

-- 5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')
SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

-- 6. For each continent show the continent and number of countries.
SELECT continent, COUNT(name) FROM world GROUP BY continent

-- 7. For each continent show the continent and number of countries with populations of at least 10 million.
SELECT continent, COUNT(name) FROM world WHERE population >= 10000000 GROUP BY continent

-- 8. List the continents that have a total population of at least 100 million.
SELECT continent FROM world GROUP BY continent HAVING SUM(population) >= 100000000


-- JOIN and UEFA EURO 2012
------------------------------------------------------
-- 1. Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid, player FROM goal 
  WHERE teamid = 'Ger'

-- 2. Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2
  FROM game JOIN goal
    ON (game.id = goal.matchid)
  WHERE game.id = 1012 LIMIT 1

-- 3. Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
 WHERE teamid = 'GER'

-- 4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
 WHERE player LIKE 'Mario%'

-- 5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam
    ON(goal.teamid = eteam.id) 
 WHERE gtime<=10

-- 6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT mdate, teamname
  FROM game JOIN eteam
   ON (game.team1 = eteam.id)
  WHERE eteam.coach = 'Fernando Santos';

-- 7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player
  FROM game JOIN goal
    ON (game.id = goal.matchid)
  WHERE game.stadium = 'National Stadium, Warsaw';

-- 8. Show the name of all players who scored a goal against Germany.
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE 'GER' IN (team1, team2) AND teamid <> 'GER';

-- 9. Show teamname and the total number of goals scored.
SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname;

-- 10. Show the stadium and the number of goals scored in each stadium.
SELECT stadium, COUNT(player)
  FROM game JOIN goal ON matchid=id
 GROUP BY stadium;

-- 11. For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid, mdate, COUNT(player)
  FROM game JOIN goal ON matchid = id 
 WHERE 'POL' IN (team1, team2)
  GROUP BY matchid, mdate;

-- 12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT matchid, mdate, COUNT(player)
  FROM game JOIN goal ON matchid = id 
 WHERE teamid  = 'GER'
  GROUP BY matchid, mdate;

-- 13. List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
  FROM game JOIN goal ON matchid = id
  GROUP BY mdate, team1, team2


-- 1.
-- 2.
-- 3.
-- 4.
-- 5.
-- 6.
-- 7.
-- 8.
-- 9.
-- 10.
-- 11.
-- 12.
-- 13.
-- 14.
-- 15.


-- 1.
-- 2.
-- 3.
-- 4.
-- 5.
-- 6.
-- 7.
-- 8.
-- 9.
-- 10.
-- 11.
-- 12.
-- 13.
-- 14.
-- 15.


-- 1.
-- 2.
-- 3.
-- 4.
-- 5.
-- 6.
-- 7.
-- 8.
-- 9.
-- 10.
-- 11.
-- 12.
-- 13.
-- 14.
-- 15.
