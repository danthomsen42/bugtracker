CREATE TABLE `Language_Table` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `languageID` text NOT NULL
);

CREATE TABLE `Bug_Status_Table` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `languageID` int,
  `status` text NOT NULL
);

CREATE TABLE `Priority_Table` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `languageID` int,
  `priorityType` text NOT NULL
);

CREATE TABLE `Project_Status_Table` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `languageID` int,
  `status` text NOT NULL
);

CREATE TABLE `Bug_Nature_Table` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `languageID` int,
  `nature` text NOT NULL
);

CREATE TABLE `Ratings_Table` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `languageID` int,
  `ratingDescription` text NOT NULL
);

CREATE TABLE `Permission_Level_Table` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `languageID` int,
  `PriorityName` text NOT NULL
);

CREATE TABLE `Organization_Table` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `organizationName` text NOT NULL,
  `organizationInternalNumber` int AUTO_INCREMENT DEFAULT 1024
);

CREATE TABLE `Team_Table` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `organizationID` int,
  `organizationInternalNumber` int AUTO_INCREMENT DEFAULT 1024
);

CREATE TABLE `User_Table` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `firstName` text NOT NULL,
  `lastName` text NOT NULL,
  `userName` text NOT NULL,
  `email` email NOT NULL,
  `jobTitle` text NOT NULL,
  `organizationID` int,
  `teamID` int,
  `permissionLevelID` int,
  `languageID` text,
  `hashedPassword` longtext NOT NULL,
  `dateTimeCreated` date
);

CREATE TABLE `Project_List_Table` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `OrganizationID` int,
  `permissionLevelID` int,
  `teamID` int,
  `userID` int,
  `personalProject` bool NOT NULL,
  `projectName` text NOT NULL,
  `priorityID` int,
  `statusID` int,
  `dateTimeCreated` date,
  `dateLastModified` date,
  `projectDescription` longtext NOT NULL
);

CREATE TABLE `Bug_Table` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `projectID` int,
  `userID` int,
  `teamID` int,
  `bugName` longtext NOT NULL,
  `bugNatureID` int,
  `assignedBugPriority` int,
  `recommendedBugPriority` int,
  `findability` int,
  `exploitability` int,
  `danger` int,
  `bugLocation` longtext NOT NULL,
  `bugDescription` longtext NOT NULL,
  `bugStatusID` int,
  `dateBugFound` date,
  `dateBugStatusAssigned` date
);

CREATE TABLE `Step_Log_Table` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `bugIndexID` int,
  `steps` longtext NOT NULL,
  `dateTimeAdded` date
);

ALTER TABLE `Bug_Status_Table` ADD FOREIGN KEY (`languageID`) REFERENCES `Language_Table` (`id`);

ALTER TABLE `Priority_Table` ADD FOREIGN KEY (`languageID`) REFERENCES `Language_Table` (`id`);

ALTER TABLE `Project_Status_Table` ADD FOREIGN KEY (`languageID`) REFERENCES `Language_Table` (`id`);

ALTER TABLE `Bug_Nature_Table` ADD FOREIGN KEY (`languageID`) REFERENCES `Language_Table` (`id`);

ALTER TABLE `Ratings_Table` ADD FOREIGN KEY (`languageID`) REFERENCES `Language_Table` (`id`);

ALTER TABLE `Permission_Level_Table` ADD FOREIGN KEY (`languageID`) REFERENCES `Language_Table` (`id`);

ALTER TABLE `Team_Table` ADD FOREIGN KEY (`organizationID`) REFERENCES `Organization_Table` (`id`);

ALTER TABLE `User_Table` ADD FOREIGN KEY (`organizationID`) REFERENCES `Organization_Table` (`id`);

ALTER TABLE `User_Table` ADD FOREIGN KEY (`teamID`) REFERENCES `Team_Table` (`id`);

ALTER TABLE `User_Table` ADD FOREIGN KEY (`permissionLevelID`) REFERENCES `Permission_Level_Table` (`id`);

ALTER TABLE `User_Table` ADD FOREIGN KEY (`languageID`) REFERENCES `Language_Table` (`id`);

ALTER TABLE `Project_List_Table` ADD FOREIGN KEY (`OrganizationID`) REFERENCES `Organization_Table` (`id`);

ALTER TABLE `Project_List_Table` ADD FOREIGN KEY (`permissionLevelID`) REFERENCES `Permission_Level_Table` (`id`);

ALTER TABLE `Project_List_Table` ADD FOREIGN KEY (`teamID`) REFERENCES `Team_Table` (`id`);

ALTER TABLE `Project_List_Table` ADD FOREIGN KEY (`userID`) REFERENCES `User_Table` (`id`);

ALTER TABLE `Project_List_Table` ADD FOREIGN KEY (`priorityID`) REFERENCES `Priority_Table` (`id`);

ALTER TABLE `Project_List_Table` ADD FOREIGN KEY (`statusID`) REFERENCES `Project_Status_Table` (`id`);

ALTER TABLE `Bug_Table` ADD FOREIGN KEY (`projectID`) REFERENCES `Project_List_Table` (`id`);

ALTER TABLE `Bug_Table` ADD FOREIGN KEY (`userID`) REFERENCES `User_Table` (`id`);

ALTER TABLE `Bug_Table` ADD FOREIGN KEY (`teamID`) REFERENCES `User_Table` (`id`);

ALTER TABLE `Bug_Table` ADD FOREIGN KEY (`bugNatureID`) REFERENCES `Bug_Nature_Table` (`id`);

ALTER TABLE `Bug_Table` ADD FOREIGN KEY (`assignedBugPriority`) REFERENCES `Bug_Nature_Table` (`id`);

ALTER TABLE `Bug_Table` ADD FOREIGN KEY (`recommendedBugPriority`) REFERENCES `Bug_Nature_Table` (`id`);

ALTER TABLE `Bug_Table` ADD FOREIGN KEY (`findability`) REFERENCES `Bug_Nature_Table` (`id`);

ALTER TABLE `Bug_Table` ADD FOREIGN KEY (`exploitability`) REFERENCES `Bug_Nature_Table` (`id`);

ALTER TABLE `Bug_Table` ADD FOREIGN KEY (`danger`) REFERENCES `Bug_Nature_Table` (`id`);

ALTER TABLE `Bug_Table` ADD FOREIGN KEY (`bugStatusID`) REFERENCES `Bug_Status_Table` (`id`);

ALTER TABLE `Step_Log_Table` ADD FOREIGN KEY (`bugIndexID`) REFERENCES `Bug_Table` (`id`);
