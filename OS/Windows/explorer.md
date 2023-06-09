Control Panel - Categories:
explorer.exe ::{26EE0668-A00A-44D7-9371-BEB064C98683}

открытие папки через ярлык
`%windir%\explorer.exe E:\downloads`

Чтобы открыть папку «Документы»:
`%windir%\explorer.exe::{450D8FBA-AD25-11D0-98A8-0800361B1103}`

Чтобы открыть сетевую папку:
`%windir%\explorer.exe::{208D2C60-3AEA-1069-A2D7-08002B30309D}`

Чтобы открыть корзину:
`%windir%\explorer.exe::{645FF040-5081-101B-9F08-00AA002F954E}`

Чтобы открыть папку поиска компьютера:
`%windir%\explorer.exe::{1F4DE370-D627-11D1-BA4F-00A0C91EEDBA}`

Чтобы открыть панель управления:
`%windir%\explorer.exe::{20D04FE0-3AEA-1069-A2D8-08002B30309D}\::{21EC2020-3AEA-1069-A2DD-08002B30309D}`

Запускаем Windows Explorer с папки My Computer, вместо Libraries.
Настраиваем нажатие на кнопку Windows Explorer, чтобы оно приводило в паку My Computer, вместо Libraries:

Просто измените в свойствах ярлыка Windows Explorer поле Target (Объект) на
 `%SystemRoot%\explorer.exe::{20D04FE0-3AEA-1069-A2D8-08002B30309D}`

Создайте ярлык
 `C:\Windows\explorer.exe /e,`
 (запятая обязательно). Будет открываать Компьютер

Чтобы это изменение затронуло и ссылку в меню Start, то вам потребуется изменить поле Target в свойствах
 ярлыка Windows Explorer и в папке Accessories из меню Start.
Чтобы в панеле задач иконка Проводника, так же выходила в Мой компьютер,
 а не библиотеки, для этого нужно удалить ее с панели задачи, правый клик и Unpin.
 Возвращаемся в Accessories находим знакомую иконку, правый клик по ней и выбираем Pin to Taskbar.
Комбинация клавиш Win+E также откроет Проводник в «Компьютере»

