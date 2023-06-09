В ранних версиях системы такой фокус не пройдет, так что потребуется использовать другую встроенную программу. Для начала следует зайти в меню пуск, найти там командную строку и запустить ее с правами администратора. Далее нужно будет ввести и выполнить **несколько операторов**:

- diskpart
- list disk
- select disk 4
- clean
- create partition primary
- select partition 1
- active не обязательно
- format fs=fat32 quick (форматирует в фат32)
- format fs=ExFAT quick label=16gbExFat     (форматирует в ExFAT с меткой тома)
- format fs=NTFS quick label=16gbNTFS     (форматирует в NTFS с меткой тома)
- assign
- exit

