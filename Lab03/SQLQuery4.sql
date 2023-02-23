USE R_MyBase;

INSERT INTO Заказчик (Название, [Банковские реквизиты],Телефон,[Контактное лицо])
     VALUES
           ('Bref', 4343285739213764, '+1(887)822-23-21', 'Miriam Young'),
		   ('Clear', 6787645421672546, '+1(221)862-32-29', 'Elaine Attwood'),
		   ('Lipton', 6757800806927182, '+1(374)273-56-32', 'Carlos Donovan'),
		   ('Rexona', 5674930122321023, '+1(374)888-98-98', 'Shirley Fisher'),
		   ('Shauma', 7685763242841232, '+1(312)234-23-19', 'Daniel Hailey'),
		   ('Tide', 7465748374657483, '+1(234)237-89-77', 'Adam Haig');
INSERT INTO Передача ([Название передачи], Рейтинг, [Стоимость минуты])
	VALUES
		  ('Conan', 8.1, 4.00),
		  ('Ellen: The Ellen DeGeneres Show', 7.1, 4.00),
		  ('Real Time with Bill Maher', 7.5, 4.00),
		  ('The Eric Andre Show', 8.6, 7.00),
		  ('The Graham Norton Show', 8.4, 5.00),
		  ('The Late Show with Stephen Colbert', 7.3, 3.00),
		  ('The Tonight Show Starring Jimmy Fallon', 7.4, 3.00);
INSERT INTO Реклама (id, [Вид рекламы], Дата, Длительность, Заказчик, Передача)
	VALUES
		 (1, 'Видеоролик', convert(date, '2022-12-02', 102), '00:01:21.0000000', 'Tide', 'Conan'),
		 (2, 'Заставка', convert(date, '2023-01-12', 102), '00:01:13.0000000', 'Clear', 'Ellen: The Ellen DeGeneres Show'),
		 (3, 'Телеобъявление', convert(date, '2023-01-17', 102), '00:01:02.0000000', 'Rexona', 'The Graham Norton Show'),
		 (4, 'Бегущая строка', convert(date, '2023-02-10', 102), '00:01:02.0000000', 'Bref', 'The Late Show with Stephen Colbert'),
		 (5, 'Рекламная передача', convert(date, '2022-07-31', 102), '00:01:23.0000000', 'Shauma', 'Real Time with Bill Maher'),
		 (6, 'Видеоролик', convert(date, '2023-02-14', 102), '00:01:24.0000000', 'Lipton', 'The Tonight Show Starring Jimmy Fallon');


