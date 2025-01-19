-- Q. Find out top 5 Batsmen of each team.

SELECT * FROM
(SELECT battingTeam, batter, SUM(batsman_run) as total_runs,
dense_rank() OVER (PARTITION BY battingTeam order by SUM(batsman_run) DESC) AS rank_in_team
FROM ipl
group by battingTeam, batter) t
where rank_in_team<6
order by battingteam, rank_in_team
;