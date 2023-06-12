https://non-gnu.uvt.nl/debian/jammy/mpv/

!
https://non-gnu.uvt.nl/debian/jammy/mpv/mpv_0.35.1+fruit.3_amd64.deb

[### How to Install mpv Media Player on Ubuntu 22.04 LTS](https://www.linuxcapable.com/how-to-install-mpv-media-player-on-ubuntu-22-04-lts/)

#### **Method 2: How to install MPV Media Player on Ubuntu 22.04 using snap**
`sudo snap install mpv-nilsboy`

`sudo snap remove mpv-nilsboy`


#### Install mpv Media Player – APT PPA Method
First, import the mpv PPA and the FFMPEG 4 PPA that is required as dependencies are needed from it.
```
sudo add-apt-repository ppa:savoury1/mpv -y
sudo add-apt-repository ppa:savoury1/ffmpeg4 -y
```
Secondly, importing the following additional PPAs for multimedia compatibility is recommended, as these contain updated dependencies that reflect mpv and many other applications on your desktop.
```
sudo add-apt-repository ppa:savoury1/ffmpeg5 -y
sudo add-apt-repository ppa:savoury1/graphics -y
sudo add-apt-repository ppa:savoury1/display -y
sudo add-apt-repository ppa:savoury1/graphics
```
Note that importing these PPAs will give you the latest in many multimedia packages. This will be desirable for most users, but note that with any PPA, instabilities can occur. The Rob Savory PPAs are known to be well and truly stable so that issues will be at a minimum, and he is swift in updating packages.

Next, run an APT update to reflect the new additions.
`sudo apt-get update`
Before you continue, run an APT upgrade as many dependencies will need to be upgraded, it is best to do this before the installation.
`sudo apt upgrade`
Now install mpv.
`sudo apt install mpv libmpv1 -y`

```
Следующие пакеты имеют неудовлетворённые зависимости:
 mpv : Зависит: libavcodec60 (>= 7:5.1) но он не может быть установлен
       Зависит: libavdevice60 (>= 7:5.1) но он не может быть установлен
       Зависит: libavfilter9 (>= 7:5.1) но он не может быть установлен
       Зависит: libavformat60 (>= 7:5.1) но он не может быть установлен
       Зависит: libavutil58 (>= 7:5.1) но он не может быть установлен
       Зависит: libplacebo264 (>= 5.264.1) но он не может быть установлен
       Зависит: libshaderc1 (>= 2023.2) но он не может быть установлен
       Зависит: libswscale7 (>= 7:5.1) но он не может быть установлен

```

sudo apt autoremove mpv libmpv1 -y

