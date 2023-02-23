use R_MyBase;

ALTER Table Заказчик ADD Адрес nvarchar(100) NOT NULL DEFAULT 'default';

ALTER Table Заказчик DROP Column Адрес;