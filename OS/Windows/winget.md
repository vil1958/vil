---
	tags: winget, json, powershell, upgrade
---
[##### Использование менеджера пакетов WinGet в Windows 10 и 11](https://winitpro.ru/index.php/2020/08/11/menedzher-paketov-winget-windows/)
Теперь установим, например, Windows Terminal и [VSCode для написания PowerShell скриптов](https://winitpro.ru/index.php/2019/08/08/visual-studio-code-powershell/):
Сначала ищем имена пакетов:
`winget search terminal   winget search "visual studio"`

Затем устанавливаем их по очереди:
`winget install Microsoft.WindowsTerminal –e ; winget install Microsoft.VisualStudioCode –e`

Если вы хотите запустить установку пакета программы в фоновом режиме, используйте параметр `--silent` :
`winget install "VLC media player" --silent`

При установке некоторых программ можно автоматически принять условия использования. Например, при установке набора утилит sysinternals:
`winget install sysinternals --accept-package-agreements`

По умолчанию программы устанавливаются на системный диск в каталоги Program Files. Вы можете изменить каталог установки программы:
`winget install microsoft.visualstudiocode --location "D:\Programs"`

## Winstall – графической интерфейс для менеджера пакетов WinGet

Пользователи, которым некомфортно работать в командной строке winget, могут использовать веб-сервис **Winstall** ([https://winstall.app/](https://winstall.app/)). Winstall представляет собой графический интерфейс для репозитория WinGet (для установки доступно более 2900 программ).

С помощью сервиса Winstall можно сгенерировать скрипт установки нужных вам программ. Найдите программы в репозитории и нажмите **+** для добавления их в скрипт установки.
Затем нажмите на кнопку **Generate Script** и сервис сформирует для вас команду установки выбранных приложений.

Скопируйте код со вкладки Batch или PowerShell и вставьте его соответственно в cmd.exe или PowerShell консоль.

## WinGet: Обновление и удаление программ в Windows

WinGet позволяет не только устанавливать программы, но и обновлять или удалять их. Для вывода списка установленных программ на компьютере выполните:
`Winget list`
Команда выведет полный список программ, установленных на компьютере (включая программы, установленные не через winget). Если для программы доступно обновление, в столбце **Available** будет указана новая версия.

Для обновления приложения, установленного через winget, выполните команды:  
`winget upgrade --id 7zip.7zip`

Можно обновить сразу все установленные программы:
`winget upgrade --all`

Для удаления программ используется команда:
`winget uninstall --name 7zip.7zip`

Вы также можете удалить приложения, установленные не через WinGet по их ID:
`winget uninstall --id "{0F693AA3-4387-4ACB-A6FD-3A396290587}"`

## Экспорт и импорт установленных приложений на другие компьютеры

С помощью WinGet вы можете экспортировать в JSON файл список приложений, установленных на компьютере и затем использовать этот файл для быстрой установки того же набора приложений на другом компьютере.

Для экспорта списка приложений в файл, выполните:
`winget export -o c:\ps\installedapps.json --include-versions`

Если для программы отсутствует манифест, то команда выведет ошибку « `The installed package is not available in any source` «.

Файл содержит список программ, установленный через Windows Package Manager.
Чтобы установить список программ из json файла на другом компьютере, выполните команду:
`winget import -o .\installedapps.json`

Можно указать, чтобы менеджер пакетов игнорировал версии и недоступные программы при установке, нужно добавить параметры `--ignore-unavailable` и `--ignore-versions`

[#### How to Install Windows Package Manager without Microsoft Store](https://bonguides.com/how-to-install-windows-package-manager-without-microsoft-store/)

```
wget https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage -Path .\Microsoft.VCLibs.x64.14.00.Desktop.appx

https://www.nuget.org/packages/Microsoft.UI.Xaml/
https://globalcdn.nuget.org/packages/microsoft.ui.xaml.2.8.3.nupkg

Change the file extension of downloaded file from .nuget to .zip then extract it to a folder.

e:\downloads\microsoft.ui.xaml.2.8.3\tools\AppX\x64\Release\Microsoft.UI.Xaml.2.8.appx
Add-AppxPackage -Path .\Microsoft.UI.Xaml.2.8.appx
```

### Install VC++ v14 Desktop Framework Package

1. Download the correct [VC++ v14 Desktop Framework Package](https://docs.microsoft.com/en-gb/troubleshoot/cpp/c-runtime-packages-desktop-bridge#how-to-install-and-update-desktop-framework-packages) for your architecture.

2. Install with: **Add-AppxPackage -Path “Path to file”**

```powershell
Add-AppPackage -Path .\Microsoft.VCLibs.x64.14.00.Desktop.appx
```

### Download and install Microsoft.UI.Xaml

Winget v1.2.10271 introduced a new dependency for Microsoft.UI.Xaml.2.7 and above which you have to install manually.

1. Download the [Nuget package](https://www.nuget.org/packages/Microsoft.UI.Xaml/) manually by clicking Download package on the right hand side under the About section.
2. Change the file extension of downloaded file from **.nuget** to **.zip** then extract it to a folder.
3.  Navigate to `tools\AppX\[YOUR ARCHITECTURE]\Release` and you can see the package.
4. Install with: **Add-AppxPackage -Path “Path to file”**

```powershell
Add-AppPackage -Path .\Microsoft.UI.Xaml.2.8.appx
```
### Installing Winget

1. Finally, download the .msixbundle package from: [https://github.com/microsoft/winget-cli/releases](https://github.com/microsoft/winget-cli/releases)

2. Install with: A**dd-AppxPackage -Path “Path to file”**

```powershell
Add-AppPackage -Path .\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
```

3. Verify that the installation succeeded by running winget in PowerShell. If no errors occur then you’re done!



