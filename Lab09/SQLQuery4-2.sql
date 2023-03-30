DECLARE @fullFIO varchar(100) = (SELECT TOP(1) STUDENT.NAME FROM STUDENT)
PRINT 'Полное ФИО:        ' + @fullFIO
DECLARE @shortFIO varchar(100) = SUBSTRING(@fullFIO, 0, CHARINDEX(' ', @fullFIO) + 1) 
+ SUBSTRING(@fullFIO, CHARINDEX(' ', @fullFIO) + 1, 1) + '. '
+ SUBSTRING(@fullFIO, CHARINDEX(' ', @fullFIO, CHARINDEX(' ', @fullFIO) + 1) + 1, 1) + '.'
PRINT 'Сокращённое ФИО:   ' + @shortFIO