DECLARE @total integer = (SELECT SUM(AUDITORIUM_CAPACITY) FROM AUDITORIUM),
		@count integer,
		@avgCapacity real,
		@countLessAvg integer,
		@percent numeric (12,5);
IF @total > 200
begin
SELECT @count = (SELECT COUNT(*) FROM AUDITORIUM)
SELECT @avgCapacity = (SELECT AVG(AUDITORIUM_CAPACITY) FROM AUDITORIUM)
SELECT @countLessAvg = (SELECT COUNT(*) FROM AUDITORIUM WHERE AUDITORIUM_CAPACITY < @avgCapacity)
SELECT @percent = CAST(@countLessAvg AS REAL) / CAST(@count AS REAL)

PRINT 'Кол-во аудиторий:				' + CAST(@count AS CHAR)
PRINT 'Средняя вместимость:			' + CAST(@avgCapacity AS CHAR)
PRINT 'Кол-во меньших, чем среднее:	' + CAST(@countLessAvg AS CHAR)
PRINT '% меньших, чем среднее:			' + CAST(@percent AS CHAR)
end

ELSE
PRINT 'Общая вместимость: ' + CAST(@total AS CHAR)