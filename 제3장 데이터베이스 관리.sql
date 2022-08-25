#날짜 : 2022/08/25
#이름 : 박종협
#내용 : 제3장 데이터베이스 관리

#실습 3-1 관리자 추가
create database `java2_test_db`;
create user 'java2_tester'@'%' identified by '1234';
grant all privileges on `java2_test_db`.* to 'java2_tester'@'%';
flush privileges;

#실습 3-2 관리자 비밀번호 수정 및 계정 삭제
alter user 'java2_tester'@'%' identified by '12345';
drop user 'java2_tester'@'%';
flush privileges;


