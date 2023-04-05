use UNIVER;
declare Prog CURSOR LOCAL DYNAMIC FOR
	SELECT p.IDSTUDENT, s.NAME, p.NOTE FROM PROGRESS p
	JOIN STUDENT s ON s.IDSTUDENT = p.IDSTUDENT
	WHERE p.IDSTUDENT = 1017
		FOR UPDATE
declare @id varchar(5), @nm varchar(50), @nt int

OPEN Prog
FETCH Prog INTO @id, @nm, @nt
UPDATE PROGRESS SET NOTE = NOTE + 1 WHERE CURRENT OF Prog
print @id + ': ' + @nm + ' (была оценка ' + cast(@nt as varchar) + ')'
CLOSE Prog