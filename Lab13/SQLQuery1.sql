create proc PSUBJECT as
begin
	declare @COUNT int = (select count(*) from SUBJECT)
	select s.SUBJECT ���, s.SUBJECT_NAME ����������, s.PULPIT ������� from SUBJECT s
	return @COUNT
end

drop proc PSUBJECT;

declare @COUNT_OUTPUT int = 0
exec @COUNT_OUTPUT = PSUBJECT
print '���������� ���������: ' + cast(@COUNT_OUTPUT as varchar)