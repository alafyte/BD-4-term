DECLARE @z numeric(5, 3), @t float, @x float
SET @t = 1
SET @x = 1.2

IF (@t > @x) 
	SET @z = SIN(@t) * SIN(@t)
ELSE IF (@t < @x)
	SET @z = 4 * (@t + @x)
ELSE
	SET @z = 1 - EXP(@x - 2)

PRINT 'z = ' + CAST(@z AS CHAR)