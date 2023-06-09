Microsoft_Visual_Studio_2022_Ent_17.6.33712.159_(17.6.0)_(Offline_Cache)_[2023_Ru_En]

DiamondMonday http://forum.ru-board.com/topic.cgi?forum=35&bm=1&topic=47368&start=2800#lt
Microsoft Visual Studio 2022 17.6.0 (17.6.33712.159 Current)
 Full Off-Line Content ENU-RUS (3 Editions + Updated Tools) by W.Z.T. (2023/05/13):
https://cloud.mail.ru/public/SrkU/BQJyJMCGm 

Microsoft Visual Studio 2022 LTSC 17.6.0 (17.6.33712.159 LTSC)
 Full Off-Line Content ENU-RUS (2 Editions + Tools) by W.Z.T. (2023/05/13):
https://cloud.mail.ru/public/SrkU/BQJyJMCGm

17.6.33712.159_(17.6.0)
"https://cloud.mail.ru/public/SrkU/BQJyJMCGm/17.6.33712.159 (17.6.0)"
https://cloud.mail.ru/public/SrkU/BQJyJMCGm
http://riperam.org/raznoe-sistemi/microsoft-visual-studio-2022-enterprise-17-6-0-offline-cache-t381440.html

контрольные суммы образа:
CRC32: AC5A2430
MD5: 446B66FD99AE27917FEC2D31230C889A
SHA-1: 9A5E39F65C97349CB503F9F2EC527DA392094EC8

Лечение:
Вариант 1. Запустите AutoRun, в меню автоматическая активация выберите опцию Лицензионный ключ и запустите установщик.
Вариант 2. Запустите AutoRun, нажмите на поле Скопировать лицензионный ключ, после установки Visual Studio запустите её, перейдите
в меню [Справка] --> [Зарегистрировать Visual Studio] --> Разблокировать с помощи ключа продукта (вставьте ключ с буфера и нажмите
кнопку применить)

Microsoft Visual Studio 2022 (v17)
 
Visual Studio 2022
Enterprise :
VHF9H-NXBBB-638P6-6JHCY-88JWH

Professional:
TD244-P4NB7-YQ6XK-Y8MMM-YWV2J

Microsoft Visual Studio 2022 Enterprise (Online Installer)	VHF9H-NXBBB-638P6-6JHCY-88JWH	   
Microsoft Visual Studio 2022 Professional (Online Installer)	TD244-P4NB7-YQ6XK-Y8MMM-YWV2J	   
Microsoft Visual Studio 2022 Community (Online Installer)	N/A

Microsoft Visual Studio 2022 17.1.0 (17.1.32210.238 Current) Full Off-Line Content ENU-RUS (3 Editions + Updated Tools) by W.Z.T. (2022/02/11):

https://twitter.com/DiamondMonday/status/1495466637348200453

