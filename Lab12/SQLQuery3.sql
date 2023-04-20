use UNIVER;
DECLARE @point varchar(3)

BEGIN TRY
	BEGIN TRAN
		DELETE FROM AUDITORIUM WHERE AUDITORIUM = '123-1'
		SET @point = 'p1'; SAVE TRAN @point
		INSERT INTO AUDITORIUM VALUES('test1', '��-�', 40, 'test1')
		SET @point = 'p2'; SAVE TRAN @point
		INSERT INTO AUDITORIUM VALUES('test1', '��-�', 50, 'test2')
		SET @point = 'p3'; SAVE TRAN @point
	COMMIT TRAN
END TRY
BEGIN CATCH
	print '������: ' + error_message()
	IF @@TRANCOUNT > 0
	BEGIN
		print '����������� �����: ' + cast(@point as varchar)
		ROLLBACK TRAN @point
		COMMIT TRAN
	END
END CATCH