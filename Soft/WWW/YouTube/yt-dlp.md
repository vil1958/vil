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