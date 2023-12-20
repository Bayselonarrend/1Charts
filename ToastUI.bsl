//MIT License

//Copyright (c) 2023 Anton Tsitavets

//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:

//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

#Область ПрограммныйИнтерфейс

Функция ДиаграммаОбластей(Знач Категории, Знач Серии, Знач Параметры = "", Знач ПолныйHTML = Истина) Экспорт
	
	Возврат ОбщийВызовДиаграмм(Категории, Серии, "areaChart", Параметры, ПолныйHTML);
	
КонецФункции

Функция Гистограмма(Знач Категории, Знач Серии, Знач Параметры = "", Знач ПолныйHTML = Истина) Экспорт
	
	Возврат ОбщийВызовДиаграмм(Категории, Серии, "barChart", Параметры, ПолныйHTML);

КонецФункции

Функция ЯщикСУсами(Знач Категории, Знач Серии, Знач Вылеты, Знач Параметры = "", Знач ПолныйHTML = Истина) Экспорт
	
	Возврат ОбщийВызовДиаграмм(Категории, Серии, "boxPlotChart", Параметры, ПолныйHTML, Вылеты);

КонецФункции

Функция ПузырьковаяДиаграмма(Знач Серии, Знач Параметры = "", Знач ПолныйHTML = Истина) Экспорт
	
	Возврат ОбщийВызовДиаграмм("", Серии, "bubbleChart", Параметры, ПолныйHTML);	
	
КонецФункции

Функция СтолбчатаяДиаграмма(Знач Категории, Знач Серии, Знач Параметры = "", Знач ПолныйHTML = Истина) Экспорт
	
	Возврат ОбщийВызовДиаграмм(Категории, Серии, "columnChart", Параметры, ПолныйHTML);

КонецФункции

Функция СтолбчатоЛинейнаяДиаграмма(Знач Категории, Знач Серии, Знач Линии, Знач Параметры = "", Знач ПолныйHTML = Истина) Экспорт
	
	Возврат ОбщийВызовДиаграмм(Категории, Серии, "columnLineChart", Параметры, ПолныйHTML,, Линии);

КонецФункции

Функция Спидометр(Знач Серии, Знач Параметры = "", Знач ПолныйHTML = Истина) Экспорт
	
	Возврат ОбщийВызовДиаграмм("", Серии, "gaugeChart", Параметры, ПолныйHTML);
	
КонецФункции

Функция ЛинейнаяДиаграмма(Знач Категории, Знач Серии, Знач Параметры = "", Знач ПолныйHTML = Истина) Экспорт
	
	Возврат ОбщийВызовДиаграмм(Категории, Серии, "lineChart", Параметры, ПолныйHTML);

КонецФункции

Функция ВложеннаяКруговаяДиаграмма(Знач Серии, Знач Параметры = "", Знач ПолныйHTML = Истина) Экспорт
	
	Возврат ОбщийВызовДиаграмм("", Серии, "nestedPieChart", Параметры, ПолныйHTML);

КонецФункции

Функция КруговаяДиаграмма(Знач Серии, Знач Параметры = "", Знач ПолныйHTML = Истина) Экспорт
	
	Возврат ОбщийВызовДиаграмм("", Серии, "pieChart", Параметры, ПолныйHTML);
	
КонецФункции

Функция Радар(Знач Категории, Знач Серии, Знач Параметры = "", Знач ПолныйHTML = Истина) Экспорт
	
	Возврат ОбщийВызовДиаграмм(Категории, Серии, "radarChart", Параметры, ПолныйHTML);

КонецФункции

Функция РадиальнаяДиаграмма(Знач Категории, Знач Серии, Знач Параметры = "", Знач ПолныйHTML = Истина) Экспорт
	
	Возврат ОбщийВызовДиаграмм(Категории, Серии, "radialBarChart", Параметры, ПолныйHTML);

КонецФункции

Функция ДиаграммаРазброса(Знач Серии, Знач Параметры = "", Знач ПолныйHTML = Истина) Экспорт
	
	Возврат ОбщийВызовДиаграмм("", Серии, "scatterChart", Параметры, ПолныйHTML);

КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ОбщийВызовДиаграмм(Знач Категории
	, Знач Серии
	, Знач Вид
	, Знач Параметры = ""
	, Знач ПолныйHTML = Истина
	, Знач Вылеты  = ""
	, Знач Линии = "")
	
	ОпределитьСтандартныеПараметры(Параметры);
	
	ДанныеJSON    = СформироватьJSONДанных(Серии, Категории, Вылеты, Линии);
	ПараметрыJSON = ДанныеВJSON(Параметры);
	
	Возврат СформироватьФинальныйHTML(ДанныеJSON, ПараметрыJSON, Вид, ПолныйHTML);
	
