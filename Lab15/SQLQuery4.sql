create trigger TR_TEACHER on TEACHER after insert, update, delete
as declare @TEACHER char(10), @TEACHER_NAME varchar(100),
		   @GENDER char(1), @PULPIT char(20), @IN varchar(300)

if (select count(*) from INSERTED) > 0 and (select count(*) from DELETED) > 0
begin
	print '��������� �������� UPDATE'
	set @TEACHER = (select TEACHER from DELETED where TEACHER is not null)
	set @TEACHER_NAME = (select TEACHER_NAME from DELETED where TEACHER_NAME is not null)
	set @GENDER = (select GENDER from DELETED where GENDER is not null)
	set @PULPIT = (select PULPIT from DELETED where PULPIT is not null)
	set @IN = ltrim(rtrim(@TEACHER)) + ' ' + ltrim(rtrim(@TEACHER_NAME)) + 
			  ' ' + ltrim(rtrim(@GENDER)) + ' ' + ltrim(rtrim(@PULPIT)) + ' -> '

	set @TEACHER = (select TEACHER from INSERTED where TEACHER is not null)
	set @TEACHER_NAME = (select TEACHER_NAME from INSERTED where TEACHER_NAME is not null)
	set @GENDER = (select GENDER from INSERTED where GENDER is not null)
	set @PULPIT = (select PULPIT from INSERTED where PULPIT is not null)
	set @IN = @IN + ltrim(rtrim(@TEACHER)) + ' ' + ltrim(rtrim(@TEACHER_NAME)) + 
			  ' ' + ltrim(rtrim(@GENDER)) + ' ' + ltrim(rtrim(@PULPIT))

	insert into TR_AUDIT (STMT, TRNAME, CC) values ('UPD', 'TR_TEACHER', @IN)
end

if (select count(*) from INSERTED) > 0 and (select count(*) from DELETED) = 0
begin
	print '��������� �������� INSERT'
	set @TEACHER = (select TEACHER from INSERTED)
	set @TEACHER_NAME = (select TEACHER_NAME from INSERTED)
	set @GENDER = (select GENDER from INSERTED)
	set @PULPIT = (select PULPIT from INSERTED)
	set @IN = ltrim(rtrim(@TEACHER)) + ' ' + ltrim(rtrim(@TEACHER_NAME)) + 
			  ' ' + ltrim(rtrim(@GENDER)) + ' ' + ltrim(rtrim(@PULPIT))
	insert into TR_AUDIT (STMT, TRNAME, CC) values ('INS', 'TR_TEACHER', @IN)
end

if (select count(*) from INSERTED) = 0 and (select count(*) from DELETED) > 0
begin
	print '��������� �������� DELETE'
	set @TEACHER = (select TEACHER from DELETED)
	set @TEACHER_NAME = (select TEACHER_NAME from DELETED)
	set @GENDER = (select GENDER from DELETED)
	set @PULPIT = (select PULPIT from DELETED)
	set @IN = ltrim(rtrim(@TEACHER)) + ' ' + ltrim(rtrim(@TEACHER_NAME)) + 
			  ' ' + ltrim(rtrim(@GENDER)) + ' ' + ltrim(rtrim(@PULPIT))
	insert into TR_AUDIT (STMT, TRNAME, CC) values ('DEL', 'TR_TEACHER', @IN)
end




insert into TEACHER values ('����', '������ ���� ��������', '�', '����')
update TEACHER set TEACHER_NAME = '������ ���� ����������' where TEACHER = '����'
delete from TEACHER where TEACHER = '����'

select * from TR_AUDIT order by ID