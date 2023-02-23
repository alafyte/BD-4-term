use R_MyBaseTest6;

CREATE TABLE "Заказчик"(
    "Название" NVARCHAR(50) NOT NULL PRIMARY KEY,
    "Банковские реквизиты" NCHAR(16) UNIQUE NOT NULL,
    "Телефон" NVARCHAR(30) NOT NULL,
    "Контактное лицо" NVARCHAR(100) NOT NULL
) on FG1;