REM Audacious_4.3.1

REM https://www.slo.ru/files/audio_players/audacious
REM https://distfiles.audacious-media-player.org/audacious-4.3.1-win32.exe
REM https://distfiles.audacious-media-player.org/audacious-4.3.1-win32.zip
REM https://distfiles.audacious-media-player.org/audacious-4.3.1.tar.bz2

плеер построенный на основе модулей
Open Source Windows Linux
Audacious — это полностью бесплатный аудиоплеер, который отлично подойдёт, как для простого воспроизведения музыки через плейлисты
или директории, так и для построения небольшой библиотеки. В нем есть набор востребованных удобств и отсутствуют специфические
функции (в базовой настройке), которые бывают в сложных медиацентрах, ориентированных на каталогизацию большого объема музыки.
Функционал Audacious запросто расширяется с помощью встроенной системы плагинов, которая позволит включить в плеер новые функции.
Модульная система – ключевая особенность этого аудиоплеера. В комплекте есть масса встроенных модулей и пользователь может выбирать
нужную ему функциональность, отсекая избыточную. Они влияют, как на функциональность, так и на интерфейс плеера. И да, если
встроенных модулей кажется недостаточно, то в Интернете можно найти дополнительные.
Audacious поддерживает воспроизведение всех востребованных аудиоформатов. Плейлисты разных типов, сортировка, получение данных от
онлайн-сервисов (теги, тексты песен, обложки), эквалайзер, несколько видов визуализации, наложение эффектов и многое другое.
Интересной особенностью Audacious является полная поддержка скинов от легендарного Winamp 2. Для многих пользователей это станет
очень привлекательной функцией, ведь таких скинов накопилась уйма и это дает возможность использовать свой любимый интерфейс в новом
плеере.
Что нового в последней версии Audacious:
Исправлены ошибки.

https://audacious-media-player.org/download

## Source code

The Audacious source is split into two packages. The “audacious” package needs to be installed before “audacious-plugins”. In each package, there is a file named INSTALL with further instructions for compiling and installing. (These instructions are not very helpful at the moment but will be improved as we have time.)

Audacious uses the Qt 5 toolkit by default, with GTK2 or optionally GTK3 as a fallback. By passing the appropriate options to `./configure` or Meson, it is also possible to build Audacious in pure-Qt or pure-GTK mode (or with neither toolkit, for a headless music player “daemon”).

Most users should download the current stable release. Testing releases are likely to have problems and may not work at all. If you do install a testing release, please report any problems you find.

### Current stable release: 4.3.1 (March 5, 2023)

