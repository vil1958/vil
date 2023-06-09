
[http://ftp.midnight-commander.org/?C=N;O=D](http://ftp.midnight-commander.org/?C=N;O=D)

[https://github.com/MidnightCommander/mc](https://github.com/MidnightCommander/mc)

[http://ftp.midnight-commander.org/](http://ftp.midnight-commander.org/)

2021-08-15

[http://ftp.midnight-commander.org/mc-4.8.27.tar.bz2](http://ftp.midnight-commander.org/mc-4.8.27.tar.bz2)

[http://ftp.midnight-commander.org/mc-4.8.27.tar.xz](http://ftp.midnight-commander.org/mc-4.8.27.tar.xz)

Бинарники обычно устанавливаются или в /usr/bin/, или в /usr/local/bin/. Запустить попробуй из консоли, просто набрав имя программы

Источник: [https://krasheninin.tech/linux/midnight-commander-odin-iz-luchshih-fajlovyh-menedzherov-dlya-linux](https://krasheninin.tech/linux/midnight-commander-odin-iz-luchshih-fajlovyh-menedzherov-dlya-linux)

Если будет ошибка «S-Lang Library version 2.0 or newer not found» — установите:

`sudo apt update && sudo apt upgrade -y`
`sudo apt-get install libslang2-dev`
`cd mc-4.8.27`
`./configure --enable-vfs-smb`
`make`
`sudo make install`

By default, `make install' will install the package's files in
`/usr/local/bin', `/usr/local/man', etc. You can specify an

installation prefix other than `/usr/local' by giving `configure' the

option `--prefix=PATH'.

`--enable-vfs-smb'

(off by default)
This option enables remote VFS over the SMB protocol. A stripped

down version of samba distributed with the sources is compiled and
linked with the mc executable. It is recommended that you install
Samba client, since mc uses some files from Samba under certain
conditions. Please visit [http://www.samba.org/](http://www.samba.org/) to learn more.
If you have compile problems in the VFS code, try disabling it by

using "--disable-vfs" option.

`make` (потом проверить mc -V в каталоге SRC)