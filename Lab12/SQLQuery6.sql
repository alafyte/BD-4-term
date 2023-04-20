-- repeatable не допускает неподтвержденного и неповтор€ющегос€ чтени€ (если мы 
--измен€ем данные между двум€ операци€ми чтени€, то рез-т будет разным)
use UNIVER;
delete AUDITORIUM where AUDITORIUM = 'тест'
-- A ---
set transaction isolation level  REPEATABLE READ 
begin transaction 
select AUDITORIUM_CAPACITY from AUDITORIUM where AUDITORIUM = 'тест'
-------------------------- t1 ------------------ 
-------------------------- t2 ------------------
select case
       when AUDITORIUM_CAPACITY = 50 then 'insert'  else ' ' 
end 'результат', AUDITORIUM from AUDITORIUM where AUDITORIUM = 'тест'
commit

--- B ---	
begin transaction 	  
-------------------------- t1 --------------------
insert AUDITORIUM values ('тест', 'Ћ - ', 10, 'тест');
commit
-------------------------- t2 --------------------
