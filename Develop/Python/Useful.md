Pause в Pyton
https://overcoder.net/q/104441/%D0%BF%D0%B0%D1%83%D0%B7%D0%B0-%D0%B2-%D0%BF%D0%B8%D1%82%D0%BE%D0%BD%D0%B5


Попробуйте `os.system("pause")` - я использовал его, и это сработало для меня.
Обязательно включите `import os` в начало script.

Нет необходимости ждать ввода перед закрытием, просто измените команду следующим образом:

```markup
cmd /K python <script>
```

Переключатель `/K` выполнит следующую команду, но оставьте окно интерпретатора команд открытым, в отличие от `/C`, которое выполняется и затем закрывается.

# Моя шпаргалка по pandas
https://habr.com/ru/company/ruvds/blog/494720/

Получение первых N строк в DataFrame Pandas  
Источник: https://tonais.ru/library/poluchenie-pervyh-n-strok-v-dataframe


