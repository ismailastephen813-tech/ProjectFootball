USE PlayerManagementDB;
GO

-- Player Match History Report

SELECT
    P.PlayerID,
    P.FirstName,
    P.LastName,
    P.Position,
    M.MatchDate,
    M.HomeTeam,
    M.AwayTeam,
    M.HomeScore,
    M.AwayScore,
    PS.Goals,
    PS.Assists,
    PS.MinutesPlayed,
    PS.YellowCards,
    PS.RedCards
FROM dbo.PlayerStatistics AS PS
INNER JOIN dbo.Players AS P
    ON PS.PlayerID = P.PlayerID
INNER JOIN dbo.Matches AS M
    ON PS.MatchID = M.MatchID
ORDER BY
    M.MatchDate DESC,
    P.LastName;
GO