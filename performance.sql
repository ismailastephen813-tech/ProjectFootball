SELECT
    P.FirstName,
    P.LastName,
    M.HomeTeam,
    M.AwayTeam,
    M.MatchDate,
    PS.Goals,
    PS.Assists,
    PS.MinutesPlayed
FROM PlayerStatistics AS PS
INNER JOIN Players AS P
    ON PS.PlayerID = P.PlayerID
INNER JOIN Matches AS M
    ON PS.MatchID = M.MatchID
ORDER BY M.MatchDate, P.LastName;