КонецФункции

Функция HTMLМакетСтраницы()
	
	//MIT License

	//Copyright (c) 2020 NHN Cloud Corp.

	//Permission is hereby granted, free of charge, to any person obtaining a copy
	//of this software and associated documentation files (the "Software"), to deal
	//in the Software without restriction, including without limitation the rights
	//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	//copies of the Software, and to permit persons to whom the Software is
	//furnished to do so, subject to the following conditions:

	//The above copyright notice and this permission notice shall be included in
	//all copies or substantial portions of the Software.

	//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	//THE SOFTWARE.
	
	Возврат
	"<!DOCTYPE html>
	|<html>
	|<head>
	|	<meta http-equiv=""Content-Type"" content=""text/html; charset=UTF-8"" />
	|	<meta name=""viewport"" content=""width=device-width, initial-scale = 1.0, maximum-scale = 1.0, user-scalable=no"">
	|	<title>Chart</title> 
	|   <link rel=""stylesheet"" href=""https://uicdn.toast.com/chart/latest/toastui-chart.min.css"" />
	|	<script charset=""utf-8"" src=""https://uicdn.toast.com/chart/latest/toastui-chart.min.js""></script>
	|
	|</head>
	|<body>
	|%1
	|</body>
	|</html>";
	
КонецФункции

Функция HTMLМакетДиаграммы(Знач Вид)
	
	Возврат 
	"
	|<div id=""chart"" style=""width: 90vw; height: 90vh;""></div>
	|<script type=""text/javascript"">
	|window.addEventListener(""load"", (event) => {
	|
	|   const Chart   = toastui.Chart;
	|	const el      = document.getElementById('chart');
	|   const data    = %1;
	|   const options = '%2';
	|
	|   const chart = Chart." + Вид + "({ el, data, options });
	|});
	|</script>
	|";
	
КонецФункции

Функция ДанныеВJSON(Знач Данные)
        
    ПараметрыJSON = Новый ПараметрыЗаписиJSON(ПереносСтрокJSON.Нет
        , " " 
        , Истина
        , ЭкранированиеСимволовJSON.Нет
        , Ложь
        , Ложь
        , Ложь
        , Ложь);
        
    ЗаписьJSON                        = Новый ЗаписьJSON;
    ЗаписьJSON.ПроверятьСтруктуру     = Истина;
    ЗаписьJSON.УстановитьСтроку(ПараметрыJSON);
    
    ЗаписатьJSON(ЗаписьJSON, Данные);
    Возврат ЗаписьJSON.Закрыть();

КонецФункции

Функция СформироватьФинальныйHTML(Знач ДанныеJSON, Знач ПараметрыJSON, Знач Вид, Знач ПолныйHTML)
	
	Диаграмма = СтрШаблон(HTMLМакетДиаграммы(Вид), ДанныеJSON, ПараметрыJSON);

	Если ПолныйHTML Тогда
		
		ТекстДок  = Новый ТекстовыйДокумент;
	
		HTML = СтрШаблон(HTMLМакетСтраницы(), Диаграмма);
		ТекстДок.УстановитьТекст(HTML);
		
		HTML = ТекстДок;

	Иначе
		
		HTML = Диаграмма;
		
	КонецЕсли;
	
	Возврат HTML;

КонецФункции

