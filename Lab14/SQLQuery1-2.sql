alter function COUNT_STUDENTS (@FACULTY varchar(20) = null, @PROFFESION varchar(20) = null) returns int
as begin
	declare @COUNT int = (select count(*)
						  from   STUDENT s
						  join   GROUPS g on s.IDGROUP = g.IDGROUP
						  join   FACULTY f on f.FACULTY = g.FACULTY
						  where  g.FACULTY = isnull(@FACULTY, g.FACULTY)
						  and    g.PROFESSION = isnull(@PROFFESION, g.PROFESSION))
	return @COUNT
end

declare @RES int = dbo.COUNT_STUDENTS('���', '1-48 01 02')
print '���������� ���������: ' + cast(@RES as varchar)