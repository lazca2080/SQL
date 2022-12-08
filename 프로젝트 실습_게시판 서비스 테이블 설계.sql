#날짜 : 2022/10/19
#이름 : 박종협
#내용 : 프로젝트 실습_게시판 서비스 테이블 설계

#데이터베이스 생성
CREATE DATABASE `java2_board`;
CREATE USER 'java2_board'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `java2_board`.* TO 'java2_board'@'%';
FLUSH PRIVILEGES;

#회원 테이블 생성
CREATE TABLE `board_user`(
	`uid`   VARCHAR(20) PRIMARY KEY,
	`pass`  VARCHAR(255) NOT NULL,
	`name`  VARCHAR(20) NOT NULL,
	`nick`  VARCHAR(20) UNIQUE NOT NULL,
	`email` VARCHAR(20) UNIQUE NOT NULL,
	`hp`	  CHAR(13) UNIQUE NOT NULL,
	`grade` TINYINT DEFAULT 2,
	`zip`   CHAR(5),
	`addr1` VARCHAR(255),
	`addr2` VARCHAR(255),
	`regip` VARCHAR(100) NOT NULL,
	`rdate` DATETIME NOT NULL
);

#약관 테이블 생성
CREATE TABLE `board_terms`(
	`terms`    TEXT,
	`privacy`  TEXT
);

#게시물 테이블 생성
CREATE TABLE `board_article`(
	`no` 			INT AUTO_INCREMENT PRIMARY KEY,
	`parent` 	INT DEFAULT 0,
	`comment` 	INT DEFAULT 0,
	`cate`		VARCHAR(20) DEFAULT 'free',
	`title` 		VARCHAR(255),
	`content`	TEXT NOT NULL,
	`file`		TINYINT DEFAULT 0,
	`hit`			INT DEFAULT 0,
	`uid`			VARCHAR(20) NOT NULL,
	`regip`		VARCHAR(100) NOT NULL,
	`rdate`		DATETIME NOT NULL
);

#파일 테이블 생성
CREATE TABLE `board_file`(
	`fno`			INT AUTO_INCREMENT PRIMARY KEY,
	`parent`		INT NOT NULL,
	`newName`	VARCHAR(255) NOT NULL,
	`oriName`	VARCHAR(255) NOT NULL,
	`download`	INT DEFAULT 0
);

SELECT `orderNo`, b.`name`,`prodName`,`orderCount`,`orderDate` FROM `order` AS a JOIN `customer` AS b ON a.orderId = b.custId
JOIN `product` AS c ON a.orderProduct = c.prodNo;

SELECT MAX(`no`) FROM `board_article`;
SELECT count(`no`) FROM `board_article`;

SELECT * FROM `board_article` WHERE `no`=1;

SELECT a.*, `nick` FROM `board_article` AS a JOIN `board_user` AS b ON a.uid = b.uid;

SELECT a.*, `nick` FROM `board_article` 
AS a JOIN `board_user` 
AS b ON a.uid = b.uid 
ORDER BY a.`no` DESC
LIMIT 0, 10;



INSERT INTO `board_article` (`cate`, `title`, `content`, `uid`, `regip`, `rdate`)
SELECT `cate`, `title`, `content`, `uid`, `regip`, `rdate` FROM `board_article`;

SELECT a.*, b.fno, b.parent AS pno, b.newName, b.oriName, b.download 
FROM `board_article` AS a
left JOIN `board_file` AS b
ON a.`no` = b.`parent`
WHERE `no` = 2;

SELECT a.*, b.`nick` FROM `board_article` AS a
JOIN `board_user` AS b
ON a.uid = b.uid
WHERE `parent`=505 order by `no` ASC

SELECT a.*, `nick` FROM `board_article`
AS a JOIN `board_user`
AS b ON a.uid = b.uid
WHERE `parent` = 0
ORDER BY a.`no` desc
LIMIT 0, 10;

SELECT count(`no`) FROM `board_article` WHERE `parent` = 0 AND `cate`='story';

SELECT a.*, b.nick FROM `board_article` AS a
JOIN `board_user` AS b USING (`uid`)
WHERE `parent` != 0 AND `cate`='story' ORDER BY `no` DESC LIMIT 1;

UPDATE `boadr_article` SET `content`= '댓글 수정입니다.' `rdate` = NOW() WHERE `no`= 68;

DELETE FROM `board_article` WHERE `no`=87;

UPDATE `board_article` SET 
`title`='101 수정8', 
`content`='101 수정 8', 
`rdate`=NOW()
WHERE `no`=101;

UPDATE `board_article` SET `title`='123', `content`='sdf', `rdate`=NOW() WHERE `no`=101

