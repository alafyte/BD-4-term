DECLARE @dayOfExam date
SET @dayOfExam = (SELECT TOP 1 p.PDATE FROM PROGRESS p JOIN STUDENT s ON s.IDSTUDENT = p.IDSTUDENT
WHERE p.SUBJECT = '��' AND s.IDGROUP = 17)
PRINT DATENAME(dw, @dayOfExam)