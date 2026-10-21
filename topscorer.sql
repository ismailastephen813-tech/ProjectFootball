SELECT
    P.FirstName,
    P.LastName,
    P.Position,
    SUM(PS.Goals) AS TotalGoals
FROM Players AS P
INNER JOIN PlayerStatistics AS PS
    ON P.PlayerID = PS.PlayerID
GROUP BY
    P.PlayerID,
    P.FirstName,
    P.LastName,
    P.Position
ORDER BY TotalGoals DESC;