UPDATE `board_article` SET `comment`=`comment`+1 WHERE `no`=101;

SELECT a.*, `nick` FROM `board_article` AS a JOIN `board_user`
AS b ON a.uid = b.uid
WHERE `parent` = 0 AND `cate` = 'story'
ORDER BY a.`no` DESC;

SELECT * FROM `board_user` WHERE `nick`='홍홍';

(SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`='grow' ORDER BY `no` DESC LIMIT 5)
UNION
(SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`='story' ORDER BY `no` DESC LIMIT 5)
UNION
(SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`='school' ORDER BY `no` DESC LIMIT 5);

SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`='notice' ORDER BY `no` DESC LIMIT 3

SELECT a.*, b.`nick` FROM `board_article` AS a
JOIN `board_user` AS b
ON a.uid = b.uid
WHERE `parent`='505' AND `cate`='story' ORDER BY `no` ASC

SELECT COUNT(`uid`) FROM `board_user` WHERE `uid`='pjh124';

SELECT * FROM `board_user` WHERE `name`='테스트' AND `email`='lazca7@naver.com'.

SELECT a.*, b.fno, b.parent AS pno, b.newName, b.oriName, b.download
FROM `board_article` AS a
LEFT JOIN `board_file` AS b
ON a.`no` = b.`parent`
WHERE `no` = 1

SELECT count(`no`) FROM `board_article` WHERE `parent` = 0

ALTER TABLE `board_user` ADD COLUMN `sessId` VARCHAR(100) UNIQUE;
ALTER TABLE `board_user` ADD COLUMN `sessLimitDate` DATETIME;

ALTER TABLE `board_user` DROP COLUMN `sessId`;
ALTER TABLE `board_user` DROP COLUMN `sessLimitDate`;

ALTER TABLE `board_user` ADD COLUMN `wdate` DATETIME;

UPDATE `board_user` SET `sessId`=?, `sessLimitDate` = DATE_ADD(NOW(),INTERVAL 3 DAY) WHERE `uid`=?;

SELECT * FROM `board_user` WHERE `sessId`='6D185376EDD27BED9882B0069673095D' AND `sessLimitDate` > NOW();

SELECT a.*, b.nick FROM `board_article` AS a
JOIN `board_user` AS b USING (`uid`)
WHERE `parent` != 0 ORDER BY `no` DESC LIMIT 1

SELECT a.*, `nick` FROM `board_article`
AS a JOIN `board_user`
AS b ON a.uid = b.uid
WHERE `parent` = 0 AND `cate`='event'
ORDER BY a.`no` desc
LIMIT 0, 10

SELECT * FROM `board_file` WHERE `parent`='1' AND `cate`='event';

DELETE FROM `board_article` WHERE (`no`='2' or `parent`='2') AND `cate`='event'

SELECT a.*, b.nick FROM `board_article` AS a
JOIN `board_user` AS b USING (`uid`)
WHERE `parent` != 0 ORDER BY `no` DESC LIMIT 1 

SELECT a.*, b.`nick` FROM `board_article` AS a
JOIN `board_user` AS b
ON a.uid = b.uid
WHERE `parent`=1021 ORDER BY `no` ASC

SELECT COUNT(`no`) FROM `board_article` WHERE `parent`=?

SELECT a.*, b.fno, b.parent AS pno, b.newName, b.oriName, b.download
FROM `board_article` AS a
LEFT JOIN `board_file` AS b
ON a.`no` = b.`parent`
WHERE `no` = 1020 AND `cate`='event'

SELECT `no`, `title`, `rdate` FROM `board_article` WHERE `cate`='notice' ORDER BY `no` DESC

SELECT `no`, `title` FROM `board_article` WHERE `cate`='notice' ORDER BY `no` DESC LIMIT 3

SELECT * FROM `board_article` WHERE `cate`='event' AND `title` LIKE '%테스%';

SELECT a.*, `nick` FROM `board_article`
AS a JOIN `board_user`
AS b ON a.uid = b.uid
WHERE `parent` = 0 AND `cate`='event' AND `title` LIKE '%테스%'
ORDER BY a.`no` DESC
LIMIT 0, 10

SELECT count(`no`) FROM `board_article` WHERE `parent` = 0 AND `cate`='event' AND `title` LIKE '%테스%'

SELECT COUNT(a.`no`), `nick` FROM `board_article` 
AS a JOIN `board_user`
AS b ON a.uid = b.uid
WHERE `parent` = 0 AND `cate`=? AND `nick` LIKE ?

SELECT COUNT(`email`) FROM `board_user` WHERE `email`=''

UPDATE `board_user` SET `grade`='2', `wdate`=NOW() WHERE `uid`='a101'