SELECT
    FirstName,
    LastName,
    Position,
    MarketValue
FROM Players
WHERE MarketValue > 300000
ORDER BY MarketValue DESC;