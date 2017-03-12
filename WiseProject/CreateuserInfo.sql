CREATE TABLE `userInfo` (
  `user_id` 	int NOT NULL AUTO_INCREMENT,
  `account` 	varchar(50) NOT NULL,
  `password` 	varchar(50) NOT NULL,
  `user_name` 	varchar(20) not NULL unique,
  `phonenum`	char(10) not NULL,
  `EMAIL`		varchar(50) not NULL,
  `gender` 		char(1) DEFAULT NULL,
  `birthday` 	datetime DEFAULT NULL,
  `head_pic` 	varchar(100) ,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;