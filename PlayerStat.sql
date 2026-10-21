CREATE TABLE PlayerStatistics (
    StatisticID INT IDENTITY(1,1) PRIMARY KEY,
    PlayerID INT NOT NULL,
    MatchID INT NOT NULL,
    Goals INT NOT NULL DEFAULT 0,
    Assists INT NOT NULL DEFAULT 0,
    MinutesPlayed INT NOT NULL DEFAULT 0,
    YellowCards INT NOT NULL DEFAULT 0,
    RedCards INT NOT NULL DEFAULT 0,

    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID),

    CONSTRAINT UQ_Player_Match UNIQUE (PlayerID, MatchID)
);