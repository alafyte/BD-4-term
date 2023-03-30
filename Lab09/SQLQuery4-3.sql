DECLARE @student table (ФИО varchar(100), [День рождения] varchar(50), Возраст integer)

DECLARE @name varchar(100) = (SELECT TOP 1 s.NAME FROM STUDENT s WHERE MONTH(s.BDAY) = MONTH(getdate()) + 1)
DECLARE @bday varchar(100) = (SELECT TOP 1 s.BDAY FROM STUDENT s WHERE MONTH(s.BDAY) = MONTH(getdate()) + 1)
DECLARE @age int = DATEDIFF(YEAR, @bday, getdate())
INSERT @student VALUES(@name, @bday, @age)

DECLARE @bday2 varchar(100) = (SELECT TOP 1 s.BDAY FROM STUDENT s WHERE MONTH(s.BDAY) = MONTH(getdate()) + 1 ORDER BY s.IDSTUDENT DESC)
DECLARE @name2 varchar(100) = (SELECT TOP 1 s.NAME FROM STUDENT s WHERE s.BDAY = @bday2)
DECLARE @age2 int = DATEDIFF(YEAR, @bday2, getdate())
INSERT @student VALUES(@name2, @bday2, @age)

SELECT * FROM @student