#file #mount
#### [subst](https://learn.microsoft.com/ru-ru/windows-server/administration/windows-commands/subst)

1. [Синтаксис](https://learn.microsoft.com/ru-ru/windows-server/administration/windows-commands/subst#syntax)
2. [Комментарии](https://learn.microsoft.com/ru-ru/windows-server/administration/windows-commands/subst#remarks)
3. [Примеры](https://learn.microsoft.com/ru-ru/windows-server/administration/windows-commands/subst#examples)
4. [Связанные ссылки](https://learn.microsoft.com/ru-ru/windows-server/administration/windows-commands/subst#related-links)

Связывает путь с буквой диска. При использовании без параметров **subst** отображает имена виртуальных дисков в действии.

## Синтаксис

Копировать
```
subst [<drive1>: [<drive2>:]<path>]
subst <drive1>: /d
```

### Параметры

|Параметр|Описание|
|---|---|
|`<drive1>:`|Указывает виртуальный диск, которому требуется назначить путь.|
|`[<drive2>:]<path>`|Указывает физический диск и путь, который необходимо назначить виртуальному диску.|
|/d|Удаляет заменяющий (виртуальный) диск.|
|/?|Отображение справки в командной строке.|

## Комментарии

- Следующие команды не работают и не должны использоваться на дисках, указанных в **команде subst** :
    
    - [Команда chkdsk](https://learn.microsoft.com/ru-ru/windows-server/administration/windows-commands/chkdsk)
        
        [Команда diskcomp](https://learn.microsoft.com/ru-ru/windows-server/administration/windows-commands/diskcomp)
        
        [команда diskcopy](https://learn.microsoft.com/ru-ru/windows-server/administration/windows-commands/diskcopy)
        
        [Команда format](https://learn.microsoft.com/ru-ru/windows-server/administration/windows-commands/format)
        
        [Команда label](https://learn.microsoft.com/ru-ru/windows-server/administration/windows-commands/label)
        
        [Команда recover](https://learn.microsoft.com/ru-ru/windows-server/administration/windows-commands/recover)
        
- Параметр `<drive1>` должен находиться в диапазоне, заданном командой **lastdrive** . В противном случае **subst** отображает следующее сообщение об ошибке: `Invalid parameter - drive1:`

[](https://learn.microsoft.com/ru-ru/windows-server/administration/windows-commands/subst#examples)

## Примеры

Чтобы создать виртуальный диск z для пути b:\user\betty\forms, введите:

```
subst z: b:\user\betty\forms
```

Вместо того чтобы вводить полный путь, вы можете получить доступ к этому каталогу, введя букву виртуального диска, за которой следует двоеточие, как показано ниже.

Копировать

```
z:
```

[](https://learn.microsoft.com/ru-ru/windows-server/administration/windows-commands/subst#related-links)

В википедии ещё такой способ описан:
"В разделе реестра: 
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\DOS Devices`
 создайте строковый параметр (String Value) с именем диска, например `G:`
В значении параметра введите путь к каталогу в формате:
`\??\<путь к каталогу>`
 например:
`\??\C:\Windows`
Перезагрузите систему, чтобы требуемый диск создался."

## Связанные ссылки

- [Условные обозначения синтаксиса команд командной строки](https://learn.microsoft.com/ru-ru/windows-server/administration/windows-commands/command-line-syntax-key)