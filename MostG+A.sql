SELECT
    P.FirstName,
    P.LastName,
    SUM(PS.Goals) AS TotalGoals,
    SUM(PS.Assists) AS TotalAssists,
    SUM(PS.Goals + PS.Assists) AS GoalContributions
FROM Players AS P
INNER JOIN PlayerStatistics AS PS
    ON P.PlayerID = PS.PlayerID
GROUP BY
    P.PlayerID,
    P.FirstName,
    P.LastName
ORDER BY GoalContributions DESC;