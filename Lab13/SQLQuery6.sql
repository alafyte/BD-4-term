create proc PAUDITORIUM_INSERTX 
@AUD char(20), @NAME varchar(50), @CAPACITY int = 0, @AUD_TYPE char(10), @AUD_TYPENAME varchar(70)
as 
begin try
	set transaction isolation level SERIALIZABLE
	begin tran
		insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
		values (@AUD_TYPE, @AUD_TYPENAME)
		exec PAUDITORIUM_INSERT @AUD, @NAME, @CAPACITY, @AUD_TYPE
	commit tran
end try
begin catch
	print '��� ������:  ' + cast(ERROR_NUMBER() as varchar)
	print '�����������: ' + cast(ERROR_SEVERITY() as varchar)
	print '���������:   ' + cast(ERROR_MESSAGE() as varchar)
	if @@TRANCOUNT > 0 
		rollback tran
	return -1
end catch


exec PAUDITORIUM_INSERTX @AUD = '323-1', @NAME = '323-1', @CAPACITY = 50, @AUD_TYPE = '��-�', @AUD_TYPENAME = '������������ �������'