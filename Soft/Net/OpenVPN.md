https://community.openvpn.net/openvpn/wiki/OpenvpnSoftwareRepos

## OpenVPN 2.6.2 -- Released 24 March 2023
https://community.openvpn.net/openvpn/wiki/Downloads

Windows: https://www.comss.ru/page.php?id=4066

#### 2. Скачайте и загрузите файл конфигурации подключения OpenVPN (файл. ovpn)

Данная процедура требуется только при первичной настройке подключения.

Файл конфигурации формата *.ovpn понадобиться для подключения к серверу ретрансляции VPN Gate через протокол OpenVPN.

Скачать файл конфигурации OpenVPN Config File (.ovpn) можно на странице списка открытых бесплатных серверов ретрансляции [http://www.vpngate.net/en/](http://www.vpngate.net/en/). Выберите VPN-сервер, к которому вы хотите подключиться и нажмите на соответствующий файл *.ovpn, чтобы скачать его на рабочий стол или папку загрузки.

После сохранения файла на компьютере, он будет отображаться как иконка OpenVPN. Тем не менее, вы не сможете установить подключение, просто дважды кликнув по файлу.

Нужно переместить файл *.ovpn в папку “config” основной директории установки OpenVPN.

Откройте папку `C:\Program Files\OpenVPN\config` и скопируйте файл *.ovpn в нее.

#### 3. Подключение к VPN

Кликните правой кнопкой мыши по иконке “OpenVPN GUI” на рабочем столе и выберите опцию “Запустить от имени администратора”. В противном случае, установить VPN подключение не удастся.

Запуститься VPN подключение. Статус подключения будет отображаться на экране. Если вы увидите диалоговое окно запроса имени пользователя и пароля. Введите “vpn” в оба поля. Данное окно появляется очень редко.

#### 4. Интернет без ограничений

Когда подключение VPN установлено, в системе Windows создается виртуальный сетевой адаптер TAP-Windows Adapter V9. Этот адаптер получит IP-адрес, который начинается с “**10.211**”. Виртуальный адаптер получит адрес шлюза по умолчанию.

Чтобы открыть **Центр управления сетями и общим доступом** (также доступен в меню **Панель управления > Сеть и Интернет**), нажмите сочетание клавиш Windows + R и в окне «Выполнить» введите следующую команду и нажмите **ОК**:
`control.exe /name Microsoft.NetworkandSharingCenter`
Вы сможете проверить конфигурацию сети, запустив команду 
`ipconfig /all`
в командной строке Windows.
Когда соединение установлено, весь сетевой трафик будет проходить проходить через VPN-сервер. Убедиться в этом вы сможете с помощью команды
`tracert 8.8.8.8`
в командной строке Windows

**OpenVPN 2.6.0**
https://www.opennet.ru/opennews/art.shtml?num=58549
https://ubunlog.com/ru/openvpn-2-6-0-ya-fue-liberado-y-llega-con-una-gran-cantidad-de-cambios/

https://github.com/OpenVPN/openvpn/blob/master/Changes.rst


-   Добавлен режим совместимости (–compat-mode), позволяющий подключаться к старым серверам, на которых работает OpenVPN 2.3.x или более ранней версии.

После двух с половиной лет с момента публикации ветки 2.5 подготовлен релиз OpenVPN 2.6.0, пакета для создания виртуальных частных сетей, позволяющего организовать шифрованное соединение между двумя клиентскими машинами или обеспечить работу централизованного VPN-сервера для одновременной работы нескольких клиентов. Код OpenVPN распространяется под лицензией GPLv2, готовые бинарные пакеты формируются для Debian, Ubuntu, CentOS, RHEL и Windows.
# Debian / Ubuntu: Using OpenVPN apt repositories[](https://community.openvpn.net/openvpn/wiki/OpenvpnSoftwareRepos#DebianUbuntu:UsingOpenVPNaptrepositories "Link to this section")

We maintain several OpenVPN (OSS) software repositories. To setup the repositories you need to change to the root user. Typically this is done using _sudo_:
`sudo -s`
Then import the public GPG key that is used to sign the packages:
`curl -fsSL https://swupdate.openvpn.net/repos/repo-public.gpg | gpg --dearmor > /etc/apt/trusted.gpg.d/openvpn-repo-public.gpg`
Next you need to create a sources.list fragment (as root) so that apt can find the new OpenVPN packages. One way to do it is this:
`echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/openvpn-repo-public.gpg] https://build.openvpn.net/debian/openvpn/release/2.6 jammy main" > /etc/apt/sources.list.d/openvpn-aptrepo.list`

`echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/openvpn-repo-public.gpg] https://build.openvpn.net/debian/openvpn/<version> <osrelease> main" > /etc/apt/sources.list.d/openvpn-aptrepo.list`

Where **<version>** can be one of

1.  **stable**: stable releases only - no alphas, betas or RCs
2.  **testing**: latest releases, including alphas/betas/RCs
3.  **release/2.3**: OpenVPN 2.3 releases
4.  **release/2.4**: OpenVPN 2.4 releases, including alphas/betas/RCs
5.  **release/2.5**: OpenVPN 2.5 releases, including alphas/betas/RCs
6.  **release/2.6**: OpenVPN 2.6 releases, including alphas/betas/RCs

and **<osrelease>** depends your distribution:

-   **stretch** (Debian 9.x)
-   **buster** (Debian 10.x)
-   **bullseye** (Debian 11.x)
-   **bookworm** (Debian 12.x)
-   **xenial** (Ubuntu 16.04 LTS)
-   **bionic** (Ubuntu 18.04 LTS)
-   **focal** (Ubuntu 20.04 LTS)
-   **jammy** (Ubuntu 22.04 LTS)
-   **kinetic** (Ubuntu 22.10)

This list may be incomplete. Please check the [​repository web page](http://build.openvpn.net/debian/openvpn/release/) for the complete list of releases.

Examples:
`echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/openvpn-repo-public.gpg] http://build.openvpn.net/debian/openvpn/testing jammy main" > /etc/apt/sources.list.d/openvpn-aptrepo.list`

`echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/openvpn-repo-public.gpg] http://build.openvpn.net/debian/openvpn/release/2.6 bullseye main" > /etc/apt/sources.list.d/openvpn-aptrepo.list`

Now you're set for installing OpenVPN. Note that packages built for older operating system releases _might_ work just fine on newer release of the same operating system.

## Installing OpenVPN[](https://community.openvpn.net/openvpn/wiki/OpenvpnSoftwareRepos#InstallingOpenVPN "Link to this section")

On Debian/Ubuntu use

`apt-get update && apt-get install openvpn`

## Notes on expired keys[](https://community.openvpn.net/openvpn/wiki/OpenvpnSoftwareRepos#Notesonexpiredkeys "Link to this section")

If the apt signing key expires, apt will complain when refreshing the package cache (e.g. _apt-get update_). In that case just download the key again as described above.