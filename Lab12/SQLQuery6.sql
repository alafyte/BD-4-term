-- A ---
set transaction isolation level  REPEATABLE READ 
begin transaction 
select AUDITORIUM_CAPACITY from AUDITORIUM where AUDITORIUM = '1234'
-------------------------- t1 ------------------ 
-------------------------- t2 ------------------
select case
       when AUDITORIUM_CAPACITY = 50 then 'insert'  else ' ' 
end '���������', AUDITORIUM from AUDITORIUM where AUDITORIUM = '1234'
commit

--- B ---	
begin transaction 	  
-------------------------- t1 --------------------
insert AUDITORIUM values ('1234', '��-�', 10, '����');
commit
-------------------------- t2 --------------------
