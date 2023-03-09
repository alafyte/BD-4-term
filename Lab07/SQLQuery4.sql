USE UNIVER;
SELECT FACULTY, PROFESSION, SUBJECT, ROUND(AVG(CAST(PROGRESS.NOTE AS FLOAT(4))), 2)[AVG_NOTE]
FROM PROGRESS INNER JOIN STUDENT 
ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
INNER JOIN GROUPS
ON GROUPS.IDGROUP = STUDENT.IDGROUP
WHERE GROUPS.FACULTY = '���'
GROUP BY FACULTY, PROFESSION, SUBJECT
INTERSECT
SELECT FACULTY, PROFESSION, SUBJECT, ROUND(AVG(CAST(PROGRESS.NOTE AS FLOAT(4))), 2)[AVG_NOTE]
FROM PROGRESS INNER JOIN STUDENT 
ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
INNER JOIN GROUPS
ON GROUPS.IDGROUP = STUDENT.IDGROUP
WHERE GROUPS.FACULTY = '����'
GROUP BY FACULTY, PROFESSION, SUBJECT;