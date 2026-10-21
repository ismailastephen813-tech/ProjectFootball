USE PlayerManagementDB;
GO

-- Player Position Analysis
-- Compare goals, assists, and appearances by position.

SELECT
    P.Position,
    COUNT(DISTINCT P.PlayerID) AS NumberOfPlayers,
    SUM(PS.Goals) AS TotalGoals,
    SUM(PS.Assists) AS TotalAssists,
    SUM(PS.Goals + PS.Assists) AS TotalContributions,
    SUM(PS.MinutesPlayed) AS TotalMinutesPlayed,
    CAST(
        SUM(PS.Goals) * 1.0 /
        NULLIF(COUNT(DISTINCT PS.PlayerID), 0)
        AS DECIMAL(10,2)
    ) AS GoalsPerPlayer,
    CAST(
        SUM(PS.Assists) * 1.0 /
        NULLIF(COUNT(DISTINCT PS.PlayerID), 0)
        AS DECIMAL(10,2)
    ) AS AssistsPerPlayer
FROM dbo.Players AS P
INNER JOIN dbo.PlayerStatistics AS PS
    ON P.PlayerID = PS.PlayerID
GROUP BY
    P.Position
ORDER BY
    TotalContributions DESC;
GO