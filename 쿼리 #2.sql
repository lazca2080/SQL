SELECT * FROM `lecture`

SELECT 
	`stdNo`,
	`stdName`,
	`lecName`,
	`lecNo`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
FROM `lecture` AS a
JOIN `register` AS b
ON a.lecNo = b.regStdNo
JOIN `student` AS c

ON b.regStdNo = c.stdNo;