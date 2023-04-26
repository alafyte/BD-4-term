create function COUNT_PULPITS (@FACULTY varchar(20)) returns int
as begin
	declare @COUNT int = (select count(PULPIT) from PULPIT where FACULTY = isnull(@FACULTY, FACULTY))
	return @COUNT
end

create function COUNT_GROUPS (@FACULTY varchar(20)) returns int
as begin
	declare @COUNT int = (select count(IDGROUP) from GROUPS where FACULTY = isnull(@FACULTY, FACULTY))
	return @COUNT
end

create function COUNT_PROFESSIONS (@FACULTY varchar(20)) returns int
as begin
	declare @COUNT int =  (select count(PROFESSION) from PROFESSION where FACULTY = isnull(@FACULTY, FACULTY))
	return @COUNT
end


--drop function COUNT_PULPITS
--drop function COUNT_GROUPS
--drop function COUNT_PROFESSIONS
--drop function FACULTY_REPORT


create function FACULTY_REPORT(@c int) returns @fr table
([���������] varchar(50), [���-�� ������] int, [���-�� �����] int, [���-�� ���������] int, [���-�� ��������������] int)
as begin 
	declare @f varchar(30);
	declare cc CURSOR static for 
	select FACULTY from FACULTY 
	where  dbo.COUNT_STUDENTS(FACULTY, default) > @c; 

	open cc;  
		fetch cc into @f;
	    while @@fetch_status = 0
			begin
	            insert @fr values(@f,  dbo.COUNT_PULPITS(@f),
	            dbo.COUNT_GROUPS(@f),   dbo.COUNT_STUDENTS(@f, default),
	            dbo.COUNT_PROFESSIONS(@f)); 
	            fetch cc into @f;  
	       end;   
	return; 
end;


select * from FACULTY_REPORT(0)