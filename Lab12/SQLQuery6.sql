-- repeatable �� ��������� ����������������� � ���������������� ������ (���� �� 
--�������� ������ ����� ����� ���������� ������, �� ���-� ����� ������)
use UNIVER;
delete AUDITORIUM where AUDITORIUM = '����'
-- A ---
set transaction isolation level  REPEATABLE READ 
begin transaction 
select AUDITORIUM_CAPACITY from AUDITORIUM where AUDITORIUM = '����'
-------------------------- t1 ------------------ 
-------------------------- t2 ------------------
select case
       when AUDITORIUM_CAPACITY = 50 then 'insert'  else ' ' 
end '���������', AUDITORIUM from AUDITORIUM where AUDITORIUM = '����'
commit

--- B ---	
begin transaction 	  
-------------------------- t1 --------------------
insert AUDITORIUM values ('����', '��-�', 10, '����');
commit
-------------------------- t2 --------------------
