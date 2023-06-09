grep

====

Создан Четверг 23 сентября 2021

[https://git.savannah.gnu.org/cgit/grep.git/snapshot/grep-3.7.tar.gz](https://git.savannah.gnu.org/cgit/grep.git/snapshot/grep-3.7.tar.gz)

[http://ftp.gnu.org/gnu/grep/grep-3.7.tar.xz](http://ftp.gnu.org/gnu/grep/grep-3.7.tar.xz)

wget [https://git.savannah.gnu.org/cgit/grep.git/snapshot/grep-3.7.tar.gz](https://git.savannah.gnu.org/cgit/grep.git/snapshot/grep-3.7.tar.gz)

wget [http://ftp.gnu.org/gnu/grep/grep-3.7.tar.xz](http://ftp.gnu.org/gnu/grep/grep-3.7.tar.xz)

./configure

make

sudo make install

=================================================

./bootstrap

или

./autogen.sh

Если таких скриптов в архиве не оказалось, то можно выполнить последовательно следующие команды:

aclocal

autoheader

automake --gnu --add-missing --copy --foreign

autoconf -f -Wall

=================================================

./configure && make && make install

The file 'configure.ac' (or 'configure.in') is used to create

'configure' by a program called 'autoconf'. You need 'configure.ac' if

you want to change it or regenerate 'configure' using a newer version of

'autoconf'.

The simplest way to compile this package is:

1. 'cd' to the directory containing the package's source code and type

'./configure' to configure the package for your system.

Running 'configure' might take a while. While running, it prints

some messages telling which features it is checking for.

2. Type 'make' to compile the package.

3. Optionally, type 'make check' to run any self-tests that come with

the package, generally using the just-built uninstalled binaries.

4. Type 'make install' to install the programs and any data files and sudo make install

documentation. When installing into a prefix owned by root, it is

recommended that the package be configured and built as a regular

user, and only the 'make install' phase executed with root

privileges.

5. Optionally, type 'make installcheck' to repeat any self-tests, but

this time using the binaries in their final installed location.

This target does not install anything. Running this target as a

regular user, particularly if the prior 'make install' required

root privileges, verifies that the installation completed

correctly.

6. You can remove the program binaries and object files from the

source code directory by typing 'make clean'. To also remove the

files that 'configure' created (so you can compile the package for

a different kind of computer), type 'make distclean'. There is

also a 'make maintainer-clean' target, but that is intended mainly

for the package's developers. If you use it, you may have to get

all sorts of other programs in order to regenerate files that came

with the distribution.

7. Often, you can also type 'make uninstall' to remove the installed

files again. In practice, not all packages have tested that

uninstallation works correctly, even though it is required by the

GNU Coding Standards.

8. Some packages, particularly those that use Automake, provide 'make

distcheck', which can by used by developers to test that all other

targets like 'make install' and 'make uninstall' work correctly.

This target is generally not run by end users.

Compilers and Options

=====================

Some systems require unusual options for compilation or linking that

the 'configure' script does not know about. Run './configure --help'

for details on some of the pertinent environment variables.

You can give 'configure' initial values for configuration parameters

by setting variables in the command line or in the environment. Here is

an example:

./configure CC=c99 CFLAGS=-g LIBS=-lposix

*Note Defining Variables::, for more details.

ls /usr/share/applications

===========================================

[https://t.me/srv_admin/1833](https://t.me/srv_admin/1833)

Рассмотрел уже много различных скриптов и консольных команд на канале. Почти везде так или иначе используется утилита grep. Отдельно её ни разу не рассматривал и сейчас хочу это исправить.

Какой Linux админ не любит хорошенько грепнуть? Наравне с cat это, пожалуй, самая популярная консольная утилита, которую используешь постоянно. Буквально каждый день. Почти любой консольный вывод я грепаю, чтобы получить только нужную информацию.

Ниже несколько примеров не самых распространённых использований grep, но при этом полезных. Основной функционал, думаю, и так все знают.

Исключение из вывода части строки:

# echo 'raz_dva_tri' | grep -Po '\Kdva_tri'

dva_tri

Начало фразы raz_ вырезали. Здесь используются два ключа: P (perl-regexp) - использование регулярного выражение Perl, o (only-matching) - возвращает только совпадение с образцом. \K - регулярка, которая отбрасывает всё, что перед ней.

Проверка файла на наличие pattern.

# grep 'pattern' file > /dev/null && echo 'String Found'

# grep -q 'pattern' file && echo 'String Found'

Если pattern не будет найден в файле, конструкция && не сработает.

Посчитать количество совпадений pattern в файле:

# grep -c pattern file

Рекурсивный поиск файлов, где найден шаблон:

# grep -lr 'pattern' /web/site.ru

И обратная история, когда нужно вывести файлы, которые не содержат шаблон:

# grep -Lr 'pattern' /web/site.ru

Опять рекурсивный поиск по директории, только выводим не имена файлов, а все совпадающие строки:

# grep -hr 'pattern' /var/log

Бывает нужно когда какой-то ip пробиваешь по нескольким логам.

Когда через grep нужно вывести символы регулярных выражений, их нужно экранировать \ или использовать ключ F (fixed-strings):

# cat /var/log/syslog | grep 'systemd\[1]'

# cat /var/log/syslog | grep -F 'systemd[1]'

Да, я знаю, что не надо тут использовать cat, но я привык. Правильнее сделать так:

# grep -F 'systemd[1]' /var/log/syslog

Ничего не могу с собой поделать. Использую всегда с cat. Причина проста - не всегда нужен grep, а смотреть что-то в консоли я привык через cat. Так что мне проще сначала сделать просто cat, а потом грепнуть вывод в случае необходимости.

Ещё одна полезная опция grep - i (ignore-case) игнорировать регистр шаблона. Будут найдены и заглавные, и строчные совпадения.

# grep -i 'Page.html' /web/site

Вывести рядом с найденной строкой 2 до и 2 после:

# last | grep -A2 -B2 'reboot'

#bash #terminal

================================================

![file://e:/Temp/app/.SBYMW1/1.png](file://e:/Temp/app/.SBYMW1/1.png)