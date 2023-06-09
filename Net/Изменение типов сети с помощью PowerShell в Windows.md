https://zawindows.ru/%D0%BA%D0%B0%D0%BA-%D0%B8%D0%B7%D0%BC%D0%B5%D0%BD%D0%B8%D1%82%D1%8C-%D1%82%D0%B8%D0%BF-%D1%81%D0%B5%D1%82%D0%B5%D0%B2%D0%BE%D0%B3%D0%BE-%D0%BF%D1%80%D0%BE%D1%84%D0%B8%D0%BB%D1%8F-%D0%BE%D1%82%D0%BA/

`Get-NetConnectionProfile`

```
Name                     : OpenVPN TAP-Windows6 3
InterfaceAlias           : OpenVPN TAP-Windows6
InterfaceIndex           : 8
NetworkCategory          : Public
DomainAuthenticationKind : None
IPv4Connectivity         : NoTraffic
IPv6Connectivity         : NoTraffic

Name                     : NET_192.168.1
InterfaceAlias           : eth_192.168.1.33
InterfaceIndex           : 17
NetworkCategory          : Private
DomainAuthenticationKind : None
IPv4Connectivity         : Internet
IPv6Connectivity         : NoTraffic
```

Попробуем изменить назначенный сетевой профиль для «OpenVPN TAP-Windows6 3». Нам нужно получить индекс, присвоенный этой сетевой карте. В этом примере **InterfaceIndex** равен 8.

После получения индекса сетевого адаптера (значение поля **InterfaceIndex**) вы можете изменить тип сети на Private (Частный):
`Set-NetConnectionProfile -InterfaceIndex 8 -NetworkCategory Private`

Убедитесь, что профиль сети изменился:
`Get-NetConnectionProfile -InterfaceIndex 8`

## Установка типа сети с помощью реестра Windows  

Тип сети также можно изменить в редакторе реестра. Для этого запустите regedit.exe (это можно сделать нажав **Win+r** и введя "**regedit**") и перейдите к следующему ключу: **HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles**. Этот раздел реестра содержит профили всех сетевых подключений.

Вы можете найти необходимый сетевой профиль по его имени, указанному (в Центре управления сетями и общим доступом) в параметре реестра **ProfileName**.

[![](https://zawindows.ru/wp-content/uploads/2021/01/network-type-10.png)](https://zawindows.ru/wp-content/uploads/2021/01/network-type-10.png)

Тип сети указывается в параметре Category. Доступны следующие значения:

-   **0** - публичная сеть
-   **1** - Частная сеть
-   **2** - Доменная сеть

[![](https://zawindows.ru/wp-content/uploads/2021/01/network-type-9.png)](https://zawindows.ru/wp-content/uploads/2021/01/network-type-9.png)

Измените значение ключа на нужное и перезагрузите компьютер.

## Изменение типа сетевого расположения с помощью политики безопасности  

Другой способ изменить тип сетевого расположения — использовать редактор локальной политики безопасности. Запустите **secpol.msc** и перейдите в раздел **Политики диспетчера списков сетей**. Справа найдите свою сеть по имени, отображаемому в Центре управления сетями и общим доступом. Откройте свойства сети и перейдите на вкладку «**Сетевое расположение**», затем измените тип сети с «**Не задано**» на «**Личное**» и сохраните изменения. Чтобы запретить пользователям изменять сетевой профиль, выберите опцию «**Пользователь не может изменить местоположение**».

[![](https://zawindows.ru/wp-content/uploads/2021/01/secpol.msc_.png)](https://zawindows.ru/wp-content/uploads/2021/01/secpol.msc_.png)

Примечание: если сервер или компьютер присоединён к домену AD, вы не можете изменить тип сети. После перезагрузки он автоматически вернётся в доменную сеть.



