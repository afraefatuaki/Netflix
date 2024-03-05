USE netflixDB

CREATE TABLE `User` (
  `UserID` INT AUTO_INCREMENT,
  `UserName` VARCHAR(255) NOT NULL,
  `Email` Varchar(255) UNIQUE NOT NULL,
  `PasswordHash` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`UserID`)
);

CREATE TABLE `Movie` (
  `MovieID` INT AUTO_INCREMENT,
  `Title` VARCHAR(225) NOT NULL,
  `Description` TEXT,
  `Genre` ENUM('Action','Drama','Horror','Romantic') NOT NULL,
  `Duration` INT,
  `ReleasedDate` DATE,
  `ThumbnailURL` VARCHAR(225),
  `Director` Varchar(255),
  PRIMARY KEY (`MovieID`)
);

CREATE TABLE `UserRecommendation` (
  `RecommendationID` INT AUTO_INCREMENT,
  `UserID` INT NOT NULL,
  `MovieID` INT NOT NULL,
  PRIMARY KEY (`RecommendationID`),
  FOREIGN KEY (`UserID`) REFERENCES `User`(`UserID`),
  FOREIGN KEY (`MovieID`) REFERENCES `Movie`(`Title`)
);

CREATE TABLE `Genre` (
  `GenreID` INT AUTO_INCREMENT,
  `Name` INT VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY (`GenreID`)
);

CREATE TABLE `UserInteraction` (
  `InteractionID ` INT AUTO_INCREMENT,
  `UserID` INT NOT NULL,
  `MovieID` INT NOT NULL,
  `like` bool,
  `view` bool,
  PRIMARY KEY (`InteractionID `),
  FOREIGN KEY (`InteractionID `) REFERENCES `User`(`UserID`)
);

CREATE TABLE `MovieGenres` (
  `GenreID, MovieID` INT NOT NULL,
  `MovieID` INT NOT NULL,
  `GenreID` INT NOT NULL,
  PRIMARY KEY (`GenreID, MovieID`),
  FOREIGN KEY (`MovieID`) REFERENCES `Movie`(`MovieID`),
  FOREIGN KEY (`GenreID`) REFERENCES `Genre`(`GenreID`)
);
