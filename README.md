![image](https://github.com/Bayselonarrend/1Charts/assets/105596284/5d5c63d4-05b6-4026-81f9-9f2bb7a0f5f1)

# 1Charts
**Библиотека формирования диаграмм ToastUI для 1С:Предприятие**

*ToastUI Charts*: [https://github.com/nhn/tui.chart](https://github.com/nhn/tui.chart)

Приемущества использования диаграмм ToastUI из 1С:
- Широкие возможности по настройке
- Универсальность формата HTML
- Разнообразие видов диаграмм
- Интерактивность

![main](https://github.com/Bayselonarrend/1Charts/raw/main/main.gif)
  
При помощи данной библиотеки вы можете создавать HTML5 диаграммы на основе ToastUI в 1С. Для этого достаточно вызывать экспортные методы модуля и передавать туда необходимые данные. Чаще всего это Категории и Серии. Для начала использования достаточно забрать общий модуль ToastUI.bsl из корня репозитория себе в конфигурацию. Больше никаких дополнительных действий не требуется, однако есть несколько важных моментов:

> [!IMPORTANT]
> 1. Данные диаграммы скорее всего не будут отображаться в полях HTML на старых версиях 1С, где используется IE
>    
> 2. В методе HTMLМакетСтраницы(), который отвечает за формирование оснастки HTML документа, источником скрипта ToastUI прописан CDN (сторонний сервер в интернете). Если вам важно сохранять работоспособность скрипта при отсутствии доступа к Интернет, данный скрипт необходимо скачать, а в качестве источника прописать локальный путь
>    
>3. Для отображения диаграмм в поле HTML, как результат функции по умолчанию возвращается объект типа ТекстовыйДокумент, который на стороне клиента необходимо записать на диск. Необходимость записи связана с тем, что при прямом вводе HTML как строки, WebKit блокирует выполнение js ToastUI. Если вы не собираетесь использовать диаграммы для вывода в поля HTML 1С, то в параметр ПолныйHTML (есть у любого метода диаграммы) нужно передавать Ложь. При этом, вместо текстового документа будет возвращаться строка, причем она будет содержать только скрипт формирования и контейнер - структуры документа с тегами HTML, Body, Head там не будет и готовую диаграмму можно передать, например, на сайт по Ajax. 

При использовании стандартного варианта, возвращаемый текстовый документ будет содержать все атрибуты полного HTML документа. После его записи на диск, в реквизит поля HTML помещается путь к файлу
```bsl

  //Вызов с клиента для вывода на форму

  &НаКлиенте
  Процедура ВывестиДиаграммуОбластей(Команда)
  	
  	ТекстДок = ToastUI.ДиаграммаОбластей(ВводныеКатегории, ВводныеСерии);
  	ИВФ      = ПолучитьИмяВременногоФайла("html");
  	
  	Оповещение = Новый ОписаниеОповещения("ПослеЗаписиHTML", ЭтотОбъект, ИВФ);
  	ТекстДок.НачатьЗапись(Оповещение, ИВФ);
  	
  КонецПроцедуры

  &НаКлиенте
  Процедура ПослеЗаписиHTML(Результат, ДополнительныеПараметры) Экспорт
  	РеквизитПоляHTML = ДополнительныеПараметры;
  КонецПроцедуры

```
## Кастомизация диаграмм

Диаграммы ToastUI имеют широкие возможности кастомизации. Для простоты и наглядности в библиотеке присутствует определение стандартных настроек внешнего вида, которые можно изменить

![image](https://github.com/Bayselonarrend/1Charts/assets/105596284/0bd6e633-7d49-4f66-8880-c4a137b39fbf)

Если вы хотите определить настройки один раз и потом не возвращаться к ним, то можно изменять значения в методах *ОпределитьСтандартныеНастройки()* и *ОпределитьСтандартнуюТему()*. При необходимости в отдельных случаях использовать другой набор настроек, их можно переопределить, передав в необязательный параметр *Параметры*, который есть у всех методов диаграмм. После определения стандартных настроек, они будут перезаписаны по ключам переданными в качестве параметра

## Доступные диаграммы:

<details>
<summary>Диаграмма областей</summary>
<br>
  
 ![image](https://github.com/Bayselonarrend/1Charts/assets/105596284/54b59172-ec01-4c9c-b6ec-531a8e07a6c1)

```bsl

  _HTML = ToastUI.ДиаграммаОбластей(ВводныеКатегории(), ВводныеСерии());

  Функция ВводныеКатегории()
  	
  	МассивКатегорий = Новый Массив;
  	МассивКатегорий.Добавить("Пн");
  	МассивКатегорий.Добавить("Вт");
  	МассивКатегорий.Добавить("Ср");
  	МассивКатегорий.Добавить("Чт");
  	МассивКатегорий.Добавить("Пт");
  	МассивКатегорий.Добавить("Сб");
  	МассивКатегорий.Добавить("Вс");
  	
  	Возврат МассивКатегорий;
  	
  КонецФункции

  Функция ВводныеСерии()
  	
  	СоответствиеСерий  = Новый Соответствие;
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(30);
  	МассивПоказателей.Добавить(45);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(70);
  	
  	СоответствиеСерий.Вставить("Олег", МассивПоказателей); 
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(40);
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(70);
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(35);
  	
  	СоответствиеСерий.Вставить("Сергей", МассивПоказателей); 
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(40);
  	МассивПоказателей.Добавить(35);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(20);
  	
  	СоответствиеСерий.Вставить("Артем", МассивПоказателей); 
  
  	Возврат СоответствиеСерий;
  	
  КонецФункции

```

</details>

<details>
<summary>Гистограмма</summary>
<br>

  ![image](https://github.com/Bayselonarrend/1Charts/assets/105596284/e2a6d50e-7d7d-463f-8b6d-0b61187aac10)

  ```bsl

  _HTML = ToastUI.Гистограмма(ВводныеКатегории(), ВводныеСерии());

  Функция ВводныеКатегории()
  	
  	МассивКатегорий = Новый Массив;
  	МассивКатегорий.Добавить("Пн");
  	МассивКатегорий.Добавить("Вт");
  	МассивКатегорий.Добавить("Ср");
  	МассивКатегорий.Добавить("Чт");
  	МассивКатегорий.Добавить("Пт");
  	МассивКатегорий.Добавить("Сб");
  	МассивКатегорий.Добавить("Вс");
  	
  	Возврат МассивКатегорий;
  	
  КонецФункции

  Функция ВводныеСерии()
  	
  	СоответствиеСерий  = Новый Соответствие;
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(30);
  	МассивПоказателей.Добавить(45);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(70);
  	
  	СоответствиеСерий.Вставить("Олег", МассивПоказателей); 
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(40);
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(70);
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(35);
  	
  	СоответствиеСерий.Вставить("Сергей", МассивПоказателей); 
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(40);
  	МассивПоказателей.Добавить(35);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(20);
  	
  	СоответствиеСерий.Вставить("Артем", МассивПоказателей); 
  
  	Возврат СоответствиеСерий;
  	
  КонецФункции

  ```
</details>

<details>
<summary>"Ящик с усами" (диаграмма размаха)</summary>
<br>

  ![image](https://github.com/Bayselonarrend/1Charts/assets/105596284/b6f34eab-27c5-487e-ba87-09eff985eccf)

  ```bsl

  _HTML = ToastUI.ЯщикСУсами(ВводныеКатегорииЯщика(), ВводныеСерииЯщика(), ВводныеВылеты());

  Функция ВводныеСерииЯщика()
  	
  	СоответствиеСерий  = Новый Соответствие;	
  	МассивЯщика        = Новый Массив;
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(100);
  	МассивПоказателей.Добавить(200);
  	МассивПоказателей.Добавить(5000);
  	МассивПоказателей.Добавить(3000);
  	МассивЯщика.Добавить(МассивПоказателей);
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(300);
  	МассивПоказателей.Добавить(450);
  	МассивПоказателей.Добавить(1500);
  	МассивПоказателей.Добавить(5000);
  	МассивЯщика.Добавить(МассивПоказателей);
  	
  	СоответствиеСерий.Вставить("Олег", МассивЯщика); 
  	
  	МассивЯщика       = Новый Массив;
  
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(400);
  	МассивПоказателей.Добавить(200);
  	МассивПоказателей.Добавить(7000);
  	МассивПоказателей.Добавить(9000);
  	МассивЯщика.Добавить(МассивПоказателей);
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(100);
  	МассивПоказателей.Добавить(150);
  	МассивПоказателей.Добавить(5000);
  	МассивПоказателей.Добавить(2000);
  	МассивЯщика.Добавить(МассивПоказателей);
  	
  	СоответствиеСерий.Вставить("Сергей", МассивЯщика); 
  	
  	МассивЯщика       = Новый Массив;
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(200);
  	МассивПоказателей.Добавить(400);
  	МассивПоказателей.Добавить(3500);
  	МассивПоказателей.Добавить(4000);
  	МассивЯщика.Добавить(МассивПоказателей);
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(150);
  	МассивПоказателей.Добавить(500);
  	МассивПоказателей.Добавить(1000);
  	МассивПоказателей.Добавить(8000);
  	МассивЯщика.Добавить(МассивПоказателей);
  	
  	СоответствиеСерий.Вставить("Артем", МассивЯщика); 
  
  	Возврат СоответствиеСерий;
  	
  КонецФункции
  
  Функция ВводныеКатегорииЯщика()
  	
  	МассивКатегорий = Новый Массив;
  	МассивКатегорий.Добавить("Первая половина");
  	МассивКатегорий.Добавить("Вторая половина");
  	
  	Возврат МассивКатегорий;
  	
  КонецФункции
	
  Функция ВводныеВылеты()
  	
  	СоответствиеВылетов  = Новый Соответствие;
  	МассивЯщика          = Новый Массив;
  	МассивПоказателей    = Новый Массив;
  	
  	МассивПоказателей.Добавить(1);
  	МассивПоказателей.Добавить(14000);
  	МассивЯщика.Добавить(МассивПоказателей);
  	
  	СоответствиеВылетов.Вставить("Олег", МассивЯщика); 
  	
  	Возврат СоответствиеВылетов;
  	
  КонецФункции

  ```
</details>

<details>
<summary>Пузырьковая диаграмма</summary>
<br>

  ![image](https://github.com/Bayselonarrend/1Charts/assets/105596284/88800203-d680-4a3d-a95e-ef3ded848033)

  ```bsl

  _HTML = ToastUI.ПузырьковаяДиаграмма(ВводныеСерииПузырьковойДиаграммы());

  Функция ВводныеСерииПузырьковойДиаграммы()
  	
  	СоответствиеСерий  = Новый Соответствие;
  	
  	МассивПоказателей = Новый Массив;
  	
  	ЭлементДиаграммы = ToastUI.КонструкторЭлементаПузырьковойДиаграммы(10, 20, 50, "Яблоко");
  	МассивПоказателей.Добавить(ЭлементДиаграммы);
  	
  	ЭлементДиаграммы = ToastUI.КонструкторЭлементаПузырьковойДиаграммы(50, 60, 20, "Груша");
  	МассивПоказателей.Добавить(ЭлементДиаграммы);
  
  	СоответствиеСерий.Вставить("Олег", МассивПоказателей); 
  	
  	МассивПоказателей = Новый Массив;
  	
  	ЭлементДиаграммы = ToastUI.КонструкторЭлементаПузырьковойДиаграммы(100, 30, 40, "Слива");
  	МассивПоказателей.Добавить(ЭлементДиаграммы);
  	
  	ЭлементДиаграммы = ToastUI.КонструкторЭлементаПузырьковойДиаграммы(20, 80, 30, "Апельсин");
  	МассивПоказателей.Добавить(ЭлементДиаграммы);
  
  	
  	СоответствиеСерий.Вставить("Сергей", МассивПоказателей); 
  	
  	МассивПоказателей = Новый Массив;
  	
  	ЭлементДиаграммы = ToastUI.КонструкторЭлементаПузырьковойДиаграммы(120, 130, 40, "Мандарин");
  	МассивПоказателей.Добавить(ЭлементДиаграммы);
  	
  	ЭлементДиаграммы = ToastUI.КонструкторЭлементаПузырьковойДиаграммы(80, 70, 30, "Киви");
  	МассивПоказателей.Добавить(ЭлементДиаграммы);
  	
  	ЭлементДиаграммы = ToastUI.КонструкторЭлементаПузырьковойДиаграммы(40, 40, 10, "Банан");
  	МассивПоказателей.Добавить(ЭлементДиаграммы);
  
  	СоответствиеСерий.Вставить("Артем", МассивПоказателей); 
  
  	Возврат СоответствиеСерий;
  	
  КонецФункции

  ```

</details>

<details>
<summary>Столбчатая диаграмма</summary>
<br>

  ![image](https://github.com/Bayselonarrend/1Charts/assets/105596284/5ddcf929-4640-400e-b534-d34539040f14)


  ```bsl

  _HTML = ToastUI.СтолбчатаяДиаграмма(ВводныеКатегории(), ВводныеСерии());

  Функция ВводныеКатегории()
  	
  	МассивКатегорий = Новый Массив;
  	МассивКатегорий.Добавить("Пн");
  	МассивКатегорий.Добавить("Вт");
  	МассивКатегорий.Добавить("Ср");
  	МассивКатегорий.Добавить("Чт");
  	МассивКатегорий.Добавить("Пт");
  	МассивКатегорий.Добавить("Сб");
  	МассивКатегорий.Добавить("Вс");
  	
  	Возврат МассивКатегорий;
  	
  КонецФункции

  Функция ВводныеСерии()
  	
  	СоответствиеСерий  = Новый Соответствие;
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(30);
  	МассивПоказателей.Добавить(45);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(70);
  	
  	СоответствиеСерий.Вставить("Олег", МассивПоказателей); 
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(40);
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(70);
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(35);
  	
  	СоответствиеСерий.Вставить("Сергей", МассивПоказателей); 
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(40);
  	МассивПоказателей.Добавить(35);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(20);
  	
  	СоответствиеСерий.Вставить("Артем", МассивПоказателей); 
  
  	Возврат СоответствиеСерий;
  	
  КонецФункции

  ```
</details>

<details>
<summary>Столбчато-линейная диаграмма</summary>
<br>

  ![image](https://github.com/Bayselonarrend/1Charts/assets/105596284/f4c11793-300e-4a50-857f-2aa9c106e812)

  ```bsl

  _HTML = ToastUI.СтолбчатоЛинейнаяДиаграмма(ВводныеКатегории(), ВводныеСерии(), ВводныеЛинии());

  Функция ВводныеКатегории()
  	
  	МассивКатегорий = Новый Массив;
  	МассивКатегорий.Добавить("Пн");
  	МассивКатегорий.Добавить("Вт");
  	МассивКатегорий.Добавить("Ср");
  	МассивКатегорий.Добавить("Чт");
  	МассивКатегорий.Добавить("Пт");
  	МассивКатегорий.Добавить("Сб");
  	МассивКатегорий.Добавить("Вс");
  	
  	Возврат МассивКатегорий;
  	
  КонецФункции

  Функция ВводныеСерии()
  	
  	СоответствиеСерий  = Новый Соответствие;
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(30);
  	МассивПоказателей.Добавить(45);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(70);
  	
  	СоответствиеСерий.Вставить("Олег", МассивПоказателей); 
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(40);
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(70);
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(35);
  	
  	СоответствиеСерий.Вставить("Сергей", МассивПоказателей); 
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(40);
  	МассивПоказателей.Добавить(35);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(20);
  	
  	СоответствиеСерий.Вставить("Артем", МассивПоказателей); 
  
  	Возврат СоответствиеСерий;
  	
  КонецФункции

  Функция ВводныеЛинии()
  	
  	СоответствиеЛиний  = Новый Соответствие;
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(30);
  	МассивПоказателей.Добавить(40);
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(30);
  	МассивПоказателей.Добавить(45);
  	МассивПоказателей.Добавить(55);
  	МассивПоказателей.Добавить(50);
  	
  	СоответствиеЛиний.Вставить("Обычная", МассивПоказателей); 
  		
  	Возврат СоответствиеЛиний;
  	
  КонецФункции

  ```
</details>

<details>
<summary>Спидометр</summary>
  <br>
  
  ![image](https://github.com/Bayselonarrend/1Charts/assets/105596284/c9ac7ff0-6223-42a7-965b-d65d2f73e056)

  ```bsl

  _HTML = ToastUI.Спидометр(ВводныеСерииСОднимЗначениемВМассиве());

  Функция ВводныеСерииСОднимЗначениемВМассиве()
  	
  	СоответствиеСерий  = Новый Соответствие;
  	
  	Значение = Новый Массив;
  	Значение.Добавить(10);
  	СоответствиеСерий.Вставить("Олег", Значение); 
  	
  	Значение = Новый Массив;
  	Значение.Добавить(20);
  	СоответствиеСерий.Вставить("Сергей", Значение);
  	
  	Значение = Новый Массив;
  	Значение.Добавить(40);
  	СоответствиеСерий.Вставить("Артем", Значение); 
  
  	Возврат СоответствиеСерий;
  	
  КонецФункции

  ```

</details>

<details>
<summary>Линейная диаграмма</summary>
  <br>

  ![image](https://github.com/Bayselonarrend/1Charts/assets/105596284/1f8eb45a-5aeb-4fcb-b7a2-1be1ae17c4a8)
  
  ```bsl
  
  _HTML = ToastUI.ЛинейнаяДиаграмма(ВводныеКатегории(), ВводныеСерии());

  Функция ВводныеКатегории()
  	
  	МассивКатегорий = Новый Массив;
  	МассивКатегорий.Добавить("Пн");
  	МассивКатегорий.Добавить("Вт");
  	МассивКатегорий.Добавить("Ср");
  	МассивКатегорий.Добавить("Чт");
  	МассивКатегорий.Добавить("Пт");
  	МассивКатегорий.Добавить("Сб");
  	МассивКатегорий.Добавить("Вс");
  	
  	Возврат МассивКатегорий;
  	
  КонецФункции

  Функция ВводныеСерии()
  	
  	СоответствиеСерий  = Новый Соответствие;
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(30);
  	МассивПоказателей.Добавить(45);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(70);
  	
  	СоответствиеСерий.Вставить("Олег", МассивПоказателей); 
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(40);
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(70);
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(35);
  	
  	СоответствиеСерий.Вставить("Сергей", МассивПоказателей); 
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(40);
  	МассивПоказателей.Добавить(35);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(20);
  	
  	СоответствиеСерий.Вставить("Артем", МассивПоказателей); 
  
  	Возврат СоответствиеСерий;
  	
  КонецФункции

  ```

</details>

<details>
<summary>Круговая диаграмма</summary>
  <br>

  ![image](https://github.com/Bayselonarrend/1Charts/assets/105596284/c5a38eaf-9fee-42d9-b404-9ca351eb612a)

  ```bsl

  _HTML = ToastUI.КруговаяДиаграмма(ВводныеСерииСОднимЗначением());

  Функция ВводныеСерииСОднимЗначением()
  	
  	СоответствиеСерий  = Новый Соответствие;
  	
  	СоответствиеСерий.Вставить("Олег", 10); 	
  	СоответствиеСерий.Вставить("Сергей", 20); 
  	СоответствиеСерий.Вставить("Артем", 40); 
  
  	Возврат СоответствиеСерий;
  	
  КонецФункции

  ```
</details>

<details>
<summary>Вложенная круговая диаграмма</summary>
<br>

  ![image](https://github.com/Bayselonarrend/1Charts/assets/105596284/58f1b887-59a8-43bd-bad5-470fea64ceb7)

  ```bsl

  _HTML = ToastUI.ВложеннаяКруговаяДиаграмма(ВводныеСерииКруговойДиаграммы());

  Функция ВводныеСерииКруговойДиаграммы()
  	
  	СоответствиеСерий  = Новый Соответствие;
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(ToastUI.КонструкторЭлементаКруговойДиаграммы("Фрукты",170));
  	МассивПоказателей.Добавить(ToastUI.КонструкторЭлементаКруговойДиаграммы("Овощи",210));
  	МассивПоказателей.Добавить(ToastUI.КонструкторЭлементаКруговойДиаграммы("Ягоды",430));
  
  	
  	СоответствиеСерий.Вставить("Все", МассивПоказателей);
  
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(ToastUI.КонструкторЭлементаКруговойДиаграммы("Яблоко",30));
  	МассивПоказателей.Добавить(ToastUI.КонструкторЭлементаКруговойДиаграммы("Слива",50));
  	МассивПоказателей.Добавить(ToastUI.КонструкторЭлементаКруговойДиаграммы("Груша",70));
  	МассивПоказателей.Добавить(ToastUI.КонструкторЭлементаКруговойДиаграммы("Киви",40));
  	МассивПоказателей.Добавить(ToastUI.КонструкторЭлементаКруговойДиаграммы("Апельсин",30));
  	
  	СоответствиеСерий.Вставить("Олег", МассивПоказателей); 
  	
  	Возврат СоответствиеСерий;
  	
  КонецФункции

  ```

</details>

<details>
<summary>Радар</summary>
<br>

  ![image](https://github.com/Bayselonarrend/1Charts/assets/105596284/58339df5-0774-438f-a52a-c4cb5fde9718)

  ```bsl

  _HTML = ToastUI.Радар(ВводныеКатегории(), ВводныеСерии());

  Функция ВводныеКатегории()
  	
  	МассивКатегорий = Новый Массив;
  	МассивКатегорий.Добавить("Пн");
  	МассивКатегорий.Добавить("Вт");
  	МассивКатегорий.Добавить("Ср");
  	МассивКатегорий.Добавить("Чт");
  	МассивКатегорий.Добавить("Пт");
  	МассивКатегорий.Добавить("Сб");
  	МассивКатегорий.Добавить("Вс");
  	
  	Возврат МассивКатегорий;
  	
  КонецФункции

  Функция ВводныеСерии()
  	
  	СоответствиеСерий  = Новый Соответствие;
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(30);
  	МассивПоказателей.Добавить(45);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(70);
  	
  	СоответствиеСерий.Вставить("Олег", МассивПоказателей); 
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(40);
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(70);
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(35);
  	
  	СоответствиеСерий.Вставить("Сергей", МассивПоказателей); 
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(40);
  	МассивПоказателей.Добавить(35);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(20);
  	
  	СоответствиеСерий.Вставить("Артем", МассивПоказателей); 
  
  	Возврат СоответствиеСерий;
  	
  КонецФункции

  ```

</details>

<details>
<summary>Радиальная диаграмма</summary>
<br>

  ![image](https://github.com/Bayselonarrend/1Charts/assets/105596284/eac140c0-36c6-4d98-b448-ffe403cb4f42)

  ```bsl

  _HTML = ToastUI.РадиальнаяДиаграмма(ВводныеКатегории(), ВводныеСерии());

  Функция ВводныеКатегории()
  	
  	МассивКатегорий = Новый Массив;
  	МассивКатегорий.Добавить("Пн");
  	МассивКатегорий.Добавить("Вт");
  	МассивКатегорий.Добавить("Ср");
  	МассивКатегорий.Добавить("Чт");
  	МассивКатегорий.Добавить("Пт");
  	МассивКатегорий.Добавить("Сб");
  	МассивКатегорий.Добавить("Вс");
  	
  	Возврат МассивКатегорий;
  	
  КонецФункции

  Функция ВводныеСерии()
  	
  	СоответствиеСерий  = Новый Соответствие;
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(30);
  	МассивПоказателей.Добавить(45);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(70);
  	
  	СоответствиеСерий.Вставить("Олег", МассивПоказателей); 
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(40);
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(70);
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(35);
  	
  	СоответствиеСерий.Вставить("Сергей", МассивПоказателей); 
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(20);
  	МассивПоказателей.Добавить(40);
  	МассивПоказателей.Добавить(35);
  	МассивПоказателей.Добавить(15);
  	МассивПоказателей.Добавить(50);
  	МассивПоказателей.Добавить(10);
  	МассивПоказателей.Добавить(20);
  	
  	СоответствиеСерий.Вставить("Артем", МассивПоказателей); 
  
  	Возврат СоответствиеСерий;
  	
  КонецФункции

  ```

</details>

<details>
<summary>Диаграмма разброса</summary>
<br>
  
  ![image](https://github.com/Bayselonarrend/1Charts/assets/105596284/e8e8d3db-1799-4868-bea2-ac0a0a4ffaba)

  ```bsl

  _HTML = ToastUI.ДиаграммаРазброса(ВводныеСерииРазброса());

  Функция ВводныеСерииРазброса()
  	
  	СоответствиеСерий  = Новый Соответствие;
  	
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(ToastUI.КонструкторЭлементаРазброса(20,170));
  	МассивПоказателей.Добавить(ToastUI.КонструкторЭлементаРазброса(50,210));
  	МассивПоказателей.Добавить(ToastUI.КонструкторЭлементаРазброса(70,430));
  
  	
  	СоответствиеСерий.Вставить("Все", МассивПоказателей);
  
  	МассивПоказателей = Новый Массив;
  	МассивПоказателей.Добавить(ToastUI.КонструкторЭлементаРазброса(40,30));
  	МассивПоказателей.Добавить(ToastUI.КонструкторЭлементаРазброса(110,50));
  	МассивПоказателей.Добавить(ToastUI.КонструкторЭлементаРазброса(20,70));
  	МассивПоказателей.Добавить(ToastUI.КонструкторЭлементаРазброса(40,40));
  	МассивПоказателей.Добавить(ToastUI.КонструкторЭлементаРазброса(90,30));
  	
  	СоответствиеСерий.Вставить("Олег", МассивПоказателей); 
  	
  	Возврат СоответствиеСерий;
  	
  КонецФункции

  ```
</details>

<br>

___

<br>

>Основано на библиотеке ToastUI Charts<br>
>MIT License<br>
>https://github.com/nhn/tui.chart?tab=MIT-1-ov-file#readme<br>
>Copyright (c) 2020 NHN Cloud Corp.<br>

<br>

>![Infostart](https://github.com/Bayselonarrend/TelegramEnterprise/raw/main/infostart.svg)
>
>Статья на Инфостарте:<br>
>[https://infostart.ru/1c/articles/2003116/](https://infostart.ru/1c/articles/2003116/)<br>

