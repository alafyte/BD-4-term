use UNIVER;
--INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) values ('КГ',   1025,  '06.05.2013', 3);
declare ProgStud CURSOR LOCAL DYNAMIC FOR
	SELECT p.IDSTUDENT, s.NAME, p.NOTE FROM PROGRESS p
	JOIN STUDENT s ON s.IDSTUDENT = p.IDSTUDENT
	WHERE p.NOTE < 4
		FOR UPDATE
declare @id varchar(5), @nm varchar(50), @nt int


OPEN ProgStud
FETCH ProgStud INTO @id, @nm, @nt
print @id + ': ' + @nm + ' (оценка ' + cast(@nt as varchar) + ')'
DELETE PROGRESS WHERE CURRENT OF ProgStud
CLOSE ProgStud