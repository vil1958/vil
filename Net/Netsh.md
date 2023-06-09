[##### Netsh Commands for Windows Hypertext Transfer Protocol (WINHTTP)](https://learn.microsoft.com/ru-ru/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc731131(v=ws.10))
---
tags: net, proxy, netsh
---

В ОС Windows XP/2003 WinHttp прокси задавался с помощью утилиты ==proxycfg.exe==. В новых ОС Windows Vista/7/2008 данная утилита упразднена и [настройка WinHttp прокси выполняется при помощи команды **netsh**](https://winitpro.ru/index.php/2011/02/14/sistemnyj-proksi-v-windows-2008-i-windows-7/).

You can use commands in the **netsh winhttp** context to configure proxy and tracing settings for Windows HTTP. The Netsh commands for **winhttp** can be run manually at the netsh prompt or in scripts and batch files.

To run these commands from the command prompt, you must either enter the **netsh winhttp** context or prepend the context to the command. For example, if you are at the command prompt but have not typed **netsh** and then **winhttp** to enter the **netsh winhttp** context, you must type:

**netsh winhttp** _command_

Where _command_ is the command that you want to run, including all of the required parameters for the command.

For information on how to interpret netsh command syntax, see [Formatting Legend](https://learn.microsoft.com/ru-ru/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc725755(v=ws.10)).

This section contains the following commands:

-   flush logbuffer
-   import proxy
-   reset proxy
-   reset tracing
-   set proxy
-   set tracing
-   show proxy
-   show tracing

Текущие настройки ProXY:
`Netsh winhttp show proxy`

Установить ProXY:
```
Netsh winhttp set proxy proxy-server="http=127.0.0.1:12346;https=127.0.0.1:12346;ftp=127.0.0.1:12346;socks=127.0.0.1:12345" bypass-list="10.*;172.16.*;172.17.*;172.18.*;172.19.*;172.20.*;172.21.*;172.22.*;172.23.*;172.24.*;172.25.*;172.26.*;172.27.*;172.28.*;172.29.*;172.30.*;172.31.*;192.168.*;169.254.*;[fc*];[fd*];[fe8*];[fe9*];[fea*];[feb*];<local>"
```

`Netsh winhttp set proxy proxy-server="http=127.0.0.1:12346;https=127.0.0.1:12346" bypass-list="<local>"`

Очистить ProXY:
`Netsh winhttp reset proxy`

Как вариант, если вы хотите взять настройки прокси из Internet Explorer, можно воспользоваться командой:
`netsh winhttp import proxy source=ie`

Как вариант возможна также ситуация, когда необходимо перенаправить весь трафик, кроме трафика на Microsoft (системные обновления, активация) на прокси-сервер, тогда можно воспользоваться следующей командой обхода прокси для обновлений Windows.

Сделайте обход прокси для активации и обновлений вот так:
`netsh winhttp set proxy proxy-server="your-proxy-srv:3128" bypass-list="*.windowsupdate.com;*.microsoft.com"`

Текущие настройки WinHttp можно посмотреть командой:
`netsh winhttp show proxy`

Сбросить же настройки прокси сервера можно при помощи команды:
`Netsh winhttp reset proxy`




