DECLARE @students smallint;
	SET @students = (SELECT COUNT(*) FROM STUDENT);
IF @students > 50
	BEGIN
		PRINT '���-�� ��������� > 50. ���-�� = ' + CAST(@students AS CHAR);
	END;
ELSE IF @students = 50
	BEGIN
		PRINT '���-�� ��������� = ' + CAST(@students AS CHAR);
	END;
ELSE
	BEGIN
		PRINT '���-�� ��������� < 50. ���-�� = ' + CAST(@students AS CHAR);
	END;