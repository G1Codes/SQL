-- Q. Find out top 5 Batsmen of each team.

SELECT * FROM
(SELECT battingTeam, batter, SUM(batsman_run) as total_runs,
dense_rank() OVER (PARTITION BY battingTeam order by SUM(batsman_run) DESC) AS rank_in_team
FROM ipl
group by battingTeam, batter) t
where rank_in_team<6
order by battingteam, rank_in_team
;

-- Q. Virat’s Total Runs after 50th, 100th & 200th match

SELECT * FROM
(SELECT 
CONCAT ("Match-",
ROW_NUMBER() OVER(ORDER BY ID))as 'Match',
SUM(BATSMAN_RUN) AS Runs,
SUM(SUM(BATSMAN_RUN)) OVER (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Cumulative_Runs
from ipl
WHERE batter = "V kohli"
group by ID) t
where t.Match = 'Match-50' OR t.Match = 'Match-100' OR t.Match = 'Match-200'
  ;

-- Q. Find out Kohli’s average after each match.

SELECT * FROM
(SELECT 
CONCAT ("Match-",
ROW_NUMBER() OVER(ORDER BY ID))as 'Match',
SUM(BATSMAN_RUN) AS Runs,
AVG(SUM(BATSMAN_RUN)) OVER (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Career_Avg
from ipl
WHERE batter = "V kohli"
group by ID) t
;

-- Q. Calculate Virat’s running average over 10 matches.

SELECT * FROM
(SELECT 
CONCAT ("Match-",
ROW_NUMBER() OVER(ORDER BY ID))as 'Match',
SUM(BATSMAN_RUN) AS Runs,
AVG(SUM(BATSMAN_RUN)) OVER (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Cumulative_Runs,
AVG(SUM(BATSMAN_RUN)) OVER (ROWS BETWEEN 9 PRECEDING AND CURRENT ROW) AS Running_Avg
from ipl
WHERE batter = "V kohli"
group by ID) t
;
