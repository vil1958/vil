**Скачать:**  
https://calibre-ebook.com/download

**Изменения:**  
[https://calibre-ebook.com/whats-new](https://softoroom.org/go.php?go=https://calibre-ebook.com/whats-new)

[Calibre 6.22.0](https://github.com/kovidgoyal/calibre/releases/tag/v6.22.0)


REM Calibre 6.22.0
REM http://calibre-ebook.com/download
REM https://github.com/kovidgoyal/calibre/releases/tag/v6.22.0
REM https://github.com/kovidgoyal/calibre/releases/download/v6.13.0/calibre-64bit-6.13.0.msi
REM https://github.com/kovidgoyal/calibre/releases/download/v6.13.0/calibre-portable-installer-6.22.0.exe
REM https://status.calibre-ebook.com/dist/win32
REM https://calibre-ebook.com/dist/win64
REM https://status.calibre-ebook.com/dist/portable

SET VER=6.22.0
SET PRGI=calibre
SET PRGO=Calibre
SET PTH=https://github.com/kovidgoyal/calibre/releases/download/v%VER%
SET REF=https://github.com/kovidgoyal/calibre/releases/tag/v%VER%

REM wget.exe -O "%PRGO%_%VER%_x32.msi" "%PTH%/%VER%/%PRGI%-%VER%.msi" --referer="%REF%/win32" --content-disposition
wget.exe -O "%PRGO%_%VER%_x64.msi" "%PTH%/%PRGI%-64bit-%VER%.msi" --referer="%REF%" --content-disposition
REM wget.exe -O "%PRGO%_%VER%.exe" "%PTH%/calibre-portable-installer-%VER%.exe" --referer="%REF%" --content-disposition

Для Unix обновление:
```
sudo -v && wget --no-check-certificate -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
```

**Calibre** - бесплатная программа которая пригодится для читателей электронных книг.  
В ее состав входят инструменты для управления библиотекой, модули преобразования файлов электронных книг из одного формата в другой, интегратор новостей, модуль синхронизации данных с электронной читалкой и мощный просмотрщик.  
  
**Возможности Calibre:**  
— Управление библиотекой. Можно сортировать и искать книги по метаданным (название, автор, дата издания, дата добавления, размер, серия книг, рейтинг и т. п.). Также есть поддержка тегов, комментариев и обзоров. Книгу можно искать, используя простой или расширенный поиск.  
— С помощью Calibre можно искать метаданные о книгах и обложки к ним в интернете, используя название, фамилию автора или ISBN.  
— Конвертор форматов книг. При конвертировании в качестве исходных допускаются следующие форматы: CBZ, CBR, CBC, EPUB, FB2, HTML, LIT, LRF, MOBI, ODT, PDF, PRC**, PDB, PML, RB, RTF, TCR, TXT. Возможно преобразование в следующие форматы: EPUB, FB2, OEB, LIT, LRF, MOBI, PDB, PML, RB, PDF, TCR, TXT.  
— Синхронизация с ридерами. Calibre поддерживает множество устройств чтения, причем модульная система драйверов для ридеров, используемая программой, позволяет достаточно просто добавлять новые устройства.  
— Скачивание новостей и конвертирование их в книгу. В данное время программа содержит уже 3 сотни источников новостей. Пользователь без труда может добавлять дополнительные источники новостей для скачивания.  
— Встроенная читалка для книг. В Calibre встроены программы для чтения всех поддерживаемых форматов книг.  
— Веб-сервер контента. Программа содержит встроенный веб-сервер для удаленного управления библиотекой. Также она может скачивать и высылать книги по электронной почте.  
  
**Home:** calibre-ebook.com  
**Лицензия:** Free  
**OC:** XP/7/8/10  
**Интерфейс:** Русский есть

вывод во время установки
```
Extracting files to /opt/calibre ...
Extracting application files... 
Creating symlinks...
	Symlinking /opt/calibre/ebook-device to /usr/bin/ebook-device
	Symlinking /opt/calibre/ebook-meta to /usr/bin/ebook-meta
	Symlinking /opt/calibre/ebook-convert to /usr/bin/ebook-convert
	Symlinking /opt/calibre/ebook-polish to /usr/bin/ebook-polish
	Symlinking /opt/calibre/markdown-calibre to /usr/bin/markdown-calibre
	Symlinking /opt/calibre/web2disk to /usr/bin/web2disk
	Symlinking /opt/calibre/calibre-server to /usr/bin/calibre-server
	Symlinking /opt/calibre/lrf2lrs to /usr/bin/lrf2lrs
	Symlinking /opt/calibre/lrs2lrf to /usr/bin/lrs2lrf
	Symlinking /opt/calibre/calibre-debug to /usr/bin/calibre-debug
	Symlinking /opt/calibre/calibredb to /usr/bin/calibredb
	Symlinking /opt/calibre/calibre-parallel to /usr/bin/calibre-parallel
	Symlinking /opt/calibre/calibre-customize to /usr/bin/calibre-customize
	Symlinking /opt/calibre/fetch-ebook-metadata to /usr/bin/fetch-ebook-metadata
	Symlinking /opt/calibre/calibre-smtp to /usr/bin/calibre-smtp
	Symlinking /opt/calibre/calibre to /usr/bin/calibre
	Symlinking /opt/calibre/lrfviewer to /usr/bin/lrfviewer
	Symlinking /opt/calibre/ebook-viewer to /usr/bin/ebook-viewer
	Symlinking /opt/calibre/ebook-edit to /usr/bin/ebook-edit
Setting up command-line completion...
Installing zsh completion to: /usr/share/zsh/vendor-completions/_calibre
Installing bash completion to: /usr/share/bash-completion/completions/
Setting up desktop integration...
Creating un-installer: /usr/bin/calibre-uninstall
Run "calibre" to start calibre 

```


