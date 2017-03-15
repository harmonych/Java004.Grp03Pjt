CREATE TABLE `userInfo` (
  `user_id` 	int NOT NULL AUTO_INCREMENT,
  `account` 	varchar(50) NOT NULL,
  `password` 	varchar(50) NOT NULL,
  `user_name` 	varchar(20) NOT NULL unique,
  `phonenum`	char(10) NOT NULL unique,
  `EMAIL`		varchar(50) NOT NULL unique,
  `gender` 		char(1) DEFAULT NULL,
  `birthday` 	datetime DEFAULT NULL,
  `portrait` 	mediumblob(100) ,
  `creator`     boolean NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;