Функция СформироватьJSONДанных(Знач Серии, Знач Категории, Знач Вылеты = "", Знач Линии = "")
	
	Если Не ЗначениеЗаполнено(Вылеты) Тогда	
		Вылеты = Новый Соответствие;	
	КонецЕсли;
	
	Если Не ЗначениеЗаполнено(Линии) Тогда	
		Линии = Новый Соответствие;	
	КонецЕсли;

	
	СоответствиеДанных = Новый Соответствие;
	МассивСтолбцов     = Новый Массив;
	МассивЛиний        = Новый Массив;
		
	Для Каждого Серия Из Серии Цикл
		
		ТекущееЗначение = Серия.Значение;
		
		СоответствиеСерии  = Новый Соответствие;
		СоответствиеСерии.Вставить("name", Серия.Ключ);
		СоответствиеСерии.Вставить("data", ТекущееЗначение);
		
		ТекущийВылет = Вылеты.Получить(Серия.Ключ);
		
		Если Не ТекущийВылет = Неопределено Тогда
			СоответствиеСерии.Вставить("outliers", ТекущийВылет);
		КонецЕсли;
		
		МассивСтолбцов.Добавить(СоответствиеСерии);
		
	КонецЦикла;
	
	Для Каждого Линия Из Линии Цикл
		
		СоответствиеЛинии  = Новый Соответствие;
		СоответствиеЛинии.Вставить("name", Линия.Ключ);
		СоответствиеЛинии.Вставить("data", Линия.Значение);
		МассивЛиний.Добавить(СоответствиеЛинии);
		
	КонецЦикла;
	
	Если ЗначениеЗаполнено(Категории) Тогда
		СоответствиеДанных.Вставить("categories", Категории);
	КонецЕсли;
	
	Если Линии.Количество() = 0 Тогда 
		СоответствиеДанных.Вставить("series"    , МассивСтолбцов); 
	Иначе
		
		СоответствиеРасширенныхДанных = Новый Соответствие;
		СоответствиеРасширенныхДанных.Вставить("column", МассивСтолбцов);
		СоответствиеРасширенныхДанных.Вставить("line"  , МассивЛиний);
		
		СоответствиеДанных.Вставить("series", СоответствиеРасширенныхДанных);
		
	КонецЕсли;
	
	Возврат ДанныеВJSON(СоответствиеДанных);
	
КонецФункции

#Область СтандартныеПараметры

Процедура ОпределитьСтандартныеПараметры(Параметры = "", Тема = "", Знач Линии = "")
	
	Если Не ЗначениеЗаполнено(Параметры) Тогда
		Параметры = Новый Соответствие;
	КонецЕсли;
	
	Если Не ЗначениеЗаполнено(Тема) Тогда
		Тема = Новый Соответствие;
	КонецЕсли;
	
	_Параметры = Новый Соответствие;
	_Тема      = Новый Соответствие;
	
	ОпределитьСтандартныеНастройки(_Параметры, Линии);
	ОпределитьСтандартнуюТему(_Тема);	

	Для Каждого ВходнойПараметр Из Параметры Цикл
		_Параметры.Вставить(ВходнойПараметр.Ключ, ВходнойПараметр.Значение);
	КонецЦикла;
	
	Для Каждого ВходнойЭлемент Из Тема Цикл
		_Тема.Вставить(ВходнойЭлемент.Ключ, ВходнойЭлемент.Значение);
	КонецЦикла;
	
	Параметры = _Параметры;
	
КонецПроцедуры

Процедура ОпределитьСтандартныеНастройки(Параметры, Линии)
	
	#Область Диаграмма
	
	ПараметрыДиаграммы           = Новый Соответствие;
	ПараметрыДиаграммы_Заголовок = Новый Соответствие;
	ПараметрыДиаграммы_Текст     = Новый Соответствие;
		
	ПараметрыДиаграммы_Заголовок.Вставить("text"     , "Диаграмма ToastUI из 1С");  //Текст заголовка
	ПараметрыДиаграммы_Заголовок.Вставить("align"    , "left");                     //Выравнивание: 'left' | 'right' | 'center'
	
	ПараметрыДиаграммы_Текст.Вставить("noData", "Данных нет");                      //Текст при отсутствии данных
	
	ПараметрыДиаграммы.Вставить("width"    , "auto");                               //Ширина: Число или auto
	ПараметрыДиаграммы.Вставить("height"   , "auto");                               //Высота: Число или auto
	ПараметрыДиаграммы.Вставить("animation", Истина);					            //Использовать анимацию: Истина или Ложь	
	ПараметрыДиаграммы.Вставить("title"    , ПараметрыДиаграммы_Заголовок);
	ПараметрыДиаграммы.Вставить("lang"     , ПараметрыДиаграммы_Текст);

	Параметры.Вставить("chart", ПараметрыДиаграммы);
	
	#КонецОбласти
	
	#Область ПараметрыПоля

	ПараметрыПоля      = Новый Соответствие;

	ПараметрыПоля.Вставить("width" , "auto");                                       //Ширина области данных диаграммы
	ПараметрыПоля.Вставить("height", "auto");                                       //Высота области данных диаграммы
	ПараметрыПоля.Вставить("lines" , СформироватьЛинии(Линии));                     //Вывести линии

	Параметры.Вставить("plot", ПараметрыДиаграммы);
	
	#КонецОбласти
	
	#Область ПараметрыОсей
	
	ПараметрыОсиX = СтандартныеПараметрыОси();
	ПараметрыОсиY = СтандартныеПараметрыОси();
	
	Параметры.Вставить("xAxis", ПараметрыОсиX);
	Параметры.Вставить("yAxis", ПараметрыОсиY);
	
	#КонецОбласти

	#Область ПараметрыМенюЭкспорта
	
	ПараметрыМенюЭкспорта = Новый Соответствие;
	ПараметрыМенюЭкспорта.Вставить("visible" , Истина);                              //Отображать меню экспорта
	ПараметрыМенюЭкспорта.Вставить("filename", "Chart");                             //Имя файла экспорта по умолчанию
	
	Параметры.Вставить("exportMenu", ПараметрыМенюЭкспорта); 
	
	#КонецОбласти

	#Область Легенда
	
	ПараметрыЛегенды             = Новый Соответствие;

	ПараметрыЛегенды.Вставить("align"       , "right");                             //Расположение легенды top, bottom, right, left
	ПараметрыЛегенды.Вставить("showCheckbox", Истина);                              //Показывать чекбокс
	ПараметрыЛегенды.Вставить("visible"     , Истина);                              //Видимость
	
	Параметры.Вставить("legend", ПараметрыЛегенды);
	
	#КонецОбласти

