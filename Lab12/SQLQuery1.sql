set nocount on
if  exists (select * from  SYS.OBJECTS where OBJECT_ID = object_id(N'DBO.TASK1') )	            
drop table TASK1;           
declare @c int, @flag char = 'c';           -- commit или rollback?
SET IMPLICIT_TRANSACTIONS  ON   -- включ. режим неявной транзакции
CREATE table TASK1(K int );                         -- начало транзакции 
INSERT TASK1 values (1),(2),(3);
set @c = (select count(*) from TASK1);
print 'количество строк в таблице TASK1: ' + cast( @c as varchar(2));
if @flag = 'c'  
	commit;                   -- завершение транзакции: фиксация 
else 
	rollback;                                 -- завершение транзакции: откат  
SET IMPLICIT_TRANSACTIONS  OFF   -- выключ. режим неявной транзакции

if  exists (select * from  SYS.OBJECTS where OBJECT_ID= object_id(N'DBO.TASK1') )
	print 'таблица TASK1 есть';  
else 
	print 'таблицы TASK1 нет'
	