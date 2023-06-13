#### [Windows — узнать внешний IP из командной строки](https://dzen.ru/a/Yuvft7o0q3BJzed9)

`curl ifconfig.me`
ярлык:
`%comspec% /K curl ifconfig.me`

Свой внешний IP адрес можно узнать с помощью одной из команд:
```
REM chcp 1251
chcp 866
nslookup myip.opendns.com. resolver1.opendns.com  
nslookup -type=any myip.opendns.com. resolver1.opendns.com
```
Мы выполнили запрос к серверу DNS под названием resolver1.opendns.com. Он в свою очередь должен был выдать нам ip адрес доменного имени myip.opendns.com. Но весь смысл в том, что DNS сервер resolver1.opendns.com настроен так, чтобы при запросе конкретного домена выдавать ip адрес с которого поступил запрос. Вот так без особых усилий мы узнали наш внешний ip.

Если команда не сработает, попробуйте другую.
Если сервер поддерживает curl:
```
curl ifconfig.me  
curl -s checkip.dyndns.org  
curl ipinfo.io/ip  
curl v4.ident.me  
```

`curl -s checkip.dyndns.org | grep -Eo "[0-9][0-9.]{1,14}"`

Powershell
Можно использовать и Powershell. Будет удобно для дальнейшей работы с ip в ваших скриптах:


##### [Узнать внешний ip адрес из консоли Linux](https://newadmin.ru/kak-uznat-vneshnij-ip-iz-konsoli/)

Данный метод работоспособен для **_Ubuntu_**, **_Centos_**, **_Gentoo_** и прочих дистрибутивов:
`wget -qO- eth0.me`

На случай если указанный выше сайт перестанет работать ниже приведу еще несколько рабочих вариантов:
```
wget -qO- ipecho.net/plain
curl ifconfig.me
wget -O - -q ifconfig.me/ip
```

