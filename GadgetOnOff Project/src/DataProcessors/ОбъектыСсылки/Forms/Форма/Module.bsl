
&НаСервере
Процедура ИзменитьНаименованиеНаСервере()
	
	//ССылка на элемент формы обработки
	ВалютаСсылка = Объект.Валюта;
	
	//Получить объект для редактирования 
	ВалютаОбъект = ВалютаСсылка.ПолучитьОбъект();
	
	//Установка нового наименования
	ВалютаОбъект.Наименование  = "$$$";
	
	//Запись элемента в базу данных
	ВалютаОбъект.Записать();
	
КонецПроцедуры

&НаКлиенте
Процедура ИзменитьНаименование(Команда)
	ИзменитьНаименованиеНаСервере();
КонецПроцедуры

&НаСервере
Процедура СоздатьВалютуНаСервере()

	//Создание нового элемента
	НовыйЭлемент = Справочники.Валюты.СоздатьЭлемент();
	
	//Установка наименования
	НовыйЭлемент.Наименование = Объект.НаименованиеВалюты;
	
	//Запись элемента в базу данных
	НовыйЭлемент.Записать();
	
	//Установка значения нового элемента в поле Валюта
	Объект.Валюта = НовыйЭлемент.Ссылка;
	
	


КонецПроцедуры

&НаКлиенте
Процедура СоздатьВалюту(Команда)
	СоздатьВалютуНаСервере();
КонецПроцедуры

&НаСервере
Процедура НайтиВалютуНаСервере()
	
	//Поиск элемнта по имени
	ВалютаСсылка = Справочники.Валюты.НайтиПоНаименованию(Объект.НаименованиеВалюты, Истина);
	
	Объект.Валюта = ВалютаСсылка;
	
КонецПроцедуры

&НаКлиенте
Процедура НайтиВалюту(Команда)
	НайтиВалютуНаСервере();
КонецПроцедуры
