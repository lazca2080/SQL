#날짜 : 2022/09/01
#이름 : 박종협
#내용 : SQL 연습문제4

#실습 4-1
create database `java2_BookStore`;
create user 'java2_admin4'@'%' identified by '1234';
grant all privileges on `java2_BookStore`.* to 'java2_admin4'@'%';
flush privileges;

#실습 4-2
create table `Customer` (
	`custId`	int primary key AUTO_INCREMENT,
    `name`		varchar(10) NOT NULL,
    `address`	varchar(20) default NULL,
    `phone`		varchar(13) default NULL
	);

create table `Book` (
	`bookId`	int primary key,
    `bookName`	varchar(20) NOT NULL,
    `publisher`	varchar(20) NOT NULL,
    `price`		int default NULL
    );

create table `Order` (
	`orderId`	int primary key AUTO_INCREMENT,
    `custId`	int NOT NULL,
    `bookId`	int NOT NULL,
    `salePrice`	int NOT NULL,
    `orderDate`	date NOT NULL
    );

#실습 4-3
insert into `Customer` (`name`, `address`, `phone`) values ('박지성', '영국 맨체스터', '000-5000-0001');
insert into `Customer` (`name`, `address`, `phone`) values ('김연아', '대한민국 서울', '000-5000-0001');
insert into `Customer` (`name`, `address`, `phone`) values ('장미란', '대한민국 강원도', '000-5000-0001');
insert into `Customer` (`name`, `address`, `phone`) values ('추신수', '미국 클리블랜드', '000-5000-0001');
insert into `Customer` (`name`, `address`) values ('박세리', '대한민국 대전');

insert into `Book` values (1, '축구의 역사', '굿스포츠', '7000');
insert into `Book` values (2, '축구아는 여자', '나무수', '13000');
insert into `Book` values (3, '축구의 이해', '대한미디어', '22000');
insert into `Book` values (4, '골프 바이블', '대한미디어', '35000');
insert into `Book` values (5, '피겨 교본', '굿스포츠', '8000');
insert into `Book` values (6, '역도 단계별기술', '굿스포츠', '6000');
insert into `Book` values (7, '야구의 추억', '이상미디어', '20000');
insert into `Book` values (8, '야구를 부탁해', '이상미디어', '13000');
insert into `Book` values (9, '올림픽 이야기', '삼성당', '7500');
insert into `Book` values (10, 'Olympic Champions', 'Pearson', '13000');

insert into `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) values (1, 1, '6000', '2014-07-01');
insert into `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) values (1, 3, '21000', '2014-07-03');
insert into `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) values (2, 5, '8000', '2014-07-03');
insert into `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) values (3, 6, '6000', '2014-07-04');
insert into `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) values (4, 7, '20000', '2014-07-05');
insert into `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) values (1, 2, '12000', '2014-07-07');
insert into `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) values (4, 8, '13000', '2014-07-07');
insert into `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) values (3, 10, '12000', '2014-07-08');
insert into `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) values (2, 10, '7000', '2014-07-09');
insert into `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) values (3, 8, '13000', '2014-07-10');

#실습 4-4
select 
	`custId`,
	`name`,
    `address`
from `customer`;

#실습 4-5
select
	`bookname`, `price`
from `book`;

#실습 4-6
select
	`price`, `bookname`
from `book`;

#실습 4-7
select
	`bookId`, `bookname`,
    `publisher`, `price`
from `book`;

#실습 4-8
select `publisher` from `book`;

#실습 4-9
select distinct `publisher` from `book`;

#실습 4-10
select * from `book` where `price` >= 20000;

#실습 4-11
select * from `book` where `price` < 20000;

#실습 4-12
select * from `book` where `price` between 10000 and 20000;

#실습 4-13
select
	`bookId`, `bookname`, `price`
from `book` where `price` between 15000 and 30000;

#실습 4-14
select * from `book` where `bookid` in(2, 3, 5);

#실습 4-15
select * from `book` where mod (`bookId`, 2) = 0;
select * from `book` where `bookId`% 2 = 0;

#실습 4-16
select * from `customer` where `name` like '박%';

#실습 4-17
select * from `customer` where `address` like '대한민국%';

