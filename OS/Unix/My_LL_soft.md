/etc/fstab
```# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/sda3 during installation
UUID=cf1235f7-ea16-4c0b-b061-b3457cfb9dd5 /               ext4    errors=remount-ro 0       1
# /boot/efi was on /dev/sda2 during installation
UUID=4916-D125  /boot/efi       vfat    umask=0077      0       1
/swapfile                                 none            swap    sw              0       0
192.168.1.2:/volume1/share	/mnt/Z	nfs	auto,nofail,noatime,nolock,intr,tcp
```

/etc/hosts
```127.0.0.1	localhost
127.0.1.1	llvil
192.168.1.2     NTP-server-host
192.168.1.2     nas
# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```
samba connect to 192.168.1.2
```
sudo apt-get install nfs-common
sudo mount 192.168.1.2:/volume1/share /mnt/Z
sudo mount 192.168.1.2:/volume1/share /mnt/Z -v
# sudo mount 192.168.1.2:/volumeUSB1/usbshare /mnt/Y
```

bleachbit-root.desktop
```
[Desktop Entry]
Version=1.1
Type=Application
Name=BleachBit (as root)
Comment=Free space and maintain privacy
Comment[ru]=Освобождение дискового пространства и обслуживание конфиденциальности
TryExec=pkexec
Exec=pkexec bleachbit
Icon=bleachbit
Categories=System;FileTools;GTK;
Keywords=cache;clean;free;performance;privacy;
StartupNotify=true
X-GNOME-UsesNotifications=true
```

Czkawka.desktop
```
[Desktop Entry]
Version=1.0
Type=Application
Name=Czkawka
Comment=Multi functional app to clean OS which allow to find duplicates, empty folders, similar files etc.
Exec=/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=czkawka_gui com.github.qarmin.czkawka
Icon=com.github.qarmin.czkawka
Path=
Terminal=false
StartupNotify=false
```

DoubleCmd
Obsidian /mnt/Z/=/Doc/Obsidian
Kodi
CherryTree /mnt/Z/=/Doc/ChT/Vil/vil.ctb
ZimDesktop /mnt/Z/=/Doc/Zim
Vivaldi     vil1958
FireFox    vil8591@gmail.com sergcs1958
Chrome  vil1958@gmail.com  SergCs1958

TelegramDesktop
AnyDesk llvil@ad vil859@ad ==> PC

Z

Calibre
Kodi
VLC
KeePassXC
Strawberry
Clementene
MousePad
Czkawka

/usr/bin/lite-updates






