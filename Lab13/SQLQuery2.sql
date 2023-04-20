alter proc PSUBJECT @PULPIT varchar(20), @COUNT_OUT int output
as
begin
	declare @COUNT_ALL int = (select count(*) from SUBJECT)
	print '���������: @PULPIT = ' + @PULPIT + '; @COUNT_OUT = ' + cast(@COUNT_OUT as varchar)
	select s.SUBJECT ���, s.SUBJECT_NAME ����������, s.PULPIT �������
	from   SUBJECT s
	where  s.PULPIT = @PULPIT
	set @COUNT_OUT = @@ROWCOUNT
	return @COUNT_ALL
end

drop procedure PSUBJECT;

declare @COUNT_SUBJECTS int = 0
declare @PARAM int = 0
exec @COUNT_SUBJECTS = PSUBJECT @PULPIT = '����', @COUNT_OUT = @PARAM output
print '���-�� ��������� �� �������: ' + cast(@PARAM as varchar)
print '���-�� ��������� �����: ' + cast(@COUNT_SUBJECTS as varchar)