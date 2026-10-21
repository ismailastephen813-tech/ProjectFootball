USE PlayerManagementDB;
GO

-- Display players ranked by market value

SELECT
    PlayerID,
    FirstName,
    LastName,
    Nationality,
    Position,
    ShirtNumber,
    MarketValue
FROM dbo.Players
ORDER BY MarketValue DESC;
GO