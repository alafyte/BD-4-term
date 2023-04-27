create trigger TEACH_TRAN on TEACHER after insert, delete, update
AS
declare @c int = (select COUNT(TEACHER) from TEACHER);
		if(@c > 20)
			begin
				raiserror('Учителей не может быть больше 20', 10, 1);
				rollback;
			end;
		return;



insert into TEACHER values ('ВСЛВ', 'Васильев Василий Васильевич', 'м', 'ИСиТ')
select * from TR_AUDIT order by ID