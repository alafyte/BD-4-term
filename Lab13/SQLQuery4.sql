create proc PAUDITORIUM_INSERT @AUD char(20), @NAME varchar(50), @CAPACITY int = 0, @TYPE char(10)
as begin
	begin try
		insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE)
		values (@AUD, @NAME, @CAPACITY, @TYPE)
		return 1
	end try
	begin catch
		print 'Код ошибки:  ' + cast(ERROR_NUMBER() as varchar)
		print 'Серьёзность: ' + cast(ERROR_SEVERITY() as varchar)
		print 'Сообщение:   ' + cast(ERROR_MESSAGE() as varchar)
		return -1
	end catch
end

drop proc PAUDITORIUM_INSERT
delete AUDITORIUM where AUDITORIUM = '322-1'

declare @RETURN int
exec @RETURN = PAUDITORIUM_INSERT @AUD = '322-1', @NAME = '322-1', @CAPACITY = 20, @TYPE = 'ЛБ-К'
print 'Процедура завершилась с кодом ' + cast(@RETURN as varchar)