#alias #doskey
##### [Создание alias команд под Windows](https://antonshell.me/post/windows-doskey-aliases)

В процессе работы web-программисту часто приходится пользоваться командной строкой. Это может быть работа с git, установка библиотек через npm или commposer. Создание шаблона приложения. Очистка кэша web-приложения. Управление миграциями базы данных и т.д.

В таком случае могут возникнуть 2 проблемы. Во-первых нужно постоянно печатать повторяющиеся команды. Либо копировать откуда-то. Во вторых нужно помнить эти самые команды. Что тоже бывает сложно. Например команда создания миграции в symfony 3 выглядит так.
`php bin/console doctrine:migrations:generate`

В какой-то момент это все надоедает и хочется создать сокращения для команд. Под Windows можно сделать с помощью doskey.

Alias можно создать такой командой. Однако это работает только для текущей сессии.
`doskey gs=git status`

Если хочется создать много алиасов, имеет смысл создать .bat файл и записать туда все алиасы. Сохранить файл в удобном месте, например так:
`C:\doskey\doskey.bat`

Далее нужно сделать так, чтобы все это применялось автоматически при старте системы. Для этого нужно зайти в редактор реестра, выполнив команду regedit.
```
regedit
```

Далее найти ключ `HKEY_CURRENT_USER\Software\Microsoft\Command Processor\Autorun` и установить путь к .bat файлу.

`HKEY_CURRENT_USER\Software\Microsoft\Command Processor\Autorun`
`C:\doskey\doskey.bat`

