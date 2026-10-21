USE PlayerManagementDB;
GO

-- Player Rankings by Goal Contributions

WITH PlayerPerformance AS (
    SELECT
        P.PlayerID,
        P.FirstName,
        P.LastName,
        P.Position,
        SUM(PS.Goals) AS TotalGoals,
        SUM(PS.Assists) AS TotalAssists,
        SUM(PS.Goals + PS.Assists) AS GoalContributions
    FROM dbo.Players AS P
    INNER JOIN dbo.PlayerStatistics AS PS
        ON P.PlayerID = PS.PlayerID
    GROUP BY
        P.PlayerID,
        P.FirstName,
        P.LastName,
        P.Position
)
SELECT
    PlayerID,
    FirstName,
    LastName,
    Position,
    TotalGoals,
    TotalAssists,
    GoalContributions,
    RANK() OVER (
        ORDER BY GoalContributions DESC
    ) AS PlayerRank
FROM PlayerPerformance
ORDER BY PlayerRank, LastName;
GO