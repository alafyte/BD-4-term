USE R_MyBase;
CREATE TABLE "Заказчик"(
    "Название" NVARCHAR(50) NOT NULL PRIMARY KEY,
    "Банковские реквизиты" NCHAR(16) UNIQUE NOT NULL,
    "Телефон" NVARCHAR(30) NOT NULL,
    "Контактное лицо" NVARCHAR(100) NOT NULL
);
CREATE TABLE "Передача"(
    "Название передачи" NVARCHAR(100) NOT NULL PRIMARY KEY,
    "Рейтинг" DECIMAL(2, 1) NOT NULL,
    "Стоимость минуты" SMALLMONEY NOT NULL
);
CREATE TABLE "Реклама"(
    "id" int NOT NULL PRIMARY KEY,
    "Вид рекламы" NVARCHAR(50) NOT NULL,
    "Дата" DATE NOT NULL,
    "Длительность" TIME NOT NULL,
    "Заказчик" NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES "Заказчик"("Название"),
    "Передача" NVARCHAR(100) NOT NULL FOREIGN KEY REFERENCES "Передача"("Название передачи")
);