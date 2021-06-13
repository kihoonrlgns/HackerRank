#Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
#
#Input Format
#
#The STATION table is described as follows:
#
#Station.jpg
#
#where LAT_N is the northern latitude and LONG_W is the western longitude.

SELECT DISTINCT city
FROM STATION
WHERE city REGEXP '^[^aeiou]'
OR city REGEXP '[^aeiou]$'


-----------------------------


SELECT DISTINCT city
FROM STATION
WHERE LEFT(city, 1) NOT IN ('A','E','I','O','U')
OR RIGHT(city, 1) NOT IN ('A','E','I','O','U')