[https://routerus.com/how-to-install-wine-on-ubuntu-20-04/](https://routerus.com/how-to-install-wine-on-ubuntu-20-04/)

## Установка Wine 5.0 на Ubuntu

### Пакеты Wine включены в репозитории Ubuntu по умолчанию и могут быть легко установлены с помощью диспетчера пакетов 

`   ### apt   `

###  Это самый простой способ установить Wine на Ubuntu. Однако версия дистрибутива может отставать от последней версии Wine.

### Большинство приложений Windows построено на 32-битной архитектуре. Первый шаг — включить мультиархитектуру, что позволит вам установить на машину как 64-битные, так и 32-битные пакеты:

`sudo dpkg --add-architecture i386sudo apt update`

### Установите Wine:

`sudo apt install wine64 wine32`

### После завершения установки проверьте это, распечатав версию Wine:

`wine --version`

### Текущая версия Wine, доступная в репозиториях Ubuntu 20.04, — 

`   ### 5.0   `

###  .

`wine-5.0 (Ubuntu 5.0-3ubuntu1)`

### Вот и все. Wine установлен на ваш компьютер, и вы можете начать его использовать.

## Установка Wine 6.0 на Ubuntu

В этом разделе мы предоставим пошаговые инструкции о том, как установить Wine версии 6 на Ubuntu 20.04.

Если вы используете 64-битную систему Ubuntu, включите 32-битную архитектуру и обновите список пакетов:

sudo dpkg --add-architecture i386

sudo apt update

Импортируйте GPG-ключ репозитория WineHQ:

wget -qO- https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -

Добавьте репозиторий WineHQ в вашу систему:

sudo apt install software-properties-commonsudo apt-add-repository "deb http://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -cs) main"

Установите Wine, набрав:

sudo apt install --install-recommends winehq-stable

Это установит кучу пакетов. После завершения проверьте установку Wine, набрав:

На момент написания этой статьи последним основным выпуском Wine была версия 6.0:

## Настройка Wine

### Чтобы начать настройку Wine, запустите команду 

`   ### winecfg   `

###  в своем терминале. Команда устанавливает Mono и Gecko и устанавливает среду Wine:

### Появится диалоговое окно с вопросом, хотите ли вы установить пакет wine-mono:

 _[](https://routerus.com/)_[Routerus](https://routerus.com/) > [Linux](https://routerus.com/linux/) > [Ubuntu](https://routerus.com/linux/ubuntu/) > Как установить и использовать Wine в Ubuntu 20.04

# Как установить и использовать Wine в Ubuntu 20.04

 04.03.2021  [Linux](https://routerus.com/linux/), [Ubuntu](https://routerus.com/linux/ubuntu/)  [Комментариев нет](https://routerus.com/how-to-install-wine-on-ubuntu-20-04/#respond)

Wine — это уровень совместимости с открытым исходным кодом, который позволяет запускать приложения Windows в Unix-подобных операционных системах, таких как Linux, FreeBSD и macOS. [Wine](https://routerus.com/goto/https://www.winehq.org/) — это аббревиатура от «Wine Is Not an Emulator». Он преобразует системные вызовы Windows в эквивалентные вызовы POSIX, используемые операционными системами на основе Unix, что позволяет легко интегрировать программы Windows в среду рабочего стола.

Не все приложения Windows будут работать в Wine, и даже если они это сделают, они могут вести себя иначе, чем обычно. [Wine AppDB](https://routerus.com/goto/https://appdb.winehq.org/) — это база данных, содержащая список приложений, которые были протестированы и подтверждены для работы под Wine.

Wine не всегда лучший вариант для запуска программ Windows в Linux. Вы также можете использовать инструмент виртуализации, такой как [VirtualBox](https://routerus.com/how-to-install-virtualbox-on-ubuntu-20-04/) или [VMware](https://routerus.com/how-to-install-vmware-workstation-player-on-ubuntu-18-04/) , но для них требуется больше системных ресурсов и установочный файл Windows.

В этой статье описывается, как установить Wine на Ubuntu 20.04. Мы покажем вам, как установить дистрибутив по умолчанию версии 5.0 и последней версии 6.x из репозиториев WineHQ. Те же инструкции применимы для любого дистрибутива на основе Ubuntu, включая Zorin OS, Linux Mint и Elementary OS.

### Содержание

• [Установка Wine 5.0 на Ubuntu](https://routerus.com/how-to-install-wine-on-ubuntu-20-04/#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0_Wine_50_%D0%BD%D0%B0_Ubuntu)

• [Установка Wine 6.0 на Ubuntu](https://routerus.com/how-to-install-wine-on-ubuntu-20-04/#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0_Wine_60_%D0%BD%D0%B0_Ubuntu)

• [Настройка Wine](https://routerus.com/how-to-install-wine-on-ubuntu-20-04/#%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0_Wine)

• [Установка Notepad ++ в Ubuntu](https://routerus.com/how-to-install-wine-on-ubuntu-20-04/#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0_Notepad_%D0%B2_Ubuntu)

• [Вывод](https://routerus.com/how-to-install-wine-on-ubuntu-20-04/#%D0%92%D1%8B%D0%B2%D0%BE%D0%B4)

## Установка Wine 5.0 на Ubuntu

Пакеты Wine включены в репозитории Ubuntu по умолчанию и могут быть легко установлены с помощью диспетчера пакетов `apt` Это самый простой способ установить Wine на Ubuntu. Однако версия дистрибутива может отставать от последней версии Wine.

Большинство приложений Windows построено на 32-битной архитектуре. Первый шаг — включить мультиархитектуру, что позволит вам установить на машину как 64-битные, так и 32-битные пакеты:

`sudo dpkg --add-architecture i386sudo apt update`Установите Wine:

`sudo apt install wine64 wine32`После завершения установки проверьте это, распечатав версию Wine:

`wine --version`Текущая версия Wine, доступная в репозиториях Ubuntu 20.04, — `5.0` .

`wine-5.0 (Ubuntu 5.0-3ubuntu1)`

Вот и все. Wine установлен на ваш компьютер, и вы можете начать его использовать.

## Установка Wine 6.0 на Ubuntu

В этом разделе мы предоставим пошаговые инструкции о том, как установить Wine версии 6 на Ubuntu 20.04.

Если вы используете 64-битную систему Ubuntu, включите 32-битную архитектуру и обновите список пакетов:

`sudo dpkg --add-architecture i386sudo apt update`Импортируйте GPG-ключ репозитория WineHQ:

`wget -qO- https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -`Добавьте репозиторий WineHQ в вашу систему:

`sudo apt install software-properties-commonsudo apt-add-repository "deb http://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -cs) main"`Установите Wine, набрав:

`sudo apt install --install-recommends winehq-stable`Это установит кучу пакетов. После завершения проверьте установку Wine, набрав:

`wine --version`На момент написания этой статьи последним основным выпуском Wine была версия 6.0:

`wine-6.0`

Wine установлен и готов к использованию.

## Настройка Wine

Чтобы начать настройку Wine, запустите команду `winecfg` в своем терминале. Команда устанавливает Mono и Gecko и устанавливает среду Wine:

`winecfg`

Появится диалоговое окно с вопросом, хотите ли вы установить пакет wine-mono:

[![file://e:/Temp/app/.SBYMW1/1.png](file://e:/Temp/app/.SBYMW1/1.png)](https://routerus.com/wp-content/uploads/ubuntu-winecfg-mono_hu26c5a324626221aab18ac50bbe4b4217_214964_480x0_resize_q75_lanczos.jpg)

Нажмите кнопку «Установить», и установка начнется. После этого появится новое диалоговое окно с предложением установить Gecko. Снова нажмите кнопку «Установить».

Когда установка будет завершена, отобразится диалоговое окно конфигурации Wine. Здесь вы можете настроить различные параметры Wine. В большинстве случаев достаточно настроек по умолчанию. По завершении закройте диалоговое окно.

 _[](https://routerus.com/)_[Routerus](https://routerus.com/) > [Linux](https://routerus.com/linux/) > [Ubuntu](https://routerus.com/linux/ubuntu/) > Как установить и использовать Wine в Ubuntu 20.04

# Как установить и использовать Wine в Ubuntu 20.04

 04.03.2021  [Linux](https://routerus.com/linux/), [Ubuntu](https://routerus.com/linux/ubuntu/)  [Комментариев нет](https://routerus.com/how-to-install-wine-on-ubuntu-20-04/#respond)

Wine — это уровень совместимости с открытым исходным кодом, который позволяет запускать приложения Windows в Unix-подобных операционных системах, таких как Linux, FreeBSD и macOS. [Wine](https://routerus.com/goto/https://www.winehq.org/) — это аббревиатура от «Wine Is Not an Emulator». Он преобразует системные вызовы Windows в эквивалентные вызовы POSIX, используемые операционными системами на основе Unix, что позволяет легко интегрировать программы Windows в среду рабочего стола.

Не все приложения Windows будут работать в Wine, и даже если они это сделают, они могут вести себя иначе, чем обычно. [Wine AppDB](https://routerus.com/goto/https://appdb.winehq.org/) — это база данных, содержащая список приложений, которые были протестированы и подтверждены для работы под Wine.

Wine не всегда лучший вариант для запуска программ Windows в Linux. Вы также можете использовать инструмент виртуализации, такой как [VirtualBox](https://routerus.com/how-to-install-virtualbox-on-ubuntu-20-04/) или [VMware](https://routerus.com/how-to-install-vmware-workstation-player-on-ubuntu-18-04/) , но для них требуется больше системных ресурсов и установочный файл Windows.

В этой статье описывается, как установить Wine на Ubuntu 20.04. Мы покажем вам, как установить дистрибутив по умолчанию версии 5.0 и последней версии 6.x из репозиториев WineHQ. Те же инструкции применимы для любого дистрибутива на основе Ubuntu, включая Zorin OS, Linux Mint и Elementary OS.

### Содержание

• [Установка Wine 5.0 на Ubuntu](https://routerus.com/how-to-install-wine-on-ubuntu-20-04/#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0_Wine_50_%D0%BD%D0%B0_Ubuntu)

• [Установка Wine 6.0 на Ubuntu](https://routerus.com/how-to-install-wine-on-ubuntu-20-04/#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0_Wine_60_%D0%BD%D0%B0_Ubuntu)

• [Настройка Wine](https://routerus.com/how-to-install-wine-on-ubuntu-20-04/#%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0_Wine)

• [Установка Notepad ++ в Ubuntu](https://routerus.com/how-to-install-wine-on-ubuntu-20-04/#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0_Notepad_%D0%B2_Ubuntu)

• [Вывод](https://routerus.com/how-to-install-wine-on-ubuntu-20-04/#%D0%92%D1%8B%D0%B2%D0%BE%D0%B4)

## Установка Wine 5.0 на Ubuntu

Пакеты Wine включены в репозитории Ubuntu по умолчанию и могут быть легко установлены с помощью диспетчера пакетов `apt` Это самый простой способ установить Wine на Ubuntu. Однако версия дистрибутива может отставать от последней версии Wine.

Большинство приложений Windows построено на 32-битной архитектуре. Первый шаг — включить мультиархитектуру, что позволит вам установить на машину как 64-битные, так и 32-битные пакеты:

`sudo dpkg --add-architecture i386sudo apt update`Установите Wine:

`sudo apt install wine64 wine32`После завершения установки проверьте это, распечатав версию Wine:

`wine --version`Текущая версия Wine, доступная в репозиториях Ubuntu 20.04, — `5.0` .

`wine-5.0 (Ubuntu 5.0-3ubuntu1)`

Вот и все. Wine установлен на ваш компьютер, и вы можете начать его использовать.

## Установка Wine 6.0 на Ubuntu

В этом разделе мы предоставим пошаговые инструкции о том, как установить Wine версии 6 на Ubuntu 20.04.

Если вы используете 64-битную систему Ubuntu, включите 32-битную архитектуру и обновите список пакетов:

`sudo dpkg --add-architecture i386sudo apt update`Импортируйте GPG-ключ репозитория WineHQ:

`wget -qO- https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -`Добавьте репозиторий WineHQ в вашу систему:

`sudo apt install software-properties-commonsudo apt-add-repository "deb http://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -cs) main"`Установите Wine, набрав:

`sudo apt install --install-recommends winehq-stable`Это установит кучу пакетов. После завершения проверьте установку Wine, набрав:

`wine --version`На момент написания этой статьи последним основным выпуском Wine была версия 6.0:

`wine-6.0`

Wine установлен и готов к использованию.

## Настройка Wine

Чтобы начать настройку Wine, запустите команду `winecfg` в своем терминале. Команда устанавливает Mono и Gecko и устанавливает среду Wine:

`winecfg`Появится диалоговое окно с вопросом, хотите ли вы установить пакет wine-mono:

[![file://e:/Temp/app/.SBYMW1/2.png](file://e:/Temp/app/.SBYMW1/2.png)](https://routerus.com/wp-content/uploads/ubuntu-winecfg-mono_hu26c5a324626221aab18ac50bbe4b4217_214964_480x0_resize_q75_lanczos.jpg)

Нажмите кнопку «Установить», и установка начнется. После этого появится новое диалоговое окно с предложением установить Gecko. Снова нажмите кнопку «Установить».

Когда установка будет завершена, отобразится диалоговое окно конфигурации Wine. Здесь вы можете настроить различные параметры Wine. В большинстве случаев достаточно настроек по умолчанию. По завершении закройте диалоговое окно.