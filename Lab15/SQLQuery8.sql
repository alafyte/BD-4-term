create trigger TR_TEACHER_INSTEAD_OF on TEACHER instead of delete
as raiserror('�������� ���������', 10, 1)
return


set nocount on
delete from TEACHER where TEACHER = '���'
select * from TR_AUDIT order by ID