**// Top 10 players by highest bid amount.

SELECT PLAYERS , PRICE_PAID
FROM IPL_Players.players
ORDER BY PRICE_PAID DESC
LIMIT 10



**//Count the number of players sold to each team .

SELECT TEAM , COUNT(PLAYERS) AS PLAYER_COUNT
FROM `IPL_Players.players`
GROUP BY TEAM



**//Calculate the average bid amount for each team .

SELECT FLOOR(AVG(PRICE_PAID)) AS AVG_BID , TEAM
FROM IPL_Players.players
GROUP BY TEAM


**//Calculate the total spending by each team .

SELECT SUM(PRICE_PAID) AS TOTAL_SPENDING , TEAM
FROM IPL_Players.players
GROUP BY TEAM


##Players with highest bid in each team .
SELECT TEAM , PLAYERS , PRICE_PAID
FROM (
  SELECT TEAM , PLAYERS , PRICE_PAID ,
        ROW_NUMBER() OVER (PARTITION BY TEAM
                           ORDER BY PRICE_PAID DESC) AS RowNum
  FROM IPL_Players.players
) AS Ranked
WHERE RowNum = 1




## Teams with lowest average bid .
SELECT TEAM , FLOOR(AVG(PRICE_PAID)) AS AVG_BID_AMT
FROM `IPL_Players.players`
GROUP BY TEAM
ORDER BY AVG(PRICE_PAID) ASC
LIMIT 1


## Teams with highest average bid .
SELECT TEAM , FLOOR(AVG(PRICE_PAID)) AS AVG_BID_AMT
FROM `IPL_Players.players`
GROUP BY TEAM
ORDER BY AVG(PRICE_PAID) DESC
LIMIT 1



## Total spending highest for Indian or Overseas players .
SELECT NATIONALITY ,SUM(PRICE_PAID) AS TOTAL_SPENDING
FROM `IPL_Players.players`
GROUP BY NATIONALITY
ORDER BY SUM(PRICE_PAID) DESC



## Type of players get highest bid .
SELECT TYPE , SUM(PRICE_PAID) AS TOTAL_SPENDING
FROM `IPL_Players.players`
GROUP BY TYPE
ORDER BY SUM(PRICE_PAID) DESC



