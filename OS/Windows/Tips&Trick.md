Панель управления сетью:
```
Win+R
inetcpl.cpl
```
Свойства боузера отключить или включить PROXY

http://forum.ru-board.com/topic.cgi?forum=62&bm=1&topic=31477&start=160#lt
Как вариант, отключить службу обновлений.  
Откл:  
sc config wuauserv start= disabled  
net stop wuauserv  
   
Вкл:  
sc config wuauserv start= auto  
net start wuauserv    
   
cmd от имени Администратора запускать.

#### [Как я могу создать ссылку на локальный файл на локальной веб-странице](https://overcoder.net/q/38498/%D0%BA%D0%B0%D0%BA-%D1%8F-%D0%BC%D0%BE%D0%B3%D1%83-%D1%81%D0%BE%D0%B7%D0%B4%D0%B0%D1%82%D1%8C-%D1%81%D1%81%D1%8B%D0%BB%D0%BA%D1%83-%D0%BD%D0%B0-%D0%BB%D0%BE%D0%BA%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9-%D1%84%D0%B0%D0%B9%D0%BB-%D0%BD%D0%B0-%D0%BB%D0%BE%D0%BA%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B9-%D0%B2%D0%B5%D0%B1-%D1%81%D1%82%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D0%B5)
## Почему три слэша?
Потому что это часть схемы [File URI](https://en.wikipedia.org/wiki/File_URI_scheme). У вас есть возможность указать хост после первых двух косых черт. Если вы пропустите указание хоста, он просто предположит, что вы ссылаетесь на файл на своем ПК. Другими словами: `file:///C:/etc` является ярлыком для `file://localhost/C:/etc`.

##### [Boot into the BIOS directly from Windows](https://betanews.com/2023/06/27/boot-into-the-bios-directly-from-windows/)
What you need to do is create a shortcut. Right-click a blank area on the desktop and go to **New > Shortcut.**
In the wizard that opens, click in the box underneath **Type the location of the item**, and enter the following:
`Shutdown /r /fw /t 1`
If you're not familiar with these commands, /r means restart, /fw means boot to firmware (aka the BIOS) and /t introduces a delay in seconds before the restart begins. In our example above, that's one second.

# Несколько версий Windows 10 подвержены сбою BSOD при загрузке
https://www.comss.ru/page.php?id=11253

Microsoft на портале «[Состояние выпуска Windows](https://www.comss.ru/page.php?id=8583)» подтвердила сбои BSOD после установки [обновления KB5021233](https://www.comss.ru/page.php?id=11234) в следующих версиях [Windows 10](https://www.comss.ru/list.php?c=windows-10):

-   [Windows 10, версия 22H2](https://www.comss.ru/list.php?c=22h2) (Windows 10 2022 Update)
-   [Windows 10, версия 21H2](https://www.comss.ru/list.php?c=21h2) (November 2021 Update)
-   [Windows 10, версия 21H1](https://www.comss.ru/list.php?c=21h1) (May 2021 Update)
-   [Windows 10, версия 20H2](https://www.comss.ru/list.php?c=20h2) (October 2020 Update)

Новой проблеме не подвержены Windows 11, а также Windows Server, Windows Enterprise LTSC и Windows Enterprise LTSB.

На сайте поддержки Microsoft [сообщает](https://learn.microsoft.com/en-us/windows/release-health/status-windows-10-22H2#you-might-receive-an-error--0xc000021a--with-a-blue-screen):

> После установки KB5021233 некоторые устройства Windows могут запускаться с синим экраном с ошибкой (0xc000021a).

Проблема вызвана несоответствием версии файла. Проблема затрагивает файл hidparse.sys, который по умолчанию находится в папках _c:/windows/system32_ и _c:/windows/system32/drivers_. Проверка подписи может завершиться ошибкой из-за несоответствия версии, когда происходит очистка.

Microsoft предлагает обходное решение для уязвимых устройств, но оно требует загрузки среды восстановления Windows. Если сбой BSOD при загрузке произошел, то среда восстановления будет загружена автоматически.

В остальных случаях несколько способов войти в среду восстановления Windows. Один из самых простых вариантов — выбрать опцию **Завершение работы** на экране входа в систему и удерживать нажатой клавишу **Shift** при выборе параметра перезагрузки. Другой вариант — перейти в меню «Пуск»> Параметры > Обновление и безопасность > Восстановление  и выбрать опцию **Перезагрузить сейчас** в разделе **Особые варианты загрузки**.

В среде восстановления нужно выполнить следующие действия:

-   Нажмите кнопку **Поиск и устранение неисправностей**.
-   Выберите **Дополнительные параметры**.
-   Запустите интерфейс командной строки, нажав кнопку **Командная строка**. В этот момент устройство может перезагрузиться.
-   Когда на экране откроется окно командной строки, запустите команду (используйте букву диска, на который установлена Windows): _xcopy C:\windows\system32\drivers\hidparse.sys C:\windows\system32\hidparse.sys_
-   После завершения команды введите _edit_.
-   Нажмите кнопку **Продолжить**.

Система Windows должна перезагрузиться, после чего проблема должна быть решена. Microsoft предупреждает администраторов, что им не следует использовать какие-либо другие методы для решения проблемы. Инженеры Microsoft работают над разработкой решения для всех устройств. Компания еще не объявила дату выпуска исправления.

Если вы используете Windows 11 в неподдерживаемой системе и хотите удалить раздражающий водяной знак, ознакомьтесь с нашим [пошаговым руководством](https://www.techspot.com/news/97748-how-remove-unsupported-pc-watermark-windows-11.html) о том, как отредактировать реестр, чтобы предупреждение Microsoft исчезло.
https://www.techspot.com/news/97748-how-remove-unsupported-pc-watermark-windows-11.html

-   Click on the Start menu and type Registry Editor and open it
-   Expand HKEY_CURRENT_USER
-   Navigate to and expand Control Panel
-   Click the UnsupportedHardwareNotificationCache folder
-   In the accompanying window pane, right-click the SV2 entry and select Modify
-   Change the value to "0" then click OK
-   Reboot your PC

Microsoft: Внутренние диски SATA отображаются как съемные носители в Windows 11, Windows 10, Windows 8, Windows 8.1 и Windows 7
--------------------------------------------------------------------------------------------------------

Является ли устройство съемным или нет, определяется BIOS вашей системы и тем, как он помечает различные порты SATA на материнской плате. Входящий драйвер напрямую проверяет порты SATA и рассматривает устройства, подключенные к портам с пометкой «внешние», как съемные устройства. Не все драйвера хранилища делают это, что может быть потенциальной причиной повреждения или потери данных.  
  
Сначала проверьте и установите доступные обновления BIOS от производителя вашего ПК. Если таковых нет, вы можете выполнить следующие действия, чтобы переопределить способ, которым входящий драйвер отображает устройства на некоторых портах:  
  
1. Откройте командную строку с правами администратора.  
2. В окне командной строки введите следующую команду и нажмите Enter: devmgmt.msc.  
3. В разделе Дисковые накопители определите устройство SATA, которое входящий драйвер должен считать внутренним, и откройте свойства этого устройства, щелкнув правой кнопкой мыши и выбрав пункт Свойства.  
4. Обратите внимание на номер шины из обзора свойств («1» в приведенном ниже примере).  
5. Для Windows 7:  
a. Введите следующую команду в ранее открытой командной строке и нажмите Enter:  
  `reg.exe add “HKLM\SYSTEM\CurrentControlSet\Services\msahci\Controller0\Channelx\” /f /v TreatAsInternalPort /t REG_DWORD /d 0x00000001`
  
Где x соответствует номеру шины, который вы указали на шаге 4.  
  
6. Для Windows 8 и более поздних версий:  
  
a. Введите следующую команду в ранее открытой командной строке и нажмите Enter:  
`reg.exe add “HKLM\SYSTEM\CurrentControlSet\Services\storahci\Parameters\Device” /f /v TreatAsInternalPort /t REG_MULTI_SZ /d x`
 
Где x соответствует номеру шины, который вы указали на шаге 4.  
  
msreview.net