#실습 4-18
select * from `customer` where `phone` is not null;

#실습 4-19
select * from `book` where `publisher` = '굿스포츠' or `publisher` = '대한미디어';
select * from `book` where `publisher` in('굿스포츠','대한미디어');

#실습 4-20
select `publisher` from `book` where `bookname` = '축구의 역사';

#실습 4-21
select `publisher` from `book` where `bookname` like '축구%';

#실습 4-22
select * from `book` where `bookname` like '_구%';

#실습 4-23
select * from `book` where `bookname` like '축구%' and `price` >= 20000;

#실습 4-24
select * from `book` order by `bookname`;

#실습 4-25
select * from `book` order by `price`, `bookname`;

#실습 4-26
select * from `book` order by `price` desc, `publisher` asc;

#실습 4-27
select * from `book` order by `price` desc
limit 3;

#실습 4-28
select * from `book` order by `price` asc
limit 3;

#실습 4-29
select
	sum(`salePrice`) as `총판매액`
from `customer` as a
join `order` as b on a.custId = b.custId
join `book` as c on b.bookId = c.bookId;

#실습 4-30
select
	sum(`saleprice`) as `총판매액`,
    avg(`saleprice`) as `평균값`,
    min(`saleprice`) as `최저가`,
    max(`saleprice`) as `최고가`
from `customer` as a
join `order` as b on a.custId = b.custId
join `book` as c on b.bookId = c.bookId;

#실습 4-31
select 
	count(`saleprice`) as `판매건수`
from `customer` as a
join `order` as b on a.custId = b.custId
join `book` as c on b.bookId = c.bookId;

#실습 4-32
update `book` set
	`bookname` = replace(`bookname`, '야구', '농구') where `bookname` like '야구%';
select 
	`bookId`,
	replace(`bookname`, '야구', '농구') as `bookname`,
    `publisher`,
    `price`
    from `book`;
    
#실습 4-33
select 
	b.`custId`,
    count(`saleprice`) as `수량`
from `customer` as a
join `order` as b on a.custId = b.custId
join `book` as c on b.bookId = c.bookId
where `saleprice` >= 8000
group by b.`custid`
having `수량` >= 2;

#실습 4-34
select * from `customer` as a
join `order` as b on a.custId = b.custId;

#실습 4-35
select * from `customer` as a
join `order` as b on a.custId = b.custId
order by b.`custId`;

#실습 4-36
select
	`name`,
    `saleprice`
from `customer` as a
join `order` as b on a.custId = b.custId;

#실습 4-37
select
	`name`,
    sum(`saleprice`)
from `customer` as a
join `order` as b on a.custId = b.custId
group by `name`;

#실습 4-38
select
	`name`,
    `bookname`
from `customer` as a
join `order` as b on a.custId = b.custId
join `book` as c on b.bookId = c.bookId
order by a.custId;

#실습 4-39
select 
	`name`,
    `bookname`
from `customer` as a
join `order` as b on a.custId = b.custId
join `book` as c on b.bookId = c.bookId
where `saleprice` = 20000;

#실습 4-40
select 
	`name`,
    `saleprice`
from `customer` as a
left join `order` as b on a.custId = b.custId;

#실습 4-41
select
	`bookname`
from `book` where `price` = ( SELECT MAX(`price`) FROM `book`);

#실습 4-42
select 
	`name`
from `customer` as a
left join `order` as b on a.custId = b.custId
where `saleprice` is null;

select `name` from `customer` 
where `name` not in (select `name` from `customer` 
where `custId` in(select distinct `custId` from `Order`));

#실습 4-43
select
	sum(`saleprice`) as `총매출`
from `customer` as a
join `order` as b on a.custId = b.custId
join `book` as c on b.bookId = c.bookId
where `name` = '김연아';

#실습 4-44
insert into `book` (`bookId`, `bookname`, `publisher`) values (11, '스포츠의학', '한솔의학서적');
select * from `book`;
delete from `book` where `bookId` = 11;

#실습 4-45
update `Customer` set
	`address` = '대한민국 부산' where `custId` = 6;
select * from `Customer`;

#실습 4-46
delete from `Customer` where `custId` = 6;
select * from `Customer`;

