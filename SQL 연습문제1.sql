#날짜 : 2022/08/29
#이름 : 박종협
#내용 : SQL 연습문제1

#실습 1-1
create database `java2_shop`;
create user 'java2_admim1'@'%' identified by '1234';
grant all privileges on `java2_shop`.* to 'java2_admin1'@'%';
flush privileges;

#실습 1-2
create table `Customer` (
	`custId` varchar(10) primary key,
    `name` varchar(10) NOT NULL,
    `hp` varchar(13) unique default NULL,
    `addr` varchar(100) default NULL,
    `rdate` date NOT NULL
    );    
    
create table `Product` (
	`prodNo` int primary key,
    `prodName` varchar(10) NOT NULL,
    `stock` int default 0 NOT NULL ,
    `price` int default NULL,
    `company` varchar(20) NOT NULL
    );
    
create table `Order` (
	`orderNo` int primary key,
    `orderId` varchar(10) NOT NULL,
    `orderProduct` int NOT NULL,
    `orderCount` int NOT NULL default 1,
    `orderDate` datetime NOT NULL
    );

#실습 1-3
insert into `Customer` values ('c101', '김유신', '010-1234-1001', '김해시 봉황동', now());
insert into `Customer` values ('c102', '김춘추', '010-1234-1002', '경주시 보문동', now());
insert into `Customer` values ('c103', '장보고', '010-1234-1003', '완도군 청산면', now());
insert into `Customer` values ('c104', '강감찬', '010-1234-1004', '서울시 마포구', now());
insert into `Customer` values ('c106', '정철', '010-1234-1006', '경기도 용인시', now());
insert into `Customer` values ('c108', '이순신', '010-1234-1008', '서울시 영등포구', now());
insert into `Customer` values ('c109', '송상현', '010-1234-1009', '부산시 동래구', now());
insert into `Customer` values ('c110', '정약용', '010-1234-1010', '경기도 광주시', now());
insert into `Customer` (`custId`,`name`,`rdate`) values ('c105', '이성계', now());
insert into `Customer` (`custId`,`name`,`rdate`) values ('c107', '허준', now());

insert into `Product` values ('1', '새우깡', 5000, 1500, '농심');
insert into `Product` values ('2', '초코파이', 2500, 2500, '오리온');
insert into `Product` values ('3', '포카칩', 3600, 1700, '오리온');
insert into `Product` values ('4', '양파링', 1250, 1800, '농심');
insert into `Product` values ('6', '마가렛트', 3500, 3500, '롯데');
insert into `Product` values ('7', '뿌셔뿌셔', 1650, 1200, '오뚜기');
insert into `Product` (`prodNo`, `prodName`, `stock`, `company`) 
			   values ('5', '죠리퐁', 2200, '크라운');

insert into `Order` values (1, 'c102', 3, 2, now());
insert into `Order` values (2, 'c101', 4, 1, now());
insert into `Order` values (3, 'c108', 1, 1, now());
insert into `Order` values (4, 'c109', 6, 5, now());
insert into `Order` values (5, 'c102', 2, 1, now());
insert into `Order` values (6, 'c101', 7, 3, now());
insert into `Order` values (7, 'c110', 1, 2, now());
insert into `Order` values (8, 'c104', 2, 4, now());
insert into `Order` values (9, 'c102', 1, 3, now());
insert into `Order` values (10, 'c107', 6, 1, now());

#실습 1-4
select * from `Customer`;
#실습 1-5
select `custID`, `name`, `hp` from `Customer`;
#실습 1-6
select * from `Product`;
#실습 1-7
select `company` from `Product`;
#실습 1-8

#실습 1-9
select `prodName`, `price` from `Product`;
#실습 1-10
select `prodName`, `price` where `price`+`500` as `조정단가` from `Product`;

#실습 1-11
select `prodName`, `stock`, `price` from `Product` 
where `company` = '오리온';

#실습 1-12
select `orderProduct`, `orderCount`, `orderDate` from `order` 
where `orderId` = 'c102';

#실습 1-13
select `orderProduct`, `orderCount`, `orderDate` from `order` 
where `orderId` = 'c102' and `ordercount` >= 2;

#실습 1-14
select * from `Product` where `price` between 1000 and 2000;

#실습 1-15
select `custId`, `name`, `hp`, `addr` from `Customer`
where `name` like '김%';

#실습 1-16
select `custId`, `name`, `hp`, `addr` from `Customer`
where `name` like '__';

#실습 1-17
select * from `Customer` where `hp` = 'NULL';

#실습 1-18
select * from `Customer` where `addr`;

#실습 1-19
select * from `Customer` order by `rdate` asc;

#실습 1-20
select * from `Order` 
where `orderCount` >= 3 order by `orderProduct` desc;

#실습 1-21
select AVG(`price`) from `Product`;

#실습 1-22
select SUM(`stock`) as `재고량 합계` from `Product` 
where `company` = '농심';

#실습 1-23
select COUNT(`custId`) as `고객수` from `customer`;

#실습 1-24
select COUNT(`company`) as `제조업체 수` from `Product`;

#실습 1-25
select `orderProduct` as `주문 상품번호`, SUM(`orderCount`) as `총 주문 수량`
from `order` group by `orderProduct` 
order by `orderProduct` asc;

#실습 1-26
select `company` as `제조업체`, count(*) as `제품수`, max(`price`) as `최고가`
from `Product` group by `company` 
order by `company` asc;

#실습 1-27
select `Company` as `제조업체`, count(*) as `제품수`, MAX(`price`) as `최고가`
from `Product` group by `company` having `제품수` >= 2;

#실습 1-28
select `orderProduct`, `orderId`, SUM(`orderCount`) as `총 주문수량`
from `Order` group by `orderProduct`, `orderId` 
order by `orderProduct` asc;

#실습 1-29
select a.orderId, b.prodName from `Order` as a
join `Product` as b
on a.orderProduct = b.prodNo
where `orderId` = 'c102';

#실습 1-30

