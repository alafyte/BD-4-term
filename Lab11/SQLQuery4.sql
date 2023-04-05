USE UNIVER;
DECLARE  @tc int, @rn char(50);  
DECLARE Progr cursor local dynamic SCROLL                               
for SELECT row_number() over (order by SUBJECT) SName,
                           IDSTUDENT FROM PROGRESS
OPEN Progr;

FETCH FIRST from Progr into  @tc, @rn;                 
print 'первая строка           : ' + cast(@tc as varchar(3))+ rtrim(@rn);

FETCH NEXT from Progr into  @tc, @rn;                 
print 'следующая строка        : ' + cast(@tc as varchar(3))+ rtrim(@rn);  

FETCH ABSOLUTE 3 from Progr into  @tc, @rn;                 
print '3-я строка от начала    : ' + cast(@tc as varchar(3))+ rtrim(@rn); 

FETCH RELATIVE 5 from Progr into  @tc, @rn;                 
print '5-я строка вперед от текущей : ' + cast(@tc as varchar(3))+ rtrim(@rn); 

FETCH PRIOR from Progr into  @tc, @rn;                 
print 'предыдущая строка       : ' + cast(@tc as varchar(3))+ rtrim(@rn); 

FETCH LAST from Progr into @tc, @rn;       
print 'последняя строка        : ' +  cast(@tc as varchar(3))+ rtrim(@rn);      
CLOSE Progr;
