1.0.14
музыкальный плеер, ориентированный на формирование коллекции
https://www.slo.ru/files/audio_players/strawberry

Strawberry — музыкальный плеер, подходящий как для простого воспроизведения музыки, так и для ведения коллекции. Свободный проект с открытым исходным кодом и версиями для Windows и GNU/Linux.

Strawberry — форк замечательного и любимого многими плеера  [![](https://www.slo.ru/img/64/clementine.gif) Clementine](https://www.slo.ru/files/audio_players/clementine). Последние 6 лет разработка последнего практически не ведется и это одна из основных причин создания форка. Не смотря на внешнее сходство, отличий у плееров достаточно много, что делает их совсем разными. В Strawberry предпринята масса внутренних изменений и исправлений, переписаны и улучшены многие функции, исключено достаточно много возможностей. Разработчик отмечает, что новый плеер ориентирован главным образом на ведение локальной медиатеки и потому больше всего ущемлена поддержка стриминговых платформ и прочих онлайновых сервисов. Основные причины — трудоемкость поддержки или отсутствие спроса. Также упразднен CD-риппер (разработчик рекомендует сторонние), механизм умных плейлистов (перерабатывается), рейтинг (перерабатывается) и некоторые другие функции. Все подробности о различиях можно узнать на [специальной странице](https://github.com/strawberrymusicplayer/strawberry/wiki/Differences-from-Clementine). В общем и целом, если пользователю подходил Clementine и нет необходимости поддержки стриминговых сервисов, то можно подумать о переходе на Strawberry.

https://www.strawberrymusicplayer.org

Strawberry is available in the package repositories on most Linux distributions including Fedora, openSUSE and Arch.  
However, Strawberry is currently not available on Ubuntu. For Ubuntu and derivatives, we have an official PPA repository.

To add the PPA repository on Ubuntu use the following commands:  
`sudo add-apt-repository ppa:jonaski/strawberry`
`sudo apt update`
`sudo apt install strawberry`

For the latest development changes you can use `ppa:jonaski/strawberry-unstable` instead.
`sudo add-apt-repository ppa:jonaski/strawberry-unstable`
