DECLARE @c char = 'f',
		@v varchar(5) = 'World',
		@d datetime,
		@t time,
		@i int, 
		@s smallint,
		@ti tinyint,
		@n numeric(12, 5);

SET @d = getdate()
SET @t = '12:30:15.123'

SELECT @i = 1234, @s = 145, @tI = 2, @n = 124567.32132

PRINT 'char:           ' + @c
PRINT 'varchar:        ' + @v
PRINT 'int:            ' + CAST(@i AS CHAR)
PRINT 'smallint:       ' + CAST(@s AS CHAR)

SELECT @d [Date], @t[Time], @ti [Tiny int], @n [Numeric];