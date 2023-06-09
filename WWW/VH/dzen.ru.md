https://dzen.ru

что-бы скачать видео:
https://compconfig.ru/social/kak-skachat-video-s-yandeks-dzen.html
1. сохранить страничку в html файл
2. найти ссылку начало "https конец m3u8:  "(https.+?m3u8)
3. открыть ссылку в PotPlayer и выполнить Video --> Захват

Просмотр кода страницы ничего не дает, так как ссылка теперь находится в js файле.  
Для получения ссылки m3u8 я использую браузер Vivaldi где на любой части страницы Дзена кликаю правой кнопкой мыши: Инструменты разработчика => Инспектировать (CTRL+Shift+I)

1. Картинка для понимания: https://compconfig.ru/wp-content/uploads/2022/06/vid1.jpg ![[Pasted image 20230202073438.png]]
2. Далее наживаю в появившемся окне значок «Выбор элемента на странице для инспектирования». https://compconfig.ru/wp-content/uploads/2022/06/vid2.jpg ![[Pasted image 20230202073622.png]]
3. Нажимаю на плеер понравившегося видео, и автоматически справа мне показан DIV блок видео. Но он нам не нужен. В нем нет ссылки. Ссылка находится в предыдущем элементе DIV, его надо открыть https://compconfig.ru/wp-content/uploads/2022/06/vid3.jpg ![[Pasted image 20230202073724.png]]
4. Видим в нем также свернутый блок «Script nonce» и открываем его. https://compconfig.ru/wp-content/uploads/2022/06/vid4.jpg ![[Pasted image 20230202073857.png]]
5. В открывшемся блоке на теле скрипта нажимаем правой кнопкой мышки Copy => Copy outerHTML  Так мы скопировали текст скрипта для нахождения нашей заветной ссылки https://compconfig.ru/wp-content/uploads/2022/06/vid5.jpg ![[Pasted image 20230202073950.png]]
6. Открываем любой текстовый редактор (у меня PSPad Editor), можно и в блокноте. Вставляем скопированный текст скрипта и ищем заветную ссылку начинающуюся с https … strm.yandex и заканчивающуюся на m3u8, скопируем её. https://compconfig.ru/wp-content/uploads/2022/06/vid6.jpg ![[Pasted image 20230202074109.png]]
7. У меня стоит для закачки FDM (Free Download Manager) в который я вставляю новую закачку — тот самый адрес ссылки m3u8. https://compconfig.ru/wp-content/uploads/2022/06/vid7.jpg ![[Pasted image 20230202074158.png]]
8. Затем в окне выбираем какое качество изображения нам понравилось и начинаем закачку https://compconfig.ru/wp-content/uploads/2022/06/vid8.jpg ![[Pasted image 20230202074249.png]]
9. Качается файл видео с расширением «ts» с максимальной скоростью, сам собирается и в нужном качестве. Наслаждайтесь! https://compconfig.ru/wp-content/uploads/2022/06/vid9.jpg  ![[Pasted image 20230202074402.png]]


