DECLARE @students smallint;
	SET @students = (SELECT COUNT(*) FROM STUDENT);
IF @students > 50
	BEGIN
		PRINT 'Кол-во студентов > 50. Кол-во = ' + CAST(@students AS CHAR);
	END;
ELSE IF @students = 50
	BEGIN
		PRINT 'Кол-во студентов = ' + CAST(@students AS CHAR);
	END;
ELSE
	BEGIN
		PRINT 'Кол-во студентов < 50. Кол-во = ' + CAST(@students AS CHAR);
	END;