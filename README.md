Данный репозиторий существует как помощь для новичков в вопросе проектирования, отладки и симуляции печатных плат и устройств на их базе с помощью программного комплекса Cadence Allegro

Архитектура репозитория состоит из следующих разделов:
- `CIS` - база данных компонентов с разделением на составляющие
- `Scripts` - скрипты на языке программирования SKILL для автоматизации работы

База даннхы CIS является единой автоматизированной информационной системой направленной на уменьшение издержек при проектировании, отладки и симуляции печатных плат. Структура базы данных CIS:
- `olbpath` - каталог с родительским классом каждого компонента который разделен на семейства (Capacitor/Ceramic/TNLX90XX)
- `padpath` - каталог с контактами компонентов между корпусом и печатной платой (.pad)
- `psmpath` - каталог с footprint-моделью компонента и связью между symbol-обозначением (.dra/.psm)
- `stppath` - каталог с 3D-моделью компонента

Инструкция по добалвению базы данных компонентов в Cadence:
1. Клонируйте репозиторий по этому адресу - `D:\Projects\`
2. После клонирования репозитория убедитесь что у вас он расположен по следующему пути - `D:\Projects\CadenceAllegro\CIS\...`
3. Найдите в меню пуск утилиту `Источники данных ODBC (64-bit)`, в графе `Пользовательский DSN` укажите что хотите добавить новый источник
4. Выберите в качестве источника данных `Microsoft Access Driver`
5. Имя источника данных - `CIS`, база данных - выбираете файл БД который лежит в репозитории
6. Нажимаете ОК, перезагружаете компьютер
7. 


XX. 
```SKILL
[Part Management]
Configuration File=D:\PROJECTS\CADENCEALLEGRO\CIS\CIS.DBC
[Footprint Viewer Type]
Type=Allegro
[Allegro Footprints]
Dir0=C:\Cadence\SPB_24.1\share\pcb\pcb_lib\symbols
Dir1=D:\Projects\CadenceAllegro\CIS\olbpath
Dir2=D:\Projects\CadenceAllegro\CIS\padpath
Dir3=D:\Projects\CadenceAllegro\CIS\psmpath
Dir4=D:\Projects\CadenceAllegro\CIS\stppath
```

