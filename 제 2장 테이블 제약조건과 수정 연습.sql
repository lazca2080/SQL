create table `ABC` (
	`uid`	varchar(10) primary key,
    `name`	varchar(10),
    `hp`	char(13),
    `age`	tinyint
    );
    
    
create table `ABC1` (
	`uid`	varchar(10) primary key,
    `name`	varchar(10),
    `hp`	char(13) unique,
    `age`	tinyint
    );
    
create table `ABC2` (
	`pid`	varchar(10) primary key,
    `name`	varchar(10),
    `hp`	char(13) unique
    );
    
create table `ABC3` (
	`cid`	varchar(10) primary key,
    `name`	varchar(10),
    `hp`	char(13) unique,
    `pid`	varchar(10),
    foreign key (`pid`) references `ABC2` (`pid`)
    );
    
    
create table `ABC4` (
	`seq`		int auto_increment primary key,
    `name`		varchar(10),
    `gender`	tinyint,
    `age`		tinyint,
    `addr`		varchar(255)
    );
    
create table `ABC5` (
	`name`		varchar(10) not null,
    `gender`	tinyint,
    `age`		int default 1,
    `addr`		varchar(10)
    );