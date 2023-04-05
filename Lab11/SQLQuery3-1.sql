DECLARE @tid char(10), @tnm char(40), @tgn char(1);  
DECLARE Prog CURSOR LOCAL STATIC                              
	 for SELECT SUBJECT, PDATE, NOTE 
	       FROM PROGRESS where SUBJECT = 'БД';				   
open Prog;
print   'Количество строк : '+cast(@@CURSOR_ROWS as varchar(5)); 
UPDATE PROGRESS set NOTE = 5 where IDSTUDENT = '1017';
DELETE PROGRESS where IDSTUDENT = '1079';
INSERT PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) 
                 values ('БД', 1079, '2013-01-10', 7); 
FETCH Prog into @tid, @tnm, @tgn;     
while @@fetch_status = 0                                    
     begin 
         print @tid + ' '+ @tnm + ' '+ @tgn;      
         fetch Prog into @tid, @tnm, @tgn; 
      end;          
CLOSE Prog;

