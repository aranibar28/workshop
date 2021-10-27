USE movies;

CREATE TABLE IF NOT EXISTS `movies`.`movie` (
  `idmovie` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NULL,
  `plot` VARCHAR(250) NULL,
  `year` INT NULL,
  `length` INT NULL,
  `director` VARCHAR(45) NULL,
  `background` VARCHAR(200) NULL,
  `coverimage` VARCHAR(200) NULL,
  `maincolor` VARCHAR(8) NULL,
  PRIMARY KEY (`idmovie`));

CREATE TABLE IF NOT EXISTS `movies`.`genre` (
  `idgenre` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  PRIMARY KEY (`idgenre`));

CREATE TABLE IF NOT EXISTS `movies`.`movieGenre` (
  `idmovieGenre` INT NOT NULL AUTO_INCREMENT,
  `idmovie` INT NULL,
  `idgenre` INT NULL,
  PRIMARY KEY (`idmovieGenre`),
  FOREIGN KEY (`idmovie`)
    REFERENCES `movies`.`movie` (`idmovie`),
  FOREIGN KEY (`idgenre`)
    REFERENCES `movies`.`genre` (`idgenre`));
  
INSERT INTO movie (`title`, `plot`, `year`, `length`, `director`, `background`, `coverimage`, `maincolor`)
VALUES 
("Bright", "Set in a world where fantasy creatures live side by side with humans. A human cop is forced to work with an Orc to find a weapon everyone is prepared to kill for.",
2017, 117, "David Ayer", 
"https://occ-0-2433-448.1.nflxso.net/art/cd5c9/3e192edf2027c536e25bb5d3b6ac93ced77cd5c9.jpg",
"https://movieplayer.net-cdn.it/t/images/2017/12/20/bright_jpg_191x283_crop_q85.jpg",
"#0d0d0c");

INSERT INTO movie (`title`, `plot`, `year`, `length`, `director`, `background`, `coverimage`, `maincolor`)
VALUES 
("Tomb Raider", "Lara Croft, the fiercely independent daughter of a missing adventurer, must push herself beyond her limits when she finds herself on the island where her father disappeared.",
2018, 125, "Roar Uthaug", 
"https://fsmedia.imgix.net/cd/c9/5e/ba/4817/4d9a/93f0/c776ec32ecbc/lara-crofts-neck-looks-unnatural-in-the-new-poster-for-tomb-raider.png",
"https://mr.comingsoon.it/imgdb/locandine/235x336/53750.jpg",
"#0d0d0c");

INSERT INTO movie (`title`, `plot`, `year`, `length`, `director`, `background`, `coverimage`, `maincolor`)
VALUES 
("Black Panther", "T'Challa, the King of Wakanda, rises to the throne in the isolated, technologically advanced African nation, but his claim is challenged by a vengeful outsider who was a childhood victim of T'Challa's father's mistake.",
2018, 134, "Ryan Coogler", 
"https://www.gannett-cdn.com/-mm-/c03fd140debe8ad4c05cf81a5cad7ad61a12ce52/c=0-1580-2985-3266&r=x803&c=1600x800/local/-/media/2017/06/09/USATODAY/USATODAY/636326272873599176-Black-Panther-Teaser.jpg",
"https://mr.comingsoon.it/imgdb/locandine/235x336/53715.jpg",
"#0d0d0c");

INSERT INTO `movies`.`genre` (`title`) VALUES ("Action");
INSERT INTO `movies`.`genre` (`title`) VALUES ("Crime");
INSERT INTO `movies`.`genre` (`title`) VALUES ("Fantasy");
INSERT INTO `movies`.`genre` (`title`) VALUES ("Adventure");
INSERT INTO `movies`.`genre` (`title`) VALUES ("Sci-Fi");

INSERT INTO `movies`.`moviegenre` (`idmovie`,`idgenre`) VALUES("1", "1");
INSERT INTO `movies`.`moviegenre` (`idmovie`,`idgenre`) VALUES("1", "2");
INSERT INTO `movies`.`moviegenre` (`idmovie`,`idgenre`) VALUES("1", "3");
INSERT INTO `movies`.`moviegenre` (`idmovie`,`idgenre`) VALUES("2", "1");
INSERT INTO `movies`.`moviegenre` (`idmovie`,`idgenre`) VALUES("2", "3");
INSERT INTO `movies`.`moviegenre` (`idmovie`,`idgenre`) VALUES("3", "1");
INSERT INTO `movies`.`moviegenre` (`idmovie`,`idgenre`) VALUES("3", "4");
INSERT INTO `movies`.`moviegenre` (`idmovie`,`idgenre`) VALUES("3", "3");

SELECT mg.idmovie, g.title FROM moviegenre AS mg
LEFT JOIN genre AS g
ON mg.idgenre = g.idgenre
WHERE idmovie = 2