alter proc PSUBJECT @PULPIT varchar(20)
as begin
	select * 
	from   SUBJECT
	where  SUBJECT.PULPIT = @PULPIT
end


drop table #SUBJECT
create table #SUBJECT
(
	��� varchar(10) primary key,
	���������� varchar(50),
	������� varchar(10)
)
insert #SUBJECT exec PSUBJECT @PULPIT = '����'
select * from #SUBJECT