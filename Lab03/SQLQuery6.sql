use master;
go
create database R_MyBaseTest6
on primary (name = N'R_MyBase_mdf', filename = N'C:\University\4_term\ад\Lab03\Base\R_MyBase_mdf.mdf', 
   size = 10240Kb, maxsize = UNLIMITED, filegrowth = 1024Kb),
   (name = N'R_MyBase_ndf', filename = N'C:\University\4_term\ад\Lab03\Base\R_MyBase_ndf.ndf', 
   size = 10240KB, maxsize=1Gb, filegrowth=25%),
filegroup FG1
(name = N'R_MyBase_fg1_1', filename = N'C:\University\4_term\ад\Lab03\Base\R_MyBase_fgq-1.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%),
(name = N'R_MyBase_fg1_2', filename = N'C:\University\4_term\ад\Lab03\Base\R_MyBase_fgq-2.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%)
log on
(name = N'R_Mybase_log', filename=N'C:\University\4_term\ад\Lab03\Base\R_Mybase_log.ldf',       
   size=10240Kb,  maxsize=2048Gb, filegrowth=10%)
go