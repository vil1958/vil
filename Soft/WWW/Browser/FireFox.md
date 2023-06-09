[Firefox 114.0 Final](http://download-installer.cdn.mozilla.net/pub/firefox/releases/114.0/win64/ru/Firefox Setup 114.0.exe)

```
REM "http://download-installer.cdn.mozilla.net/pub/firefox/releases/114.0/win64/ru/Firefox Setup 114.0.exe"
REM "https://ftp.mozilla.org/pub/firefox/releases/114.0/win64/ru/Firefox Setup 114.0.exe"
REM "https://ftp.mozilla.org/pub/firefox/releases/114.0/win64/ru/Firefox Setup 114.0.msi"
REM http://download-installer.cdn.mozilla.net/pub/firefox/releases/
REM "https://download.mozilla.org/?product=firefox-114.0-SSL&os=win&lang=ru"
```

desktop file for start firefox:

[Desktop Entry]
X-SnapInstanceName=firefox
Version=1.0
Name=Firefox Web Browser
Name[ru]=Веб-браузер Firefox
Comment=Browse the World Wide Web
Comment[ru]=Доступ в Интернет
GenericName=Web Browser
GenericName[ru]=Веб-браузер
Keywords=Internet;WWW;Browser;Web;Explorer
Keywords[ru]=Internet;WWW;Browser;Web;Explorer;интернет;браузер;веб;файрфокс;огнелис
Exec=env BAMF_DESKTOP_FILE_HINT=/var/lib/snapd/desktop/applications/firefox_firefox.desktop /snap/bin/firefox %u
Terminal=false
Type=Application
Icon=/snap/firefox/current/default256.png
Categories=GNOME;GTK;Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupNotify=true
Actions=NewWindow;NewPrivateWindow;

[Desktop Action NewWindow]
Name=Open a New Window
Name[ru]=Новое окно
Exec=env BAMF_DESKTOP_FILE_HINT=/var/lib/snapd/desktop/applications/firefox_firefox.desktop /snap/bin/firefox -new-window

[Desktop Action NewPrivateWindow]
Name=Open a New Private Window
Exec=env BAMF_DESKTOP_FILE_HINT=/var/lib/snapd/desktop/applications/firefox_firefox.desktop /snap/bin/firefox -private-window

=================================
 Firefox

114.0

update snap версии:
````
sudo killall firefox
sudo snap refresh
````

когда будет проверка обновления:
`snap refresh --time`
`snap refresh --list`

# Установка из Snap

114.0 [https://snapcraft.io/firefox](https://snapcraft.io/firefox)

Чтобы установить Firefox из Snap, 
 установите Snap
  на свой компьютер. После установки Snap перейдите на .страницу Firefox в магазине Snapcraft , нажмите кнопку  Install и следуйте инструкциям.

По возможности Snap устанавливает Firefox в локализации вашей операционной истемы. Чтобы использовать другой язык, пожалуйста следуйте инструкциям  из этой статьи Напомним, что в осеннем выпуске Ubuntu 21.10 браузер Firefox был переведён по умолчанию на поставку в виде snap-пакета, но возможность установки deb-пакета была сохранена и оставалась доступной в форме опции. С 2019 года только в формате snap также поставляется браузер Chromium. В сопровождении snap-пакета с Firefox принимают участие сотрудники Mozilla. ​отдельного сопровождения
  для всех поддерживаемых веток Ubuntu и, соответственно, сборки и тестирования с учётом разных версий системных компонентов, а пакет snap может формироваться сразу для всех веток Ubuntu. Одним из важных требований к поставке браузеров в дистрибутивах является необходимость оперативной доставки обновлений для своевременного блокирования уязвимостей. Поставка в формате snap позволит ускорить доведение новых версий браузера до пользователей Ubuntu. Кроме того, поставка браузера в формате snap даёт возможность запускать Firefox в дополнительно изолированном окружении, созданном при помощи механизма AppArmor, что позволит усилить защиту остальной системы от эксплуатации уязвимостей в браузере.
Минусами применения snap является затруднение контроля сообщества над разработкой пакетов и привязка к дополнительному инструментарию и сторонней инфраструктуре. Процесс snapd выполняется в системе с правами root, что создаёт дополнительные угрозы в случае компрометации инфраструктуры или выявления уязвимостей. Недостатком также является необходимость решения  проблем  , специфичных для поставки в формате snap (не работают   некоторые обновления,  всплывают  недоработки при использовании Wayland,  возникают  проблемы с гостевым сеансом, имеются трудности
  с запуском внешних обработчиков).
[https://ftp.mozilla.org/pub/firefox/releases/95.0/linux-x86_64/ru/](https://ftp.mozilla.org/pub/firefox/releases/95.0/linux-x86_64/ru/)
[https://help.ubuntu.ru/wiki/firefox](https://help.ubuntu.ru/wiki/firefox)
[https://support.mozilla.org/ru/kb/ustanovka-firefox-na-linux](https://support.mozilla.org/ru/kb/ustanovka-firefox-na-linux)

**Firefox** is available to download and install via Lite Software. Just keep in mind it will install the Snap package system, so expect extra bloat and slow downs. Because Firefox is tied to Snap as a service, it won't appear in your Menu until you have rebooted.

**Installing Firefox pure deb package (PPA):**

o add-apt-repository ppa:mozillateam/ppa

echo '

Package: *

Pin: release o=LP-PPA-mozillateam

Pin-Priority: 1001

' | sudo tee /etc/apt/preferences.d/mozilla-firefox

echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

sudo apt-get install firefox

иконка поиск:

find /usr/share/icons -type f -iname '*firefox*'

[/usr/share/icons/hicolor/256x256/apps/firefox.png](file:///usr/share/icons/hicolor/256x256/apps/firefox.png)

 Установка Статичного Билда с Сайта Разработчиков

Не совсем линуксовский способ, но гарантирует свежую и стабильную версию браузера. Качественно подходит для любителей старых дистрибутивов в которых прекращена поддержка, браузера в том числе, - например версия 10.04-LTS. Делаем это так, - качается в домашнюю директорию архив с последней версией, с сайта mozilla.org - например русская версия для 64-битных систем:

cd ~/

wget -c https://download-installer.cdn.mozilla.net/pub/firefox/releases/37.0.2/linux-x86_64/ru/firefox-37.0.2.tar.bz2Стандартной директорией для любителей командной строки будет директория:

wget -c https://download-installer.cdn.mozilla.net/pub/firefox/releases/Остальное подсмотрите здесь: [02.png](https://help.ubuntu.ru/_media/wiki/firefox/02.png) - и по ссылке: [https://www.mozilla.org/en-US/firefox/all/](https://www.mozilla.org/en-US/firefox/all/) - где:

/37.0.2 - номер релиза

/linux-x86_64 - архитектура билда

/ru - язык билда

/firefox-37.0.2.tar.bz2 - полное название архива с билдомТак же можете закачать любую нужную вам версию вручную, в домашнюю директорию, используя эту же страницу - [Download Firefox in your language](https://www.mozilla.org/en-US/firefox/all/) - где выбираем язык билда.

Далее, архив распаковывается в папку /opt - которая специально используется для подобных статичных архивов с программным обеспечением:

cd /opt

sudo tar -jxvf ~/firefox-37.0.2.tar.bz2Далее, делаем несколько полезных ссылок, - пару симлинков в /usr/local/bin и /usr/bin чтобы можно было запускать браузер из командной строки терминала. И одну на десктоп - по желанию:

sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox

sudo ln -s /opt/firefox/firefox /usr/bin/firefox

ну и одну отправляем на рабочий стол, если надо - например эту - /usr/bin/firefoxДалее, - настраиваем firefox как это делаем обычно и так как написано на этой странице и - работаем. Обновление производим штатным для браузера способом - из меню: Справка - О Firefox.

 Установка Aurora

Помимо основной, стабильной ветки, есть так же нестабильная ветка, именуемая Aurora. Для её установки надо добавить PPA репозитории.

Добавление PPA-репозитория с Aurora заменит ваш стабильный Firefox! Эта версия Firefox нестабильна и может содержать баги! Используйте ее на свой страх и риск!

Для добавления PPA Aurora и установки выполните в терминале команды:
`sudo add-apt-repository ppa:ubuntu-mozilla-daily/firefox-aurora`
`sudo apt-get update`
`sudo apt-get install firefox`

 Установка Firefox-trunk

Так же есть и Nightly сборки именуемые Firefox-trunk. Firefox-trunk не заменяет стабильную версию Firefox, поэтому можно держать одновременно стабильную и разрабатываемую сборки.
Использование Firefox-trunk может привести к потере Ваших данных. Эта версия Firefox предназначена для разработчиков и тестировщиков и содержит баги! Используйте ее на свой страх и риск!
`sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa`
`sudo apt-get update`
`sudo apt-get install firefox-trunk`

_Mozilla Firefox (Linux) 93.0_

x64:

[https://ftp.mozilla.org/pub/firefox/releases/93.0/linux-x86_64/ru/firefox-93.0.tar.bz2]
(https://ftp.mozilla.org/pub/firefox/releases/93.0/linux-x86_64/ru/firefox-93.0.tar.bz2)
[https://losst.ru/ustanovka-firefox-ubuntu-16-04](https://losst.ru/ustanovka-firefox-ubuntu-16-04)

 1. ОФИЦИАЛЬНЫЕ РЕПОЗИТОРИИ
Если вы удалили раньше Firefox, то можете сейчас установить программу из официальных репозиториев. Это можно сделать через менеджер приложений или терминал:
`sudo apt install firefox`

Firefox 50 вышел для всех поддерживаемых на данный момент систем Ubuntu. Поэтому в результате такой установки вы получите самую последнюю стабильную версию программы. Для обновления вы можете воспользоваться пакетным менеджером Ubuntu или просто выполнить штатное обновление системы:

`sudo apt update`
`sudo apt upgrade`

 Установка Firefox Ubuntu 20.04 последней версии будет выполнена вместе с установкой других обновлений:
`firefox --version`

 2. PPA РЕПОЗИТОРИЙ

 Если вы хотите самую свежую версию Firefox, которая ещё находится на стадии бета-тестирования, вам нужно использовать PPA репозиторий от Mozilla. Сначала надо добавить в систему ключ:

`sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A6DCF7707EBC211F`

Затем добавьте репозиторий:
sudo apt-add-repository "deb http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu focal main"`

 После этого можно установить Firefox:
`sudo apt install firefox`

 Затем проверьте версию:
`firefox --version`

 3. ОФИЦИАЛЬНЫЙ САЙТ

 Установка последней версии Firefox может быть выполнена не только из репозиториев. Вы можете скачать архив с бинарными файлами программы и распаковать его на своем компьютере. Сначала удалите существующую версию:
`sudo apt remove firefox`

[![file:///tmp/.8FAGX1/1.png](file:///tmp/.8FAGX1/1.png)](https://losst.ru/wp-content/uploads/2016/11/Snimok-ekrana-ot-2020-06-18-21-21-23-875x576.png)

 Перейдите в папку /usr/local/
`cd /usr/local/`

 Затем скачайте архив из официального сайта. Например, для последней версии Firefox 64 бит ссылка будет выглядеть вот так:
`sudo wget -O ~/FirefoxSetup.tar.bz2`
[https://ftp.mozilla.org/pub/firefox/releases/93.0/linux-x86_64/ru/firefox-93.0.tar.bz2]
(https://ftp.mozilla.org/pub/firefox/releases/93.0/linux-x86_64/ru/firefox-93.0.tar.bz2)
или
`sudo wget -O ~/FirefoxSetup.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64"`

 Файл по умолчанию сохранен в домашней папке текущего пользователя.
 Для 32 бит:
`sudo wget -O ~/FirefoxSetup.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux32"`

 Затем распакуйте полученный архив:
`sudo tar xvjf ~/FirefoxSetup.tar.bz2`

-C /usr/local/

 Программа уже скомпилирована и ничего собирать не нужно, осталось создать символическую ссылку на саму программу в каталог /bin:
.`sudo ln -s /usr/local/firefox/firefox /usr/bin/firefox`

 Для обновления полученного таким образом Firefox надо просто повторить процедуру. Затем можно запускать из главного меню или через терминал:
`firefox`
( или создайте исполняемый файл Firefox в/usr/lib/, который указывает на местоположение, где Вы извлекли .tar.bz2 файл (/выбирают папка). Используйте следующую команду, чтобы сделать так:
`sudo ln -s /usr/local/firefox/firefox /usr/lib/firefox/firefox`
)

 4. ПАКЕТ SNAP

 Я не знаю зачем вам может это понадобится, но вы можете установить firefox из snap пакета. Для этого просто выполните:
`sudo snap install firefox`

 Никаких преимуществ у такого метода установки нет, но вы можете это сделать.

## УДАЛЕНИЕ FIREFOX

 Если вы хотите полностью удалить Firefox из системы используйте команду:
`sudo apt remove firefox`

 Можно удалить Firefox полностью, наряду с любыми конфигурациями, которые Вы, возможно, сделали посредством следующей команды:
`sudo apt-get purge firefox`

 Если же вы хотите удалить версию из репозитория, просто удалите сам репозиторий из файла 
/etc/apt/sources.list
 , обновите списки пакетов и переустановите firefox:
`sudo apt update`

 Чтобы удалить Firefox установленный из официального сайта надо удалить символическую ссылку 
/usr/bin/firefox:
`sudo rm -Rf /usr/bin/firefox`

 Затем удалить папку /usr/loca/firefox:
`sudo rm -Rf /usr/loca/firefox`

 Для удаления snap пакета выполните:
`sudo snap remove firefox`

======================================

sudo add-apt-repository ppa:new/ppa-repository
 Но в некоторых дистрибутивах Linux, основанных на Ubuntu, например, в Elementary OS, выполнение данной команды будет приводить к ошибке:
`sudo: add-apt-repository: command not found`
 Причина очень простая. В системе не установлена утилита 
add-apt-repository
Утилита add-apt-repository
находится в пакете software-properties-common который нужно установить.
 Установим пакет 
software-properties-common
Выполняем команду:
`sudo apt-get install software-properties-common
`sudo add-apt-repository ppa:mozillateam/ppa`
echo ' Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
 | sudo tee /etc/apt/preferences.d/mozilla-firefox
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
sudo apt-get install firefox