USE PlayerManagementDB;
GO

-- Football Player Performance Report

SELECT
    P.PlayerID,
    P.FirstName,
    P.LastName,
    P.Position,
    SUM(PS.Goals) AS TotalGoals,
    SUM(PS.Assists) AS TotalAssists,
    SUM(PS.Goals + PS.Assists) AS GoalContributions,
    SUM(PS.MinutesPlayed) AS TotalMinutesPlayed
FROM dbo.Players AS P
INNER JOIN dbo.PlayerStatistics AS PS
    ON P.PlayerID = PS.PlayerID
GROUP BY
    P.PlayerID,
    P.FirstName,
    P.LastName,
    P.Position
ORDER BY
    GoalContributions DESC;
GO