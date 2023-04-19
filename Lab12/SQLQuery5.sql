set transaction isolation level READ COMMITTED 
-- A ---
begin transaction 
select count(*) from AUDITORIUM where AUDITORIUM = '1234'
-------------------------- t1 ------------------ 
-------------------------- t2 -----------------
select 'update' результат, count(*) from AUDITORIUM where AUDITORIUM = '1234'
commit
--- B ---	
begin transaction 	  
-------------------------- t1 --------------------
update AUDITORIUM set AUDITORIUM = '1234' where AUDITORIUM = '123456' 
commit
-------------------------- t2 --------------------