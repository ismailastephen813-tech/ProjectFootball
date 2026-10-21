-- Project: Football Player Management & Statistics System
-- Purpose: Store football match information

USE PlayerManagementDB;
GO

CREATE TABLE dbo.Matches (
    MatchID INT IDENTITY(1,1) PRIMARY KEY,
    HomeTeam VARCHAR(100) NOT NULL,
    AwayTeam VARCHAR(100) NOT NULL,
    MatchDate DATE NOT NULL,
    HomeScore INT NOT NULL DEFAULT 0,
    AwayScore INT NOT NULL DEFAULT 0,
    Competition VARCHAR(100),

    CONSTRAINT CK_Matches_HomeScore
        CHECK (HomeScore >= 0),

    CONSTRAINT CK_Matches_AwayScore
        CHECK (AwayScore >= 0),

    CONSTRAINT CK_Matches_DifferentTeams
        CHECK (HomeTeam <> AwayTeam)
);
GO