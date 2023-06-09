# AnyDesk 7.1.12
https://www.slo.ru/files/admin/anydesk

[https://askubuntu.com/questions/1405323/anydesk-doesn-t-work-after-upgrading-to-ubuntu-22-04-lts](https://askubuntu.com/questions/1405323/anydesk-doesn-t-work-after-upgrading-to-ubuntu-22-04-lts)

### Essentially, you need to download and install 

`libpangox`

###  manually with:

`wget http://ftp.us.debian.org/debian/pool/main/p/pangox-compat/libpangox-1.0-0_0.0.2-5.1_amd64.deb`

`sudo apt install ./libpangox-1.0-0_0.0.2-5.1_amd64.deb`

[https://computingforgeeks.com/how-to-install-anydesk-on-ubuntu/](https://computingforgeeks.com/how-to-install-anydesk-on-ubuntu/)

`sudo apt update && sudo apt -y upgrade`

### Import AnyDesk GPG key for signing APT packages.

```
curl -fsSL https://keys.anydesk.com/repos/DEB-GPG-KEY|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/anydesk.gpg
```

### Then add AnyDesk repository content to your Ubuntu system.

```
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
```

### Finally update apt cache and install the latest release of AnyDesk on Ubuntu 22.04|20.04|18.04 Linux.

`sudo apt update && sudo apt -y upgrade`
`sudo apt install anydesk`

AnyDesk Install

---------------
https://www.linuxcapable.com/ru/%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C-Anydesk-%D0%BD%D0%B0-ubuntu-linux/
Ubuntu 22.04
Прежде чем приступить к руководству, убедитесь, что ваша система обновлена ​​со всеми существующими пакетами.
`sudo apt update`

При желании вы можете перечислить обновления для пользователей, которым требуется просмотр или любопытство
`sudo apt --list upgradable`

Перейдите к обновлению всех устаревших пакетов, используя следующую команду.
`sudo apt upgrade`

Следующие зависимости должны быть установлены. Большинство этих пакетов уже есть в вашей системе, но выполнение команды может помочь убедиться, что они установлены.
`sudo apt install dirmngr ca-certificates software-properties-common apt-transport-https curl -y`
Если вы пропустите и столкнетесь с проблемами, вернитесь и просто запустите команду.

Первым шагом является импорт ключа GPG для проверки подлинности пакетов. В терминале выполните следующую команду для импорта в цепочку для ключей.
`sudo curl -fsSL https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo gpg --dearmor | sudo tee /usr/share/keyrings/anydesk.gpg > /dev/null`

Затем импортируйте репозиторий AnyDesk.
`echo 'deb [signed-by=/usr/share/keyrings/anydesk.gpg] http://deb.anydesk.com/ all main' | sudo tee /etc/apt/sources.list.d/anydesk.list`

Теперь запустите обновление APT, чтобы отразить недавно импортированный репозиторий.
`sudo apt update`

Наконец, вы можете установить AnyDesk, используя следующую команду.
`sudo apt install anydesk -y`

## Запустите AnyDesk в Ubuntu Linux

Теперь, когда у вас установлено программное обеспечение, запуск можно выполнить несколькими способами.
Используя терминал командной строки, вы можете быстро открыть его, используя следующую команду.
`anydesk`

## Обновите AnyDesk в Ubuntu Linux

Программное обеспечение должно обновляться с помощью ваших системных пакетов для пользователей настольных компьютеров с помощью диспетчера пакетов APT. Для пользователей, которые хотят проверить вручную, используйте следующую команду в своем терминале.
`sudo apt update && sudo apt upgrade`

## Удалить AnyDesk в Ubuntu Linux

Если вы больше не хотите, чтобы программное обеспечение для видеоконференций было установлено в вашей системе, используйте следующую команду для его удаления.
`sudo apt autoremove anydesk --purge -y`
Удалите репозиторий, если вы не планируете повторно устанавливать AnyDesk.
`sudo rm /etc/apt/sources.list.d/anydesk.list /usr/share/keyrings/anydesk.gpg`



[https://infoit.com.ua/linux/ubuntu/kak-ustanovit-anydesk-v-ubuntu-20-04-18-04-linux/](https://infoit.com.ua/linux/ubuntu/kak-ustanovit-anydesk-v-ubuntu-20-04-18-04-linux/)

`sudo apt update && sudo apt upgrade -y`
`sudo apt-get install libgnutls28-dev`

`wget -qO - [https://keys.anydesk.com/repos/DEB-GPG-KEY](https://keys.anydesk.com/repos/DEB-GPG-KEY) | sudo apt-key add -``

`sudo apt-key del D56311E5FF3B6F39D5A16ABE18DF3741CDFFDE29` удалить ключ

`echo "deb [http://deb.anydesk.com/](http://deb.anydesk.com/) all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list`

`sudo apt update`
`sudo apt install anydesk`

Шаг 1: Обновите систему Ubuntu

Начните с того, что ваша система будет обновлена.
`sudo apt update`
`sudo apt -y upgrade`

Добавить репозиторий AnyDesk
Импортируйте ключ AnyDesk GPG для подписи пакетов APT.

new:
`curl -s https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/anydesk.gpg --import`

`sudo chmod 644 /etc/apt/trusted.gpg.d/anydesk.gpg`
`cp /etc/apt/trusted.gpg.d/anydesk.gpg /usr/share/keyrings/anydesk.gpg`

deprecreted:
`wget -qO - [https://keys.anydesk.com/repos/DEB-GPG-KEY](https://keys.anydesk.com/repos/DEB-GPG-KEY) | sudo apt-key add -`

Затем добавьте содержимое репозитория AnyDesk в вашу систему Ubuntu.
`echo "deb [http://deb.anydesk.com/](http://deb.anydesk.com/) all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list`

Шаг 3. Установите AnyDesk в Ubuntu 20.04 / 18.04 LTS.

Наконец, обновите apt cache и установите последнюю версию AnyDesk в Ubuntu 20.04 / 18.04 Linux.

`sudo apt update`
`sudo apt install anydesk`

Шаг 4. Запустите AnyDesk в Ubuntu 20.04 / 18.04.

После установки запустите приложение AnyDesk в Ubuntu 20.04 / 18.04 LTS с помощью средства запуска настольных приложений.
.`anydesk`