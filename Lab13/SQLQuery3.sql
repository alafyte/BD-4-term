alter proc PSUBJECT @PULPIT varchar(20)
as begin
	select * 
	from   SUBJECT
	where  SUBJECT.PULPIT = @PULPIT
end


drop table #SUBJECT
create table #SUBJECT
(
	Код varchar(10) primary key,
	Дисциплина varchar(50),
	Кафедра varchar(10)
)
insert #SUBJECT exec PSUBJECT @PULPIT = 'ИСиТ'
select * from #SUBJECT