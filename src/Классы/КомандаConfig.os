
Перем Лог;

///////////////////////////////////////////////////////////////////////////////////////////////////
// Прикладной интерфейс

Процедура ЗарегистрироватьКоманду(Знач ИмяКоманды, Знач Парсер) Экспорт
		
	Лог = ПараметрыСистемы.ПолучитьЛог();

	Команда = Парсер.ОписаниеКоманды(ИмяКоманды, "Конфигурировать 1c-flow");
	Парсер.ДобавитьКоманду(Команда);
	Парсер.ДобавитьПозиционныйПараметрКоманды(Команда, "ПутьКОсновномуХранилищу", "Путь к основному хранилищу продукта.");
	Парсер.ДобавитьПозиционныйПараметрКоманды(Команда, "ПользовательОсновногоХранилища", "Пользователь основного хранилища продукта.");
	Парсер.ДобавитьПозиционныйПараметрКоманды(Команда, "ПарольОсновногоХранилища", "Пароль основного хранилища продукта.");
КонецПроцедуры

// Выполняет логику команды
// 
// Параметры:
//   ПараметрыКоманды - Соответствие ключей командной строки и их значений
//
Функция ВыполнитьКоманду(Знач ПараметрыКоманды) Экспорт
	
	ПутьКОсновномуХранилищу        = ПараметрыКоманды["ПутьКОсновномуХранилищу"];
	ПользовательОсновногоХранилища = ПараметрыКоманды["ПользовательОсновногоХранилища"];
	ПарольОсновногоХранилища       = ПараметрыКоманды["ПарольОсновногоХранилища"];

	СохраняемыеПараметры = Новый СохраняемыеПараметры;
	
	ЧитатьИмеющийсяКонфиг = Ложь;
	СтруктураПараметров = СохраняемыеПараметры.Конструктор_СтруктураПараметров(ЧитатьИмеющийсяКонфиг);
	СтруктураПараметров.ПутьКОсновномуХранилищу        = ПутьКОсновномуХранилищу;
	СтруктураПараметров.ПользовательОсновногоХранилища = ПользовательОсновногоХранилища;
	СтруктураПараметров.ПарольОсновногоХранилища       = ПарольОсновногоХранилища;
	
	СохраняемыеПараметры.СохранитьПараметры(СтруктураПараметров);
	
	Возврат 0;
	
КонецФункции
