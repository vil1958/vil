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
Если команда не сработает, попробуйте другую.
Если сервер поддерживает curl:
```
curl ifconfig.me  
curl -s checkip.dyndns.org  
curl ipinfo.io/ip  
curl v4.ident.me  
```

`curl -s checkip.dyndns.org | grep -Eo "[0-9][0-9.]{1,14}"`
