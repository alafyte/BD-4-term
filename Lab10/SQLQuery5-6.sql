use tempdb;
--drop table #EX5
CREATE TABLE #EX5
(
	TKEY int,
	CC int identity(1, 1),
	TF varchar(100)
)

set nocount on
declare @I int = 0
while @I < 10000
begin
	insert #EX5(TKEY, TF) 
	values (floor(10000 * rand()), replicate ('строка', 3))
	set @I += 1
end

SELECT COUNT(*) FROM #EX5;
CREATE INDEX #EX5_TKEY on #EX5(TKEY)
--drop index #EX5_TKEY on #EX5

INSERT top(10000) #EX5(TKEY, TF) select TKEY, TF from #EX5;

SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), 
OBJECT_ID(N'#EX5'), NULL, NULL, NULL) ss  JOIN sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id  WHERE name is not null;




ALTER INDEX #EX5_TKEY ON #EX5 reorganize

ALTER INDEX  #EX5_TKEY ON #EX5 rebuild with (online = off)

drop index #EX5_TKEY on #EX5
drop index IX_EX6 on #EX5


create index IX_EX6 on #EX5 (TKEY) with (fillfactor	= 10)


set nocount on
declare @I1 int = 0
while @I1 < 10000
begin
	insert #EX5(TKEY, TF) 
	values (floor(30000 * rand()), replicate ('строка', 10))
	set @I1 += 1
end



SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), 
OBJECT_ID(N'#EX5'), NULL, NULL, NULL) ss  JOIN sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id  WHERE name is not null;