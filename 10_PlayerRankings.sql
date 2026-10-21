USE PlayerManagementDB;
GO

-- Player Efficiency Rankings
-- Rank players by goal contributions per 90 minutes.

WITH PlayerPerformance AS (
    SELECT
        P.PlayerID,
        P.FirstName,
        P.LastName,
        P.Position,

        COUNT(DISTINCT PS.MatchID) AS MatchesPlayed,

        SUM(PS.Goals) AS TotalGoals,
        SUM(PS.Assists) AS TotalAssists,

        SUM(PS.Goals + PS.Assists) AS TotalContributions,

        SUM(PS.MinutesPlayed) AS TotalMinutes

    FROM dbo.Players AS P

    INNER JOIN dbo.PlayerStatistics AS PS
        ON P.PlayerID = PS.PlayerID

    GROUP BY
        P.PlayerID,
        P.FirstName,
        P.LastName,
        P.Position
),
PlayerRates AS (
    SELECT
        *,
        CAST(TotalGoals * 1.0 / NULLIF(MatchesPlayed, 0)
            AS DECIMAL(10,2)) AS GoalsPerMatch,

        CAST(TotalAssists * 1.0 / NULLIF(MatchesPlayed, 0)
            AS DECIMAL(10,2)) AS AssistsPerMatch,

        CAST(TotalContributions * 90.0 / NULLIF(TotalMinutes, 0)
            AS DECIMAL(10,2)) AS ContributionsPer90

    FROM PlayerPerformance
)
SELECT
    PlayerID,
    FirstName,
    LastName,
    Position,
    MatchesPlayed,
    TotalGoals,
    TotalAssists,
    TotalMinutes,
    GoalsPerMatch,
    AssistsPerMatch,
    ContributionsPer90,

    RANK() OVER (
        ORDER BY ContributionsPer90 DESC
    ) AS EfficiencyRank

FROM PlayerRates
ORDER BY
    EfficiencyRank,
    LastName;
GO