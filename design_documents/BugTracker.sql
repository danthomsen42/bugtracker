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

ALTER TABLE `Bug_Status_Table` ADD FOREIGN KEY (`languageID`) REFERENCES `Language_Table` (`id`);

ALTER TABLE `Priority_Table` ADD FOREIGN KEY (`languageID`) REFERENCES `Language_Table` (`id`);

ALTER TABLE `Project_Status_Table` ADD FOREIGN KEY (`languageID`) REFERENCES `Language_Table` (`id`);

ALTER TABLE `Bug_Nature_Table` ADD FOREIGN KEY (`languageID`) REFERENCES `Language_Table` (`id`);

ALTER TABLE `Ratings_Table` ADD FOREIGN KEY (`languageID`) REFERENCES `Language_Table` (`id`);
