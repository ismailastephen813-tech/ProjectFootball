CREATE TABLE Players (
    PlayerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Nationality VARCHAR(50),
    Position VARCHAR(30),
    ShirtNumber INT,
    PreferredFoot VARCHAR(10),
    Salary DECIMAL(12,2),
    MarketValue DECIMAL(15,2)
);