[Компиляция с помощью коммандной строки:](http://forum.ru-board.com/topic.cgi?forum=5&topic=48937&start=60#lt)
------------------------------------------------------------------------------------

EWDK with Visual Studio Build Tools 17.1.5
EWDK — это автономная среда командной строки для создания драйверов. В нее включена последняя версия Visual Studio Build Tools, пакета SDK и WDK.  
Чтобы приступить к работе, подключите ISO-файл и выполните LaunchBuildEnv

https://software-static.download.prss.microsoft.com/dbazure/988969d5-f34g-4e03-ac9d-1f9786c66749/EWDK_ni_release_svc_prod1_22621_220804-1759.iso

Для сборки драйверов этого хватает, однако, для компиляции обычных файлов я набросал bat-файл (только для Intel, для других платформ можно легко сделать по аналогии). **Внимание: если нужна работа только с компилятором C/C++, или Microsoft Macro Assembler, запускать LaunchBuildEnv нет необходимости!**  
Существует OpenSource программа для монтирования ISO-файлов в Windows 7/8 (Windows 10 умеет монтировать сама, выбираем в контекстном меню на имени файла пункт **"Подключить"**) --- [WinCDEmu](https://github.com/sysprogs/WinCDEmu/releases/download/v4.1/PortableWinCDEmu-4.0.exe), программа **легкая** (весит около 600 Кб), **портабельная**, т. е. **не требует установки**, не говоря о том, что исходные коды открыты. Естественно, требуется администраторский доступ, и это, пожалуй, ее единственный недостаток. Эта программа может все-таки пригодиться в Windows 10 --- обнаружилось, что WinRar или UltraISO захватывают пункт меню **"Подключить"**, рисуя вместо него малополезную команду **"Открыть"**  
Модификация bat-файла  
**vc.bat**  
**Код:**
```
@echo off  
set VER=%1  
if "%VER%" == "32" set LIBVER=86  
if "%VER%" == "64" set LIBVER=64  
set "VSROOT=**D**:\Program Files"  
set "WDKLIBVER=**10.0.22621.0**"  
set "BUILDTOOLSPATH=%VSROOT%\Microsoft Visual Studio\**2022**\BuildTools"  
set "WDKROOT=%VSROOT%\Windows Kits\10"  
set "WDKLIB=%WDKROOT%\Lib\%WDKLIBVER%"  
call "%BUILDTOOLSPATH%\VC\Auxiliary\Build\vcvars%VER%.bat"  
set "INCLUDE=%WDKROOT%\Include\%WDKLIBVER%\ucrt;%INCLUDE%"  
set "LIB=%WDKLIB%\ucrt\x%LIBVER%;%WDKLIB%\um\x%LIBVER%;%LIB%"
```

Опять же, 5-ю строчку надо редактировать под ваши реалии: букву диска меняем на ту, которую имеет смонтированный ISO-файл. **Совет:** файл vc.bat поместите в каталог, скажем, D:\Programs\bin, и добавьте эту же путь в системную переменную PATH (программу PortableWinCDEmu-4.0.exe также стоит поместить в этот же каталог). Тогда командную строку для компиляции можно запустить так:  
**Код:**

vc 32 | 64

Дальше пользуем команду cl  
**Цитата:**
C:\User\Asm>vc 64  
**********************************************************************  
** Visual Studio 2022 Developer Command Prompt v17.1.5  
** Copyright (c) 2022 Microsoft Corporation  
**********************************************************************  
[vcvarsall.bat] Environment initialized for: 'x64'  
   
C:\User\Asm>cl  
Microsoft (R) C/C++ Optimizing Compiler Version 19.31.31107 for x64  
Copyright (C) Microsoft Corporation.  All rights reserved.     
usage: cl [ option... ] filename... [ /link linkoption... ]  
   
Microsoft Macro Assembler запускаем так:  
**Код:**
ml | ml64

  
**Цитата:**
C:\User\Asm>ml64  
Microsoft (R) Macro Assembler (x64) Version 14.31.31107.0  
Copyright (C) Microsoft Corporation.  All rights reserved.  
   
usage: ML64 [ options ] filelist [ /link linkoptions]  
Run "ML64 /help" or "ML64 /?" for more info

Господа, по EWDK сообщаю, что очень легко можно отсечь все вам ненужные ATL/MFC (минус 4.1 GB), а также ненужные процессорные платформы (минус еще около 6 GB). В итоге, если даже оставить spectre, **оставшийся объем будет около 5.4 GB**. Процесс отсечения лишнего очень быстрый  
   
**Victor_VG**  
Кстати, Process Hacker легко собирается с EWDK без лишних телодвижений. Ничего устанавливать не надо, админский доступ не нужен

Как известно, в течение длительного времени Microsoft C/C++ компилятор невозможно было использовать без массивной (нынче уже монструозной и, к сожалению, жутко глюкавой) IDE; времена QuickC в счет не берем. Между тем, во многих ситуациях требуется компилятор в классическом виде, без излишеств.  
В 2003 Microsoft выпустила продукт под названием Microsoft Visual C++ Toolkit 2003, в настоящее время его можно нагуглить, но с официального сайта фирма, следуя своей не лучшей традиции, его удалила.  
   
Раньше можно было использовать также пакет Windows Driver Kit (WDK), в состав которого, до 8-й версии, входил компилятор.  
   
В 2015г. был, наконец, анонсирован, а затем выпущен продукт [Visual C++ Build Tools 2015](http://landinghub.visualstudio.com/visual-cpp-build-tools), который представляет собой набор инструментальных стредств (C++ компилятор, компоновщик и другие вспомогательные утилиты, библиотеки и заголовочные файлы, скрипты для сборки, различные версии Windows SDK, впрочем последние можно и не устанавливать) для сборки C++ приложений и библиотек для настольных версий Windows, причем устанавливать Visual Studio не требуется. Этот пакет требует .NET Framework версии 4.5.1 и выше.  

Состав:    
-      Visual C++ Compilers (targeting x86, X64 and ARM)  
    
-      Visual C++ headers & libraries (CRT & STL)  
    
-      Visual C++ build scripts (targeting Windows desktop)  
    
-      Microsoft Build Tools 2015 (MSBuild)  
    
-      Windows SDK 8.1 (optional, on by default)  
    
-      Windows SDK 10 (optional, off by default)  
    
-      C++ Build tools specific command prompts  
    
-      MFC and ATL (added with VS 2015 Update 3)  
    

Этот продукт можно скачать на сайте компании в виде 3-х мегабайтного Web-установщика. Конечно, для установки на несколько компьютеров вариант online-установки не подходит. Для offline-установки скачанный Web-установщик надо запустить с ключом /layout --- в этом случае установщик скачает все необходимые компоненты в указанный каталог для последующей установки уже в offline-режиме, но уже с ключом /NoWeb; общий размер загруженных файлов составляет примерно 1,7 Гб.  
   
Как утверждается на сайте Microsoft, фирма, учитывая высокую стоимость (в смысле трудозатрат) индивидуальных установок Visual Studio 2015 и WDK для организаций с большим количеством разработчиков, выпустила специальную версию уже упомянутого пакета Windows Driver Kit (WDK) под названием [Enterprise Windows Driver Kit](http://developer.microsoft.com/ru-ru/windows/hardware/license-terms-enterprise-wdk) (Enterprise WDK), основанный на Enterprise-редакции Visual Studio 2015, WDK, и Windows SDK. В составе Enterprise WDK также нет визуальной среды разработки --- предлагается только интерфейс командной строки. Enterprise WDK версии 10 включает в свой состав:  
• Visual Studio Build Tools, C/C++ компилятор, компоновщик (linker) и объектные библиотеки (lib) из Visual Studio сборки 14.00.24720.0 (VS 2015 Update 1)  
• Windows SDK сборки 10586.13    
• .NET Framework 4.6 SDK сборки 10586.13    
• Windows Driver Development Kit сборки 10586.0  
   
Таким образом, Enterprise WDK содержит все необходимое для сборки драйверов и базовых тестовых Win32-приложений. Установка продукта крайне проста --- в соответствии с заявленными целями он поставляется в виде единственного zip-файла "весом" около 1,8 Гб, который надо просто распаковать и запустить скрипт настройки от имени администратора. Распакованный архив занимает уже около 5,7 Гб.  
   
Подчеркнем еще раз, что эти продукты имеют интерфейс командной строки --- никакой визуальной среды разработки, даже простого редактора кода, в своем составе они не имеют.  
   
Преимущества и недостатки  
**1. Visual C++ Build Tools 2015**  
Неудобная загрузка --- инсталлятор часто глючит  
Необходим администраторский доступ для установки, следовательно, при переустановке системы надо заново устанавливать  
   
**2. Enterprise Windows Driver Kit (EWDK)**  
Легкая загрузка --- качаем единственный zip-архив  
   
Формально, как написано в [официальном сайте](http://msdn.microsoft.com/windows/hardware/drivers/develop/installing-the-enterprise-wdk), для запуска скриптов необходим администраторский доступ, но можно работать и без этого; как --- опишу ниже. Официальный сайт предлагает пользоваться утилитой MSBuild, но в этом случае, чтобы скомпилировать даже простой "проект" "Hello, world", надо составить файл проекта .vcxproj, причем формат этого файла кое-в-чем отличается от, так скажем, стандартного. В статье [Walkthrough: Using MSBuild to Create a Visual C++ Project](http://msdn.microsoft.com/en-us/library/dd293607.aspx) приводится пример такого файла  
[Подробнее...](http://forum.ru-board.com/topic.cgi?forum=5&topic=48937&start=0&limit=1&m=1#1) [?]  
Однако, этот файл, скажем так, несколько устарел. Ниже приведен модифицированный мной пример MyTest.vcxproj  
[Подробнее...](http://forum.ru-board.com/topic.cgi?forum=5&topic=48937&start=0&limit=1&m=2#1) [?]  
Теперь можно и собирать:  
MSBuild MyTest.vcxproj /p:configuration=release /p:platform=Win32  
   
Теперь кратко (только для двух платформ, для других можно попробовать аналогичным образом) опишу, как заставить "работать" EWDK **без администраторского доступа** и **без** утилиты MSBuild (эта информация устарела и будет отредактировано)  
[Подробнее...](http://forum.ru-board.com/topic.cgi?forum=5&topic=48937&start=0&limit=1&m=3#1) [?]  
   
И еще: **nmake** тоже наличествует  
   
На всякий случай, история выпусков:  
[https://developer.microsoft.com/ru-ru/windows/hardware/license-terms-enterprise-wdk](https://developer.microsoft.com/ru-ru/windows/hardware/license-terms-enterprise-wdk)  
[https://docs.microsoft.com/en-us/legal/windows/hardware/enterprise-wdk-license-2015](https://docs.microsoft.com/en-us/legal/windows/hardware/enterprise-wdk-license-2015)  
EWDK for Windows 10, version 1607 with Visual C++ Build Tools 2015  
EWDK for Windows 10, version 1703 with Visual C++ Build Tools 2015  
[https://developer.microsoft.com/ru-ru/windows/hardware/license-terms-EWDK](https://developer.microsoft.com/ru-ru/windows/hardware/license-terms-EWDK)  
[https://docs.microsoft.com/en-us/legal/windows/hardware/enterprise-wdk-license-2017](https://docs.microsoft.com/en-us/legal/windows/hardware/enterprise-wdk-license-2017)  
EWDK for Windows 10, version 1709 with Visual Studio Build Tools 15.2  
EWDK for Windows 10, version 1709 with Visual Studio Build Tools 15.4  
EWDK for Windows 10, version 1709 with Visual Studio Build Tools 15.6  
EWDK for Windows 10, version 1803 with Visual Studio Build Tools 15.6  
EWDK for Windows 10, version 1803 with Visual Studio Build Tools 15.7  
EWDK for Windows 10, version 1809 with Visual Studio Build Tools 15.8  
EWDK for Windows 10, version 1809 with Visual Studio Build Tools 15.8.9  
[https://developer.microsoft.com/ru-ru/windows/hardware/license-terms-EWDK-2](https://developer.microsoft.com/ru-ru/windows/hardware/license-terms-EWDK-2)  
[https://docs.microsoft.com/en-us/legal/windows/hardware/enterprise-wdk-license-2019](https://docs.microsoft.com/en-us/legal/windows/hardware/enterprise-wdk-license-2019)  
EWDK for Windows 10, version 1903 with Visual Studio Build Tools 16.0  
EWDK for Windows 10, version 2004 with Visual Studio Build Tools 16.7  
EWDK for Windows Server 2022 with Visual Studio Build Tools 16.9.2  
[https://docs.microsoft.com/en-us/legal/windows/hardware/enterprise-wdk-license-2019-New](https://docs.microsoft.com/en-us/legal/windows/hardware/enterprise-wdk-license-2019-New)  
Windows 11 EWDK with Visual Studio Build Tools 16.9.2  
Windows 11 EWDK with Visual Studio Build Tools 16.11.10  
[https://learn.microsoft.com/en-us/legal/windows/hardware/enterprise-wdk-license-2022](https://learn.microsoft.com/en-us/legal/windows/hardware/enterprise-wdk-license-2022)  
Windows 11, version 22H2 EWDK with Visual Studio Build Tools 17.1.5  
   
Также полезная информация: иногда требуется указать в командной строке для MSBuild значение параметра PlatformToolset [Подробнее...](http://forum.ru-board.com/topic.cgi?forum=5&topic=48937&start=0&limit=1&m=4#1) [?]