КонецПроцедуры

Процедура ОпределитьСтандартнуюТему(Тема)
	
	#Область ТемаДиаграммы
	
	ТемаДиаграммы = Новый Соответствие;
	ТемаДиаграммы.Вставить("backgroundColor", "#FFFFFF");                           //Цвет фона диаграммы
	ТемаДиаграммы.Вставить("fonFamily"      , "Tahoma");                            //Основной шрифт
	
	Тема.Вставить("chart", ТемаДиаграммы);
	
	#КонецОбласти
	
	#Область ТемаПоля
	
	ТемаПоля = Новый Соответствие;
	ТемаПоля.Вставить("backgroundColor", "#FFFFFF");                                //Цвет фона основной области
	
	Тема.Вставить("plot", ТемаПоля);
	
	#КонецОбласти
	
	#Область ТемаЗаголовка
	
	ТемаЗаголовка = Новый Соответствие;
	ТемаЗаголовка.Вставить("fontSize"  , 28);                                       //Размер шрифта
	ТемаЗаголовка.Вставить("fontWeight", 200);                                      //Толщина
	ТемаЗаголовка.Вставить("fontFamily", "sans-serif");                             //Шрифт (css font-family)
	ТемаЗаголовка.Вставить("color"     , "green");                                  //Цвет текста

	Тема.Вставить("title", ТемаЗаголовка);
	
	#КонецОбласти
	
	#Область ТемаОсей
		
	Тема.Вставить("xAxis", СтандартнаяТемаОси());
	Тема.Вставить("yAxis", СтандартнаяТемаОси());

	#КонецОбласти
	
	#Область ТемаЛегенды
	
	ТемаЛегенды        = Новый Соответствие;
	ТемаЛегенды_Ярлыки = Новый Соответствие;
	
	ТемаЛегенды_Ярлыки.Вставить("fontSize"  , 15);                                  //Размер шрифта
	ТемаЛегенды_Ярлыки.Вставить("fontWeight", 200);                                 //Толщина
	ТемаЛегенды_Ярлыки.Вставить("fontFamily", "sans-serif");                        //Шрифт (css font-family)
	ТемаЛегенды_Ярлыки.Вставить("color"     , "#000000");                           //Цвет текста
	
	ТемаЛегенды.Вставить("label", ТемаЛегенды_Ярлыки);

	Тема.Вставить("legend", ТемаЛегенды);
	
	#КонецОбласти

КонецПроцедуры

