cherrytree 

# Cherrytree Portable 0.99.56 (hierarchical note taker) Released
Submitted by John T. Haller on December 18, 2022 - 2:19pm
https://portableapps.com/news/2022-12-18--cherrytree-portable-0.99.56-released

[https://github.com/giuspen/cherrytree](https://github.com/giuspen/cherrytree)
https://www.giuspen.net/cherrytree/
https://github.com/giuspen/cherrytree/releases/tag/0.99.52
https://www.giuspen.com/cherrytree/#downl

Ubuntu bionic 18.04 LTS / focal 20.04 LTS / jammy 22.04 LTS / kinetic 22.10
`sudo add-apt-repository ppa:giuspen/ppa`

```bash
sudo add-apt-repository ppa:giuspen/ppa    # add the repo
sudo apt update                            # update package lists
sudo apt install cherrytree                # install
```

#### How to install CherryTree on Ubuntu 20.04 Focal Fossa?

[https://askubuntu.com/questions/1258007/how-to-install-cherrytree-on-ubuntu-20-04-focal-fossa](https://askubuntu.com/questions/1258007/how-to-install-cherrytree-on-ubuntu-20-04-focal-fossa)

* Step 1

Run update command to update package repositories and get latest package information.
`sudo apt-get update -y`

* Step 2

Run the install command with -y flag to quickly install the packages and dependencies.
`sudo apt-get install -y cherrytree`

`sudo snap install cherrytree`

Alternatively, snapd can be installed from the command line:
`sudo apt update`
`sudo apt install snapd`

[https://cyber-x.ru/%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%B0%D0%B2%D0%BB%D0%B8%D0%B2%D0%B0%D0%B5%D0%BC-%D1%83%D1%82%D0%B8%D0%BB%D0%B8%D1%82%D1%83-%D0%B4%D0%BB%D1%8F-%D0%B7%D0%B0%D0%BC%D0%B5%D1%82%D0%BE%D0%BA-cherrytree/](https://cyber-x.ru/%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%B0%D0%B2%D0%BB%D0%B8%D0%B2%D0%B0%D0%B5%D0%BC-%D1%83%D1%82%D0%B8%D0%BB%D0%B8%D1%82%D1%83-%D0%B4%D0%BB%D1%8F-%D0%B7%D0%B0%D0%BC%D0%B5%D1%82%D0%BE%D0%BA-cherrytree/)

#### Building Cherrytree on Ubuntu

[https://cyber-x.ru/%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%B0%D0%B2%D0%BB%D0%B8%D0%B2%D0%B0%D0%B5%D0%BC-%D1%83%D1%82%D0%B8%D0%BB%D0%B8%D1%82%D1%83-%D0%B4%D0%BB%D1%8F-%D0%B7%D0%B0%D0%BC%D0%B5%D1%82%D0%BE%D0%BA-cherrytree/](https://cyber-x.ru/%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%B0%D0%B2%D0%BB%D0%B8%D0%B2%D0%B0%D0%B5%D0%BC-%D1%83%D1%82%D0%B8%D0%BB%D0%B8%D1%82%D1%83-%D0%B4%D0%BB%D1%8F-%D0%B7%D0%B0%D0%BC%D0%B5%D1%82%D0%BE%D0%BA-cherrytree/)

Устанавливаем CherryTree в Ubuntu 20.04

Что же касается дистрибутива Ubuntu, то у разработчиков имеется PPA репозиторий, который мы в последствии и подключим. И так, для того что бы подключить PPA репозиторий в Ubuntu 20.04, а так же ее производных, переходим в терминал и вводим следующую команду:
`sudo add-apt-repository ppa:giuspen/ppa`
`sudo apt update`

Далее, для установки CherryTree в Ubuntu вводим команду:
`sudo apt install cherrytree`

[https://github.com/giuspen/cherrytree#building-cherrytree-on-ubuntu](https://github.com/giuspen/cherrytree#building-cherrytree-on-ubuntu)

Install dependencies:

sudo apt install build-essential cmake ninja-build libgtkmm-3.0-dev libgtksourceviewmm-3.0-dev libxml++2.6-dev libsqlite3-dev gettext libgspell-1-dev libcurl4-openssl-dev libuchardet-dev libfmt-dev libspdlog-dev gnome-icon-theme

Note: On Debian10 / Ubuntu 18.04 libfmt-dev and libspdlog-dev are not used since too old; bundled source code is built instead Get cherrytree source, compile and run:

git clone [https://github.com/giuspen/cherrytree.git](https://github.com/giuspen/cherrytree.git)

cd cherrytree

git submodule update --init

./build.sh

./build/cherrytree

Install documentation:

sudo apt install devhelp libgtkmm-3.0-doc libgtksourceviewmm-3.0-doc libglibmm-2.4-doc libpangomm-1.4-doc libxml++2.6-doc libgspell-1-doc

devhelp

xdg-open /usr/share/doc/libgtkmm-3.0-doc/reference/html/index.html

xdg-open /usr/share/doc/libgtksourceviewmm-3.0-doc/reference/html/index.html

xdg-open /usr/share/doc/libglibmm-2.4-doc/reference/html/index.html

xdg-open /usr/share/doc/libpangomm-1.4-doc/reference/html/index.html

xdg-open /usr/share/doc/libxml++2.6-doc/reference/html/index.html

xdg-open /usr/share/doc/libgspell-1-dev/html/index.html

##### =======================================

[https://github.com/giuspen/cherrytree/releases](https://github.com/giuspen/cherrytree/releases)

[https://github.com/giuspen/cherrytree/releases/download/0.99.41/cherrytree_0.99.41.tar.xz](https://github.com/giuspen/cherrytree/releases/download/0.99.41/cherrytree_0.99.41.tar.xz)