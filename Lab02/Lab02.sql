CREATE TABLE "Заказчик"(
    "Название" NVARCHAR(50) NOT NULL,
    "Банковские реквизиты" NCHAR(16) NOT NULL,
    "Телефон" NVARCHAR(30) NOT NULL,
    "Контактное лицо" NVARCHAR(100) NOT NULL
);
ALTER TABLE
    "Заказчик" ADD CONSTRAINT "Заказчик_Название_primary" PRIMARY KEY("Название");
CREATE TABLE "Реклама"(
    "id" INT NOT NULL,
    "Вид рекламы" NVARCHAR(50) NOT NULL,
    "Дата" DATE NOT NULL,
    "Длительность" TIME NOT NULL,
    "Заказчик" NVARCHAR(50) NOT NULL,
    "Передача" NVARCHAR(100) NOT NULL
);
ALTER TABLE
    "Реклама" ADD CONSTRAINT "Реклама_id_primary" PRIMARY KEY("id");
CREATE TABLE "Передача"(
    "Название передачи" NVARCHAR(100) NOT NULL,
    "Рейтинг" DECIMAL(2, 1) NOT NULL,
    "Стоимость минуты" SMALLINT NOT NULL
);
ALTER TABLE
    "Передача" ADD CONSTRAINT "Передача_Название передачи_primary" PRIMARY KEY("Название передачи");
ALTER TABLE
    "Реклама" ADD CONSTRAINT "Реклама_Передача_foreign" FOREIGN KEY("Передача") REFERENCES "Передача"("Название передачи");
ALTER TABLE
    "Реклама" ADD CONSTRAINT "Реклама_Заказчик_foreign" FOREIGN KEY("Заказчик") REFERENCES "Заказчик"("Название");