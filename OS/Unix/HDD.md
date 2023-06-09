ServerAdmin.ru, [03.05.2022 18:29]

[https://t.me/srv_admin/1878](https://t.me/srv_admin/1878)

У меня давно написана статья на тему работы с дисками в Debian ([https://serveradmin.ru/nastrojka-diskov-v-debian/](https://serveradmin.ru/nastrojka-diskov-v-debian/)). С тех пор ничего не поменялось, так что она по прежнему актуальна. Думаю, будет полезна выжимка из этой статьи, чтобы сохранить полезные команды в закладки. Статья писалась на основе системы Debian, но практически всё без каких-то существенных изменений будет актуально в любом дистрибутиве Linux.

Информация о дисках (железо)

Hwinfo

# apt install hwinfo

# hwinfo --disk

На выходе максимально подробная информация о диске - вендор, модель, серийный номер, метки диска в системе и многое другое. Программа показывает принадлежность диска к рейд массиву (если он поддерживает, например adaptec), что бывает удобно.

Smartmontools

# apt install smartmontools

# smartctl -i /dev/sda

Показывает основную информацию о диске, в том числе SMART.

Информация о дисках (разделы)

Общая информация о разделах и их размерах.

# lsblk -a

Более подробная информация о структуре диска, в том числе используемых секторах каждого раздела.

# fdisk -l

Создать или удалить раздел.

# cfdisk /dev/sdb

Обновить информацию об изменённых разделах.

# partprobe -s

Просмотр меток разделов.

# blkid

Cвободное место на диске

Общая информация о всех подмонтированных дисках.

# df -h

10 самых больших папок в текущем каталоге:

# du . --max-depth=1 -ah | sort -rh | head -10

Подключение сетевого диска

По smb.

# apt install cifs-utils

# mount -t cifs //10.1.4.4/backup /mnt/backup \

-o user=admin,password=passadmin

- 0.1.4.4/backup - сетевая шара

- /mnt/backup - локальная директория, куда монтируем сетевой диск

- admin - пользователь с доступом к сетевому диску

- passadmin - пароль

По NFS.

# apt install nfs-common

# mount -t nfs 10.1.4.4:/backup /mnt/backup

Перед подключением диска можете проверить, а если вам вообще доступ к сетевому диску на сервере:

# showmount --exports 10.1.4.4

Создание файловой системы ext4, xfs

XFS

# apt install xfsprogs

# mkfs.xfs /dev/sdb1

EXT4

# mkfs -t ext4 /dev/sdb1

Работа с LVM

Инициализация дисков для работы в LVM:

# pvcreate /dev/sdb /dev/sdc

Создание группы томов:

# vgcreate vgbackup /dev/sdb /dev/sdc

Создание раздела, занимающего 100% размера группы томов:

# lvcreate -l100%FREE vgbackup -n lv_full

Создание файловой системы:

# mkfs -t ext4 /dev/vgbackup/lv_full

Монтирование:

# mount /dev/vgbackup/lv_full /mnt/backup

Удаление раздела:

# umount /mnt/backup

# lvremove /dev/vgbackup/lv_full

Список физических томов:

# vgscan

Информация о Физическая томах:

# pvscan

# pvdisplay

Логическая информация о Физических томах:

# vgdisplay

Список логических разделов:

# lvscan

# lvs

Показать информацию о логических разделах:

# lvdisplay

Протестировать скорость диска

Тест записи.

# sync; dd if=/dev/zero of=tempfile bs=1M count=12000; sync

Тест чтения.

# apt install hdparm

# hdparm -t /dev/vda1

Проверить нагрузку на диск

# apt install sysstat

# iostat -xk -t 2

или

# apt install dstat

# dstat --top-bio

# dstat --top-io

# dstat -tldnpms 10

Нагрузка процессов или конкретного процесса:

# pidstat -d 1

# pidstat -p `pgrep mysqld` -d 1

#bash #terminal