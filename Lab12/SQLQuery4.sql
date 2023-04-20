--Неподтвержденное чтение, Неповторяющееся чтение, Фантомное чтение
-- uncomitted - поддерживает неподтвержденное чтение, т.е. запросы между t1 и t2 выполняются даже без commit в B тран-ии

use UNIVER;
set transaction isolation level READ UNCOMMITTED 
--------- A ---------
begin transaction 
-------------------------- t1 ------------------
select @@SPID Процесс, 'INSERT AUDITORIUM' Результат, 
	   * from AUDITORIUM where AUDITORIUM = '123456'
select @@SPID Процесс, 'UPDATE AUDITORIUM' Результат, 
	   * from AUDITORIUM where AUDITORIUM = '123456'
commit
-------------------------- t2 -----------------
--------- B ---------
begin transaction 
insert AUDITORIUM values ('123456', 'ЛК-К', 80, '1234')
update AUDITORIUM set AUDITORIUM = '123456'
				  where AUDITORIUM = '1234567' 
-------------------------- t1 --------------------
-------------------------- t2 --------------------
rollback