set nocount on
if  exists (select * from  SYS.OBJECTS where OBJECT_ID = object_id(N'DBO.TASK1') )	            
drop table TASK1;           
declare @c int, @flag char = 'c';           -- commit ��� rollback?
SET IMPLICIT_TRANSACTIONS  ON   -- �����. ����� ������� ����������
CREATE table TASK1(K int );                         -- ������ ���������� 
INSERT TASK1 values (1),(2),(3);
set @c = (select count(*) from TASK1);
print '���������� ����� � ������� TASK1: ' + cast( @c as varchar(2));
if @flag = 'c'  
	commit;                   -- ���������� ����������: �������� 
else 
	rollback;                                 -- ���������� ����������: �����  
SET IMPLICIT_TRANSACTIONS  OFF   -- ������. ����� ������� ����������

if  exists (select * from  SYS.OBJECTS where OBJECT_ID= object_id(N'DBO.TASK1') )
	print '������� TASK1 ����';  
else 
	print '������� TASK1 ���'
	