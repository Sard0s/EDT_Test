
&НаКлиенте
Процедура РаботаСПеременными(Команда)
	
	//Явно объявление переменной
	//Перем СуммаДокумента;
	
	//Неявное объяление переменной
	
	//Переменная числового типа
	СуммаДокумента = 1000;
	СуммаДокумента = СуммаДокумента + 1;
	Сообщить (СуммаДокумента);
	
	//Переменная строкового типа
	СуммаДокумента = "АА-1000";
	СуммаДокумента = СуммаДокумента + 1;
	Сообщить (СуммаДокумента);
	
	//Тип число = 1, 2, 3, ...
	//Сложение чисел: 1 + 1 = 2
	
	//Тип строка = фыва, олдж, 1, 2, 3, ...
	//Сложение строк: "фор" + "мула" = формула
	//Сложение строк: "1" + "1" = "11"
	
КонецПроцедуры

&НаКлиенте
Процедура РаботаСТипомСтрока(Команда)
	
	//Многострочный текст 
	//Способ 1
	//ТекстСообщения = "Обработка выполнятеся без ошибок"
	//"Продолжайте в том же духе!";
	
	//Способ 2
	ТекстСообщения = "Обработка выполнятеся без ошибок
	|Уважаемые пользователи плтаформы ""Skillbox"" Продолжайте в том же духе!";	
	
	Сообщить("Длина строки: "         + СтрДлина(ТекстСообщения));
	Сообщить("Первые 5 символов: "    + Лев(ТекстСообщения, 5));
	Сообщить("Последние 5 символов: " + Прав(ТекстСообщения, 5));
	Сообщить("Середина текста: "      + Сред(ТекстСообщения, 11, 11));
	Сообщить("Верхний регистр: "      + Врег(ТекстСообщения));
	Сообщить("Замена текста: "        + СтрЗаменить(ТекстСообщения, "ошибок", "проблем"));
		
	Сообщить(ТекстСообщения);
	
КонецПроцедуры

&НаКлиенте
Процедура РаботаСТипомЧисло(Команда)
	
	//Арифметические операции -, +, *, / (%)
	//Приоритет согласно математическим правилам
	
	Число1 = 10;
	Число2 = 12;
	
	Число3 = (Число1 + Число2*2)+1;
	
	Сообщить(Число3);
	
	//Остаток от деления
	ОстатокОтДеления = 15%4;
	
	Сообщить("Остаток от деления равен: " + ОстатокОтДеления);
	
	//Прочие Функции
	ЦелоеЗначение = Цел(12/5);
	Сообщить("Целое значение от деления: " + ЦелоеЗначение);
	
	Округление = Окр(12/54, 2, РежимОкругления.Окр15как20);
	Сообщить("Результат округления до второго знака после запятой: " + Округление);
	
	
КонецПроцедуры

&НаКлиенте
Процедура РаботаСДатами(Команда)
	
	//Описание даты
	//Способ 1
	ДатаСобытия1 = '2022.06.12';
	Сообщить(ДатаСобытия1);
	
	//Способ 2 - использование функции дата
	ДатаСобытие2 = Дата(2022, 5, 12, 14, 01, 45);
	Сообщить(ДатаСобытие2);
	
	//Способ 3 - использование функции дата + переменных
	ГодСобытия = 2022;
	МесяцСобытия = 4;
	ДеньСобытия = 11;
	
	ДатаСобытия3 = Дата(ГодСобытия, МесяцСобытия, ДеньСобытия);
	Сообщить(ДатаСобытия3);
	
	//Операция сложения для даты, добавлена 3600 (1 час) * 24 часа (сутки) секунд
	ДатаСобытия3 = ДатаСобытия3 + 3600*24;
	
	ДатаСобытия4 = ДобавитьМесяц(ДатаСобытия3, 5);
	
	Сообщить(ДатаСобытия3);
	Сообщить(ДатаСобытия4);
	
	//Получить текущую дату
	ДатаНаТекущийМомент = ТекущаяДата();
	Сообщить(ДатаНаТекущийМомент);
		
КонецПроцедуры
