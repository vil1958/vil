Камрады.. ) Я сто раз уже писал, давал версию.. )
для Centbrowser:
switches=-user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/999.0.9999.999/537.36 Safari/537.36"
 .. и всё в шоколадке, даже в Алёнке ))

а чем [это](https://chrome.google.com/webstore/detail/censor-tracker-%E2%80%93-proxy-fo/gaidoampbkcknofoejhnhbhbhhifgdop/related) не нравится? работает норм. и не надо ничего править. даже свое можно добавить

Заменить в папке с актуальной версией цента chrome.dll с патченной версией 112 вместо родной 102 (других изменений не вносилось)
Заменил 102.0.5005.167 на 999.0.9999.999 в chrome.dll и mkelkmkgljeohnaeehnnkmdpocfmkmmf спокойно установился из google store.
 Вроде даже работает.
Обычный hex редактор, например WinHex.
Использовал этот редактор. [https://mh-nexus.de/downloads/HxDPortableSetup.zip](https://mh-nexus.de/downloads/HxDPortableSetup.zip)

102 заменить на 112 мне вполне достаточно с теми расширениями, что я использую на текущий момент (вариант с 999 я откинул сразу) 
102.0.5005.167
112.0.0000.000

Редактор использовал WinHex, конечно можно любым, удобным Вам HEX редактором.  
   
После патча и замены chrome.dll (оригинальную можете сохранить) UA определяется как  
**Цитата:**

Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36

  
Соответственно, расширения которые требуют версию Chrome >102 - устанавливаются и обновляются.  
По крайней мере с тем набором расширений, что использую я, проблем не замечено.

было:
https://wtools.io/ru/check-my-user-agent
 `Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36 Edg/91.0.864.71`


Удобнее и быстрее - просто запустить TOR, а браузер пускать со строкой _--proxy-server="socks5://127.0.0.1:9050"_ и не зависеть ни от расширений, ни от версий, ни от чего.

У меня:  `USERPROFILE=D:\Users\vil`
``D:\bin\WWW\Browser` ==>
`%USERPROFILE%\AppData\Local\CentBrowser\`
сойства ярлыков:
```
D:\bin\WWW\Browser\CentBrowser\Application\chrome.exe --profile-directory="Profile_vil1958"
D:\bin\WWW\Browser\CentBrowser\Application


D:\bin\WWW\Browser\CentBrowser\Application\chrome.exe --profile-directory="Profile_vil1958" --proxy-server="socks5://127.0.0.1:12345"D:\bin\WWW\Browser\CentBrowser\Application
D:\bin\WWW\Browser\CentBrowser\Application
```

Версия 5.0.1002.354 (Официальная сборка), (64 бит) (Chromium 102.0.5005.167)
http://forum.ru-board.com/topic.cgi?forum=5&bm=1&topic=51000&start=2300#lt

Берешь любой понравившийся НЕХ редактор, ищешь в хромэдлл текст  
102.0.5005.167  
И заменяешь нужными тебе цифрами поверх старых. То бишь, будет у тебя нечто вида    
1**1**2.0.5005.167  
и будет твоя цель достигнута.  
Искать все совпадения, оно там далеко даже не одно будет.