-   [audacious-4.3.1.tar.bz2](https://distfiles.audacious-media-player.org/audacious-4.3.1.tar.bz2) (600 KB)
-   [audacious-plugins-4.3.1.tar.bz2](https://distfiles.audacious-media-player.org/audacious-plugins-4.3.1.tar.bz2) (1.9 MB)

Older releases, along with the legacy `libaudclient` library, are available [here](https://distfiles.audacious-media-player.org/)

### Что нового в последней версии Audacious:

**Что нового в Audacious 4.3.1**

-   Добавлен плагин вывода звука PipeWire.
-   Добавлен собственный плагин декодирования Opus.
-   Возвращена поддержка GTK3 (опционально, по умолчанию используется GTK2).
-   Улучшена поддержка Qt 6 (опционально, по умолчанию используется QT5).
-   Завершено включение поддержки системы сборки Meson.
-   Добавлена возможность копировать путь к фалу в диалоге информации о треке.
-   Добавлена поддержка трансляций Ogg FLAC.
-   Добавлена поддержка чтения встроенных тегов текстов песен.
-   В функцию поиска включена поддержка разного содержания для тегов исполнитель трека и исполнитель альбома.
-   Добавлена поддержка нового формата значения длинны трека в SID-плагине.
-   Добавлена поддержка тегов Publisher и Catalog Number.
-   В диалог экспорта плейлиста добавлена функция фильтрации файлов.
-   Исправлены ошибки.

## Linux

Most Linux distributions provide Audacious in their package repositories. Please note that these packages can be out of date.

### Debian, Ubuntu, Linux Mint

Users of Debian and its derivatives can install Audacious with apt-get:

```
# apt-get install audacious
```

Note that the versions of Audacious available in Debian stable and Ubuntu LTS releases tend to be rather out of date. Panda Jim of [ubuntuhandbook.org](https://ubuntuhandbook.org/) maintains a [PPA with newer versions](https://launchpad.net/~ubuntuhandbook1/+archive/ubuntu/apps) for Ubuntu users

https://launchpad.net/~ubuntuhandbook1/+archive/ubuntu/apps

Audacious 4.2 (July 9, 2022)

[https://audacious-media-player.org/download](https://audacious-media-player.org/download)

### Install Audacious 4.2 via PPA:

I’ve updated the [unofficial PPA](https://launchpad.net/~ubuntuhandbook1/+archive/ubuntu/apps) with the package for Ubuntu 18.04, Ubuntu 20.04, Ubuntu 22.04 and their based systems, such as Linux Mint and Pop! OS.
### PPA description

Apps that are not available in Ubuntu universe repositories or the Ubuntu repositories only provide an old version

Maintained by [http://ubuntuhandbook.org](http://ubuntuhandbook.org/)

If the packages here are helpful, you may buy me a coffee:

         [https://ko-fi.com/ubuntuhandbook1](https://ko-fi.com/ubuntuhandbook1)

         [https://www.buymeacoffee.com/ubuntuhandbook1](https://www.buymeacoffee.com/ubuntuhandbook1)

UPDATE June 18, 2022: The PPA has exceeded its size limit. So, I'm going to delete old packages for non-supported Ubuntu editions in next month! Please email me (ubuntuhandbook1 at gmail.com) if you're running on old system and need certain packages.

After deletion, the PPA will contain packages for Ubuntu 22.04, Ubuntu 21.10, Ubuntu 20.04, 18.04, 16.04, 14.04, and 12.04

## Adding this PPA to your system

You can update your system with unsupported packages from this untrusted PPA by adding **ppa:ubuntuhandbook1/apps** to your system's Software Sources. ([Read about installing](https://launchpad.net/+help-soyuz/ppa-sources-list.html))

``sudo add-apt-repository ppa:ubuntuhandbook1/apps
``sudo apt update

_**NOTE if you’re using the Audacious 4.2 beta package via my test PPA, you have to remove it as well as the PPA first.**_

First, open terminal by either pressing Ctrl+Alt+T on keyboard or searching from _Activities_ overview (start menu). When it opens, run the command to add the PPA:

sudo add-apt-repository ppa:ubuntuhandbook1/apps

Second, update the package cache in Ubuntu 18.04, Linux Mint, though itâ€™s done automatically in Ubuntu 20.04 +

sudo apt update Finally, either update the music player via **Software Updater**, or run the command below in terminal to install/update the package:

sudo apt install audacious audacious-plugins

The Audacious source is split into two packages. The “audacious” package needs to be installed before “audacious-plugins”. In each package, there is a file named INSTALL with further instructions for compiling and installing. (These instructions are not very helpful at the moment but will be improved as we have time.)

Audacious uses the Qt 5 toolkit by default, with GTK2 optionally enabled as a fallback. By passing the appropriate options to ./configure, it is possible to build Audacious in pure-Qt or pure-GTK2 mode (or with neither toolkit, for a headless music player “daemon”).

Most users should download the current stable release. Testing releases are likely to have problems and may not work at all. If you do install a testing release, please report any problems you find.

Current stable release: 4.2 (July 9, 2022)

Linux

Most Linux distributions provide Audacious in their package repositories. Please note that these packages can be out of date.

Debian, Ubuntu, Linux Mint

Users of Debian and its derivatives can install Audacious with apt-get:

apt-get install audacious

### Установить Audacious 4.0.2

### Пользователи Ubuntu могут установить Audacious 4 через PPA. Чтобы добавить этот PPA и установить Audacious в Ubuntu Systems, просто выполните следующие команды в терминале:

sudo add-apt-repository ppa:ubuntuhandbook1/apps

$ sudo apt-get update

$ sudo apt install audacious audacious-plugins

### Пакеты в этом PPA: смелый, ap-hotspot, awn-applet-radio, awn-applet-wm, calise, cmus, dockbarx, dockbarx-themes-extra, dropbox-share, изумруд, exaile, fbmessenger, gnome-subtitles, gnome -window-апплеты, grsync, grive, gthumb, launchpad-getkeys, mc, mdm (Диспетчер Mint Display), миниатюры, minitube, musique, notifyosdconfig, nautilus-columns, powertop, ppa-purge, rosa-media-player, fixed pulseaudio -equalizer, subtitleeditor, syncwall, umplayer, unit-reboot, wimlib, youtube-dl, xfce4-dockbarx-plugin, xournal, yad, yarock и другие. Почти все пакеты обновляются до последней версии.

Установка из *.tar.bz2

The file `configure.ac' (or `configure.in') is used to create

`configure' by a program called `autoconf'. You need `configure.ac' if

you want to change it or regenerate `configure' using a newer version

of `autoconf'.

`sudo apt-get install gtk2.0`

sudo apt update

sudo apt install qtbase5-dev

No package 'libxml-2.0' found

sudo `apt-get install libxml2-dev`

error: Missing dependency for FLAC support: flac >= 1.2.1

sudo apt install libflac-dev

You may need to install:

`sudo apt install libvorbis-dev`

and

`sudo apt build-dep libvorbis`

I

## nstall libmpg123-dev Using apt-get

Update apt database with `apt-get` using the following command.

`sudo apt-get update`

After updating apt database, We can install `libmpg123-dev` using `apt-get` by running the following command:

`sudo apt-get -y install libmpg123-dev`

`sudo apt-get -y install wavpack`

--without-wavpack

The simplest way to compile this package is:

1. `cd' to the directory containing the package's source code and type

`./configure' to configure the package for your system.

Running `configure' might take a while. While running, it prints

some messages telling which features it is checking for.

2. Type `make' to compile the package.

3. Optionally, type `make check' to run any self-tests that come with

the package, generally using the just-built uninstalled binaries.

4. Type `make install' to install the programs and any data files and

documentation. When installing into a prefix owned by root, it is

recommended that the package be configured and built as a regular

user, and only the `make install' phase executed with root

privileges.

5. Optionally, type `make installcheck' to repeat any self-tests, but

this time using the binaries in their final installed location.

This target does not install anything. Running this target as a

regular user, particularly if the prior `make install' required

root privileges, verifies that the installation completed

correctly.

6. You can remove the program binaries and object files from the

source code directory by typing `make clean'. To also remove the

files that `configure' created (so you can compile the package for

a different kind of computer), type `make distclean'. There is

also a `make maintainer-clean' target, but that is intended mainly

for the package's developers. If you use it, you may have to get

all sorts of other programs in order to regenerate files that came

with the distribution.

7. Often, you can also type `make uninstall' to remove the installed

files again. In practice, not all packages have tested that

uninstallation works correctly, even though it is required by the

GNU Coding Standards.

8. Some packages, particularly those that use Automake, provide `make

distcheck', which can by used by developers to test that all other

targets like `make install' and `make uninstall' work correctly.

This target is generally not run by end users.

Compilers and Options

=====================

Some systems require unusual options for compilation or linking that

the `configure' script does not know about. Run `./configure --help'

for details on some of the pertinent environment variables.

You can give `configure' initial values for configuration parameters

by setting variables in the command line or in the environment. Here

is an example:

./configure CC=c99 CFLAGS=-g LIBS=-lposix

*Note Defining Variables::, for more details.

Installation Names

==================

By default, `make install' installs the package's commands under

`/usr/local/bin', include files under `/usr/local/include', etc. You

can specify an installation prefix other than `/usr/local' by giving

`configure' the option `--prefix=PREFIX', where PREFIX must be an

absolute file name.

You can specify separate installation prefixes for

architecture-specific files and architecture-independent files. If you

pass the option `--exec-prefix=PREFIX' to `configure', the package uses

PREFIX as the prefix for installing programs and libraries.

Documentation and other data files still use the regular prefix.

In addition, if you use an unusual directory layout you can give

options like `--bindir=DIR' to specify different values for particular

kinds of files. Run `configure --help' for a list of the directories

you can set and what kinds of files go in them. In general, the

default for these options is expressed in terms of `${prefix}', so that

specifying just `--prefix' will affect all of the other directory

specifications that were not explicitly provided.

The most portable way to affect installation locations is to pass the

correct locations to `configure'; however, many packages provide one or

both of the following shortcuts of passing variable assignments to the

`make install' command line to change installation locations without

having to reconfigure or recompile.

The first method involves providing an override variable for each

affected directory. For example, `make install

prefix=/alternate/directory' will choose an alternate location for all

directory configuration variables that were expressed in terms of

`${prefix}'. Any directories that were specified during `configure',

but not in terms of `${prefix}', must each be overridden at install

time for the entire installation to be relocated. The approach of

makefile variable overrides for each directory variable is required by

the GNU Coding Standards, and ideally causes no recompilation.

However, some platforms have known limitations with the semantics of

shared libraries that end up requiring recompilation when using this

method, particularly noticeable in packages that use GNU Libtool.

The second method involves providing the `DESTDIR' variable. For

example, `make install DESTDIR=/alternate/directory' will prepend

`/alternate/directory' before all installation names. The approach of

`DESTDIR' overrides is not required by the GNU Coding Standards, and

does not work on platforms that have drive letters. On the other hand,

it does better at avoiding recompilation issues, and works well even

when some directory options were not specified in terms of `${prefix}'

at `configure' time.