use UNIVER;
SELECT isnull(TEACHER.TEACHER_NAME, '***')[TEACHER], PULPIT.PULPIT_NAME
FROM PULPIT LEFT OUTER JOIN TEACHER
ON TEACHER.PULPIT = PULPIT.PULPIT