��    r      �  �   <      �	  	   �	  >   �	     �	     
     (
  "   4
  
   W
  	   b
     l
  1  x
     �  %   �  &   �       /   $  '   T  -   |     �     �     �  %   �  M     "   Q  q   t     �     �       &     $   D     i     x     �     �     �     �     �  '   �  &        ;     M     U  $   k     �  .   �  �   �  *   �  ^   �  �     8   �     �  G   �     6    Q  .   T  �   �  	     	        (     .     4     =     C     W     l     �     �     �     �  
   �     �     �     �     �     �     �  	          
        %     ?  
   E     P  	   m     w     �  
   �  
   �  
   �     �     �  	   �     �      �               "     '  	   /     9     G     `     d     y     �  	   �     �     �     �     �     �  
   �     �     �  �  �     �  �   �  :   =     x     �  O   �  "   �       ,   (  ]  U  6   �  F   �  J   1  '   |  D   �  =   �  G   '  <   o  
   �  #   �  k   �  }   G  '   �  �   �     �   +   �   H   "!  X   k!  X   �!     "  N   6"  !   �"     �"  /   �"     �"  I   �"  Q   H#  Y   �#  #   �#     $     '$  G   C$  R   �$  j   �$  u  I%  G   �&  �   '    �'  ^   �(  &   4)     [)  P   �)  �  ,*  C   �+    &,     /-     C-     [-  	   s-  	   }-     �-  "   �-  %   �-  '   �-     .  #   .     B.  ,   P.     }.  #   �.  
   �.  
   �.     �.  J   �.     /     -/     A/     a/  3   |/     �/     �/  Z   �/     *0  $   90     ^0     k0  #   �0     �0     �0     �0     �0  7   1  D   I1     �1      �1     �1     �1     �1  ,   �1  +   2     92  :   H2  "   �2     �2      �2     �2     �2  /   �2  6   $3     [3     l3     }3  
   �3         N   M      e       B      !          0   	       r             '   C      F   (   l       ?   f   P       ;      :           `   8   I      #   =   K          Y       7          ,      j       J   
   i   3       >   ]       H       %          W   -          $   4   E   T   5                 U   h              A           X   O   G   R           1   V   ^   b   /   n          <                  o   m      g      c   L       a   \           "           6                Q      9   d   _   .          +      )   q   p   *          S       2       D       k       @      Z       &       [     (custom)  couldn't be executed successfully. You must run this as root!  not found. Is grub2 installed? (new Entries) A_ppearance Add a script to your configuration Add script BURG Mode BURG found! Before you can edit your grub configuration we have to
mount the required partitions.

This assistant will help you doing this.


Please ensure the target system is based on the same cpu architecture
as the actually running one.
If not, you will get an error message when trying to load the configuration. Configuration has been saved Couldn't mount the selected partition Couldn't umount the selected partition Default title:  Do you want to configure BURG instead of grub2? Do you want to save your modifications? Do you want to select another root partition? Edit grub preferences Entry Entry %1 (by position) Error while installing the bootloader Grub Customizer is a graphical interface to configure the grub2/burg settings Grub Customizer: Partition chooser Install the bootloader to MBR and put some
files to the bootloaders data directory
(if they don't already exist). Install to MBR Mount failed! Mount selected Filesystem Move down the selected entry or script Move up the selected entry or script Name the Entry No Bootloader found No script found Partition Chooser Please type a device string! Preview: Proxy binary not found! Remove a script from your configuration Save configuration and generate a new  Script to insert: Seconds Select _partition … Select and mount your root partition Select required submountpoints The bootloader has been installed successfully The generated configuration didn't equal to the saved configuration on startup. So what you see now may not be what you see when you restart your pc. To fix this, click update! The saved configuration is not up to date! These are the mountpoints of your fstab file.
Please select every grub/boot related partition. This option doesn't work when the "os-prober" script finds other operating systems. Disable "%1" if you don't need to boot other operating systems. This seems not to be a root file system (no fstab found) Timeout To get the colors above working,
you have to select a background image! Unmount mounted Filesystem You selected the option for choosing another partition.
Please note: The os-prober may not find your actually running system.
So run Grub Customizer on the target system
again and save the configuration (or run update-grub/update-burg)
to get the entry back! You started Grub Customizer using the live CD. You will see all entries (uncustomized) when you run grub. This error accurs (in most cases), when you didn't install grub gustomizer currectly. _Advanced _Device:  _Edit _File _General _Help _Install to MBR … _Quit without saving _Quit without update _Save & Quit _Update & Quit _View _use another partition:  background background image black blue brown custom resolution:  cyan dark-gray default entry font color generate recovery entries green highlight: installing the bootloader… is active kernel parameters label light-blue light-cyan light-gray light-green light-magenta light-red loading configuration… look for other operating systems magenta menu colors name normal: partition pre_defined:  previously _booted entry red reload configuration remove background settings show menu transparent type umount failed! updating configuration value visibility white yellow Project-Id-Version: grub-customizer
Report-Msgid-Bugs-To: FULL NAME <EMAIL@ADDRESS>
POT-Creation-Date: 2011-09-14 00:10+0200
PO-Revision-Date: 2011-09-14 19:50+0000
Last-Translator: Dimitar Dimitrov <Unknown>
Language-Team: Bulgarian <bg@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Launchpad-Export-Date: 2011-09-27 19:28+0000
X-Generator: Launchpad (build 14041)
  (потребителски)  не можа да се изпълни успешно Това трябва да се пусне като администратор!  не е открит. Инсталиран ли е grub2? (нови записи) _Външен вид Добавяне на скрипт към вашата конфигурация Добавяне на скрипт BURG режим Открита е програмата BURG! Преди да можете да редактирате вашата grub конфигурация, ние трябва да
монтираме необходимите дялове.

Този помощник ще ви помогне за това.


Моля уверете се, че целевата система е със същата процесорна архитектура
като тази на текущо пусната.
В противен случай при опит за зареждане на конфигурацията ще получите съобщение за грешка. Конфигурацията беше запазена Избраният дял не може да бъде монтиран Избраният дял не може да бъде демонтиран Стандартно заглавие:  Желаете ли да настроите BURG вместо grub2? Желаете ли да запазите промените? Желаете ли да изберете друг главен дял? Редактиране на настройките на grub Запис Запис %1 (по позиция) Грешка при инсталиране на програмата за начално зареждане Grub Customizer е графичен интерфейс за конфигуриране настройките на grub2/burg Grub Customizer: Избор на дял Инсталиране на програмата за начално зареждане в MBR
и поставяне на някои файлове в папката и с данни
(ако те вече не съществуват). Инсталиране в MBR Монтирането се провали! Монтиране на избраната файлова система Преместване надолу на избрания запис или скрипт Преместване нагоре на избрания запис или скрипт Име на записа Не е открита програма за начално зареждане Не е открит скрипт Избор на дял Моля въведете устройство! Преглед: Двоичния файл на посредника не е открит! Премахване на скрипт от вашата конфигурация Запазване на конфигурацията и генериране на нов  Скрипт за вмъкване: Секунди Избор на _дял … Изберете и монтирайте вашия главен дял Изберете необходимите подточки за монтиране Програмата за начално зареждане беше инсталирана успешно Генерираната конфигурация не е еднаква със запазената при пускане на програмата. Това, което виждате тук не е това, което ще видите при рестартиране на компютъра. За да оправите това натиснете обновяване! Запазената конфигурация не е актуална! Това са точките за монтиране на вашия файл fstab.
Моля изберете всеки дял, свързан с grub/начално зареждане. Тази опция не работи, когато скриптът "os-prober" намери други операционни системи. Изключете "%1", ако нямате нужда да зареждате други операционни системи. Изглежда, че това не е главен дял (не открит файл fstab) Просрочка на времето За да работят горните цветове,
трябва да изберете фоново изображение! Демонтиране на монтираната файлова система Вие решихте да изберете друг дял.
Моля забележете: os-prober може да не открие вашата реално пусната система.
Затова отново пуснете Grub Customizer на целевата система
и запазете конфигурацията (или изпълнете update-grub/update-burg)
за да върнете записа отново! Вие стартирахте Grub Customizer от жив диск. Когато пуснете grub ще видите всички записи (непроменени). Тази грешка се получава (в повечето случаи), когато не сте инсталирали правилно grub gustomizer. _Разширени _Устройство:  _Редактиране _Файл _Общи _Помощ _Инсталиране в MBR … _Изход без запазване _Изход без обновяване _Запис и изход _Обновяване и изход _Изглед _използване на друг дял:  фон фоново изображение черно синьо кафяво потребителска разделителна способност:  синьозелено тъмно сиво стандартен запис цвят на шрифта генериране на авариен запис зелено осветено: Инсталиране на програмата за начално зареждане... активен параметри на ядрото етикет светло синьо светло синьозелено светло сиво светло зелено светло пурпурно светло червено зареждане на конфигурацията... търсене за други операционни системи пурпурно цветове на менюто име нормално: дял _предварително зададен:  пос_ледно зареден запис червено презареждане на конфигурацията премахване на фона настройки Показване на меню прозрачен тип Демонтирането се провали! обновяване на конфигурацията стойност видимост бяло жълто 