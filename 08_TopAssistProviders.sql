USE PlayerManagementDB;
GO

-- Top Assist Providers Report

SELECT
    P.PlayerID,
    P.FirstName,
    P.LastName,
    P.Position,
    SUM(PS.Assists) AS TotalAssists
FROM dbo.Players AS P
INNER JOIN dbo.PlayerStatistics AS PS
    ON P.PlayerID = PS.PlayerID
GROUP BY
    P.PlayerID,
    P.FirstName,
    P.LastName,
    P.Position
HAVING SUM(PS.Assists) > 0
ORDER BY
    TotalAssists DESC;
GO