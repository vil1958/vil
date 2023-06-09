#certificate #ssh

[##### Добавляем корневой доверенный сертификат в Linux](https://winitpro.ru/index.php/2022/09/28/ustanovit-kornevoj-doverennyj-sertifikat-ca-linux/#:~:text=%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0%20%D0%BA%D0%BE%D1%80%D0%BD%D0%B5%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%81%D0%B5%D1%80%D1%82%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%82%D0%B0%20%D0%B2%20Linux,-%D0%94%D0%BB%D1%8F%20%D0%BE%D0%B1%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%85%D1%80%D0%B0%D0%BD%D0%B8%D0%BB%D0%B8%D1%89%D0%B0&text=%D0%92%D1%8B%D0%B1%D0%B5%D1%80%D0%B8%D1%82%D0%B5%20%D0%B8%D0%B7%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%20%D1%81%D0%B5%D1%80%D1%82%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%82%D1%8B%2C%20%D0%BA%D0%BE%D1%82%D0%BE%D1%80%D1%8B%D0%B5,%D0%B2%20%D0%B8%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D1%8E%20%D0%BE%20%D0%BD%D0%BE%D0%B2%D1%8B%D1%85%20%D1%81%D0%B5%D1%80%D1%82%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%82%D0%B0%D1%85.)

Чтобы проверить, что ваш хост Linux не может проверить (и соответственно не доверяет) SSL сертификату на определенном сайте, выполните команду:

`curl –I https://192.168.1.2:5001`
`curl –I https://192.168.1.2:5006`

Если ваш файл сертификата в формате DER, вы можете конвертировать его в PEM формат с помощью утилиты openssl:
`openssl x509 -in my_trusted_sub_ca.der -inform der -out my_trusted_sub_ca.cer`

Сначала рассмотрим, как добавит корневой сертификат вашего CA в доверенные в дистрибутивах Linux на базе DEB (Ubuntu, Debian, Mint, Kali Linux).

Скопируйте файлы ваших сертификаты в хранилище сертификатов в каталог usr/local/share/ca-certificates/:

`sudo cp my_trusted_sub_ca.crt /usr/local/share/ca-certificates/`
`sudo cp my_trusted_root_ca.crt /usr/local/share/ca-certificates/`

Обновите хранилище сертификатов командой:

`sudo update-ca-certificates -v`

Если команда не найдена, установите пакет в Ubuntu:

`sudo apt-get install -y ca-certificates`


Вы можете убедиться, что ваша ОС доверяет сертификату с помощью команду:
`openssl verify my_trusted_sub_ca.crt`
`openssl verify root.crt`

Также вы можете добавить новые сертификаты в хранилище с помощью команды:
`sudo dpkg-reconfigure ca-certificates`
Выберите из списка сертификаты, которые нужно добавить в доверенные.

В Linux список доверенных сертификатов содержится в файле /etc/ssl/certs/ca-certificates.crt. Обе рассмотренные выше команды обновят этот файл и добавят в информацию о новых сертификатах.

Вы можете проверить, что ваши сертификаты были добавлены в доверенные с помощью команды:
`awk -v cmd='openssl x509 -noout -subject' ' /BEGIN/{close(cmd)};{print | cmd}' < /etc/ssl/certs/ca-certificates.crt | grep -i YourCASubj`

Укажите часть Common Name вашего сертификата вместо YourCASubj для поиска в хранилище по subject.
Можно также вручную добавить путь к сертификату:
`sudo mkdir /usr/share/ca-certificates/extra   `

`sudo cp my.crt /usr/share/ca-certificates/extra/mycert1.crt`
`sudo vim /etc/ca-certificates.conf`

`exta/mycert1.crt`

`sudo update-ca-certificates`  

Чтобы удалить сертификат, удалите ваш crt файл:
`sudo rm /usr/local/share/ca-certificates/yourcert.crt`

И обновите хранилище:
`sudo update-ca-certificates --fresh`

[##### Обновление корневых сертификатов в Windows](https://winitpro.ru/index.php/2017/03/20/obnovlenie-kornevyx-sertifikatov-v-windows/)
#windows

##### Добавить корневой доверенный сертификат для браузеров Mozilla, Chrome
#browser #certificate 

Теперь все системные утилиты будут доверять сайтам, использующим данный CA. Но это не повлияет на веб браузеры Mozilla Firefox или Google Chrome. Они по-прежнему будут показывать предупреждение о недоверенном сертификате.

Дело в том, что браузеры Firefox, Chromium, Google Chrome, Vivaldi и даже почтовый клиент Mozilla Thunderbird не используют системное хранилище сертификатов Linux. Хранилище сертификатов для этих программ находится в директории пользователя в файле **cert8.db** (для Mozilla) или **cert9.db** (для Chromium и Chrome). Для обновления этих хранилищ сертификатов используется утилита certutil из пакета libnss3-tools.

Установите пакет:
`sudo apt install libnss3-tools`

Теперь выполните следующие скрипты для добавления ваших сертификатов в хранилище через NSS:
```
#!/bin/bash  
certfile="my_rusted_root_ca.crt"  
certname="My Root CA1"  
for certDB in $(find ~/ -name "cert8.db")  
do  
certdir=$(dirname ${certDB});  
certutil -A -n "${certname}" -t "TCu,Cu,Tu" -i ${certfile} -d dbm:${certdir}  
done  
for certDB in $(find ~/ -name "cert9.db")  
do  
certdir=$(dirname ${certDB});  
certutil -A -n "${certname}" -t "TCu,Cu,Tu" -i ${certfile} -d sql:${certdir}  
done
```

После запуска скрипта, сайтам с данным CA будут доверять все браузеры.

И да, подскажите пожалуйста как .cer в .crt перегнать, делал из PEM
`openssl x509 -inform PEM -in certificate.cer -out certificate.crt`

мой hosts:
127.0.0.1	localhost
127.0.1.1	llvil
192.168.1.1 vil.tp-link.com
192.168.1.2     nas
192.168.1.2     nas.vil1958.synology.me
192.168.1.2     NTP-server-host

https://nas.vil1958.synology.me:5001/#/signin

Router
https://192.168.1.1
https://192.168.1.1/webpages/login.html
https://vil.tp-link.com/webpages/login.html
192.168.1.1 vil.tp-link.com
TP-Link
tp-link.com
vil.tp-link.com

vil.tplinkwifi.net

Веб-сайты подтверждают свою подлинность с помощью сертификатов. Firefox не доверяет этому сайту, потому что он использует сертификат, недействительный для tplinkwifi.net. Сертификат действителен только для следующих доменов: *.tp-link.com, tp-link.com


# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters  



