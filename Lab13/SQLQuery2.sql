alter proc PSUBJECT @PULPIT varchar(20), @COUNT_OUT int output
as
begin
	declare @COUNT_ALL int = (select count(*) from SUBJECT)
	print 'Параметры: @PULPIT = ' + @PULPIT + '; @COUNT_OUT = ' + cast(@COUNT_OUT as varchar)
	select s.SUBJECT Код, s.SUBJECT_NAME Дисциплина, s.PULPIT Кафедра
	from   SUBJECT s
	where  s.PULPIT = @PULPIT
	set @COUNT_OUT = @@ROWCOUNT
	return @COUNT_ALL
end

drop procedure PSUBJECT;

declare @COUNT_SUBJECTS int = 0
declare @PARAM int = 0
exec @COUNT_SUBJECTS = PSUBJECT @PULPIT = 'ИСиТ', @COUNT_OUT = @PARAM output
print 'Кол-во дисциплин на кафедре: ' + cast(@PARAM as varchar)
print 'Кол-во дисциплин всего: ' + cast(@COUNT_SUBJECTS as varchar)