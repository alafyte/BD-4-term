CREATE TABLE #example
(	INT_FIELD int,
	STR_FIELD varchar(100),
	DATE_FIELD datetime
)

TRUNCATE TABLE #example

SET nocount on;
DECLARE @i int = 0;
WHILE @i < 10
	BEGIN
INSERT #example(INT_FIELD, STR_FIELD, DATE_FIELD) VALUES (floor(300 * rand()), replicate('s', @i + 1), GETDATE());
SET @i = @i + 1;
	END;

SELECT * FROM #example