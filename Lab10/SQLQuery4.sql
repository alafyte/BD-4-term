CREATE TABLE #EX4
(
	TKEY int,
	CC int identity(1, 1),
	TF varchar(100)
)

set nocount on
declare @I int = 0
while @I < 15000
begin
	insert #EX4(TKEY, TF) 
	values (floor(30000 * rand()), replicate ('строка', 10))
	set @I += 1
end

SELECT TKEY FROM #EX4 WHERE TKEY BETWEEN 5000 AND 19999 
SELECT TKEY FROM #EX4 WHERE TKEY > 15000 AND TKEY < 20000  
SELECT TKEY FROM #EX4 WHERE TKEY = 17000

CREATE INDEX IX_dbo_EX4_FILTER ON #EX4 (TKEY) WHERE (TKEY > 15000 and TKEY < 20000)