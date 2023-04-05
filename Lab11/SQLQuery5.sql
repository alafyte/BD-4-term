declare Prog cursor local dynamic for 
	select IDSTUDENT, SUBJECT, NOTE from PROGRESS FOR UPDATE
declare @id varchar(10), @sub varchar(15), @nt int


open Prog
fetch Prog into @id, @sub, @nt
print @id + ' студент – ' + rtrim(cast(@sub as varchar)) + ' (оценка ' + cast(@nt as varchar) + ')'
delete PROGRESS where CURRENT OF Prog
fetch Prog into @id, @sub, @nt
update PROGRESS set NOTE = NOTE + 1 where CURRENT OF Prog
print ''
print @id + ' студент – ' + rtrim(cast(@sub as varchar)) + ' (оценка ' + cast(@nt as varchar) + ')'

close Prog