create trigger TEACH_TRAN on TEACHER after insert, delete, update
AS
declare @c int = (select COUNT(TEACHER) from TEACHER);
		if(@c > 20)
			begin
				raiserror('�������� �� ����� ���� ������ 20', 10, 1);
				rollback;
			end;
		return;



insert into TEACHER values ('����', '�������� ������� ����������', '�', '����')
select * from TR_AUDIT order by ID