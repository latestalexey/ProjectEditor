﻿
&НаКлиенте
Процедура КомандаОтмена(Команда)
	Закрыть(КодВозвратаДиалога.Отмена);
КонецПроцедуры


&НаКлиенте
Процедура КомандаСоздать(Команда)
	СтруктураВозврата = Новый Структура("БазоваяДлительность, ВсегоРесурсов, ВсегоРолей, КоличествоЗадач, КоличествоСтрокВыплат, КоличествоСтрокДоходов, КоличествоСтрокПоступлений," +
			"КоличествоСтрокРасходов, ОбщаяСуммаПланДоходов, ОбщаяСуммаПланРасходов, ОбщееКоличествоНоменклатуры, ОбщееКоличествоЧасов, СоздаватьНовые");
	ЗаполнитьЗначенияСвойств(СтруктураВозврата, ЭтаФорма);
	Закрыть(СтруктураВозврата);
КонецПроцедуры

