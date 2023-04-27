drop table TR_AUDIT
drop trigger TEACH_TRAN
drop trigger TR_TEACHER_DEL
drop trigger TR_TEACHER_DEL1
drop trigger TR_TEACHER_DEL2
drop trigger TR_TEACHER_DEL3
drop trigger TR_TEACHER_INS
drop trigger TR_TEACHER
drop trigger TR_TEACHER_INSTEAD_OF
drop trigger TR_TEACHER_UPD
drop trigger TR_TEACHER_DDL on database
---------------------------
create table TR_AUDIT
(
	ID int identity(1, 1),										-- ID
	STMT varchar(20) check (STMT in ('INS', 'DEL', 'UPD')),		-- DML operator name
	TRNAME varchar(50),											-- trigger name
	CC varchar(300)												-- comment
)


create trigger TR_TEACHER_INS on TEACHER after insert
as declare @TEACHER char(10), @TEACHER_NAME varchar(100),
		   @GENDER char(1), @PULPIT char(20), @IN varchar(300)
print 'Выполнена операция INSERT'
set @TEACHER = (select TEACHER from INSERTED)
set @TEACHER_NAME = (select TEACHER_NAME from INSERTED)
set @GENDER = (select GENDER from INSERTED)
set @PULPIT = (select PULPIT from INSERTED)
set @IN = ltrim(rtrim(@TEACHER)) + ' ' + ltrim(rtrim(@TEACHER_NAME)) + 
		  ' ' + ltrim(rtrim(@GENDER)) + ' ' + ltrim(rtrim(@PULPIT))
insert into TR_AUDIT (STMT, TRNAME, CC) values ('INS', 'TR_TEACHER_INS', @IN)
return;

insert into TEACHER values ('ИВНВ', 'Иванов Иван Иванович', 'м', 'ИСиТ')
select * from TR_AUDIT order by ID