create database hwdb;

create table `hwdb`.`user`(
`userid` varchar(20) not null,
`userpwd` varchar(20) not null,
`regidate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`)
);

create table `hwdb`.`productinfo`(
	`regi_userid` varchar(20) not null ,
	`isbn` varchar(20) not null,
    `pname` varchar(20) not null,
    `price` varchar(20) not null,
    `desc` varchar(100) not null,
    `regidate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    primary key (`isbn`),
    foreign key (`regi_userid`) references user (`userid`)
);
commit;