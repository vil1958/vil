[скачать](https://web.whatsapp.com/#)

##### [Как установить Whatsapp из Microsoft Store, не используя приложение Microsoft Store](https://dzen.ru/a/ZHnY_N-U6xeLFAqK)
#appx #powershell
**! Только копировать файлы не в папку  `Windows\System32`  , а например в 
`d:\Users\vil\`**

Друзья, всем привет! Сегодня рассмотрим вопрос установки Whatsapp из Microsoft Store, не используя его. То есть обойдем магазин приложений и установим Whatsapp

На своём компьютере я удалил магазин приложений от Windows, но Whatsapp пользуюсь. Ниже покажем, как установить последнюю версию мессенджера на Windows 10/11

![Друзья, всем привет! Сегодня рассмотрим вопрос установки Whatsapp из Microsoft Store, не используя его.](https://avatars.dzeninfra.ru/get-zen_doc/9709654/pub_6479d8fcdf94eb178b140a8a_6479da8c907e5327bc806b31/scale_1200)

На момент написания обзора у меня было 24 дня на использования 2.2319.9.0 версии Whatsapp:


Если у вас Microsoft Store нет ➣ удаляем нашу версию Whatsapp ➣ переходим по [ссылке](https://store.rg-adguard.net/) ➣ в строке поиска вбиваем **https://apps.microsoft.com/store/detail/whatsapp/9NKSQGP7F2NH**
![[whatsapp_01.webp]]

Нажимаем на файл, указанный красной стрелкой ➣ скачиваем его ➣ перемещаем в папку **`C:\windows\system32`** ➣ переименовываем его (я переименовал просто в Whatsapp)
![[whatsapp_02.webp]]


Также в ту же папку нужно скачать 2 файла, которые указаны стрелками ниже (это для х64 системы, соответственно если у вас 32 битная система скачивайте те же файлы, только х86)
Вот как они должны выглядеть в папке **`C:\windows\system32`**
![[whatsapp_03.webp]]
Переименовываем файлы:
![[whatsapp_04.webp]]

Далее устанавливать эти файлы и Whatsapp мы будем через PowerShell. Нажимаем ПУСК ➣ В поиске вбиваем PowerShell ➣ Запускаем от имени администратора

![Друзья, всем привет! Сегодня рассмотрим вопрос установки Whatsapp из Microsoft Store, не используя его.](https://avatars.dzeninfra.ru/get-zen_doc/9662528/pub_6479d8fcdf94eb178b140a8a_6479dfcbc2a48c0aabff08f0/scale_1200)

Вводим команды:
**`Add-AppxPackage -Path .\1.appx`**
**`Add-AppxPackage -Path .\2.appx`**
**`Add-AppxPackage -Path .\Whatsapp.Msixbundle`**
![[whatsapp_06.webp]]

После чего заходим в меню Пуск и видим наш новый установленный Whatsapp

![Друзья, всем привет! Сегодня рассмотрим вопрос установки Whatsapp из Microsoft Store, не используя его.-9](https://avatars.dzeninfra.ru/get-zen_doc/9729319/pub_6479d8fcdf94eb178b140a8a_6479e7acaa42181304e8eb28/scale_1200)

Далее заходим по стандартной системе, сканируем QR-код и пользуемся новой версией Whatsapp

При проблемах у меня:
```
https://dzen.ru/a/ZHnY_N-U6xeLFAqK
https://store.rg-adguard.net/

PS D:\Users\vil> Add-AppxPackage -Path .\1.appx
PS D:\Users\vil> Add-AppxPackage -Path .\2.appx
PS D:\Users\vil> Add-AppxPackage -Path .\watsApp.Msixbundle
PS D:\Users\vil>


Add-AppxPackage : Не удается найти путь "C:\Windows\System32\1.appx", так как он не существует.
https://mywebpc.ru/windows/ne-udaetsya-najti-appxmanifest-xml/

sfc /scannow
DISM /Online /Cleanup-Image /RestoreHealth
wsreset

Set-ExecutionPolicy Unrestricted
Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
Get-AppXPackage -AllUsers |Where-Object {$_.InstallLocation -like "*SystemApps*"} | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

```



```
REM WhatsApp Messenger 2.2317.11.0

REM https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe
REM https://web.whatsapp.com/desktop/windows/release/ia32/WhatsAppSetup.exe
```
