русская клавиатура:
### [xfce4-xkb-plugin](https://docs.xfce.org/panel-plugins/xfce4-xkb-plugin/start)

ссылка на каталог
```
[Desktop Entry]
Encoding=UTF-8
Name=User Files
Comment=User Files Desktop Icon
Type=Application
Exec=exo-open --launch FileManager %u
Icon=user-home
```

UserAndLinux
[UA-Linux репозиторий](https://ualinux.com/ru/repo-deb)
[###### КАК ПОДКЛЮЧИТЬ РЕПОЗИТОРИЙ](https://ualinux.com/ru/how-to-connect)
**Для установки программ и игр из нашего репозитория, вам необходимо сделать следующее:**

---

**Часть 1**:

Для любых дистрибутивов любых версий

_1. Загрузить пакет автоматической установки репозитория нажав эту кнопку_ [UALINUX-REPOSITORY-ALL.DEB](http://archive.ualinux.com/deb/pool/all/ualinux/ualinux-repository-all.deb)

_2. Установить пакет средствами GUI или сделать это в терминале:_  
**`sudo dpkg -i ./ualinux-repository-all.deb`**

_3, После этого необходимо обновить системную информацию о пакетах средствами GUI или сделать это в терминале:_  
**`sudo bash -c "rm /var/lib/apt/lists/* ; apt update"`**

---

**Часть 2**:

Дополнительно.  
Содержит программы, которые привязаны к конкретным версиям Ubuntu.

_0. **ВНИМАНИЕ**. Требуется предварительно установленный пакет **`ualinux-repository-all`** указанный в **Части 1**._

_1. Загрузить пакет автоматической установки репозитория нажав эту кнопку_ [UALINUX-REPOSITORY.DEB](http://archive.ualinux.com/deb/pool/all/ualinux/ualinux-repository.deb)  

_2. Установить пакет средствами GUI или сделать это в терминале:_  
**`sudo dpkg -i ./ualinux-repository.deb`**

_3, После этого необходимо обновить системную информацию о пакетах средствами GUI или сделать это в терминале:_  
**`sudo bash -c "rm /var/lib/apt/lists/* ; apt update"`**


[#### Очистка системы](https://omgubuntu.ru/7-sposobov-osvobodit-miesto-na-diskie-v-ubuntu-i-linux-mint/)
Это простая команда, которую вы можете запускать время от времени, чтобы освободить место в системе Ubuntu:
```
sudo apt-get autoremove
```
Система управления пакетами APT хранит кэш DEB пакетов в /var/cache/apt/archives. Со временем этот кэш может увеличиваться и содержать множество пакетов, которые вам не нужны.
Вы можете увидеть размер этого кэша с помощью команды du ниже:
```
sudo du -sh /var/cache/apt 
```
Теперь у вас есть два способа очистить APT кэш.
Либо удалить только устаревшие пакеты, как те, которые были заменены недавним обновлением, что делает их совершенно ненужными.
```
sudo apt-get autoclean
```
Либо удалить кэш apt целиком (освобождает больше дискового пространства):
```
sudo apt-get clean
```

##### Очистка логов системных журналов
Вы можете проверить размер журнала с помощью этой команды:
```
journalctl --disk-usage
```
Есть способы очистить системные журналы. Самый простой для вас - это очистить журналы, которые старше определенного дня.
```
sudo journalctl --vacuum-time=3d
```
##### Удаление старых версии Snap-приложений
Вы, наверное, уже знаете, что Snap-пакеты больше по размеру. Кроме того, в Snap хранятся как минимум две старые версии приложения (в случае, если вы хотите вернуться к предыдущей версии). Это съедает огромную часть пространства. В моем случае эта часть составляла более 5 GB.
```
du -h /var/lib/snapd/snaps
```
Алан Поуп (Alan Pope), член команды Snapcraft в Canonical, создал небольшой скрипт, который вы можете использовать и запускать для очистки всех старых версий ваших snap приложений.

Здесь вам нужно создать новый shell скрипт и использовать следующие строки в нем:

```
#!/bin/bash
# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
```

Дайте ему разрешение на выполнение, запустите скрипт оболочки с помощью sudo и увидите магию. Скрипт удалил старые пакеты Snap и освободил более 2,5 ГБ пространства, используемого Snap.



Шпаргалка по командам в Ubuntu-образных дистрибутивах

[http://forum.ru-board.com/topic.cgi?forum=65&topic=3199&start=300#8](http://forum.ru-board.com/topic.cgi?forum=65&topic=3199&start=300#8)

 *

      Привилегии

sudo command – запустить command с правами root

sudo su – открыть командную строку с правами root

sudo su user – открыть коммандную строку с правами user

sudo -k – забыть пароль sudo

gksudo command – графический диалог sudo (GNOME)

kdesudo command – графический диалог sudo (KDE)

sudo visudo – редактировать /etc/sudoers

gksudo nautilus – файловый менеджер с правами root (GNOME)

kdesudo konqueror – файловый менеджер с правами root (KDE)

passwd – сменить Ваш пароль

    *

      X-сервер

sudo /etc/init.d/gdm restart – перезапустить X (GNOME)

sudo /etc/init.d/kdm restart – перезапустить X (KDE)

(file) /etc/X11/xorg.conf – конфигурация X

sudo dpkg-reconfigure -phigh xserver-xorg – сбросить конфигурацию X

Ctrl+Alt+Bksp – перезапустить X-сервер

Ctrl+Alt+FN – переключиться на консоль №N

Ctrl+Alt+F7 – вернуться к X

    *

      Системные сервисы&#185;

start service – запустить service (Upstart)

stop service – остановить service (Upstart)

status service – проверить, запущен ли service (Upstart)

/etc/init.d/service start – запустить service (SysV)

/etc/init.d/service stop – остановить service (SysV)

/etc/init.d/service status – проверить service (SysV)

/etc/init.d/service restart – перезапустить service (SysV)

runlevel – посмотреть текущий runlevel

    *

      Управление пакетами&#185;

apt-get update – обновить базу пакетов

apt-get upgrade – обновить все пакеты

apt-get dist-upgrade – обновить версию Ubuntu

apt-get install pkg – установить pkg

apt-get remove pkg – удалить pkg

apt-get autoremove – удалить устаревшие пакеты

apt-get -f install – попытаться исправить сломаные пакеты(зависимости)

dpkg --configure -a – попытаться исправить сломаные пакеты(зависимости)

dpkg -i pkg.deb – установить пакет из файла pkg.deb

(file) /etc/apt/sources.list – список репозиториев APT

    *

      Сеть

ifconfig – просмотр сетевой информации

iwconfig – просмотр информации беспроводных устройств

sudo iwlist scan – сканировать беспроводные сети

sudo /etc/init.d/networking restart – перезапустить сеть

(file) /etc/network/interfaces – файл для ручной настройки сети

ifup interface – поднять interface

ifdown interface – положить interface

    *

      Специальные пакеты

ubuntu-desktop – стандартная среда Ubuntu

kubuntu-desktop – рабочий стол KDE

xubuntu-desktop – рабочий стол XFCE

ubuntu-minimal – основные утилиты Ubuntu

ubuntu-standard – стандартные утилиты Ubuntu

ubuntu-restricted-extras – не свободные, но полезные пакеты

kubuntu-restricted-extras – несвободные пакеты для kubuntu

xubuntu-restricted-extras – несвободные пакеты для xubuntu

build-essential – пакеты, необходимые для сборки программ

linux-image-generic – последнее generic ядро

linux-headers-generic – последние хедеры ядра

    *

      Фаервол&#185;

ufw enable – включить фаервол

ufw disable – выключить фаервол

ufw default allow – разрешить все подключения

ufw default deny – запретить все подключения

ufw status – текущий статус и правила

ufw allow port – разрешить соединения по порту port

ufw deny port – закрыть port

ufw deny from ip – заблокировать ip адрес

    *

      Имена приложений

nautilus – файловый менеджер (GNOME)

dolphin – файловый менеджер (KDE)

krusader —двухпанельный файловый менеджер

konqueror – веб-браузер (KDE)

kate – текстовый редактор (KDE)

gedit – текстовый редактор (GNOME)

    *

      Система

При зависании – Наберите фразу “REISUB” зажав клавиши Alt и SysRq (PrintScrn) с 1 сукундной паузой между каждой буквой. Компьютер перезагрузится.

lsb_release -a – получить версию Ubuntu

uname -r – получить версию ядра

uname -a – получить больше информации о ядре

        1. запускайте эти комманды с sudo

Источник  – [http://ulmencave.blogspot.com](http://ulmencave.blogspot.com/)

[http://ubuntologia.ru/](http://ubuntologia.ru/)

[http://www.thg.ru/software/ubuntu_linux/print.html](http://www.thg.ru/software/ubuntu_linux/print.html)

[https://forum.ubuntu.ru/index.php?topic=6900.0](https://forum.ubuntu.ru/index.php?topic=6900.0)