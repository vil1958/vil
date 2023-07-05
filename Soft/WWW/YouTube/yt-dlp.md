https://github.com/yt-dlp/yt-dlp#usage-and-options

[#### yt-dlp update available](https://www.antixforum.com/forums/topic/ytdlp-update-available-to-2023-06-01/)

```
$ sudo yt-dlp -U
yt-dlp: error: yt-dlp's self-update mechanism is disabled on Debian.
Please update yt-dlp using apt(8).
See https://packages.debian.org/sid/yt-dlp for the latest packaged version.
```

```
$ apt-cache policy yt-dlp
yt-dlp:
  Installiert:           2022.05.19
  Installationskandidat: 2022.05.19
  Versionstabelle:
     2022.11.11-1~bpo11+1 100
        100 http://deb.debian.org/debian bullseye-backports/main amd64 Packages
        100 http://deb.debian.org/debian bullseye-backports/main i386 Packages
 *** 2022.05.19 500
        500 http://ftp.halifax.rwth-aachen.de/mxlinux/packages/antix/bullseye bullseye/main amd64 Packages
        500 http://ftp.halifax.rwth-aachen.de/mxlinux/packages/antix/bullseye bullseye/main i386 Packages
        100 /var/lib/dpkg/status
```

```
sudo apt-get install yt-dlp=2022.11.11-1~bpo11+1
```

[разные настройки](http://forum.ru-board.com/topic.cgi?forum=5&bm=1&topic=49719&start=2340#lt:~:text=of%20available%20formats-,%D0%B0%20%D0%B2%D0%BE%D1%82%20%D1%82%D0%B0%D0%BA%20%D0%BD%D0%BE%D1%80%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE,-yt%2Ddlp%20%2Df)

а вот так нормально    
`yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]" `
а вот так уже ошибка  
`yt-dlp -f "bestvideo**[height=1080]**[ext=mp4]+bestaudio[ext=m4a]"`  
а если добавить **<** то все становится норм  
`yt-dlp -f "bestvideo[height**<**=1080][ext=mp4]+bestaudio[ext=m4a]"`


1. Работоспособность всех вариантов кнопки подтверждена в Windows 10.  
2. Формат скачиваемого видео: .webm (видеокодек - VP9, аудиокодек - Opus), разрешение - не выше 1080p. Настройте формат по вашему усмотрению!  
Для тех, кто не может или не хочет иметь дело с кодеком VP9, пример строки в батнике:  
  
**Код:**
`yt-dlp -f "bestvideo[height<=720][ext=mp4]+bestaudio[ext=m4a]/best" -S "vcodec:h264,fps:30,acodec:mp4a,channels:2" "%URL%" -o "%dir%\%file%"`
  
Будет скачано видео с разрешением 720 или меньше (если нет 720), с расширением mp4, видеокодек - AVC (h264), аудиокодек - AAC (mp4a), частота кадров - 30 (25), стерео (2 канала).  
Параметры сортировки нужны по следующим причинам.  
vcodec:h264 - чтобы не скачался AV1 (он также идет в контейнере mp4)  
fps:30 - чтобы не скачался 60 fps (например, поток ID=298)  
acodec:mp4a - чтобы не скачался AC3 (он также идет в контейнере m4a)  
channels:2 - чтобы не скачался 6 канальный звук  
3. Во всех вариантах полный путь к файлу **yt-dlp.exe** не указан, так как подразумевается, что адрес папки, где находится этот файл, прописан в Переменные среды в переменную Path (см. п.5)  
4. Если скачиваются отдельные видео и аудио потоки, то для их склеивания yt-dlp автоматически использует FFMPEG. Адрес папки, где находится **ffmpeg.exe**, также должен быть прописан в Переменные среды в переменную Path (см. п.5)  
5. Как прописать адрес папки с нужным файлом в Переменные среды в переменную Path (на примере ffmpeg.exe).  
Панель управления -> Система -> Дополнительные параметры системы -> Вкладка Дополнительно -> кнопка Переменные среды -> Переменные среды пользователя -> Path  
Если переменной Path еще не существует, то кнопка Создать.  
Если переменная Path уже есть, то кнопка Изменить.  
Указать полный путь к папке, напр. D:\FFMPEG\bin - именно к той папке, где находится файл ffmpeg.exe (там же должны быть ffplay.exe, ffprobe.exe)  
Желательно, чтобы в пути не было русских букв и пробелов.  
В Windows 7 адреса записывались в одну строку, между адресами - точка с запятой ";" без пробелов.  
В Windows 10 сделано удобнее - для каждого адреса отдельная строка.  
Не забыть последовательно нажать все OK.  
Проверить можно так, набрав в командной строке:  
  
**Код:**
`ffmpeg -version`