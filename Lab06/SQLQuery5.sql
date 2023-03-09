USE UNIVER;
SELECT FACULTY, PROFESSION, SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2)[AVG_NOTE]
FROM PROGRESS INNER JOIN STUDENT
ON STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
INNER JOIN GROUPS
ON GROUPS.IDGROUP = STUDENT.IDGROUP
WHERE GROUPS.FACULTY = '���'
GROUP BY FACULTY, PROFESSION, SUBJECT;