 [win7_tweaks_v2023.bat](https://gist.github.com/wincmd64/e357bd54a4e7883c9a1b49f4c0ee0970)
```
:: Быстрая настройка Windows 7
:: Кодировка этого файла должна быть OEM 866
:: https://t.me/wincmd64

NET SESSION
IF %ERRORLEVEL% NEQ 0 GOTO ELEVATE
GOTO ADMINTASKS

:ELEVATE
CD /d %~dp0
MSHTA "javascript: var shell = new ActiveXObject('shell.application'); shell.ShellExecute('%~nx0', '', '', 'runas', 1);close();"
exit

:ADMINTASKS
cls
@echo off
echo RUN SCRIPT ?
pause
@echo on

:: Схема питания "Высокая производительность"
powercfg /S 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

:: Проводник. Всегда показывать расширения файлов
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f

:: Проводник. Отключить префикс " - ярлык" при создании новых ярлыков
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates" /v ShortcutNameTemplate /d \"%%s.lnk\" /f

:: Панель управления. Крупные значки
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" /v StartupPage /t REG_DWORD /d 1 /f

:: Панель задач. Переходить на последнее открытое окно при клике по сгруппированым приложениям
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LastActiveClick /t REG_DWORD /d 1 /f
:: ...или вовсе не группировать 
:: reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarGlomLevel /t REG_DWORD /d 2 /f

:: Вид меню Пуск
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowRun /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowMyDocs /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowMyMusic /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowMyPics /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowSetProgramAccessAndDefaults /t REG_DWORD /d 0 /f

:: Блокнот. Отображать строку состояния
reg add "HKCU\Software\Microsoft\Notepad" /v StatusBar /t REG_DWORD /d 1 /f

:: En Ru Ua и Ctrl+Shift
reg add "HKCU\Keyboard Layout\Preload" /v 1 /d 00000409 /f
reg add "HKCU\Keyboard Layout\Preload" /v 2 /d 00000419 /f
reg add "HKCU\Keyboard Layout\Preload" /v 3 /d 00000422 /f
reg add "HKCU\Keyboard Layout\Toggle" /v "Language Hotkey" /d 2 /f

:: Вид консоли
reg add HKCU\Console\%%SystemRoot%%_system32_cmd.exe /v FaceName /d Consolas /f
reg add HKCU\Console\%%SystemRoot%%_system32_cmd.exe /v FontSize /t REG_DWORD /d 1048576 /f
reg add HKCU\Console\%%SystemRoot%%_system32_cmd.exe /v FontWeight /t REG_DWORD /d 400 /f
reg add HKCU\Console\%%SystemRoot%%_system32_cmd.exe /v ScreenBufferSize /t REG_DWORD /d 19660920 /f
reg add HKCU\Console\%%SystemRoot%%_system32_cmd.exe /v WindowSize /t REG_DWORD /d 1638520 /f

:: Вид PowerShell (минуя "Windows PowerShell.lnk")
reg add HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe /v FaceName /d "Lucida Console" /f
reg add HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe /v FontSize /t REG_DWORD /d 786432 /f
reg add HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe /v FontWeight /t REG_DWORD /d 400 /f
reg add HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe /v ScreenBufferSize /t REG_DWORD /d 19660920 /f
reg add HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe /v WindowSize /t REG_DWORD /d 3276920 /f
reg add HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe /v ColorTable00 /t REG_DWORD /d 5645313 /f
reg add HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe /v ColorTable07 /t REG_DWORD /d 15789550 /f
reg add HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe /v ColorTable05 /t REG_DWORD /d 8421376 /f

:: Определяет положение переключателей в окне Быстродействие (SystemPropertiesPerformance.exe)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 3 /f
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9032078010000000 /f
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f

:: Схема курсоров "Windows Aero (крупный)"
reg add "HKCU\Control Panel\Cursors" /ve /d "Windows Aero (крупный)" /f
reg add "HKCU\Control Panel\Cursors" /v "AppStarting" /t REG_EXPAND_SZ /d "%%SystemRoot%%\cursors\aero_working_l.ani" /f
reg add "HKCU\Control Panel\Cursors" /v "Arrow" /t REG_EXPAND_SZ /d "%%SystemRoot%%\cursors\aero_arrow_l.cur" /f
reg add "HKCU\Control Panel\Cursors" /v "Hand" /t REG_EXPAND_SZ /d "%%SystemRoot%%\cursors\aero_link_l.cur" /f
reg add "HKCU\Control Panel\Cursors" /v "Help" /t REG_EXPAND_SZ /d "%%SystemRoot%%\cursors\aero_helpsel_l.cur" /f
reg add "HKCU\Control Panel\Cursors" /v "No" /t REG_EXPAND_SZ /d "%%SystemRoot%%\cursors\aero_unavail_l.cur" /f
reg add "HKCU\Control Panel\Cursors" /v "NWPen" /t REG_EXPAND_SZ /d "%%SystemRoot%%\cursors\aero_pen_l.cur" /f
reg add "HKCU\Control Panel\Cursors" /v "SizeAll" /t REG_EXPAND_SZ /d "%%SystemRoot%%\cursors\aero_move_l.cur" /f
reg add "HKCU\Control Panel\Cursors" /v "SizeNESW" /t REG_EXPAND_SZ /d "%%SystemRoot%%\cursors\aero_nesw_l.cur" /f
reg add "HKCU\Control Panel\Cursors" /v "SizeNS" /t REG_EXPAND_SZ /d "%%SystemRoot%%\cursors\aero_ns_l.cur" /f
reg add "HKCU\Control Panel\Cursors" /v "SizeNWSE" /t REG_EXPAND_SZ /d "%%SystemRoot%%\cursors\aero_nwse_l.cur" /f
reg add "HKCU\Control Panel\Cursors" /v "SizeWE" /t REG_EXPAND_SZ /d "%%SystemRoot%%\cursors\aero_ew_l.cur" /f
reg add "HKCU\Control Panel\Cursors" /v "UpArrow" /t REG_EXPAND_SZ /d "%%SystemRoot%%\cursors\aero_up_l.cur" /f
reg add "HKCU\Control Panel\Cursors" /v "Wait" /t REG_EXPAND_SZ /d "%%SystemRoot%%\cursors\aero_busy_l.ani" /f


:: Команды ниже требуют повышение прав на выполнение


:: UAC (1 вкл. 0 выкл.)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f
:: без заморозки (предпоследнее положение ползунка)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 5 /f

:: Отключает блокировку скачанных файлов. https://habr.com/ru/post/505194/
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v SaveZoneInformation /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v SaveZoneInformation /t REG_DWORD /d 1 /f

:: Отключает поиск в сети Интернет при открытии файла с неизвестным расширением
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoInternetOpenWith /t REG_DWORD /d 1 /f

:: Отключает гибернацию и удаляет файл C:\hiberfil.sys
powercfg -h off

:: Настраиваем локальную сеть
net user Гость /active:yes
netsh advfirewall firewall set rule group="Обнаружение сети" new enable=Yes
netsh advfirewall firewall set rule group="Общий доступ к файлам и принтерам" new enable=Yes

:: Отключает службу "Центр обеспечения безопасности"
sc stop "wscsvc" && sc config "wscsvc" start= disabled

:: En Ru Ua и Ctrl+Shift для Logon Screen
reg add "HKU\.DEFAULT\Keyboard Layout\Preload" /v 1 /d 00000409 /f
reg add "HKU\.DEFAULT\Keyboard Layout\Preload" /v 2 /d 00000419 /f
reg add "HKU\.DEFAULT\Keyboard Layout\Preload" /v 3 /d 00000422 /f
reg add "HKU\.DEFAULT\Keyboard Layout\Toggle" /v "Language Hotkey" /d 2 /f

:: Отключает задание WinSAT в планировщике
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Maintenance\WinSAT"

:: Разрешить пользователям менять системное время
if exist "%~dp0ntrights.exe" ("%~dp0ntrights.exe" +r SeSystemtimePrivilege -u "Все")

pause
```

Line continuation:
```
call C:\WINDOWS\system32\ntbackup.exe ^
    backup ^
    /V:yes ^
    /R:no ^
    /RS:no ^
    /HC:off ^
    /M normal ^
    /L:s ^
    @daily.bks ^
    /F daily.bkf
```
This will open up Windows Explorer in the "some_directory" folder:
````
start .
````

I heard :: is more efficient than REM because REM attempts to do environment variable expansion on the stuff that occurs after it, but :: does not

Variable substrings:
```
> set str=0123456789
> echo %str:~0,5%
01234
> echo %str:~-5,5%
56789
> echo %str:~3,-3%
3456
```


