CREATE TABLE #EX3
(
	TKEY int,
	CC int identity(1, 1),
	TF varchar(100)
)

set nocount on
declare @I int = 0
while @I < 15000
begin
	insert #EX3(TKEY, TF) 
	values (floor(30000 * rand()), replicate ('строка', 10))
	set @I += 1
end

SELECT CC FROM #EX3 WHERE TKEY > 15000

CREATE INDEX IX_dbo_TASK3_TKEY_CC ON #EX3(TKEY) INCLUDE (CC)