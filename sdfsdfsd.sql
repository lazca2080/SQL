SELECT `lecName` FROM `lecture` AS a JOIN `register` AS b ON a.lecNo = b.regLecNo;

INSERT INTO  (코드, 년도)
(
  SELECT A.코드, A.년도 -- 추가할 필드
  FROM TB1 A LEFT JOIN TB2 B 
  ON A.코드 = B.코드
  WHERE B.코드 IS NULL -- join한 TB2테이블의 필드가 NULL이라는 말은 TB2에는 없는 값을 의미한다.
)

SELECT `stdNo`, `stdName`, `lecName`, `lecNo`, `regMidScore`, `regFinalScore`, `regTotalScore`, `regGrade`
FROM `lecture` AS a
JOIN `register` AS b
ON a.lecNo = b.regLecNo
JOIN `student` AS c
ON b.regStdNo = c.stdNo
WHERE `stdNo` = '20201016';

SELECT * FROM `student` WHERE `stdNo`='10';

INSERT INTO `user2` VALUSE('a110','이신신','010-9999-7891',43);

SELECT * FROM `board_user` WHERE `uid`='pjh12345' and `pass`=SHA2('!pjh12345', 256)

SELECT count(`uid`) FROM `board_user` WHERE `name`='테스트' AND `email`='lazca7@naver.com';