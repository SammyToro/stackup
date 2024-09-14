SELECT * 
FROM football.players 
INNER JOIN football.club 
ON football.players.current_club_id = football.club.club_id 
WHERE football.club.name = "Manchester United" AND height_in_cm 
> 170 AND position = "Midfield";

SELECT * 
FROM football.players 
INNER JOIN football.club ON football.players.current_club_id = football.club.club_id WHERE football.club.name = "Manchester United" OR 
football.players.country_of_citizenship = "England";

SELECT * 
FROM football.players 
INNER JOIN football.club ON football.players.current_club_id = football.club.club_id 
WHERE football.club.name != "Manchester United";

SELECT *
FROM football.players
INNER JOIN football.club
ON football.players.current_club_id = football.club.club_id
WHERE football.club.name IN ("Manchester United", "Chelsea FC", "Liverpool");

SELECT *
FROM football.players
INNER JOIN football.club
ON football.players.current_club_id = football.club.club_id
WHERE football.club.name NOT IN ("Manchester United", "Chelsea FC", "Liverpool");

SELECT name, squad_size
FROM football.club
WHERE squad_size BETWEEN 25 AND 27;

SELECT name, squad_size
FROM football.club
WHERE squad_size > 24 AND squad_size < 28;

SELECT *
FROM football.club
WHERE football.club.name LIKE "man%";

SELECT *
FROM football.club
WHERE football.club.name LIKE "%united";

SELECT *
FROM football.club
WHERE football.club.name LIKE "%chester%";

SELECT football.players.name, football.players.height_in_cm,
CASE
WHEN football.players.height_in_cm >= 190 THEN "Giant"
WHEN football.players.height_in_cm >= 183 THEN "Tall"
WHEN football.players.height_in_cm <= 173 THEN "Short"
ELSE "Medium"
END AS height
FROM football.players;

SELECT player_id, football.player_valuations.market_value_in_eur,
(SELECT AVG(football.player_valuations.market_value_in_eur) FROM football.player_valuations)
from football.player_valuations;

SELECT football.players.name
FROM football.players
WHERE player_id IN
(select player_id
from football.player_valuations
WHERE football.player_valuations.market_value_in_eur > 100000);

WITH valuations AS (
SELECT *
FROM football.player_valuations
WHERE football.player_valuations.market_value_in_eur >= 10000
)
SELECT *
FROM valuations;

SELECT ROW_NUMBER() OVER() AS row_num, name
FROM football.players;

SELECT ROW_NUMBER() OVER(ORDER BY last_season DESC) AS row_num,
name, last_season
FROM football.players;

SELECT ROW_NUMBER() OVER(PARTITION BY last_season ORDER BY last_season DESC) AS row_num, name, last_season
FROM football.players;

SELECT COUNT(name) OVER(PARTITION BY last_season ORDER BY last_season DESC) AS total_sum,
name, last_season
FROM football.players;

SELECT RANK() OVER(PARTITION BY last_season ORDER BY highest_market_value_in_eur DESC) AS ranked,
    name, 
    highest_market_value_in_eur
FROM football.players;


SELECT name, highest_market_value_in_eur,
SUM(highest_market_value_in_eur) OVER (ORDER BY highest_market_value_in_eur DESC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS total_sum
FROM football.players;

SELECT name, highest_market_value_in_eur,
SUM(highest_market_value_in_eur) OVER (ORDER BY highest_market_value_in_eur DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS total_sum
FROM football.players;

SELECT name, highest_market_value_in_eur,
NTILE(4) OVER (ORDER BY highest_market_value_in_eur DESC) AS splits
FROM football.players;

SELECT date_posted, DATEDIFF(NOW(), date_posted) AS days_difference 
FROM instagram.insta_data;

SELECT TIMESTAMPDIFF(MONTH, date_posted, NOW()) AS month_difference 
FROM instagram.insta_data;

SELECT 
  DATE_SUB(date_posted, INTERVAL 7 MONTH) AS past,
  date_posted,
  DATE_ADD(date_posted, INTERVAL 4 DAY) AS future
FROM 
  instagram.insta_data;
  
SELECT 
  date_posted,
  TIMESTAMPDIFF(HOUR, date_posted, NOW()) AS hours_difference,
  TIMESTAMPDIFF(MINUTE, date_posted, NOW()) AS minutes_difference
FROM 
  instagram.insta_data;
  
SELECT 
  YEAR(date_posted) AS year,
  MONTH(date_posted) AS month,
  DAY(date_posted) AS day,
  HOUR(date_posted) AS hour,
  MINUTE(date_posted) AS minute,
  SECOND(date_posted) AS second
FROM 
  instagram.insta_data;  
  
SELECT CONCAT(first_name, "'s Instagram handle is ", handle) AS message 
FROM instagram.insta_data;

SELECT 
	first_name,
	UPPER(first_name)
FROM
	instagram.insta_data;
    
SELECT 
	first_name,
	LENGTH(first_name)
FROM
	instagram.insta_data;    
  