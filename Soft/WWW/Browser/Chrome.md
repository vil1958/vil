chrome://net-internals/#events
chrome://net-internals/#proxy
chrome://net-internals/#dns
chrome://net-internals/#sockets
chrome://net-internals/#hsts

chrome://bookmarks/

[Google Chrome 112.0.5615.121](https://www.slo.ru/files/browsers/google_chrome)

#plugin
Browsec
https://browsec.com/en/

Proxy SwitchyOmega
Идентификатор
padekgcemlokbadohgkifijomclgjgif

IDM Integration Module
https://www.internetdownloadmanager.com/
Идентификатор
ngpampappnmepgilojfohadhhmbhlaek

Google Переводчик
Идентификатор
aapbdbdomjkkjkaonfhkkikfgjllcleb

ImTranslator: Переводчик, Словарь, Голос
Идентификатор
noaijdpnepcgjemiklgfkcfbkokogabh

KeePassXC-Browser
Идентификатор
oboonakemofpalcgghocfoadofidjkkk


#proxy
##### [Configuring a SOCKS proxy server in Chrome](https://www.chromium.org/developers/design-documents/network-stack/socks-proxy/)

To configure chrome to proxy traffic through the SOCKS v5 proxy server _**myproxy:8080**_, launch chrome with these two command-line flags:

`D:\Users\vil\AppData\Local\Vivaldi\Application\vivaldi.exe --profile-directory="Profile_vil1958" --proxy-server="socks5://127.0.0.1:12345"'

`--proxy-server="socks5://127.0.0.1:12345"`
`--proxy-server="socks5://127.0.0.1:8080"`
`--host-resolver-rules="MAP * ~NOTFOUND , EXCLUDE 127.0.0.1"`

Удобнее и быстрее - просто запустить TOR, а браузер пускать со строкой _--proxy-server="socks5://127.0.0.1:9050"_ и не зависеть ни от расширений, ни от версий, ни от чего.


Флаг --proxy-server применяется только к загрузке URL. Существуют и другие компоненты Chrome, которые могут выполнять DNS-разрешения _напрямую_ и, следовательно, обходить этот прокси-сервер. Наиболее заметным таким компонентом является «предварительная выборка DNS». Следовательно, если предварительная выборка DNS не отключена в Chrome, вы все равно будете видеть локальные DNS-запросы, выдаваемые Chrome, несмотря на указанный прокси-сервер SOCKS v5.

Отключение предварительной выборки DNS решит эту проблему, однако это хрупкое решение, поскольку однажды необходимо знать обо всех областях в Chrome, которые выдают необработанные DNS-запросы. Чтобы решить эту проблему, следующий флаг --host-resolver-rules="MAP * ~NOTFOUND , EXCLUDE myproxy" является универсальным, чтобы запретить Chrome отправлять любые DNS-запросы по сети. В нем говорится, что все разрешения DNS должны быть просто сопоставлены с (недопустимым) адресом 0.0.0.0. Предложение «EXCLUDE» делает исключение для «myproxy», потому что в противном случае Chrome не сможет сам разрешить адрес прокси-сервера SOCKS, и все запросы обязательно завершатся с ошибкой PROXY_CONNECTION_FAILED.
