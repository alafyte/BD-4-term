create proc PSUBJECT as
begin
	declare @COUNT int = (select count(*) from SUBJECT)
	select s.SUBJECT Код, s.SUBJECT_NAME Дисциплина, s.PULPIT Кафедра from SUBJECT s
	return @COUNT
end

drop proc PSUBJECT;

declare @COUNT_OUTPUT int = 0
exec @COUNT_OUTPUT = PSUBJECT
print 'Количество дисциплин: ' + cast(@COUNT_OUTPUT as varchar)