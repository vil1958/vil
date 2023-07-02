#### [Доступ к сетевым дискам из программ, запущенных с правами администратора](https://winitpro.ru/index.php/2015/03/11/nework-disk-access-from-elevated-programs/)

Если вы используете подключенные сетевые диски на рабочих станциях, вероятно вы заметили, что они не доступны в программах, запущенных с правами администратора (в том числе в cmd и PowerShell). Это связано с функционалом User Account Control (UAC). Включенный UAC с настройками по-умолчанию не позволяет получить доступ **к подключенным (через net use) сетевым дискам из приложений, запущенных в привилегированном режиме** (Run As Administrator). Это означает, что при запуске командной строки или файлового менеджера (того же, Total Commander) с повышенными правами, в них будут не видны буквы дисков смонтированных сетевых папок.

Проблема наблюдается, если выполняются следующие условия

- В сессию пользователя подключены сетевые диски (через GPO или вручную через `net use` );
- На компьютере включен UAC (параметр GPO User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode имеет значение по-умолчанию “Prompt for credentials”);![политика UAC Behavior elevation prompt](https://winitpro.ru/wp-content/uploads/2015/03/UAC-Behavior-elevation-prompt.jpg)
- У текущего пользователя есть права локального администраора на компьютере и он запускает приложение в режиме Run as administrator.

В этом случае сетевые диски отображаются в проводнике Windows и в программах, но недоступны в любых приложениях, запуженные в привелигированном режиме.

В этой заметке мы покажем, как в Windows 10 **разрешить доступ к сетевым дискам из приложений, работающих в привилегированном режиме** (запущенных от имени администратора). Проблема проявляется как для [сетевых дисков, подключенных через групповые политики](https://winitpro.ru/index.php/2020/07/14/podklychit-setevoy-disk-windows-gpo/), так и для папок подключенных пользователей самостоятельно.

**Важно**. Настоятельно не рекомендуется совсем [отключать UAC](https://winitpro.ru/index.php/2010/11/12/eshhe-neskolko-sposobov-otklyuchit-uac-v-windows-7/) на компьютере, даже для одного [конкретного приложения](https://winitpro.ru/index.php/2014/04/17/kak-otklyuchit-uac-dlya-opredelennogo-prilozheniya/).

## Подключенные сетевые диски не отображаются в приложении

Проверим, что при [включенном UAC](https://winitpro.ru/index.php/2016/05/16/polzunok-user-account-control-i-nastrojki-gruppovyx-politik/) вы не можете из привилегированного приложения получить доступ к подключенному в обычном режиме сетевому диску.

Например, откроем командную строку с правами пользователя и проверим что мы можем получить доступ к содержимому подключенного сетевого диска Z:\.
`Net use   Dir z:`

Команда вывела содержимое сетевой папки.

![Доступ к сетевому диску из сессии пользователя](https://winitpro.ru/wp-content/uploads/2015/03/net-use-setevaya-papka.jpg)

Если в контексте этого же пользователя открыть [окно командной строки с правами администратора](https://winitpro.ru/index.php/2012/09/24/zapusk-komandnoj-stroki-s-pravami-administratora-v-windows-8/), то при попытке получить доступ к этому же диску, появится сообщение, что указанный путь не найден:

The system cannot find the path specified.

Системе не удается найти указанный путь.

![нет доступа к подключенной сетевой папке из командной стрки с правами администартора](https://winitpro.ru/wp-content/uploads/2015/03/setevaya-papka-ne-dostupna-cmd-as-admin.jpg)

Такое поведение системы может вызывать ряд неудобств при частом запуске приложений в привилегированном режиме. Можно [запускать приложения без прав администратора](https://winitpro.ru/index.php/2018/06/28/zapusk-programmy-bez-prav-admina-i-zaprosa-uac/), но это не всегда применимо.

**Почему это происходит?** Данная особенность связана с механизмом работы UAC для пользователя с правами локального администратора. Дело в том, что при входе такого пользователя в систему создаются два маркера доступа: один маркер доступа с отключенными правами администратора (маркер фильтрованного доступа – из-под которого запускаются большинство программ) и маркер полноценного администратора, обладающего полными правами в системе (в этом контексте выполняются все программы, получившие подтверждение на повышение прав в UAC).

Если с помощью команды `whoami /all` сравнить текущие привилегии одного и того же пользователя в двух сессиях cmd.exe (обычной и привилегированной), можно увидеть, что они сильно отличаются. В следующей таблице перечислены отличия в группах и текущих полномочиях в каждой сессии.

|   |   |   |
|---|---|---|
||Обычная сесия пользователя|Привелигированная сесиия пользователя|
|Группа доступа|Обязательная метка\Средний обязательный уровень (Medium Mandatory Level) Метка S-1-16-8192|Обязательная метка\Высокий обязательный уровень (High Mandatory Level) Метка S-1-16-12288|
|Привелегии|SeLockMemoryPrivilege<br><br>SeMachineAccountPrivilege<br><br>SeShutdownPrivilege<br><br>SeChangeNotifyPrivilege<br><br>SeUndockPrivilege<br><br>SeIncreaseWorkingSetPrivilege<br><br>SeTimeZonePrivilege|SeLockMemoryPrivilege<br><br>SeIncreaseQuotaPrivilege<br><br>SeMachineAccountPrivilege<br><br>SeSecurityPrivilege<br><br>SeTakeOwnershipPrivilege<br><br>SeLoadDriverPrivilege<br><br>SeSystemProfilePrivilege<br><br>SeSystemtimePrivilege<br><br>SeProfileSingleProcessPrivilege<br><br>SeIncreaseBasePriorityPrivilege<br><br>SeCreatePagefilePrivilege<br><br>SeBackupPrivilege<br><br>SeRestorePrivilege<br><br>SeShutdownPrivilege<br><br>SeSystemEnvironmentPrivilege<br><br>SeChangeNotifyPrivilege<br><br>SeRemoteShutdownPrivilege<br><br>SeUndockPrivilege<br><br>SeManageVolumePrivilege<br><br>SeImpersonatePrivilege<br><br>SeCreateGlobalPrivilege<br><br>SeIncreaseWorkingSetPrivilege<br><br>SeTimeZonePrivilege<br><br>SeCreateSymbolicLinkPrivilege<br><br>SeDelegateSessionUserImpersonatePrivilege|

![whoami all](https://winitpro.ru/wp-content/uploads/2015/03/whoami-all.jpg)

При включенном UAC приложения под одним и тем же пользователем могут запускаться в двух контекстах (привилегированном и непривилегированном). При подключении общих сетевых папок, система создает символические ссылки (DosDevices), в которых хранится сопоставление буквы диска и UNC пути. Эти ссылки ассоциируются с текущим сеансом для текущего маркера доступа процесса и недоступны из-под другого маркера.

Соответственно, может иметь место и обратная проблема: если пользователь обладает правами администратора на своем компьютере, то при подключении сетевых дисков через логон-скрипты групповых политик, задания планировщика или SCCM (которые запускаются с повышенными привилегиями), эти диски не видны пользователю в проводнике Windows (непривилегированный процесс).

**Примечание**. В Windows вы можете [запустить Проводник Windows с повышенными привилегиями](https://winitpro.ru/index.php/2016/07/28/zapusk-provodnika-windows-ot-imeni-administratora/).

В качестве обходного решения можно порекомендовать подключать сетевые диски из командой строки, запущенной с правами администратора (через `net use` или `rundll32 SHELL32.dll,SHHelpShortcuts_RunDLL Connect` ). Но это решение не всегда применимо, и не очень удобно.

## Enablelinkedconnections: разрешить доступ к сетевым дискам из программ, запущенных с правами администратора

Есть более простое решение. Для его реализации нужно внести следующие изменения в реестр:

1. Откройте редактор реестра (**regedit.exe**);
2. Перейдите в раздел реестра **`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System` ;  
3. Создайте новый параметр (типа DWORD) с именем **EnableLinkedConnections** и значением **1 ;**![Параметр реестра EnableLinkedConnections](https://winitpro.ru/wp-content/uploads/2015/03/EnableLinkedConnections-2.jpg)  
    
    **Совет**. То же самое можно сделать одной командой:  
    `[New-ItemProperty](https://winitpro.ru/index.php/2017/02/07/rabotaem-s-reestrom-windows-cherez-powershell/) -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name EnableLinkedConnections -Value 1 -PropertyType 'DWord'`
    
4. Перезагрузите компьютер (или перезапустите службу LanmanWorkstation командой PowerShell: `[get-service](https://winitpro.ru/index.php/2019/09/05/upravlenie-sluzhbami-windows-powershell/) LanmanWorkstation |Restart-Service –Force` , и перезайдите в систему).

Это работает во всех версиях Windows, начиная с Vista и заканчивая Windows 10 / Windows Server 2016.

В обратную сторону это тоже работает: все сетевые диски, подключенные в контексте привилегированной сессии, будут доступны и в обычной сессии.

![Доступ к сетевым дискам (net use) из прилжения, запущенного с повышенными правами](https://winitpro.ru/wp-content/uploads/2015/03/dostup-k-setevym-diskam-pod-adminom.jpg)

**Совет**. К сожалению, в групповых политиках отсутствует возможность включения параметра EnableLinkedConnections, поэтому для применения этих настроек на компьютеры домена придется [распространить параметр реестра через GPP](https://winitpro.ru/index.php/2016/01/19/nastrojka-klyuchej-reestra-s-pomoshhyu-gruppovyx-politik/).

**Как это работает.** После включения параметра реестра EnableLinkedConnections, служба LanmanWorkstation и LSA будут проверять наличие второго маркера доступа, связанного с сессией текущего пользователя. Если такой маркер доступа обнаружен, список подключенных сетевых дисков копируется из одного маркера в другой. Таким образом сетевые диски, подключенные в привилегированном режиме, будут видны в обычном и наоборот.

**Совет**. В качестве альтернативного решения можно предложить [создать символическую ссылку](https://winitpro.ru/index.php/2021/03/03/ispolzovanie-simlink-ssylok-v-windows/) на целевой сетевой каталог. Например, так  
`mklink /D c:\docs \\msk-fs1\docs`  
Доступ к данному каталогу будет возможен и в обычном и в привилегированном режиме. Из недостатков метода, отметим, что доступ на общую папку выполняется с полномочиями текущего пользователя. Нельзя, как в случае с net use, использовать учетную запись другого пользователя.

После включения параметра EnableLinkedConnections сетевые диски также станут доступны из заданий планировщика, запущенных из-под текущего пользователя. Если задание запускается [от имени LocalSystem](https://winitpro.ru/index.php/2011/12/26/zapusk-cmd-ot-system-v-windows-7/) или другого пользователя, сетевые диски текущего пользователя, естественно, будут недоступны.