
&НаСервереБезКонтекста
Процедура ВыгрузитьНаСервере(НазваниеСправочника, ПутьКФайлу)
	
	//Обращение и соединнеие с Excel 
	ApplicationExcel = Новый COMОбъект("Excel.Application");
	//Новый COMОбъект("COMConnector")
	
	//Запуск эксель не в фоновом режиме 
	ApplicationExcel.Visible = Истина;
	
	//Путь к файлу для  редактирования 
	ApplicationExcel.Workbooks.Open(ПутьКФайлу);
	
	//Обращения к каждой ячейке для записи
	ApplicationExcel.Sheets(1).Cells(2, 1).Value = "Код";
	ApplicationExcel.Sheets(1).Cells(2, 2).Value = "Наимененование";
	
	//Выбор элемента справочников
	Если НазваниеСправочника = "Номенклатура" Тогда	
		Выборка = Справочники.Номенклатура.Выбрать();
		ApplicationExcel.Sheets(1).Cells(1, 2).Value = "Справочник Номенклатура";
		ApplicationExcel.Sheets(1).Cells(2, 3).Value = "Вид номенклатуры";
	ИначеЕсли НазваниеСправочника = "Контрагенты" Тогда
		Выборка = Справочники.Контрагенты.Выбрать();
		ApplicationExcel.Sheets(1).Cells(1, 2).Value = "Справочник Контрагенты";
		ApplicationExcel.Sheets(1).Cells(2, 3).Value = "ИНН";
		ApplicationExcel.Sheets(1).Cells(2, 4).Value = "Полное наименование";
		
	ИначеЕсли НазваниеСправочника = "Склады" Тогда
		Выборка = Справочники.Склады.Выбрать();
	ИначеЕсли НазваниеСправочника = "Валюты" Тогда	
		Выборка = Справочники.Валюты.Выбрать();
	КонецЕсли;
	
	Счетчик = 3;
	
	//Заполнение ячеек
	Пока Выборка.Следующий() Цикл
		
		//Проверяем элемент справочника на группу
		Если Выборка.ЭтоГруппа = Ложь Тогда
		
		ApplicationExcel.Sheets(1).Cells(Счетчик, 1).Value = Выборка.Код;
		ApplicationExcel.Sheets(1).Cells(Счетчик, 2).Value = Выборка.Наименование;
		
		Если НазваниеСправочника = "Номенклатура" Тогда
			
			ApplicationExcel.Sheets(1).Cells(Счетчик, 3).Value = Строка(Выборка.ВидНоменклатуры);
			
		ИначеЕсли НазваниеСправочника = "Контрагенты" Тогда
			ApplicationExcel.Sheets(1).Cells(Счетчик, 3).Value = Выборка.ИНН;
			ApplicationExcel.Sheets(1).Cells(Счетчик, 3).NumberFormat = "0";
			ApplicationExcel.Sheets(1).Cells(Счетчик, 4).Value = Выборка.ПолноеЮридическоеНаименование;	
			
		КонецЕсли;
		//Изменение строки
		Счетчик = Счетчик + 1;
		КонецЕсли;
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура Выгрузить(Команда)
	ВыгрузитьНаСервере(ВыборСправочника, ПутьКФайлу);
КонецПроцедуры

&НаКлиенте
Процедура ПутьКФайлуНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	ДиалогВыбораФайла = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Открытие);
	ДиалогВыбораФайла.Фильтр                      = НСтр("ru='XLSX файл (*.xlsx)|*.xlsx'");
	ДиалогВыбораФайла.Заголовок                   = НСтр("ru='Выберите xlsx файл'");
	ДиалогВыбораФайла.ПредварительныйПросмотр     = Ложь;
	ДиалогВыбораФайла.Расширение                  = "xlsx";
	ДиалогВыбораФайла.ИндексФильтра               = 0;
	ДиалогВыбораФайла.ПолноеИмяФайла              = ПутьКФайлу;
	ДиалогВыбораФайла.ПроверятьСуществованиеФайла = Ложь;
	Если ДиалогВыбораФайла.Выбрать() Тогда
		ПутьКФайлу = ДиалогВыбораФайла.ПолноеИмяФайла;
	КонецЕсли;   	

КонецПроцедуры
