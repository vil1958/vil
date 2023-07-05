#alias
##### [Создание alias команд под Windows](https://antonshell.me/post/windows-doskey-aliases)

В процессе работы web-программисту часто приходится пользоваться командной строкой. Это может быть работа с git, установка библиотек через npm или commposer. Создание шаблона приложения. Очистка кэша web-приложения. Управление миграциями базы данных и т.д.

В таком случае могут возникнуть 2 проблемы. Во-первых нужно постоянно печатать повторяющиеся команды. Либо копировать откуда-то. Во вторых нужно помнить эти самые команды. Что тоже бывает сложно. Например команда создания миграции в symfony 3 выглядит так.
`php bin/console doctrine:migrations:generate`

В какой-то момент это все надоедает и хочется создать сокращения для команд. Под Windows можно сделать с помощью doskey.

Alias можно создать такой командой. Однако это работает только для текущей сессии.
`doskey gs=git status`

Если хочется создать много алиасов, имеет смысл создать .bat файл и записать туда все алиасы. Сохранить файл в удобном месте, например так:
`C:\doskey\doskey.bat`

Далее нужно сделать так, чтобы все это применялось автоматически при старте системы. Для этого нужно зайти в редактор реестра, выполнив команду regedit.
```
regedit
```

Далее найти ключ `HKEY_CURRENT_USER\Software\Microsoft\Command Processor\Autorun` и установить путь к .bat файлу.

`HKEY_CURRENT_USER\Software\Microsoft\Command Processor\Autorun`
`C:\doskey\doskey.bat`

![](https://antonshell.me/resources/img/posts/windows-doskey-aliases/2.jpg)

Все, можно пользоваться алиасами. Мой список alias выглядит так:

```
@echo off
 
DOSKEY ls=dir
 
doskey gs=git status
doskey gaa=git add -A
doskey gpl=git pull
doskey gps=git push
doskey gc=git commit $*
doskey gcm=git commit $*
doskey gck=git checkout $*
doskey gbr=git branch
doskey gmg=git merge $*
 
doskey ymg=php yii migrate $*
doskey ymgc=php yii migrate/create $*
doskey ymgd=php yii migrate/down $*
 
doskey yfxl=php yii fixture/load $*
 
doskey sfmgc=php bin/console doctrine:migrations:generate $*
doskey sfmg=php bin/console doctrine:migrations:migrate $*
 
doskey updb_cabinet = C:\doskey\scripts\updateCabinetDb.bat
doskey mysqldump = C:\xampp\mysql\bin\mysqldump.exe -uroot -p $*
```

Список включает в себя наиболее часто используемые команды git, команды yii, symfony. Также некоторые команды для работы с mysql. Список обновляется по мере использования мною новых технологий, фреймворков и т.д.

Если нужно добавить сложную составную команду, рекомендую вынести ее в отдельный .bat файл и сделать алиас на него.