[Как из командной строки запустить explorer с развернутой папкой RecycleBin?](https://forum.ixbt.com/topic.cgi?id=22:60991)
У меня так запускается...
`explorer c:\recycled`

Команды для `c:\recycled d:\recycled e:\recycled` дают одинаковый результат, и файлы в корзине отображаются независимо от выбранного диска. Вот, правда, строка адреса выглядит, я бы сказал, неадекватно.

весь список:
```
"%systemroot%\explorer.exe" ::{2227A280-3AEA-1069-A2DE-08002B30309D} - Printers and Faxes
"%systemroot%\explorer.exe" ::{645FF040-5081-101B-9F08-00AA002F954E} - Recycle Bin
"%systemroot%\explorer.exe" ::{208D2C60-3AEA-1069-A2D7-08002B30309D} - My Network Places
%systemroot%\explorer.exe ::{450D8FBA-AD25-11D0-98A8-0800361B1103} - My Documents
```
"control.exe printers" запускает explorer.exe с параметрами, эти параметры удалось выщемить. Оттуда и сдвоенное двоеточие.
Как предположение, по аналогии с VisualC++ это будет обозначение Global Namespace, а дальше объект этого простанства.

https://ss64.com/nt/explorer.html

# Explorer.exe

Command-line switches that you can use to open the GUI Windows Explorer (Explorer.exe).

Syntax
      Explorer.exe _options_

Options
    /n            Open a new single-pane window for the default selection. This is usually the root
                  of the drive Windows is installed on. If the window is already open, a duplicate opens.

    /e            Open Windows Explorer in its default view. This is usually the users home drive.

  (,)/root,_object_ Open the specified object in a window view.

   /select,_object_ Open a window view with the specified folder, file or application selected.

   /separate      Launch the explorer instance as a separate process.
                  (This is an undocumented feature)

Quotation marks are required if the File/Folder object contains spaces or symbols.

If /e or /n are followed by a comma and folder path then explorer will open and display the folder, the /e or /n have no effect, this provides backwards compatibility with older versions of Windows. If the _object_ is given as a filename rather than a folder, the file will be opened using the default application, like [START](https://ss64.com/nt/start.html).

Explorer.exe is normally found in the Windows folder, typically C:\Windows\Explorer.exe

Current versions of Windows no longer allow the use of variables such as %username% in a [shortcut](https://ss64.com/nt/shortcut.html) **target** executable, but you can pass a variable as a **parameter** to Explorer.exe making it possible to build shortcuts which open explorer at a given path. A kind of poor mans [folder redirection](https://docs.microsoft.com/en-us/windows-server/storage/folder-redirection/folder-redirection-rup-overview).

### Examples

```
Open a Windows Explorer window at the current directory:

C:\some folder\> Explorer .

Open an Explorer window with the 'C:\Demo' folder displayed:

Explorer.exe "C:\Demo"

Open an Explorer window with the 'examples' folder displayed and its parent hidden:

Explorer.exe /root,"C:\Demo\examples"

Open a webpage in Microsoft Edge:

%windir%\explorer.exe microsoft-edge:https://ss64.com

Open an Explorer window with SS64App selected:

Explorer.exe /select,"C:\Demo\SS64App.exe"

Open an Explorer window with C: expanded and SS64App selected:

Explorer.exe /e,/root,"C:\Demo\SS64App.exe"

Open an Explorer window with the share \\server64\FileShare1 :

Explorer.exe /root,"\\server64\FileShare1"

Open an Explorer window with TestApp.exe selected in the share\\server64\FileShare1 :

Explorer.exe /root,\\server64\FileShare1,select,SS64App.exe

Open an Explorer window at the root of the system drive C:\

Explorer \

Open an Explorer window at 'My Documents':

Explorer \\  
or  
Explorer /

Open an Explorer window at 'the Computer':

Explorer ','

“From the growth of the Internet through to the mapping of the human genome and our understanding of the human brain, the more we understand, the more there seems to be for us to explore” ~ Martin Rees
```

### Related commands

[Shell: folder](https://ss64.com/nt/shell.html) - [Shortcuts to key folders]().  
[CMD](https://ss64.com/nt/cmd.html) - Start a new CMD shell.  
[RUN](https://ss64.com/nt/run.html) [Start ➞ RUN](https://ss64.com/nt/run.html) commands.  
[START](https://ss64.com/nt/start.html) - Start a program, command or batch file.  
[ProfileFolders](https://ss64.com/nt/syntax-folders.html) - Location of user profile folders.  
[Q152457](https://web.archive.org/web/20150602220856/https://support.microsoft.com/en-us/kb/152457) - Windows Explorer Command-Line Options.

#### Shortcuts
To create a shortcut to any of the shell folders above: Right click the Desktop > New Shortcut
 and set the location/target to explorer.exe followed by the shell:option
For example:
`explorer.exe shell:PrintersFolder`
Alternatively you can use a variable/string:
`explorer.exe "%ProgramData%\Microsoft\Windows\Start Menu\"`
Create a 'God mode' shortcut (a full set of Control Panel options) by setting the shortcut target to:
`%WinDir%\explorer.exe shell:::{ED7BA470-8E54-465E-825C-99712043E01C}`

`D:\T\bin\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}`
Non admin users will find it difficult to create a Shell: shortcut directly on the Task bar,
 it can be done but requires creating the shortcut in:
 `%USERPROFILE%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar`
It can then be dragged into the taskbar.



### Related commands

How-to: [ms-settings](https://ss64.com/nt/syntax-settings.html) - Shortcuts to settings.  
How-to: [RUN commands](https://ss64.com/nt/run.html) Start ➞ Run commands.  
[EXPLORER](https://ss64.com/nt/explorer.html) - Open Windows Explorer.  
How-to: [User Shell Folders - Profile, Start Menu](https://ss64.com/nt/syntax-folders.html) - Location of user profile folders.  
How-to: [Env. Variables](https://ss64.com/nt/syntax-variables.html) - List of environment variables.  
[Remove sidebar folder shortcuts from “This PC” on Windows 10](https://www.howtogeek.com/222057/how-to-remove-the-folders-from-%E2%80%9Cthis-pc%E2%80%9D-on-windows-10/) - howtogeek.com
