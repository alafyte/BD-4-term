use UNIVER;
begin tran
	insert AUDITORIUM_TYPE values ('��-�', '������������ � ����������')
	begin tran
		update AUDITORIUM set AUDITORIUM = '1234' where AUDITORIUM_TYPE = '��-�'
		commit
	if @@TRANCOUNT > 0
rollback

select (select count(*) from AUDITORIUM where AUDITORIUM_TYPE = '��-�') ���������,
	   (select count(*) from AUDITORIUM_TYPE where AUDITORIUM_TYPE = '��-�') ���