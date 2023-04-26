create function FCTEACHER (@PULPIT varchar(20)) returns int
as begin
	declare @COUNT int = (select count(*)
						  from   TEACHER t
						  where  t.PULPIT = isnull(@PULPIT, t.PULPIT))
	return @COUNT
end

print '���-�� �������������� �����: ' + cast(dbo.FCTEACHER(null) as varchar)
print '���-�� �������������� ����:  ' + cast(dbo.FCTEACHER('����') as varchar)
select PULPIT �������, dbo.FCTEACHER(PULPIT) [���-�� ��������������]
from   PULPIT