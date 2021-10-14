create database wsbook;

use wsbook;

CREATE TABLE IF NOT EXISTS `wsbook`.`book` (
	`isbn` varchar(20) not null,
    `bname` varchar(30) not null,
    `author` varchar(20) not null,
    `price` varchar(20) not null,
  `regidate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`isbn`));
  
commit;

