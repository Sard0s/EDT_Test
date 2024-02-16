
&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	
  ЗагрузитьКурсыВалют();

КонецПроцедуры 

&НаСервере
Процедура ЗагрузитьКурсыВалют()
           
	//Создаем переменную и обратимся к WS, создаем соединение
	Соединение = WSСсылки.КурсыВалютССайтаЦБ.СоздатьWSПрокси("http://web.cbr.ru/", "DailyInfo", "DailyInfoSoap");
	
	//Изменяем формат/тип курса валют для работы в 1С
	
	//Получить тип данных
	ТипWSПараметра = Соединение.ФабрикаXDTO.Пакеты.Получить("http://web.cbr.ru/").Получить("GetCursOnDate");
	//Создаем тип данных в 1С
	СегоднящняяДата = Соединение.ФабрикаXDTO.Создать(ТипWSПараметра);
	//Записываем текущую дату в нужном виде
	СегоднящняяДата.On_Date = ТекущаяДата();
	
	//Создаем переменную для получения курсов валют на дату
	КурсыВалют = Соединение.GetCursOnDate(СегоднящняяДата);
	
	НовыйДок = Документы.УстановкаКурсовВалют.СоздатьДокумент();
	//Заполняем предопределеный реквиит дата 
	НовыйДок.Дата = ТекущаяДата();
	
	//Получить значение константы "Создавать валюты автоматически"
	СоздаватьВалюты = Константы.СоздаватьВалютыАвтоматически.Получить();
	
	//Массив курсы валют обходим каждый элемент этого массива и записываем в переменую "Элемент" 
	Для каждого Элемент Из КурсыВалют.GetCursOnDateResult.diffgram.ValuteData.ValuteCursOnDate Цикл
		
		//ISO Цифровой код валюты Vcode. Поиск валюты в справочнике.
		НайденнаяВалюта = Справочники.Валюты.НайтиПоКоду(Элемент.Vcode);
		//Пропускает валюты которых нет в нашей базе
		Если ЗначениеЗаполнено(НайденнаяВалюта) Тогда
			//Если найденая валюта существует 
			НоваяСтрока        = НовыйДок.Валюты.Добавить();
			НоваяСтрока.Валюта = НайденнаяВалюта;
			НоваяСтрока.Курс   = Элемент.Vcurs;
			
		ИначеЕсли СоздаватьВалюты = Истина Тогда
			//Создание валюты
			НоваяВалюта = Справочники.Валюты.СоздатьЭлемент();
			НоваяВалюта.Код          = Элемент.Vcode;
			НоваяВалюта.Наименование = Элемент.Vname;
			НоваяВалюта.Записать();
			
			//Добавление созданой валюты в документ
			НоваяСтрока        = НовыйДок.Валюты.Добавить();
			НоваяСтрока.Валюта = НоваяВалюта.Ссылка;
			НоваяСтрока.Курс   = Элемент.Vcurs;
			
		КонецЕсли;
			
	КонецЦикла;
	
	//НовыйДок.Записать();
	
	//Запись/Проведение/Отмена проведения документа
	НовыйДок.Записать(РежимЗаписиДокумента.Проведение);
	
	//Проводить документы установка курсов валют автоматически
	//Если Константы...... = Истина Тогда
	//	
	//	НовыйДок.Записать(РежимЗаписиДокумента.Проведение);
	//	
	//Иначе //Просто запись и пользователь проводит в ручную
	
    //НовыйДок.Записать(РежимЗаписиДокумента.Проведение);	
		
	//КонецЕсли;
	
	Сообщить("Курс валют загружен! Создан документ: " + НовыйДок.Ссылка);
	
КонецПроцедуры              