![](https://antonshell.me/resources/img/posts/windows-doskey-aliases/2.jpg)

Все, можно пользоваться алиасами. Мой список alias выглядит так:

```
@echo off
 
DOSKEY ls=dir
 
doskey gs=git status
doskey gaa=git add -A
doskey gpl=git pull
doskey gps=git push
doskey gc=git commit $*
doskey gcm=git commit $*
doskey gck=git checkout $*
doskey gbr=git branch
doskey gmg=git merge $*
 
doskey ymg=php yii migrate $*
doskey ymgc=php yii migrate/create $*
doskey ymgd=php yii migrate/down $*
 
doskey yfxl=php yii fixture/load $*
 
doskey sfmgc=php bin/console doctrine:migrations:generate $*
doskey sfmg=php bin/console doctrine:migrations:migrate $*
 
doskey updb_cabinet = C:\doskey\scripts\updateCabinetDb.bat
doskey mysqldump = C:\xampp\mysql\bin\mysqldump.exe -uroot -p $*
```

Список включает в себя наиболее часто используемые команды git, команды yii, symfony. Также некоторые команды для работы с mysql. Список обновляется по мере использования мною новых технологий, фреймворков и т.д.

Если нужно добавить сложную составную команду, рекомендую вынести ее в отдельный .bat файл и сделать алиас на него.

#### [Aliases in Windows command prompt](https://stackoverflow.com/questions/20530996/aliases-in-windows-command-prompt)
you may make the alias(es) _persistent_ with the following steps,

1. Create a .bat or .cmd file with your `DOSKEY` commands.
    
2. Run regedit and go to `HKEY_CURRENT_USER\Software\Microsoft\Command Processor`
    
3. Add String Value entry with the name `AutoRun` and the _full_ path of your .bat/.cmd file.
    
    For example, `%USERPROFILE%\alias.cmd`, replacing the initial segment of the path with `%USERPROFILE%` is useful for syncing among multiple machines.
    

This way, every time cmd is run, the aliases are loaded
**For Windows 10 or Windows 11**, add the entry to `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor` instead.

(For Windows 11, also note that by default the "Terminal App" points to PowerShell. Search "cmd" for command prompt.)

For completeness, here is a template to illustrate the kind of aliases one may find useful.
```
@echo off

:: Temporary system path at cmd startup

set PATH=%PATH%;"C:\Program Files\Sublime Text 2\"

:: Add to path by command

DOSKEY add_python26=set PATH=%PATH%;"C:\Python26\"
DOSKEY add_python33=set PATH=%PATH%;"C:\Python33\"

:: Commands

DOSKEY ls=dir /B $*
DOSKEY sublime=sublime_text $*  
    ::sublime_text.exe is name of the executable. By adding a temporary entry to system path, we don't have to write the whole directory anymore.
DOSKEY gsp="C:\Program Files (x86)\Sketchpad5\GSP505en.exe"
DOSKEY alias=notepad %USERPROFILE%\Dropbox\alias.cmd

:: Common directories

DOSKEY dropbox=cd "%USERPROFILE%\Dropbox\$*"
DOSKEY research=cd %USERPROFILE%\Dropbox\Research\
```
- Note that the `$*` syntax works after a directory string as well as an executable which takes in arguments. So in the above example, the user-defined command `dropbox research` points to the same directory as `research`.
- As Rivenfall pointed out, it is a good idea to include a command that allows for convenient editing of the `alias.cmd` file. See `alias` above. If you are in a cmd session, enter `cmd` to restart cmd and reload the `alias.cmd` file.

---

When I searched the internet for an answer to the question, somehow the discussions were either focused on persistence only or on some usage of DOSKEY only. I hope someone will benefit from these two aspects being together here!

---

Here's a `.reg` file to help you install the `alias.cmd`. It's set now as an example to a dropbox folder as suggested above.

```
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Microsoft\Command Processor]
"AutoRun"="%USERPROFILE%\\alias.cmd"
```
For single-user applications, the above will do. Nevertheless, there are situations where it is necessary to check whether `alias.cmd` exists first in the registry key. See example below.

In a `C:\Users\Public\init.cmd` file hosting potentially cross-user configurations:

```
@ECHO OFF
REM Add other configurations as needed
IF EXIST "%USERPROFILE%\alias.cmd" ( CALL "%USERPROFILE%\alias.cmd" )
```

The registry key should be updated correspondly to `C:\Users\Public\init.cmd` or, using the `.reg` file:

```
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Microsoft\Command Processor]
"AutoRun"="C:\\Users\\Public\\init.cmd"
```

#### [Aliases for Windows CLI (cmd.exe)](https://github.com/azurre/windows-cmd-aliases)

The Windows shell (cmd.exe) doesn't support aliases by default. But we can make it work with them using the doskey utility. Doskey is a part of the Windows so you don't need to install anything else.

## [](https://github.com/azurre/windows-cmd-aliases#installation)Installation

- Download latest [https://github.com/azurre/windows-cmd-aliases/archive/master.zip](https://github.com/azurre/windows-cmd-aliases/archive/master.zip)
- [[windows-cmd-aliases-master.zip]]
- run install.bat

#### [Doskey](https://learn.microsoft.com/ru-ru/previous-versions/windows/it-pro/windows-xp/bb490894(v=technet.10))

Calls Doskey.exe, which recalls Windows XP commands, edits command lines, and creates macros.

[](https://learn.microsoft.com/ru-ru/previous-versions/windows/it-pro/windows-xp/bb490894(v=technet.10)#syntax)

### Syntax

**doskey** {**/reinstall** | **/listsize=**_size_ | **/macros:**[{**all** | _exename_}] | **/history** | **/insert** | **/overstrike** | **/exename=**_exename_ | **/macrofile=**_FileName_ | _macroname_**=**[_text_]}

[](https://learn.microsoft.com/ru-ru/previous-versions/windows/it-pro/windows-xp/bb490894(v=technet.10)#parameters)

### Parameters

**/reinstall**   **:** Installs a new copy of Doskey.exe. Clears the command history buffer.

**/listsize=** _**size**_   **:** Specifies the maximum number of commands in the history buffer.

**/macros** **:** Displays a list of all **doskey** macros. You can use a redirection symbol (>) with **/macros** to redirect the list to a file. You can abbreviate **/macros** to **/m**.

**all**   **:** Displays **doskey** macros for all executables.

_**exename**_   **:** Displays **doskey** macros for the specified executable.

**/history**   **:** Displays all commands stored in memory. You can use a redirection symbol (>) with **/history** to redirect the list to a file. You can abbreviate **/history** as **/h**.

**{** **/insert** **|** **/overstrike** **}** **:** Specifies whether new text you type is to replace old text. If you use **/insert**, new text that you type on a line is inserted into old text (that is, as if you pressed the INSERT key). If you use **/overstrike**, new text replaces old text. The default setting is **/overstrike**.

**/exename=** _**exename**_   **:** Specifies the program (that is, executable) in which the **doskey** macro runs.

**/macrofile=** _**FileName**_   **:** Specifies a file containing macros that you want to install.

_**macroname**_ **=** **[** _**text**_ **]** **:** Creates a macro that carries out the commands specified by _text_. _Macroname_ specifies the name you want to assign to the macro. _Text_ specifies the commands you want to record. If _text_ is left blank, _macroname_ is cleared of any assigned commands.

**/?**   **:** Displays help at the command prompt.

[](https://learn.microsoft.com/ru-ru/previous-versions/windows/it-pro/windows-xp/bb490894(v=technet.10)#remarks)

### Remarks

- Using Doskey.exe
    
    Doskey.exe is always available for all character-based, interactive programs (such as program debuggers or file transfer programs), and maintains a command history buffer and macros for each program that it starts. You cannot use **doskey** command-line options from a program. You must run **doskey** command-line options before you start a program. Program key assignments override **doskey** key assignments.
    
- Recalling a command
    
    To recall a command, you can use any of the following keys after starting Doskey.exe. If you use Doskey.exe within a program, that program's key assignments take precedence.
    
    |Key|Description|
    |---|---|
    |UP ARROW|Recalls the command you used before the one displayed.|
    |DOWN ARROW|Recalls the command you used after the one displayed.|
    |PAGE UP|Recalls the oldest command you used in the current session.|
    |PAGE DOWN|Recalls the most recent command you used.|
    
- Editing the command line
    
    With Doskey.exe, you can edit the current command line. If you use Doskey.exe within a program, that program's key assignments take precedence and some Doskey.exe editing keys might not work.
    
    The following table lists **doskey** editing keys and their functions.
    
    |Key or key combination|Description|
    |---|---|
    |LEFT ARROW|Moves the insertion point back one character.|
    |RIGHT ARROW|Moves the insertion point forward one character.|
    |CTRL+LEFT ARROW|Moves the insertion point back one word.|
    |CTRL+RIGHT ARROW|Moves the insertion point forward one word.|
    |HOME|Moves the insertion point to the beginning of the line.|
    |END|Moves the insertion point to the end of the line.|
    |ESC|Clears the command from the display.|
    |F1|Copies one character from the same column in the template to the same column in the Command Prompt window. (The template is a memory buffer that holds the last command you typed.)|
    |F2|Searches forward in the template for the next key you type after pressing F2. Doskey.exe inserts the text from the template up to, but not including, the character you specify.|
    |F3|Copies the remainder of the template to the command line. Doskey.exe begins copying characters from the position in the template that corresponds to the position indicated by the insertion point on the command line.|
    |F4|Deletes characters from the current insertion point position up to a character you specify. To use this editing key, press F4 and type a character. Doskey.exe deletes the characters from the current insertion point position to the first letter specified.|
    |F5|Copies the template into the current command line.|
    |F6|Places an end-of-file character (that is, CTRL+Z) at the current insertion point position.|
    |F7|Displays all commands for this program stored in memory in a pop-up box. Use the UP ARROW key and the DOWN ARROW key to select the command you want, and press ENTER to run the command. You can also note the sequential number in front of the command and use this number in conjunction with the F9 key.|
    |ALT+F7|Deletes all commands stored in memory for the current history buffer.|
    |F8|Displays all commands in the history buffer that start with the characters in the current command.|
    |F9|Prompts you for a history buffer command number, then displays the command associated with the number you specify. Press ENTER to run the command. To display all the numbers and their associated commands, press F7.|
    |ALT+F10|Deletes all macro definitions.|
    
- Using **doskey** within a program
    
    Certain character-based, interactive programs, such as program debuggers or file transfer programs (FTP), automatically use Doskey.exe. To use Doskey.exe, a program must be a console process and use buffered input. Program key assignments override **doskey** key assignments. For example, if the program uses the F7 key for some function, you cannot get a **doskey** command history in a pop-up window.
    
    With Doskey.exe you can maintain a command history for each program you start, repeat and edit previous commands at the program's prompt, and start **doskey** macros created for the program. If you exit and then restart a program from the same Command Prompt window, the command history from the previous program session is available.
    
    You must run Doskey.exe before you start a program. You cannot use **doskey** command-line options from a program's command prompt, even if the program has a shell command.
    
    If you want to customize how Doskey.exe works with a program and create **doskey** macros for that program, you can create a batch program that modifies Doskey.exe and starts the program.
    
- Specifying a default insert mode
    
    If you press the INSERT key, you can type text on the **doskey** command line in the middle of old text without replacing the old text. However, after you press ENTER, Doskey.exe returns your keyboard to replace mode. You must press INSERT again to return to insert mode.
    
    Use **/insert** to switch your keyboard to insert mode each time you press ENTER. Your keyboard effectively remains in insert mode until you use **/overstrike**. You can temporarily return to replace mode by pressing the INSERT key, but after you press ENTER, Doskey.exe returns your keyboard to insert mode.
    
    The insertion point changes shape when you use the INSERT key to change from one mode to the other.
    
- Creating a macro
    
    You can use Doskey.exe to create macros that carry out one or more commands. The following table lists special characters you can use to control command operations when you define a macro.
    
    |Character|Description|
    |---|---|
    |$G or $g|Redirects output. Use either of these special characters to send output to a device or a file instead of to the screen. This character is equivalent to the redirection symbol for output (>).|
    |$G$G or $g$g|Appends output to the end of a file. Use either of these special double characters to append output to an existing file instead of replacing the data in the file. These double characters are equivalent to the append redirection symbol for output (>>).|
    |$L or $l|Redirects input. Use either of these special characters to read input from a device or a file instead of from the keyboard. This character is equivalent to the redirection symbol for input (<).|
    |$B or $b|Sends macro output to a command. These special characters are equivalent to using the pipe (\|) on a command line.|
    |$T or $t|Separates commands. Use either of these special characters to separate commands when you create macros or type commands on the **doskey** command line. These special characters are equivalent to using the ampersand (&) on a command line.|
    |$$|Specifies the dollar-sign character ($).|
    |$1 through $9|Represent any command-line information you want to specify when you run the macro. The special characters $1 through $9 are batch parameters, which make it possible for you to use different data on the command line each time you run the macro. The $1 character in a **doskey** command is similar to the %1 character in a batch program.|
    |$*|Represents all the command-line information you want to specify when you type the macro name. The special character $* is a replaceable parameter that is similar to the batch parameters $1 through $9, with one important difference: everything you type on the command line after the macro name is substituted for the $* in the macro.|
    
- Running a **doskey** macro
    
    To run a macro, type the macro name starting at the first position on the command line. If the macro was defined with $* or any of the batch parameters $1 through $9, use a white space to separate parameters. You cannot run a **doskey** macro from a batch program.
    
- Creating a macro with the same name as a Windows XP command
    
    If you always use a particular command with specific command-line options, you can create a macro that has the same name as the command. To specify whether you want to run the macro or the command, follow these guidelines:
    
    - To run the macro, begin typing the macro name immediately after the command prompt, with no space between the prompt and the command name.
        
    - To run the command, insert one or more white spaces between the command prompt and the command name.
        
- Deleting a macro
    
    To delete a macro, type:
    
    **doskey** _macroname_ **=**
    

[](https://learn.microsoft.com/ru-ru/previous-versions/windows/it-pro/windows-xp/bb490894(v=technet.10)#examples)

### Examples

The **/macros** and **/history** command-line options are useful for creating batch programs to save macros and commands. For example, to store all current **doskey** macros, type:

**doskey /macros > macinit**

To use the macros stored in Macinit, type:

**doskey /macrofile=macinit**

To create a batch program named Tmp.bat that contains recently used commands, type:

**doskey /history > tmp.bat**

To define a macro with multiple commands, use **$t** to separate commands, as follows:

**doskey tx=cd temp$tdir/w $***

In the preceding example, the TX macro changes the current directory to Temp and then displays a directory listing in wide display format. You can use **$*** at the end of the macro to append other command-line options to **dir** when you run TX.

The following macro uses a batch parameter for a new directory name:

**doskey mc=md $1$tcd $1**

The macro creates a new directory and then changes to it from the current directory.

To use the preceding macro to create and change to a directory named Books, type:

**mc books**

To create a **doskey** macro for a program called Ftp.exe, include **/exename** as follows:

**doskey /exename:ftp.exe go=open 10.127.1.100$tmget *.TXT c:\reports$bye**

To use the preceding macro, start **ftp**. At the **ftp** prompt, type:

**go**

**Ftp** runs the **open**, **mget**, and **bye** commands.

To create a macro that performs a quick and unconditional format of a disk, type:

**doskey qf=format $1 /q /u**

To format a disk in drive A quickly and unconditionally, type:

**qf a:**

[](https://learn.microsoft.com/ru-ru/previous-versions/windows/it-pro/windows-xp/bb490894(v=technet.10)#formatting-legend)

### Formatting legend

|Format|Meaning|
|---|---|
|_Italic_|Information that the user must supply|
|**Bold**|Elements that the user must type exactly as shown|
|Ellipsis (...)|Parameter that can be repeated several times in a command line|
|Between brackets ([])|Optional items|
|Between braces ({}); choices separated by pipe (\|). Example: {even\|odd}|Set of choices from which the user must choose only one|
|Courier font|Code or program output|