﻿
&НаКлиенте
Процедура КомандаВыбрать(Команда)
	ТекущиеДанные = Элементы.ДеревоЗадач.ТекущиеДанные;
	Если ТекущиеДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;
	ОповеститьОВыборе(ТекущиеДанные.Задача);
КонецПроцедуры

&НаКлиенте
Процедура ДеревоЗадачВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	КомандаВыбрать(Неопределено);
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	Проекты.Ссылка КАК Задача,
	|	Проекты.грзнтПолноеНаименование КАК НаименованиеЗадачи,
	|	Проекты.грзнтВидЭлемента.Картинка
	|ИЗ
	|	Справочник.Проекты КАК Проекты
	|ГДЕ
	|	Проекты.грзнтПроектЗадачи = &Проект
	|	И НЕ Проекты.Ссылка В
	|			(ВЫБРАТЬ
	|				Рег.Задача
	|			ИЗ
	|				РегистрСведений.грзнтСДРПроектов КАК Рег ГДЕ Рег.ЭкземплярВерсии <> &Экземпляр)
	|	И НЕ Проекты.Ссылка В (&ТекущиеЗадачи)";
	Запрос.УстановитьПараметр("Проект", Параметры.Проект);
	Запрос.УстановитьПараметр("Экземпляр", Параметры.ЭкземплярВерсии);
	Запрос.УстановитьПараметр("ТекущиеЗадачи", Параметры.ТекущиеЗадачи);
	Выборка = Запрос.Выполнить().Выбрать();
	Пока Выборка.Следующий() Цикл
		СтрокаДерева = ДеревоЗадач.ПолучитьЭлементы().Добавить();
		ЗаполнитьЗначенияСвойств(СтрокаДерева, Выборка);
		Если Выборка.Задача = Параметры.Задача Тогда
			НачальныйИндекс = СтрокаДерева.ПолучитьИдентификатор();
		КонецЕсли;
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	Для Каждого СтрокаДерева ИЗ ДеревоЗадач.ПолучитьЭлементы() Цикл
		Элементы.ДеревоЗадач.Развернуть(СтрокаДерева.ПолучитьИдентификатор(), Истина);
	КонецЦикла;
	Элементы.ДеревоЗадач.ТекущаяСтрока = НачальныйИндекс;
КонецПроцедуры

&НаКлиенте
Процедура ДеревоЗадачПриНачалеРедактирования(Элемент, НоваяСтрока, Копирование)
	Если НЕ НоваяСтрока И НЕ Копирование Тогда
		ТекущиеДанные = Элементы.ДеревоЗадач.ТекущиеДанные;
		Если ТекущиеДанные <> Неопределено Тогда
			ПоказатьЗначение(, ТекущиеДанные.Задача);
		КонецЕсли;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ДеревоЗадачПередУдалением(Элемент, Отказ)
	Отказ = истина;
КонецПроцедуры

&НаКлиенте
Процедура ДеревоЗадачПередНачаломДобавления(Элемент, Отказ, Копирование, Родитель, Группа, Параметр)
	Отказ = Истина;
КонецПроцедуры

&НаКлиенте
Процедура ДеревоЗадачПередНачаломИзменения(Элемент, Отказ)
	Отказ = Истина;
	ТекущиеДанные = Элементы.ДеревоЗадач.ТекущиеДанные;
	Если ТекущиеДанные <> Неопределено Тогда
		ПоказатьЗначение(, ТекущиеДанные.Задача);
	КонецЕсли;
КонецПроцедуры

