https://192-168-1-2.vil1958.direct.quickconnect.to:5001/

#nas #synology
Подключение к NAS через Web Interface  

http://QuickConnect.to/vil1958

QuickConnect ID: vil1958

vil
sergcS1958

vil
1

https://192-168-1-2.vil1958.direct.quickconnect.to:5001/



router port            localport 192.168.1.2 TCP
49371                   80
49372                   443
49373                   5000
49374                   5001
61749                   6690                     

#### [Служба NTP](https://kb.synology.com/ru-ru/DSM/help/DSM/AdminCenter/system_ntpservice?version=7)

#ntp
Вы можете сделать Synology NAS сервером сетевого времени для синхронизации времени между разными сетевыми устройствами и Synology NAS по сети.

#### Включение службы NTP

В разделе **Панель управления** > **Региональные параметры** > **Служба NTP** установите флажок **Включить службу NTP** и нажмите **Применить**.

#### Примечание.

- Для Surveillance Station и кластера высокой доступности требуется служба NTP. Поэтому, если на устройстве Synology NAS установлена и работает Surveillance Station или Synology High Availability, службу NTP нельзя отключить при запущенных пакетах.
- Чтобы синхронизировать дату и время между мобильным устройством и Synology NAS, рекомендуется установить флажок **Включить службу NTP**. Если у вас возникли проблемы с синхронизацией, см. [эту статью](https://kb.synology.com/ru-ru/DSM/tutorial/how_to_sync_time_between_mobile_NTP)



