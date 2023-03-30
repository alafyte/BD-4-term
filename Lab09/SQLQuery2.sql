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

PRINT '���-�� ���������:				' + CAST(@count AS CHAR)
PRINT '������� �����������:			' + CAST(@avgCapacity AS CHAR)
PRINT '���-�� �������, ��� �������:	' + CAST(@countLessAvg AS CHAR)
PRINT '% �������, ��� �������:			' + CAST(@percent AS CHAR)
end

ELSE
PRINT '����� �����������: ' + CAST(@total AS CHAR)