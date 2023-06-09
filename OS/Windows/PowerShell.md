https://www.itprotoday.com/end-user-platforms/powershell

[### Installing PowerShell on Windows](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3)

Стоит обратить внимание, что последние 2 года Microsoft приостановила развитие классического Windows PowerShell (выпускаются только исправления ошибок и безопасности) и сфокусировалась на открытом кроссплатформенном PowerShell Core. В чем отличия Windows PowerShell от PowerShell Core?

-   Windows PowerShell основан на NET Framework (например, для PowerShell 5 требуется .NET Framework v4.5, нужно убедиться что он [установлен](https://winitpro.ru/index.php/2018/06/09/kak-uznat-kakie-versii-net-framework-ustanovleny-na-kompyutere/)). PowerShell Core основан на .Net Core;
-   Windows PowerShell работает только на ОС семейства Windows, а PowerShell Core является кроссплатформенным и будет [работать в Linux](https://winitpro.ru/index.php/2021/11/17/ustanovka-powershell-v-linux/);
-   В PowerShell Core нет полной совместимости с Windows PowerShell, однако Microsoft работает на улучшением обратной совместимости со старыми командлетами и скриптами (перед переходом на PowerShell Core рекомендуется протестировать работу старых PS скриптов). В PowerShell 7 обеспечивается максимальная совместимсть с Windows PowerShell.
-   Редактор PowerShell ISE нельзя использовать для отладки скриптов PowerShell Core (но можно использовать [Visual Studio Code](https://winitpro.ru/index.php/2019/08/08/visual-studio-code-powershell/))
-   Т.к. Windows PowerShell более не развивается, рекомендуется постепенно мигрировать на PowerShell Core.

Самый простой способ определить какая версия PowerShell у вас установлена с помощью команды:
`host`

или
`$PSVersionTable`

Можно получить только значении версии:
`$PSVersionTable.PSVersion.major`

Для определения установленной версии PowerShell Core нужно использовать команду:
`(Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\PowerShellCore\InstalledVersions* -Name 'SemanticVersion').SemanticVersion`

мой способ инсталяции в каталог по умолчанию: `c:\Program Files\PowerShell\7\`
```
msiexec.exe /package PowerShell_7.3.4_x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1 ADD_PATH=1 DISABLE_TELEMETRY=1
```

Есть несколько способов установки PowerShell в Windows. Каждый метод установки предназначен для поддержки различных сценариев и рабочих процессов. Выберите метод, который оптимально подходит для вашего случая.

-   [Winget](https://learn.microsoft.com/ru-ru/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3#winget) — рекомендуемый способ установки PowerShell на клиентах Windows
-   [Пакет MSI](https://learn.microsoft.com/ru-ru/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3#msi) — лучший выбор для серверов Windows и сценариев корпоративного развертывания
-   [ZIP-пакет](https://learn.microsoft.com/ru-ru/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3#zip) — самый простой способ сторонней загрузки или установки нескольких версий
    -   Используйте этот метод установки для Windows Nano Server, Windows IoT и систем на базе ARM
-   [Глобальный инструмент .NET](https://learn.microsoft.com/ru-ru/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3#dotnet) — хороший вариант для разработчиков .NET, устанавливающих и использующих другие глобальные инструменты
-   [Пакет Microsoft Store](https://learn.microsoft.com/ru-ru/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3#msstore) — простой способ установки для обычных пользователей PowerShell, имеет ряд ограничений

Примечание

Команды установки, описанные в этой статье, предназначены для последнего стабильного выпуска PowerShell. Чтобы установить другую версию PowerShell, измените команду в соответствии с нужной версией. По следующим ссылкам вы перейдете на страницу выпуска для каждой версии в репозитории PowerShell в GitHub.

-   Стабильный выпуск: [https://aka.ms/powershell-release?tag=stable](https://aka.ms/powershell-release?tag=stable)
-   Выпуск LTS: [https://aka.ms/powershell-release?tag=lts](https://aka.ms/powershell-release?tag=lts)
-   Предварительный выпуск: [https://aka.ms/powershell-release?tag=preview](https://aka.ms/powershell-release?tag=preview)

Ссылки для скачивания каждого пакета находятся в разделе **Ресурсы** на странице выпуска. Раздел **ресурсов** может быть свернут. В таком случае щелкните его, чтобы развернуть.

## Установка PowerShell с помощью Winget (рекомендуется)

Программа командной строки Winget (Диспетчер пакетов Windows) позволяет пользователям обнаруживать, устанавливать, обновлять, удалять и настраивать приложения на клиентских компьютерах с Windows. Она является клиентским интерфейсом для службы Диспетчера пакетов Windows. Программа командной строки `winget` по умолчанию входит в состав Windows 11 и современных версий Windows 10 в качестве **Установщика приложений**.

Примечание

Список системных требований и инструкции по установке см. в документации по [winget](https://learn.microsoft.com/ru-ru/windows/package-manager/winget). `Winget` в настоящее время не выполняется на серверах Windows.

Для установки PowerShell с помощью опубликованных пакетов `winget` можно использовать следующие команды:

Найдите последнюю версию PowerShell.

```
winget search Microsoft.PowerShell
```

```
Name               Id                           Version Source
--------------------------------------------------------------
PowerShell         Microsoft.PowerShell         7.3.4.0 winget
PowerShell Preview Microsoft.PowerShell.Preview 7.4.1.0 winget
```

Установите PowerShell основной или предварительной версии, используя параметр `id`.

```
winget install --id Microsoft.Powershell --source winget
winget install --id Microsoft.Powershell.Preview --source winget
```

Примечание

В системах Windows, использующих процессор X86 или X64, `winget` устанавливает пакет MSI. В системах, использующих процессор Arm64, `winget` установите пакет Microsoft Store (MSIX). Дополнительные сведения см. [в разделе Установка из Microsoft Store](https://learn.microsoft.com/ru-ru/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3#msstore).

## Установка пакета MSI

Чтобы установить PowerShell в Windows, воспользуйтесь приведенными ниже ссылками для скачивания пакета установки с сайта GitHub.

-   [PowerShell-7.3.4-win-x64.msi](https://github.com/PowerShell/PowerShell/releases/download/v7.3.4/PowerShell-7.3.4-win-x64.msi)
-   [PowerShell-7.3.4-win-x86.msi](https://github.com/PowerShell/PowerShell/releases/download/v7.3.4/PowerShell-7.3.4-win-x86.msi)

После скачивания дважды щелкните файл установщика и следуйте инструкциям на экране.

Программа установки создает ярлык в меню Windows "Пуск".

-   По умолчанию пакет устанавливается в каталог `$env:ProgramFiles\PowerShell\<version>`.
-   Вы можете запустить PowerShell с помощью меню "Пуск" или файла `$env:ProgramFiles\PowerShell\<version>\pwsh.exe`.

Примечание

PowerShell 7.3 устанавливается в новый каталог и запускается параллельно с Windows PowerShell 5.1. PowerShell 7.3 — это обновление на месте, которое заменяет PowerShell 7.0 и более ранней версии.

-   PowerShell 7.3 устанавливается в `$env:ProgramFiles\PowerShell\7`
-   Папка `$env:ProgramFiles\PowerShell\7` добавляется в переменную `$env:PATH`.
-   Папки для выпущенных ранее версий удалены

Если необходимо запустить PowerShell 7.3 параллельно с другими версиями, используйте метод [установки ZIP](https://learn.microsoft.com/ru-ru/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3#zip) , чтобы установить другую версию в другую папку.

### Поддержка Центра обновления Майкрософт в PowerShell 7.2 и более новых версиях

PowerShell 7.2 и более поздней версии поддерживает Центр обновления Майкрософт. При включении этой возможности вы будете получать последние обновления PowerShell 7 в традиционном потоке управления клиентского компонента Центра обновления Майкрософт, будь то Центр обновления Windows для бизнеса, WSUS, Microsoft Endpoint Configuration Manager или интерактивное диалоговое окно Центра обновления Майкрософт в параметрах системы.

Пакет MSI PowerShell 7.3 включает следующие параметры командной строки:

-   `USE_MU` — это свойство имеет два возможных значения:
    -   `1` (по умолчанию) — согласие на получение обновления с помощью Центра обновления Майкрософт, WSUS или Configuration Manager.
    -   `0`— Не выбирайте обновление с помощью Центра обновления Майкрософт, WSUS или Configuration Manager
-   `ENABLE_MU`
    -   `1` (по умолчанию) — согласие на использование Центра обновления Майкрософт для автоматических обновлений.
    -   `0` - Не согласиться на использование Центра обновления Майкрософт

Примечание

Включение обновлений можно задать в предыдущей установке или в конфигурации вручную. Использование `ENABLE_MU=0` не удаляет существующие параметры. Кроме того, этот параметр может быть переопределен параметрами групповой политики, управляемыми администратором.

Дополнительные сведения см. в разделе [Часто задаваемые вопросы о Центре обновления Майкрософт PowerShell](https://learn.microsoft.com/ru-ru/powershell/scripting/install/microsoft-update-faq?view=powershell-7.3).

### Установка пакета MSI из командной строки

MSI-пакеты можно устанавливать из командной строки, что позволяет администраторам развертывать их без взаимодействия с пользователем. MSI-пакет включает в себя следующие свойства для управления параметрами установки:

-   `ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL`. Это свойство позволяет добавлять пункт `Open PowerShell` в контекстное меню проводника.
-   `ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL`. Это свойство позволяет добавлять пункт `Run with PowerShell` в контекстное меню проводника.
-   `ENABLE_PSREMOTING`. Это свойство позволяет включать удаленное взаимодействие PowerShell во время установки.
-   `REGISTER_MANIFEST`. Это свойство позволяет регистрировать манифест ведения журнала событий Windows.
-   `ADD_PATH` — это свойство управляет параметром добавления PowerShell в переменную среды PATH в Windows.
-   `DISABLE_TELEMETRY` — Это свойство управляет параметром отключения телеметрии PowerShell путем задания переменной `POWERSHELL_TELEMETRY_OPTOUT` среды.

В следующих примерах показано, как выполнить автоматическую установку PowerShell со всеми включенными параметрами.

```
msiexec.exe /package PowerShell-7.3.4-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1 ADD_PATH=1
```

Полный список параметров командной строки для `Msiexec.exe` см. [здесь](https://learn.microsoft.com/ru-ru/windows/desktop/Msi/command-line-options).

## Установка ZIP-пакета

Для поддержки расширенных сценариев развертывания доступны ZIP-архивы двоичных файлов PowerShell. Скачайте один из следующих ZIP-архивов на странице с [текущим выпуском](https://aka.ms/powershell-release?tag=stable).

-   [PowerShell-7.3.4-win-x64.zip](https://github.com/PowerShell/PowerShell/releases/download/v7.3.4/PowerShell-7.3.4-win-x64.zip)
-   [PowerShell-7.3.4-win-x86.zip](https://github.com/PowerShell/PowerShell/releases/download/v7.3.4/PowerShell-7.3.4-win-x86.zip)
-   [PowerShell-7.3.4-win-arm64.zip](https://github.com/PowerShell/PowerShell/releases/download/v7.3.4/PowerShell-7.3.4-win-arm64.zip)

В зависимости от способа загрузки файла может потребоваться разблокировать файл с помощью командлета `Unblock-File`. Распакуйте содержимое в выбранное расположение и запустите `pwsh.exe`. В отличие от установки пакетов MSI при установке ZIP-архива не выполняется проверка соответствия предварительным требованиям. Для правильного удаленного взаимодействия с помощью WSMan необходимо обеспечить соответствие [предварительным требованиям](https://learn.microsoft.com/ru-ru/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3#powershell-remoting).

Используйте этот метод для установки версии PowerShell на основе ARM на таких компьютерах, как Microsoft Surface Pro X. Чтобы получить оптимальные результаты, устанавливайте PowerShell в папку `$env:ProgramFiles\PowerShell\7`.

## Установка в качестве глобального средства .NET

Если вы уже установили [пакет SDK для .NET Core](https://learn.microsoft.com/ru-ru/dotnet/core/sdk), установите PowerShell как [глобальное средство .NET](https://learn.microsoft.com/ru-ru/dotnet/core/tools/global-tools).

```
dotnet tool install --global PowerShell
```

Установщик инструмента dotnet добавляет `$HOME\.dotnet\tools` в переменную среды `$env:PATH`. Но в выполняющейся оболочке нет обновленной переменной `$env:PATH`. Вы можете запустить PowerShell из новой оболочки, введя `pwsh`.

## Установка из Microsoft Store

PowerShell 7.3 можно установить из Microsoft Store. Этот выпуск PowerShell можно найти на сайте [Microsoft Store](https://www.microsoft.com/store/apps/9MZ1SNWT0N5D) или в приложении Store в ОС Windows.

Пакет Microsoft Store обеспечивает следующие преимущества:

-   автоматические обновления, встроенные непосредственно в Windows;
-   интеграция с другими механизмами распространения программного обеспечения, такими как Intune и Configuration Manager.
-   может устанавливаться в системах Windows с процессорами x86, x64 или Arm64.

### Известные ограничения

По умолчанию пакеты Microsoft Store запускаются в песочнице приложений, которая виртуализирует доступ к некоторым разделам реестра и файловой системы. Изменения в виртуализированных расположениях файлов и реестров не сохраняются за пределами песочницы приложения.

Песочница блокирует любые изменения в корневой папке приложения. Параметры конфигурации системного уровня, хранящиеся в `$PSHOME` , не могут быть изменены. Это относится и к конфигурации WSMAN. Это означает, что вы не сможете подключать удаленные сеансы к установкам PowerShell на основе хранилища. Поддерживаются конфигурации уровня пользователя и удаленное взаимодействие по SSH.

Следующим командам требуется запись в `$PSHOME`. Эти команды не поддерживаются в экземпляре PowerShell в Microsoft Store.

-   `Register-PSSessionConfiguration`
-   `Update-Help -Scope AllUsers`
-   `Enable-ExperimentalFeature -Scope AllUsers`
-   `Set-ExecutionPolicy -Scope LocalMachine`

Подробнее см. [Основные сведения о работе упакованных классических приложений в Windows](https://learn.microsoft.com/ru-ru/windows/msix/desktop/desktop-to-uwp-behind-the-scenes).

### Изменения в PowerShell 7.2

Начиная с версии PowerShell 7.2, для пакета PowerShell больше не действует виртуализация файлов и реестра. Изменения виртуальных папок с файлами и разделов реестра теперь будут сохраняться вне песочницы приложений. Однако изменения в корневой папке приложения по-прежнему блокируются.

Важно!

Данное исключение действует только в сборках Windows от 1903 и выше.

## Установка предварительной версии

Предварительные выпуски PowerShell 7 устанавливаются в `$env:ProgramFiles\PowerShell\7-preview`, поэтому их можно выполнять параллельно с выпусками PowerShell без предварительной версии. PowerShell 7.4 — это следующий предварительный выпуск.

## Обновление существующей установки

Для получения оптимального результата при обновлении используйте тот же метод установки, который вы использовали при первой установке PowerShell. При использовании разных методов установки PowerShell устанавливается в разные расположения. Если вы не знаете, как был установлен PowerShell, вы можете сравнить установленное расположение со сведениями о пакете, приведенными в этой статье. Если установка выполнена с помощью пакета MSI, эти сведения будут отображаться в разделе **Программы и компоненты** Панели управления.

Примечание

При обновлении PowerShell не будет обновлять версию LTS до версии, отличной от LTS. Он обновляется только до последней версии LTS, например с 7.2.3 до 7.2.11. Чтобы обновить выпуск LTS до более новой стабильной версии или следующей версии LTS, необходимо установить новую версию с помощью MSI для этого выпуска.

Если установленная версия не является версией LTS, PowerShell обновляется до последней стабильной версии.


### Обновление версии PowerShell в Windows
https://winitpro.ru/index.php/2020/05/14/obnovlenie-powershell-v-windows/

### Установка/обновление PowerShell Core 7.1
https://github.com/PowerShell/PowerShell

https://github.com/PowerShell/PowerShell/releases/tag/v7.3.3

### How to Export PowerShell Command History To Make a Script
https://www.itprotoday.com/powershell/how-export-powershell-command-history-make-script?_mc=NL_DR_EDT__20230306&cid=NL_DR_EDT__20230306&utm_rid=CPNET000054010886&utm_campaign=52173&utm_medium=email&elq2=37a43a6280ec46cba5f13e7aab17ef04&sp_eh=4acad7ddf62d09d6484d190736e5bf2fdce746fb1924c8a75dcce3caf4ef01af

All you do is enter the Get-History cmdlet and then [use the Out-File cmdlet](https://www.itprotoday.com/powershell/how-write-powershell-output-file) to write the PowerShell command history to a text file.

For example, if you wanted to write the current command history to a file named history.txt, you could type:
`Get-History | Out-File C:\History.txt`

While this command works, it does not produce a ready-to-use script. Instead, your text file will contain many items you will need to edit out. These items include column headers, command ID numbers, and unwanted commands:
`Get-Content History.txt`

Now let’s look at how to remove the command ID numbers. The ID numbers are the sequential numbers that appear before each command in the history output.
Removing the command IDs is just a matter of using the Select-Object command and specifying that you only want to select the commandline. When combined with the techniques discussed above, the command becomes the following:
`Get-History | Select-Object CommandLine | Format-Table -Hide | Out-File C:\Scripts\History.txt`
_The column headers and command IDs have been removed, leaving only the command history_

### **Exporting commands that are sequential**

Here, the thing to remember is that PowerShell treats the command history as an array. As such, you simply need to specify which items from the array you want to include in the final output. This is where the command ID comes into play.

Suppose that you only wanted to include commands 3 through 6 in the output. To do so, you would set up a loop by typing 3..6.
The command would look like this:
`3..6 | Get-History | Select-Object CommandLine | Format-Table -Hide | Out-File C:\Scripts\History.txt`

### **Exporting commands that are not sequential**

But what if the commands that you wanted to export from the command history were not sequential? For instance, suppose that you wanted to export command numbers 3, 4, 5, 6, 8, 11, and 12. There are two tricks you will need to accomplish this.

The first trick is to create multiple ranges, separated by a plus sign. For example, 3..6 + 11..12 would give you items 3, 4, 5, 6, 11, and 12.

The second trick is that you may occasionally need to create a single value range. As you will recall, the original list of commands to export was 3, 4, 5, 6, 8, 11, and 12. The problem with this is that 3-6 is a range and 11-12 is a range, but 8 is a single number. The way that you would handle this is by treating 8 as a single value range. Hence, you would enter 8..8. As such, the full command would be:
`3..6 + 8..8 + 11..12 | Get-History | Select-Object CommandLine | Format-Table -Hide | Out-File C:\Scripts\History.txt`

### How To Create Functions in Powershell Scripts
If you write a lot of [PowerShell scripts](https://www.itprotoday.com/powershell/what-powershell-0), sooner or later you will find that you need to create a function. PowerShell functions are essentially a block of code that you can run again and again. You can call a PowerShell function as often as you need to

### **PowerShell Function Basics**

With that said, I want to show you the basics of creating a PowerShell function.

### **Name your function**

The first thing to know about PowerShell functions is that every function must have a name. Technically, you can give a function any name you want, so long as you don’t use any reserved words. However, as a best practice, I recommend giving your functions names that adhere to the [basic PowerShell cmdlet structure](https://www.itprotoday.com/powershell/how-learn-powershell-2022).

As I’m sure you know, PowerShell cmdlets are usually structured in a verb-noun format. These cmdlets consist of two words, a verb and a noun, separated by a dash. It works well to use the same naming convention for your functions because the verb-noun combination can describe what the function is designed to do.

Additionally, if you later decide to turn the function into a custom PowerShell cmdlet, it will already be in a format that matches the general PowerShell naming convention.

### **Use ‘Function’**

Another thing that you do when you create a PowerShell function is to use the word “Function.” _Function_ appears just before the function name. If you try to declare a function name without using _Function_, PowerShell will think you have typed an invalid command and give you an error.

### **Enclose body in brackets**

The function body can contain anything that you want. The only real requirement is that the function body must be enclosed in brackets.

## **Example of a PowerShell Function**

Now that I have explained how to declare a function, let’s take a look at a very simple function [provided by Microsoft](https://docs.microsoft.com/en-us/powershell/scripting/learn/ps101/09-functions?view=powershell-7.2).

The command for finding out which version of PowerShell you are running is $PSVersionTable.PSVersion. This command is not very intuitive, so let’s create a function called Get-Version with the $PSVersionTable.PSVersion command in the function body. That way, you simply type Get-Version to see the PowerShell version.

Here is what the code looks like:
`Function Get-Version {
 $PSVersionTable.PSVersion
}`
As you can see, we have the word “Function,” followed by a function name and an opening bracket. This is followed by the function body and a closing bracket. Once a function has been declared, you can execute it by entering the function name
'Get-Version'

## **PowerShell Functions That Use Parameters**

One last thing to show you is how to design a PowerShell function that accepts a parameter (although a PowerShell function can in fact accept multiple parameters).

There are different ways to handle parameters in PowerShell, so let’s look at one of the simpler methods.

The easiest way I know to pass a parameter to a function is to include a variable in parentheses just after the function name. This variable then inherits whatever value is passed to the function. There are far more sophisticated ways of handling parameters, but this method works and is easy to use.

In the following example, I’m going to create a really simple function in which I pass a text string to the function, then use the function to display the contents of that texturing.

Here is what the function looks like:
`Function Display-Text($MyText){
  Write-Host $MyText
}`
This function, which you can see in Figure 2, accepts a string of text as input and then uses the Write-Host cmdlet to display that text. I supply the text immediately after entering the function name when I call the function:
`$A='Hello Word'`
`Display-Text($A)`

# How To Write PowerShell Output to a File
In most cases, the Out-File cmdlet is appended to either a PowerShell cmdlet or to a variable. Doing so makes it so that the output is written to a file rather than displayed on screen
At its most basic, using the Out-File cmdlet requires you to provide a path and filename where the output should be written.

Suppose you wanted to [create a list of the system services](https://www.itprotoday.com/powershell/how-use-powershell-where-object-cmdlet) that are currently running on Windows, then write the list to a text file named C:\Scripts\Services.txt. You could accomplish this with the code below:

`$Services = Get-Service | Where-Object {$_.Status -eq ‘Running’}``
`$Services | Out-file -FilePath 'C:\Scripts\Services.txt'`

As you can see, the list of running services was written to a variable named $Services. The contents of the variable were then piped to the Out-File cmdlet. The cmdlet’s -FilePath [parameter](https://www.itprotoday.com/powershell/how-learn-powershell-2022) was then used to tell PowerShell where to save the file and what to call it

## **How To Read a Text File**

When you use the Out-File cmdlet to create a text file, you can open the resulting text file in Notepad or another text editor. You can also display the file contents within PowerShell.

When it comes to displaying a text file within PowerShell, I usually catch myself using the Type command. The Type command is a leftover from the days of DOS. It only requires you to provide the path and filename. So, for example, if you wanted to see the contents of the `C:\Scripts\Services.txt` file, you would enter:
`Type C:\Scripts\Services.txt`

Type is an alias for PowerShell’s Get-Content cmdlet, which works the same way. Just enter the Get-Content cmdlet along with the path and filename of the file that you want to display.
Here is an example:
`Get-Content C:\Scripts\Services.txt`

## **How To Set the Encoding**

When you use the Out-File cmdlet to create a text file, you normally don’t have to worry about specifying the encoding scheme. The default encoding typically works fine. However, you can set the encoding to ASCII if necessary, and you can even specify a line width.

Keep in mind that any excess characters on a line will be truncated. For example, if you set the line width to 80, then 81 characters or more would be truncated.

If you want to set the encoding to ASCII and you want to set a maximum line width, you will need to append the -Encoding and -Width parameters to the Out-File cmdlet.

Here is what such a command might look like:
`$Services | Out-file -FilePath ‘C:\Scripts\Services.txt’ -Encoding ASCII -Width 80`

## **How To Append Data**

If you use the Out-File cmdlet and the specified file already exists, that file will usually be overwritten. It is possible, however, to append new data to the end of the file rather than overwrite the file. The key is to include the -Append parameter.

Here is an example of how the -Append parameter is used:
`$Services | Out-file -FilePath ‘C:\Scripts\Services.txt’ -Append`

## **How To Force Overwriting an Existing File**

When you use PowerShell to create a text file, another problem can sometimes occur: You need to overwrite a file, but that file is being treated as read only. The workaround for this (assuming that the necessary permissions are in place) is to append the -Force parameter to the Out-File cmdlet.

Here is an example:
`$Services | Out-file -FilePath ‘C:\Scripts\Services.txt’ -Force`

## **How To Prevent a File From Being Overwritten**

A text file that you have generated may contain important data that you want to ensure won’t be overwritten. The best way to prevent the overwriting of the text file is to append the -NoClobber parameter. The -NoClobber parameter causes the Out-File cmdlet to produce an error if the specified file already exists.

Here is an example:
`$Services | Out-file -FilePath ‘C:\Scripts\Services.txt’ -NoClobber`

### Как запустить PowerShell с правами администратора в командной строке  

Если у вас уже открыта консоль PowerShell с правами обычного пользователя, то прямо из неё вы можете запустить новый процесс PowerShell с повышенными правами:
`Start-Process PowerShell -Verb RunAs`

Эта команда запустит версию PowerShell 5 или PowerShell 6 — в зависимости от того, что у вас установлено в системе по умолчанию. Чтобы запустить последнюю версию, которую вы установили вручную, то есть PowerShell 7, выполните команду:
`Start-Process pwsh -Verb RunAs`

##### Полезно для сети
#net #proxy #powershell

## Использование прокси в PowerShell Core

В [новых версиях PowerShell Core (7.x)](https://winitpro.ru/index.php/2020/05/14/obnovlenie-powershell-v-windows/) для выполнения веб запросов в командлетах Invoke-WebRequest, Find-Module, Install-Module и т.д., вместо класса System.Net.WebRequest используется класс **System.Net.HttpClient**.

Соответственно, чтобы настроит параметры прокси сервера в PowerShell Core нужно использовать команду:
`[System.Net.Http.HttpClient]::DefaultProxy = New-Object System.Net.WebProxy('http://your-proxy:3128')`

Для аутентификации на прокси под текущим пользователем Windows:
`[System.Net.Http.HttpClient]::DefaultProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials`

Для интерактивного запроса имени пользователя и пароля для аутентификации на прокси:
`[System.Net.Http.HttpClient]::DefaultProxy.Credentials = Get-Credential`

Также PowerShell Core поддерживает специальные переменные окружения Windows, в которых можно задать параметры прокси:

-    `HTTP_PROXY` – прокси для HTTP запросов
-    `HTTPS_PROXY` — прокси для HTTPS запросов
-    `ALL_PROXY` – прокси и для HTTP и для HTTPS
-    `NO_PROXY` – список адресов исключений для прокси

Из PowerShell вы можете задать переменные окружения с помощью следующих команд:
`$proxy='http://192.168.0.14:8080'`

Можно сразу в переменных окружения задать имя пользователя и пароль для аутентификации на прокси-сервере:
`$proxy='http://username:password@IP:PORT'`
`$ENV:HTTP_PROXY=$proxy   $ENV:HTTPS_PROXY=$proxy`

Проверьте, что новые переменные окружения были заданы:

`Dir env:`

![переменная окружения http_proxy для powershell core](https://winitpro.ru/wp-content/uploads/2017/04/http_proxy-v-powershell-core.jpg)

[В PowerShell Core на Linux](https://winitpro.ru/index.php/2021/11/17/ustanovka-powershell-v-linux/) вы можете экспортировать системные настройки прокси из переменных окружения так:
`export HTTP_PROXY=http://192.168.0.14:3128   export HTTPS_PROXY=http://192.168.0.14:3128`

## Как автоматически применить настройки прокси с помощью профиля PowerShell?

Вы можете создать профиль PowerShell для автоматического запуска команд импорта настроек прокси при запуске PowerShell.

Для этого выполните команду, которая создаст [файл профиля PowerShell](https://winitpro.ru/index.php/2021/09/29/ispolzovanie-fajlov-profilej-powershell/) (« `C:\Users\username\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1` «):

`notepad $PROFILE` (или `notepad $PROFILE.AllUsersCurrentHost` – если нужно применить профиль PowerShell ко всем пользователям).

Профиль PowerShell это простой PS1 скрипт, который всегда выполняется при запуске консоли PowerShell.exe.

Скопируйте в блокнот нужный PowerShell код. Например, вы используете для настройки параметров прокси-сервера на клиенте PAC файлы (Autoconfig). Вы можете указать адрес сервера с PAC файлом и способ аутентификации на прокси-сервере под текущим пользователем:

`#Использовать актуальную версию [TLS 1.2](https://winitpro.ru/index.php/2022/04/19/vklyuchit-protokol-tls-1-2-windows/) для подключения   [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12   [system.net.webrequest]::DefaultWebProxy = new-object system.net.webproxy('http://192.168.1.90:80')   #можно заменить предыдущую строку на netsh winhttp import proxy source=ie, если нужно импортировать настройки прокси из Internet Explorer   [system.net.webrequest]::DefaultWebProxy.credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials   #можно запросить учетные данные пользователя   #System.Net.WebRequest]::DefaultWebProxy.Credentials = Get-Credential   # можно загрузить пароль пользователя из XML файла (см. [статью про использование сохраненных паролей в PowerShell](https://winitpro.ru/index.php/2018/10/18/shifrovanie-paroley-v-skriptah-powershell/)):   # System.Net.WebRequest]::DefaultWebProxy= Import-Clixml -Path c:\pc\password.xml   [system.net.webrequest]::DefaultWebProxy.BypassProxyOnLocal = $true`

Настройки политики запуска PowerShell скриптов (PowerShell Execution Policy) по умолчанию запрещают запуск всех PS скриптов, даже из файлов профилей PowerShell. Чтобы [разрешить запуск PS1 скриптов](https://winitpro.ru/index.php/2020/06/03/powershell-execution-policy-zapusk-scriptov/) придется выполнить команду:

`Set-ExecutionPolicy RemoteSigned`

Сохраните файл Microsoft.PowerShell_profile.ps1 и перезапустите командную строку PowerShell. Теперь, когда вы открываете новую сессию PowerShell, выполняется код из файла профиля и в сессию импортируются настройки прокси-сервера.

## Вывести настройки прокси сервера из PowerShell

Вы можете получить текущие настройки прокси-сервера в Windows [из реестра командой PowerShell](https://winitpro.ru/index.php/2017/02/07/rabotaem-s-reestrom-windows-cherez-powershell/):

`Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' | Select-Object ProxyServer, ProxyEnable`

В моем пример адрес и порт прокси сервера: `192.168.0.14:3128`

Прокси сервер включен: `ProxyEnable =1`

![получить текущие настройки прокси из powershell](https://winitpro.ru/wp-content/uploads/2017/04/poluchit-nastroyki-proxy-iz-powershell.jpg)

Также можно получить настройки WebProxy так:

`[System.Net.WebProxy]::GetDefaultProxy()`

![System.Net.WebProxy]::GetDefaultProxy в powershell](https://winitpro.ru/wp-content/uploads/2017/04/GetDefaultProxy.jpg)

Если необходимо, вы можете включить (отключить) использование прокси следующими командами (соответственно):

`Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' ProxyEnable -value 1`

и

`Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' ProxyEnable -value 0`

## Как изменить настройки прокси-сервера в Windows из PowerShell?

Вы можете задать параметры прокси-сервера с помощью PowerShell. Например, следующая функция PowerShell позволяет изменить настройки прокси. Предварительно функция доступность прокси-сервер и порта на нем с помощью командлета [Test-NetConnection](https://winitpro.ru/index.php/2016/09/08/tcp-port-ping-s-pomoshhyu-powershell/)

`function Set-Proxy ( $server,$port)   {   If ((Test-NetConnection -ComputerName $server -Port $port).TcpTestSucceeded) {   Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -name ProxyServer -Value "$($server):$($port)"   Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -name ProxyEnable -Value 1   }   Else {   Write-Error -Message "Неверные настройки прокси-сервера:  $($server):$($port)"   }   }`

`Set-Proxy 192.168.0.14 3128`

Добавить дополнительные адреса в список исключений прокси:

`$ProxyExceptionList = ";*.winitpro.ru;*.yandex.ru"   $ProxyProperty = Get-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"   If ($ProxyProperty.ProxyOverride) {   $OldValue = $ProxyProperty.ProxyOverride   $NewValue = $OldValue+$ProxyExceptionList   $ProxyProperty | Set-ItemProperty -Name ProxyOverride -Value $NewValue   } else {   Write-Warning "Proxy overrides list empty!"   }`

Дополнительно, вы можете сохранить в реестре имя и пароль пользователя для аутентификации на прокси сервере:

`Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -name ProxyUser -Value "username"   Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -name ProxyPass -Value "password"`

Обратите внимание, что в старых билдах Windows 10, Windows Server 2016 и более старых версиях Window по умолчанию для подключения используется устаревший и небезопасный [протокол TLS 1.0](https://winitpro.ru/index.php/2022/03/02/otklyuchenie-versii-tls-gpo/). Поэтому, например, при поиске модуля в PSGalery вы получите ошибку:

WARNING: Unable to resolve package source ‘https://www.powershellgallery.com/api/v2’.

Чтобы использовать TLS 1.2 для подключений к конечным точкам из PowerShell, выполните команду:

`[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12`
[
#### Test-NetConnection: проверка открытых/закрытых TCP портов из PowerShell](https://winitpro.ru/index.php/2016/09/08/tcp-port-ping-s-pomoshhyu-powershell/)
#port #net #proxy 
В **PowerShell** **4.0** (Windows 2012 R2, Windows 8.1 и выше) появился встроенный командлет для проверки сетевых соединений — **Test****-NetConnection****.** С помощью данного командлета вы можете проверить доступность удаленного сервера или сетевой службы на нем, блокировку TCP портов файерволами, проверить доступность по ICMP и маршрутизацию. По сути, командлет `Test-NetConnection` позволяет заменить сразу несколько привычных сетевых утилит: ping, traceroute, сканер TCP портов и т.д.

## TCP Port Ping: Использование Test-NetConnection для проверки открытых портов и доступности серверов

Проверим, открыт ли порт TCP 25 (SMTP протокол) на почтовом сервере с помощью Test-NetConnection:

`Test-NetConnection -ComputerName msk-msg01 -Port 25`

В моем случае:
```
TNC smtp.gmail.com -Port 25
TNC localhost -Port 12345
TNC localhost -Port 12346
TNC 127.0.0.1 -Port 12345
TNC 127.0.0.1 -Port 12346
```

```
Test-NetConnection -ComputerName 192.168.1.1 -CommonTCPPort HTTP
Test-NetConnection -ComputerName 192.168.1.2 -CommonTCPPort SMB
Test-NetConnection -ComputerName 192.168.1.2 -Port 5001
Test-NetConnection -ComputerName 192.168.1.2 -Port 5005
Test-NetConnection -ComputerName 192.168.1.2 -Port 5006
```
`Test-NetConnection -ComputerName 192.168.1.2 -Port 5006|Format-List *`

Совет. В предыдущих версиях PowerShell проверить доступность удаленного TCP порта можно так:
`(New-Object System.Net.Sockets.TcpClient).Connect('192.168.1.2', 5001)`

Аналог #traceroute
`Test-NetConnection smtp.gmail.com –TraceRoute`

Сканер портов на моем компьютере:
`foreach ($port in 1..1024) {If (($a=Test-NetConnection 192.168.1.33 -Port $port -WarningAction SilentlyContinue).tcpTestSucceeded -eq $true){ "TCP port $port is open!"}}`

**Примечание**. С помощью командлета Test-NetConnection можно проверить только TCP соединение, для проверки доступности UDP портов он не применим.

В сокращенном виде аналогичная команда выглядит так:

`TNC msk-mail1 -Port 25`

[![Test-NetConnection - прверка ответа от TCP порта](https://winitpro.ru/wp-content/uploads/2016/09/Test-NetConnection.jpg)](https://winitpro.ru/wp-content/uploads/2016/09/Test-NetConnection.jpg)

Разберем результат команды:

ComputerName           : msk-msg01
RemoteAddress          : 10.10.1.7
RemotePort             : 25
InterfaceAlias         : CORP
SourceAddress          : 10.10.1.70
PingSucceeded          : True
PingReplyDetails (RTT) : 0 ms
TcpTestSucceeded       : True

Как вы видите, командлет выполняет разрешение имени сервера в IP адрес, выполняется проверка ответа ICMP (аналог ping) и доступность TCP порта. Указанный сервер доступен по ICMP ( `PingSucceeded = True` ) и 25 TCP порт также отвечает ( `RemotePort=25, TcpTestSucceeded= True` ).

**Примечание**. В некоторых случаях может оказаться, что PingSucceeded=False, а TcpTestSucceeded= True. Скорее всего означает, что на удаленном сервере запрещен ICMP Ping.

У командлета есть специальный параметр **–CommonTCPPort**, позволяющий указать наименование известного сетевого протокола (HTTP, RDP, SMB, WINRM).

Например, чтобы проверить доступность веб-сервера, можно использовать команду:

`Test-NetConnection -ComputerName winitpro.ru -CommonTCPPort HTTP`

Или доступность [RDP порта (3389)](https://winitpro.ru/index.php/2010/09/17/nomer-porta-rdp-v-windows/):

`Test-NetConnection msk-rds1 –CommonTCPPort RDP`

Можно вывести все параметры, которые возвращает командлет Test-NetConnection:

`Test-NetConnection msk-man01 -port 445|Format-List *`

![Test-NetConnection все свойства](https://winitpro.ru/wp-content/uploads/2016/09/Test-NetConnection-vse-svoystva.jpg)

Если нужна только информация по доступности TCP порта, в более лаконичном виде проверка может быть выполнена так:

`TNC msk-mail1 -Port 25 -InformationLevel Quiet`

Командлет вернул True, значит удаленный порт доступен.

[![TNC InformationLevel Quiet](https://winitpro.ru/wp-content/uploads/2016/09/TNC-InformationLevel-Quiet.jpg)](https://winitpro.ru/wp-content/uploads/2016/09/TNC-InformationLevel-Quiet.jpg)

**Совет**. В предыдущих версиях PowerShell проверить доступность удаленного TCP порта можно так:

`(New-Object System.Net.Sockets.TcpClient).Connect(‘msk-msg01’, 25)`

[![New-Object System.Net.Sockets.TcpClient](https://winitpro.ru/wp-content/uploads/2016/09/New-Object-System.Net_.Sockets.TcpClient.jpg)](https://winitpro.ru/wp-content/uploads/2016/09/New-Object-System.Net_.Sockets.TcpClient.jpg)

В Windows 10/ Windows Server 2016 вы можете использовать командлет Test-NetConnection для трассировки маршрута до удаленного сервера при помощи параметра **–****TraceRoute** (аналог tracert). С помощью параметра **–****Hops** можно ограничить максимальное количество хопов при проверке.

`Test-NetConnection msk-man01 –TraceRoute`

Командлет вернул сетевую задержку при доступе к серверу в милисекундах ( `PingReplyDetails (RTT) : 41 ms` ) и все IP адреса маршрутизаторов на пути до целевого сервера.

![Test-NetConnection TraceRoute](https://winitpro.ru/wp-content/uploads/2016/09/Test-NetConnection%E2%80%93TraceRoute.jpg)

## Test-NetConnection в скриптах мониторинга

Следующая команда позволить проверить доступность определенного порта на множестве серверов, список которых хранится в текстовом файле servers.txt. Нас интересуют сервера, где искомая служба не отвечает:

`Get-Content c:\Distr\servers.txt |  where { -NOT (Test-Netconnection $_ -Port 25  -InformationLevel Quiet)}| Format-Table –AutoSize`

Аналогичным образом вы можете создать простейшую систему мониторинга, которая проверяет доступность серверов и выводит [уведомление](https://winitpro.ru/index.php/2018/10/02/uvedomleniya-polzovateley-is-powershell/), если один из серверов недоступен.

Например, вы можете проверить доступность основных служб на всех контроллеров домена (список DC можно получить командлетом [Get-ADDomainController](https://winitpro.ru/index.php/2019/08/06/get-addomaincontroller-powershell/)). Проверим следующие службы на DC (в утилите [PortQry](https://winitpro.ru/index.php/2017/10/05/proverka-dostupnosti-tcp-i-udp-portov-s-pomoshhyu-portqryv2/) есть аналогичное правило Domain and trusts):

-   RPC – TCP/135
-   LDAP – TCP/389
-   LDAP – TCP/3268
-   DNS – TCP/53
-   Kerberos – TCP/88
-   SMB – TCP/445

`$Ports  = "135","389","636","3268","53","88","445","3269", "80", "443"   $AllDCs = Get-ADDomainController -Filter * | Select-Object Hostname,Ipv4address,isGlobalCatalog,Site,Forest,OperatingSystem   ForEach($DC in $AllDCs)   {   Foreach ($P in $Ports){   $check=Test-NetConnection $DC -Port $P -WarningAction SilentlyContinue   If ($check.tcpTestSucceeded -eq $true)   {Write-Host $DC.name $P -ForegroundColor Green -Separator " => "}   else   {Write-Host $DC.name $P -Separator " => " -ForegroundColor Red}   }`

Скрипт проверит указанные TCP порты на контроллерах домена, и, если один из портов недоступен, выделит его красным цветом (с небольшими доработками можно [запустить данный PowerShell скрипт как службу Windows](https://winitpro.ru/index.php/2019/04/03/zapusk-powershell-skripta-kak-sluzhby-windows/)).

![powershell: test-netconnection проверить порты на конроллерах домена](https://winitpro.ru/wp-content/uploads/2016/09/powershell-test-netconnection-check-porty.jpg)

## Сканер сети на PowerShell

Также вы можете реализовать простой сканер портов и IP подсетей для сканирования удаленных серверов или подсетей на открытые/закрытые TCP порты.

Просканируем диапазон IP адресов на открытый порт 3389:

`foreach ($ip in 5..30) {Test-NetConnection -Port 3389 -InformationLevel "Detailed" 10.10.10.$ip}`

Просканируем диапазон TCP портов от 1 до 1024 на указанном сервере:

`foreach ($port in 1..1024) {If (($a=Test-NetConnection srvfs01 -Port $port -WarningAction SilentlyContinue).tcpTestSucceeded -eq $true){ "TCP port $port is open!"}}`

