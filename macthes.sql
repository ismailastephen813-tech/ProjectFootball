CREATE TABLE Matches (
    MatchID INT IDENTITY(1,1) PRIMARY KEY,
    HomeTeam VARCHAR(100) NOT NULL,
    AwayTeam VARCHAR(100) NOT NULL,
    MatchDate DATE NOT NULL,
    HomeScore INT,
    AwayScore INT,
    Competition VARCHAR(100)
);