Функция СтандартныеПараметрыОси()
	
	ПараметрыОси              = Новый Соответствие;
	ПараметрыОси_Заголовок    = Новый Соответствие;                              
	ПараметрыОси_Ярлыки       = Новый Соответствие;
	ПараметрыОси_Отметки      = Новый Соответствие;

	ПараметрыОси_Заголовок.Вставить("text"   , ""); 	                            //Текст заголовка оси
	ПараметрыОси_Заголовок.Вставить("offsetX", 0); 	                                //Отступ заголовка оси по X
	ПараметрыОси_Заголовок.Вставить("offsetY", 0); 	                                //Отступ заголовка оси по Y
	
	ПараметрыОси_Ярлыки.Вставить("interval", 3);                                    //Интервал между показателями оси	
	ПараметрыОси_Отметки.Вставить("interval", 3);                                   //Интервал между отметками на оси
	
	ПараметрыОси.Вставить("width"  , "auto");                                       //Ширина области оси
	ПараметрыОси.Вставить("height" , "auto");                                       //Высота области оси
	ПараметрыОси.Вставить("margin" , 3);                                            //Отступ ярлыков от оси
	ПараметрыОси.Вставить("title"  , ПараметрыОси_Заголовок);
	ПараметрыОси.Вставить("label"  , ПараметрыОси_Ярлыки);
	ПараметрыОси.Вставить("tick"   , ПараметрыОси_Отметки);

	Возврат ПараметрыОси;
	
КонецФункции

Функция СтандартнаяТемаОси()
	
	ПараметрыТемыОси           = Новый Соответствие;
	ПараметрыТемыОси_Заголовок = Новый Соответствие;
	ПараметрыТемыОси_Ярлыки    = Новый Соответствие;
	
	ПараметрыТемыОси_Заголовок.Вставить("fontSize"  , 18);                          //Размер шрифта
	ПараметрыТемыОси_Заголовок.Вставить("fontWeight", 400);                         //Толщина
	ПараметрыТемыОси_Заголовок.Вставить("fontFamily", "sans-serif");                //Шрифт (css font-family)
	ПараметрыТемыОси_Заголовок.Вставить("color"     , "#000000");                   //Цвет текста
	
	ПараметрыТемыОси_Ярлыки.Вставить("fontSize"  , 14);                             //Размер шрифта
	ПараметрыТемыОси_Ярлыки.Вставить("fontWeight", 100);                            //Толщина
	ПараметрыТемыОси_Ярлыки.Вставить("fontFamily", "sans-serif");                   //Шрифт (css font-family)
	ПараметрыТемыОси_Ярлыки.Вставить("color"     , "#000000");                      //Цвет текста
	
	ПараметрыТемыОси.Вставить("color", "#808080");                                  //Цвет оси
	ПараметрыТемыОси.Вставить("width", 2);                                          //Толщина оси
	ПараметрыТемыОси.Вставить("title", ПараметрыТемыОси_Заголовок);
	ПараметрыТемыОси.Вставить("label", ПараметрыТемыОси_Ярлыки);

	Возврат ПараметрыТемыОси;
	
КонецФункции

Функция СформироватьЛинии(Знач Линии) 
	
	МассивЛиний = Новый Массив;
	
	Если Не ЗначениеЗаполнено(Линии) Тогда
		Возврат МассивЛиний;	
	КонецЕсли;
	
	Для Каждого Линия Из Линии Цикл
		
		СоответствиеДанных = Новый Соответствие;
		СоответствиеДанных.Вставить("color", Линия.Ключ);
		СоответствиеДанных.Вставить("value", Линия.Значение);
		
		МассивЛиний.Добавить(СоответствиеДанных);
		
	КонецЦикла;
	
	Возврат МассивЛиний;
	
КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

Функция КонструкторЭлементаПузырьковойДиаграммы(Знач ОсьX, Знач ОсьY, Знач Размер, Знач Ярлык) Экспорт
	
	СтруктураМакета = Новый Соответствие;
	СтруктураМакета.Вставить("x"    , ОсьX);
	СтруктураМакета.Вставить("y"    , ОсьY);
	СтруктураМакета.Вставить("r"    , Размер);
	СтруктураМакета.Вставить("label", Ярлык);
	
	Возврат СтруктураМакета;
	
КонецФункции

Функция КонструкторЭлементаКруговойДиаграммы(Знач Имя, Знач Значение) Экспорт
	
	СтруктураМакета = Новый Соответствие;
	СтруктураМакета.Вставить("name" , Имя);
	СтруктураМакета.Вставить("data" , Значение);
	
	Возврат СтруктураМакета;

КонецФункции

Функция КонструкторЭлементаРазброса(Знач ОсьX, Знач ОсьY) Экспорт
	
	СтруктураМакета = Новый Соответствие;
	СтруктураМакета.Вставить("x"    , ОсьX);
	СтруктураМакета.Вставить("y"    , ОсьY);
	
	Возврат СтруктураМакета;
	
КонецФункции

#КонецОбласти
