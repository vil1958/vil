https://github.com/qarmin/czkawka

https://github.com/qarmin/czkawka/blob/master/instructions/Installation.md

[### PPA - Debian/Ubuntu (unofficial)](https://github.com/qarmin/czkawka/blob/master/instructions/Installation.md)

```
sudo add-apt-repository ppa:xtradeb/apps
sudo apt-get update
sudo apt-get install czkawka
```


https://flathub.org/apps/details/com.github.qarmin.czkawka

```
sudo apt install flatpak
```

solve problem: ## не найдено удаленных ссылок, похожих на flathub
```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

install:
```
flatpak install flathub com.github.qarmin.czkawka
```

run:
```
flatpak run com.github.qarmin.czkawka
```

```
flatpak list --app
```

```
flatpak uninstall com.github.qarmin.czkawka
```

удалить файлы в каталоге: /home/vil/.var/app/
```
flatpak uninstall --delete-data com.github.qarmin.czkawka
```

```
flatpak list --runtime

flatpak uninstall org.freedesktop.Platform.GL.default
flatpak uninstall org.freedesktop.Platform.VAAPI.Intel
flatpak uninstall org.freedesktop.Platform.openh264
flatpak uninstall org.gtk.Gtk3theme.Materia
flatpak uninstall --unused
flatpak uninstall --all --delete-data

```
After that, you’ll have the clean `.var/apps`, `.local/share/flatpak`, and `/var/lib/flatpak` directories.

```
sudo apt remove --autoremove flatpak
```

**Warning** Main Czkawka GUI dependency - GTK 4 is only available on newer systems like e.g. Ubuntu 22.04, so if you have problems with running app on older systems, you may like to use older Czkawka versions, upgrade OS or install flatpak package which use its own set of dependencies.

#### [](https://github.com/qarmin/czkawka/blob/master/instructions/Installation.md#ubuntudebianlinux-mint)

#### Ubuntu/Debian/Linux Mint

```
sudo apt install libgtk-4-dev ffmpeg
```
