[Vivaldi (часть 6)](http://forum.ru-board.com/topic.cgi?forum=5&topic=51097&start=1940)
[snapshot](https://downloads.vivaldi.com/snapshot/vivaldi-snapshot_6.1.3035.3-1_amd64.deb)

Текущий финальный релиз:](https://vivaldi.com/download/) **6.1.3035.84** (19.04.2023)

Windows 10/11 [32-bit](https://downloads.vivaldi.com/stable/Vivaldi.6.1.3035.84.exe) | [64-bit](https://downloads.vivaldi.com/stable/Vivaldi.6.1.3035.84.x64.exe) | [Linux, macOS, Android](http://forum.ru-board.com/topic.cgi?forum=5&topic=51097&start=0&limit=1&m=1#1) [?]

[Тестовая сборка:](https://downloads.vivaldi.com/snapshot/vivaldi-snapshot_6.1.3035.12-1_amd64.deb)


[vivaldi-snapshot_6.1.3035.12-1_amd64.deb](https://downloads.vivaldi.com/snapshot/vivaldi-snapshot_6.1.3035.12-1_amd64.deb)

Путь к профилю `/home/vil/.config/vivaldi/Profile 1`

/home/vil/.config/vivaldi-snapshot/Profile_vil1958

Путь к профилю: `/home/vil/.config/vivaldi-snapshot/Profile_vil1958/Default`

Чтобы использовать распакованную копию Vivaldi в предыдущем примере в качестве автономного приложения, выполните следующее:  
  
```
cd vivaldi-snapshot ./vivaldi-snapshot --user-data-dir=profile &
cd vivaldi-snapshot ./vivaldi-snapshot --user-data-dir=/home/vil/.config/vivaldi-snapshot/Profile_vil1958 &
```

Экспериментальные возможности (сохранениее сесий):
`vivaldi://experiments`

Vivaldi.desktop
```
[Desktop Entry]
Version=1.0
Name=Vivaldi
# Only KDE 4 seems to use GenericName, so we reuse the KDE strings.
# From Ubuntu's language-pack-kde-XX-base packages, version 9.04-20090413.
GenericName=Web Browser
GenericName[en_GB]=Web Browser
GenericName[ru]=Веб-браузер
# Gnome and KDE 3 uses Comment.
Comment=Access the Internet
Comment[en_GB]=Access the Internet
Comment[ru]=Доступ в Интернет
Exec=/usr/bin/vivaldi-snapshot -user-data-dir=/home/vil/.config/vivaldi-snapshot/Profile_vil1958 %U
StartupNotify=true
Terminal=false
Icon=vivaldi-snapshot
Type=Application
Categories=Network;WebBrowser;
MimeType=application/pdf;application/rdf+xml;application/rss+xml;application/xhtml+xml;application/xhtml_xml;application/xml;image/gif;image/jpeg;image/png;image/webp;text/html;text/xml;x-scheme-handler/ftp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/mailto;
Actions=new-window;new-private-window;

[Desktop Action new-window]
Name=New Window
Name[en_GB]=New Window
Name[ru]=Новое окно
Exec=/usr/bin/vivaldi-snapshot -user-data-dir=/home/vil/.config/vivaldi-snapshot/Profile_vil1958 --new-window

[Desktop Action new-private-window]
Name=New Private Window
Name[en_GB]=New Private Window
Name[ru]=Новое приватное окно
Exec=/usr/bin/vivaldi-snapshot --user-data-dir=/home/vil/.config/vivaldi-snapshot/Profile_vil1958 --incognito
```

особо ценное - это максимально возможное штатное избавление от лишних дисковых кешей, затаскивания хромо-компонентов и тупых вопросов по назначению главным браузером. Если все три пункта не смущают, то можно и сразу по vivaldi.exe лупить:
```
Vivaldi.exe --disable-gpu-shader-disk-cache --disk-cache-dir=nul --disk-cache-size=1 --disable-background-networking --disable-component-update --no-default-browser-check
```

Windows 10/11 [32-bit](https://downloads.vivaldi.com/snapshot/Vivaldi.6.0.2979.9.exe) | [64-bit](https://downloads.vivaldi.com/snapshot/Vivaldi.6.0.2979.9.x64.exe) | [Linux, macOS](http://forum.ru-board.com/topic.cgi?forum=5&topic=51097&start=0&limit=1&m=2#1) [?]
  
**•** [Внутренние ссылки для Vivaldi — **vivaldi://**](vivaldi://vivaldi-urls)  
**•** [Страница для отправки баг-репортов](https://vivaldi.com/bugreport/); **писать только на английском!**  
**•** [Русскоязычная ветка на официальном форуме](https://forum.vivaldi.net/category/20/%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9-russian) — для пожеланий предложений  
**•** [Chrome WebStore](https://chrome.google.com/webstore/category/extensions?hl=ru) | [Opera](https://addons.opera.com/ru/) — официальный репозиторий расширений  
  
**•** [Результаты опроса по добавлению новых функций в браузер Vivaldi (проведённого в 2015 году)](https://ru.vivaldi.net/vivaldi-5-results/)  
**•** [Результаты опроса о популярности функций браузера Vivaldi (проведённого в 2016 году)](https://habr.ru/company/vivaldi/blog/312276/)  
  
Ссылки:  
**•** [Team Blog](https://vivaldi.com/blog/teamblog/)  
**•** [Архив предыдущих версий браузера со списками изменений](https://vivaldi.com/download/archive/)  
**•** [Vivaldi :: Хабр](https://habr.ru/company/vivaldi/) ([Остальное](https://habr.ru/search/?target_type=posts&q=%5Bvivaldi%5D%20&order_by=date))  
**•** [Vivaldi :: ВКонтакте](https://vk.com/vivaldi_russia)  
**•** [Vivaldi :: Twitter](https://twitter.com/vivaldi_ru)  
**•** [Vivaldi :: Vivaldi Tips](https://vivalditips.com/)  
  
**•** [Release Notes](http://forum.ru-board.com/topic.cgi?forum=5&topic=51097&start=0&limit=1&m=3#1) [?]  
**•** [Полный список функций браузера Vivaldi (обновляется)](https://forum.vivaldi.net/topic/11000/%D0%BF%D0%BE%D0%BB%D0%BD%D1%8B%D0%B9-%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA-%D1%84%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D0%B9-%D0%B1%D1%80%D0%B0%D1%83%D0%B7%D0%B5%D1%80%D0%B0-vivaldi-%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%BB%D1%8F%D0%B5%D1%82%D1%81%D1%8F)  
**•** [История реализации функций Vivaldi](http://forum.ru-board.com/topic.cgi?forum=5&topic=51097&start=0&limit=1&m=4#1) [?] | [Подробности...](http://forum.ru-board.com/topic.cgi?forum=5&topic=51097&start=0&limit=1&m=5#1) [?]

---

**•** [Список известных ошибок](http://forum.ru-board.com/topic.cgi?forum=5&topic=51097&start=0&limit=1&m=6#1) [?]  

---

Решение проблем:  
**·** [Делаем полный портабл [обновлено: 17.12.22]](http://forum.ru-board.com/topic.cgi?forum=5&topic=50704&start=2180#14) [?]  
**·** by den_po: [VivaldiHooks](https://github.com/justdanpo/VivaldiHooks/wiki/Hooks-ru)

https://vivaldi.com/download/

текущая версия: Vivaldi 6.0.2979.3 Final
для просмотра версии:
vivaldi://about/
Vivaldi 6.0.2979.3 (Stable channel) (64 бита) 
Версия 7dba05d7fcf6f361b9243b11c60685f954ff3b1a
ОС Windows 10 Version 22H2 (Build 19045.2788)
JavaScript V8 11.0.226.20
User Agent Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36

Proxy для Proximitron:
```
"D:\Users\vil\AppData\Local\Vivaldi\Application\vivaldi.exe"
 --profile-directory="Profile_vil1958" --proxy-server="socks5://127.0.0.1:12345" -dns-prefetch-disable

"D:\Users\vil\AppData\Local\Vivaldi\Application\vivaldi.exe"
--profile-directory="Profile_vil1958" --proxy-server="127.0.0.1:12346" -dns-prefetch-disable
```

Осталось только разобраться с **заворотом DNS-запросов в туннель**:  
Похоже, что для этого достаточно **отключить DNS prefetching** (упреждающее чтение DNS) в расширенных параметрах Google Chrome или путем добавления ещё одной стартовой опции  
"-dns-prefetch-disable".  
Вооружаемся tcpdump или wireshark и нюхаем UDP 53… вроде всё чисто.  
  
Поправьте меня, если я не прав, может оно и с префетчем уже работает или есть более красивый способ?  
На мой сугубо личный взгляд, вынос настроек прокси из браузера, это не очень умно, но в «великом и ужасном», похоже, считают иначе.

```
Путь к профилю:
d:\Users\vil\AppData\Local\Vivaldi\User Data\Profile_vil1958

--user-data-dir="d:\Users\vil\AppData\Local\Vivaldi\User Data"
--profile-directory="Profile_vil1958"
```

[#### Как подружить Google Сhrome portable и proxy на примере ssh-tunnel](https://habr.com/ru/articles/110587/)
[#### List of Chromium Command Line Switches](https://peter.sh/experiments/chromium-command-line-switches/#proxy-server)


Командная строка
``"D:\Users\vil\AppData\Local\Vivaldi\Application\vivaldi.exe" --flag-switches-begin --flag-switches-end --save-page-as-mhtml`

Путь к исполняемому файлу
`D:\Users\vil\AppData\Local\Vivaldi\Application\vivaldi.exe`

Путь к профилю
`D:\Users\vil\AppData\Local\Vivaldi\User Data\Profile 1`



для просмотра флагов:
Type this URL: vivaldi://flags

```
REM 6.0.2979.3 (Stable channel) (64 бита) 
REM https://downloads.vivaldi.com/stable/Vivaldi.6.0.2979.3.exe
REM https://downloads.vivaldi.com/snapshot/Vivaldi.6.0.2979.3.x64.exe

SET VER=6.0.2979.3
SET PROG=Vivaldi
SET PTH=https://downloads.vivaldi.com/stable
SET REF=%PTH%

wget.exe -O "%PROG%_%VER%_x32.exe" "%PTH%/%PROG%.%VER%.exe" --referer="%REF%" --content-disposition
wget.exe -O "%PROG%_%VER%_x64.exe" "%PTH%/%PROG%.%VER%.x64.exe" --referer="%REF%" --content-disposition
```

Установка на Unix:
https://itslinuxfoss.com/install-vivaldi-ubuntu-22-04/

[**Установка в нестандартный каталог**](https://habr.com/ru/companies/vivaldi/articles/275121/)

Установка браузера Vivaldi в нестандартный каталог заключается в распаковке одного из наших пакетов и переносе файлов в новый каталог. Многие просят TAR архив с файлами для решения этой задачи, но на самом деле тот же .deb пакет включает в себя именно TAR архивы, из которых вынуть требуемые файлы не составляет труда, используя утилиты, входящие в состав дистрибутива. То же самое касается и .rpm пакетов. Используя 64-битный .deb пакет недавней тестовой сборки в качестве примера, мы сейчас покажем, как произвести распаковку файлов в консоли:  
```
ar p vivaldi-snapshot_1.0.365.3-1_amd64.deb data.tar.xz | tar -xJf- --strip 2 ./opt
```
  В результате будет создан каталог «vivaldi-snapshot». Можете переместить его со всем содержимым в любой подходящий каталог. Чтобы запустить Vivaldi, выполните запускающий скрипт (называется «vivaldi-snapshot») из этого каталога.

**Автономная установка (standalone)**  
  Браузер Vivaldi поддерживает параметр командной строки, позволяющий указывать браузеру, где сохранять все настройки и пользовательские данные: "**--user-data-dir=**". Если вы укажете сохранять профиль и данные в подкаталоге внутри каталога с файлами браузера, вы, фактически, получите автономно работающий браузер.  
Чтобы использовать распакованную копию Vivaldi в предыдущем примере в качестве автономного приложения, выполните следующее:  
```
cd vivaldi-snapshot ./vivaldi-snapshot --user-data-dir=profile &
```

[#### List of Chromium Command Line Switches](https://peter.sh/experiments/chromium-command-line-switches/)



[#### Как установить браузер Vivaldi на Ubuntu и другие дистрибутивы Linux](https://websetnet.net/ru/how-to-install-vivaldi-browser-on-ubuntu-and-other-linux-distributions/)


## **How to install Vivaldi on Ubuntu 22.04 from its repository**

The official repository of Vivaldi can be added on Vivaldi to install it on Ubuntu 22.04. To do so, the following steps are performed:

## Step 1: Importing the Public Key

First of all, you have to import the public key and verify with the below command.
`sudo wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | gpg --dearmor | sudo dd of=/usr/share/keyrings/vivaldi-browser.gpg`

## Step 2: Copy Repository to Ubuntu Official’s Repository

Copy the official repository of Vivaldi and add it in Ubuntu’s repository list as follows:
`sudo echo "deb [signed-by=/usr/share/keyrings/vivaldi-browser.gpg arch=$(dpkg --print-architecture)] https://repo.vivaldi.com/archive/deb/ stable main" | sudo dd of=/etc/apt/sources.list.d/vivaldi-archive.list`

## Step 3: Update System Cache/Repository

At this stage your system needs to be updated with new package files and libraries.
`sudo apt update`

## Step 4: Installation of Vivaldi with Package Manager (apt)

Now install the **Vivaldi** application with **apt** installer.
`sudo apt install vivaldi-stable`

## Step 5: Open the Application from Terminal

Open your Vivaldi web browsers and explore the world from home.
`vivaldi`

## **How to Remove Vivaldi from Ubuntu 22.04**

Just in case you do not want **Vivaldi** browser anymore, you can remove Vivaldi and its configurations via the below-mentioned command:
`sudo apt purge vivaldi-stable`

## Step 1: Download Vivaldi Package using wget

Whenever you want to download a package other than Ubuntu’s official repository you need to copy the link of the package. “**wget”** is used for the purpose of downloading through a link. Thus, you can download the **deb** file with the command:
`wget https://downloads.vivaldi.com/stable/vivaldi-stable_5.2.2623.48-1_amd64.deb`

## Step 2: Check the Downloaded File of Vivaldi

Use the **“ls”** command to check the availability of the newly downloaded file.
`ls`

## Step 3: install Vivaldi with Package Manager (dpkg)

As you have seen in the above screenshot, there is a file with deb extension. Just install the package following the below syntax. “**Dpkg”** is here for package manager while **“-i”** is for install.
`sudo dpkg -i vivaldi-stable_5.2.2623.48-1_amd64.deb`

## Step 4: Open the Vivaldi Application

It’s time to open the **Vivaldi** application by using the below command.
`vivaldi`

======================================================
# Vivaldi (Linux) 4.3.2439.44

[https://downloads.vivaldi.com/stable/vivaldi-stable_4.3.2439.44-1_amd64.deb](https://downloads.vivaldi.com/stable/vivaldi-stable_4.3.2439.44-1_amd64.deb)

account Vivaldi
vil1958
sergcs19581958
1sergcs19581958

vil1958@gmail.com
60 лет

vil5891@yandex.ru
1SergCs1958

что бы не запрашивал связку ключей
/usr/bin/vivaldi-stable --password-store=basic %U

=======================================================

Proxy socks5 Psiphone

"D:\Users\vil\AppData\Local\Vivaldi\Application\vivaldi.exe" --flag-switches-begin --proxy-server=socks5://localhost:12345 --flag-switches-end

# Об обходе ограничений доступа к почтовым сервисам

[https://habr.com/ru/post/329720/](https://habr.com/ru/post/329720/)

### Запустите и импортируйте следующие данные в реестр:

`Windows Registry Editor Version 5.00`

`[HKEY_CURRENT_USER\SOFTWARE\Psiphon3]`

`"SkipBrowser"=dword:00000001`

`"SkipProxySettings"=dword:00000001`

`"SkipAutoConnect"=dword:00000000`

`"SplitTunnel"=dword:00000000`

`"DisableTimeouts"=dword:00000001`

`"Transport"="CoreTransport"`

`"LocalHTTPProxyPort"=dword:00000000`

`"LocalSOCKSProxyPort"=dword:00003039`

`"SSHParentProxyHostname"=""`

`"SSHParentProxyPort"=dword:00000000`

`"SSHParentProxySkip"=dword:00000000`

`"SystrayMinimize"=dword:00000001`

### В этом случае в системе создастся локальный SOCKS-прокси на порту 12345. Таким образом, осталось только подключить почтовые клиенты, остальной трафик будет идти напрямую.

## Decimal value: 
**12345** Hex: 3039

### Command-line options for proxy settings

[https://www.chromium.org/developers/design-documents/network-settings/](https://www.chromium.org/developers/design-documents/network-settings/)

у меня для Vivaldi:
vivaldi.exe --proxy-server=socks5://127.0.0.1:12345
или
vivaldi.exe --proxy-server=socks5://socks.zaboronahelp.pp.ua:1488

Тестовый сервер, Европа:
socks.zaboronahelp.pp.ua
Порт — 1488
Протокол — SOCKS 5

# Как установить браузер Vivaldi на Ubuntu 22.04 LTS

[https://www.linuxcapable

.com/ru/how-to-install-vivaldi-browser-on-ubuntu-22-04-lts/](https://www.linuxcapable.com/ru/how-to-install-vivaldi-browser-on-ubuntu-22-04-lts/)

sudo apt update && sudo apt upgrade -y

sudo apt install software-properties-common apt-transport-https wget ca-certificates gnupg2 ubuntu-keyring -y

wget -O- [https://repo.vivaldi.com/archive/linux_signing_key.pub](https://repo.vivaldi.com/archive/linux_signing_key.pub) | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vivaldi.gpg

echo deb [arch=amd64 signed-by=/usr/share/keyrings/vivaldi.gpg] [https://repo.vivaldi.com/archive/deb/](https://repo.vivaldi.com/archive/deb/) stable main | sudo tee /etc/apt/sources.list.d/vivaldi.list

sudo apt update

sudo apt install vivaldi-stable -y

vivaldi --version

vivaldi --proxy-server=socks5://socks.zaboronahelp.pp.ua:1488

[http://socks=127.0.0.1](http://socks=127.0.0.1)

12345

[http://socks=127.0.0.1](http://socks=127.0.0.1)

### If instead we wanted to proxy only 

`   ### http://   `

###  URLs through the HTTPS proxy 

`   ### https://foo:443   `

### , and have everything else use the SOCKSv5 proxy 

`   ### socks5://mysocks:1080   `

###  we could launch Chrome with 

`   ### --proxy-server="http=https://foo:443;socks=socks5://mysocks:1080"   `

### . This now expands to:

• proxies for HTTP - `https://foo:443`

• proxies for HTTPS - _empty_

• other proxies - `socks5://mysocks:1080`

### The command line above uses WinInet's proxy map format, with some additional features:

◇ Instead of naming proxy servers by just a hostname:port, you can use Chrome‘s URI format for proxy server identifiers. In other words, you can prefix the proxy scheme so it doesn’t default to HTTP.

◇ The `socks=` mapping is understood more broadly as “other proxies”. The subsequent proxy list can include proxies of any scheme, however if the scheme is omitted it will be understood as SOCKSv4 rather than HTTP.

### Command-line options for proxy settings

сейчас работает (Windows):

D:\bin\WWW\Browser\Vivaldi\Application\vivaldi.exe --flag-switches-begin --proxy-server=socks5://localhost:12345 --save-page-as-mhtml --flag-switches-end

Chrome supports the following proxy-related command line arguments:

**--no-proxy-server**

This tells Chrome not to use a Proxy. It overrides any other proxy settings provided.

**--proxy-auto-detect**

This tells Chrome to try and automatically detect your proxy configuration. This flag is ignored if --proxy-server is also provided.

**--proxy-server=<scheme>=<uri>[:<port>][;...] | <uri>[:<port>] | "direct://"**

This tells Chrome to use a custom proxy configuration. You can specify a custom proxy configuration in three ways:

1. By providing a semi-colon-separated mapping of list scheme to url/port pairs.

For example, you can specify:

--proxy-server="http=foopy:80;ftp=foopy2"

to use HTTP proxy "foopy:80" for http URLs and HTTP proxy "foopy2:80" for ftp URLs.

1. By providing a single uri with optional port to use for all URLs.

For example:

--proxy-server="foopy:8080"

will use the proxy at foopy:8080 for all traffic.

1. By using the special "direct://" value.

--proxy-server="direct://" will cause all connections to not use a proxy.

**--proxy-bypass-list=(<trailing_domain>|<ip-address>)[:<port>][;...]**

This tells chrome to bypass any specified proxy for the given semi-colon-separated list of hosts. This flag must be used (or rather, only has an effect) in tandem with --proxy-server.

Note that trailing-domain matching doesn't require "." separators so "*[google.com](http://google.com/)" will match "[igoogle.com](http://igoogle.com/)" for example.

For example,

--proxy-server="foopy:8080" --proxy-bypass-list="*.[google.com](http://google.com/);*[foo.com](http://foo.com/);[127.0.0.1:8080](http://127.0.0.1:8080/)"

will use the proxy server "foopy" on port 8080 for all hosts except those pointing to *.[google.com](http://google.com/), those pointing to *[foo.com](http://foo.com/) and those pointing to localhost on port 8080.


