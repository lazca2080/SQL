create database `UserDB`;
drop database `UserDB`;

create table `user2` (
	`uid` varchar(10),
    `name` varchar(10),
    `hp`  char(13),
    `age` int
    );

drop table `User2`;

insert into `User2` values ('A101', '김유신', '010-1234-1111', 25);
insert into `User2` values ('A102', '김춘추', '010-1234-2222', 23);
insert into `User2` values ('A103', '장보고', '010-1234-3333', 32);
insert into `User2` (`uid`, `name`, `age`) values ('A104', '강감찬', 45);
insert into `User2` set
				`uid`='A105',
                `name`='이순신',
                `hp`='010-1234-5555';
                
select*from `User2`;
select*from `User2` where `uid`='A101';
select*from `User2` where `name`='김춘추';
select*from `User2` where `age` < 30;
select*from `User2` where `age` >= '30';
select `uid`, `name`, `age` from `User2`;

update `User2` set `hp`='010-1234-4444' where `uid`='A104';
update `User2` set `age`= 51 where `uid`='A105';
update `User2` set
			`hp` = '010-1234-1001',
			`age`='27' 
			where
				`uid`='A101'
                


delete from `User2` where `uid` = 'A102' and `age`=25;
delete from `User2` where `uid` = 'A102' and `age`=25;
delete from `User2` where `age` >= 30;





