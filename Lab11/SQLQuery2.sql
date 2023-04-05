USE UNIVER;
DECLARE StudentsL CURSOR LOCAL for SELECT NAME, IDGROUP from STUDENT;
DECLARE @name nvarchar(50), @group int;      
	OPEN StudentsL;	  
	fetch StudentsL into @name, @group; 	
      print '1. '+ @name + ', группа: ' + cast(@group as varchar(6));   
      go
DECLARE @name nvarchar(50), @group int;     	
	fetch StudentsL into @name, @group; 	
      print '2. '+ @name+ ', группа: '  + cast(@group as varchar(6));  
go 
------------------------------
USE UNIVER;
DECLARE StudentsG CURSOR GLOBAL for SELECT NAME, IDGROUP from STUDENT;
DECLARE @name nvarchar(50), @group int;      
	OPEN StudentsG;	  
	fetch StudentsG into @name, @group; 	
      print '1. '+ @name + ', группа: ' + cast(@group as varchar(6));   
      go
 DECLARE @name nvarchar(50), @group int;     	
	fetch StudentsG into @name, @group; 	
      print '2. '+ @name + ', группа: '+ cast(@group as varchar(6));  
CLOSE StudentsG;
DEALLOCATE StudentsG;