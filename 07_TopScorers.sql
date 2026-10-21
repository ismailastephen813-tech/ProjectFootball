USE PlayerManagementDB;
GO

-- Top Scorers Report

SELECT
    P.PlayerID,
    P.FirstName,
    P.LastName,
    P.Position,
    SUM(PS.Goals) AS TotalGoals
FROM dbo.Players AS P
INNER JOIN dbo.PlayerStatistics AS PS
    ON P.PlayerID = PS.PlayerID
GROUP BY
    P.PlayerID,
    P.FirstName,
    P.LastName,
    P.Position
HAVING SUM(PS.Goals) > 0
ORDER BY
    TotalGoals DESC;
GO