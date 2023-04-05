USE UNIVER;
DECLARE @ds char(20), @t char(300) = '';
DECLARE Disc CURSOR for SELECT SUBJECT FROM SUBJECT WHERE PULPIT = 'ИСиТ';
OPEN Disc;
FETCH Disc into @ds;
print 'Cписок дисциплин';
WHILE @@FETCH_STATUS = 0
	begin
	set @t = RTRIM(@ds) + ', ' + @t;
	FETCH Disc into @ds;
	end;
	print @t;
CLOSE Disc;
DEALLOCATE Disc;