#A median is defined as a number separating the higher half of a data set from the lower half. 
#Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.

#where LAT_N is the northern latitude and LONG_W is the western longitude.

SELECT ROUND(LAT_N,4)
FROM (
    SELECT LAT_N
         , PERCENT_RANK() OVER (ORDER BY LAT_N) p_rn
    FROM STATION
) t
WHERE p_rn = 0.5




SELECT ROUND(LAT_N,4)
FROM (
    SELECT ROW_NUMBER () OVER (ORDER BY LAT_N) row_num
         , COUNT(*) OVER () n
         , LAT_N
    FROM STATION
) t
WHERE CASE 
        WHEN n%2 = 1 THEN row_num = (n+1)/2
        ELSE row_num IN (n/2, (n/2)+1)
      END