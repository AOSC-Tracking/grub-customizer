��    u      �  �   l      �	  	   �	  >   �	     *
     J
     ^
  E   l
     �
  "   �
  
   �
  	   �
     �
  1       4  %   Q  &   w     �  /   �  '   �  -        4     J     P  %   g  M   �  "   �  q   �     p          �  &   �  $   �     �               &     8     U     ^  '   v  &   �     �     �     �  $   �       .   9  �   h  *     ^   D  �   �  8   7     p  G   x     �    �  .   �  �     	   �  	   �     �     �     �     �     �     �     �               '     -  
   F     Q     b     h     m     s     �     �  	   �     �  
   �     �     �  
   �     �  	             *  
   0  
   ;  
   F     Q     ]  	   k     u      �     �     �     �     �  	   �     �     �                    ,  	   5     ?     K     P     _     v  
   |     �     �  �  �     7  N   C  ,   �     �     �  L   �     1     :     Y     h     t  Y  �     �  1   �  0   1     b  0   w     �  -   �     �     
       %   1  M   W  +   �  l   �     >     T  %   h  +   �  +   �     �  "   �          <  %   W  	   }  &   �     �  0   �     �           '   *   :   -   e   '   �   �   �   )   �!  l   �!  �   >"  ]   �"     1#  J   A#  &   �#    �#  -   �$  �   %     �%     �%  	   �%     �%     �%  
   �%     �%     &     &     <&     R&  
   m&     x&     �&     �&     �&     �&     �&  (   �&     �&  	   '     '     '     1'     >'     \'     d'     r'     �'     �'     �'     �'     �'     �'     �'     �'     �'     (  !   '(  
   I(     T(     a(  
   f(     q(     x(     �(  	   �(     �(     �(  
   �(     �(     �(     
)     )     !)     >)     F)     T)     Z)     "   Q   P   
   h       D   	   #          2          u          !   )   E      H   *   o       A   i   S       =      <   M       c   :   K      %   ?   N          \       9          .      m       L      4   5       @   `       J       '          Z   /          &   6   G   W   7                  X   k              C           [   R   I   U           3      a   e   1   q          >                  r   Y      j      f   O       d   _           $           8                T      ;   g   b   0          -      +   t   s   ,      p   V              F       n   l   B      ]       (       ^     (custom)  couldn't be executed successfully. You must run this as root!  not found. Is grub2 installed? (new Entries of %1) (new Entries) AND: your modifications are still unsaved, update will save them too! A_ppearance Add a script to your configuration Add script BURG Mode BURG found! Before you can edit your grub configuration we have to
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
to get the entry back! You started Grub Customizer using the live CD. You will see all entries (uncustomized) when you run grub. This error accurs (in most cases), when you didn't install grub gustomizer currectly. _Advanced _Device:  _Edit _File _General _Help _Install to MBR … _Quit without saving _Quit without update _Save & Quit _Update & Quit _View _use another partition:  background background image black blue brown cannot move this entry custom resolution:  cyan dark-gray default entry font color generate recovery entries green highlight: installing the bootloader… is active kernel parameters label light-blue light-cyan light-gray light-green light-magenta light-red loading configuration… look for other operating systems magenta menu colors name normal: partition pre_defined:  previously _booted entry red reload configuration remove background settings show menu transparent type umount failed! updating configuration value visibility white yellow Project-Id-Version: grub-customizer
Report-Msgid-Bugs-To: FULL NAME <EMAIL@ADDRESS>
POT-Creation-Date: 2011-09-14 00:10+0200
PO-Revision-Date: 2011-09-29 17:03+0000
Last-Translator: Ondrej Mosnáček <Unknown>
Language-Team: Slovak <sk@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Launchpad-Export-Date: 2011-11-17 22:40+0000
X-Generator: Launchpad (build 14291)
  (vlastné)  nebolo možné vykonať úpešne. Túto aplikáciu musíte spustiť ako root!  nebolo nájdené. Je Grub2 nainštalovaný? (nové položky %1) (nové položky) A: vaše úpravy stále nie sú uložené, uložia sa až pri aktualizácii! _Vzhľad Pridá skript do konfigurácie Pridať skript Režim Burg Bol nájdený Burg! Než budete môcť upravovať vašu konfiguráciu Grub, je potrebné
pripojiť požadované diskové oddiely.

Tento pomocník vám s tým pomôže.


Uistite sa prosím, že cieľový systém je založený na rovnakej CPU architektúre
ako práve bežiaci systém.
Ak nebude, dostanete chybové hlásenie pri pokuse o načítanie konfigurácie. Konfigurácia bola uložená Nebolo možné pripojiť vybraný diskový oddiel Nebolo možné odpojiť vybraný diskový oddiel Predvolený názov:  Želáte si nakonfigurovať Burg namiesto Grub2? Želáte si uložiť zmeny? Želáte si vybrať iný koreňový adresár? Upraví nastavenia Grub Položka Položka %1 (podľa pozície) Chyba počas inštalácie zavádzača Grub Customizer je grafické rozhranie na konfiguráciu nastavení Grub2/Burg Grub Customizer: Výber diskových oddielov Nainštaluje zavádzač do MBR a vloží niekoľko
súborov do adresára zavádzača
(ak ešte neexistujú). Nainštalovať do MBR Pripojenie zlyhalo! Pripojiť vybraný súborový systém Posunie vybranú položku alebo skript dole Posunie vybranú položku alebo skript hore Pomenovať položku Žiadny zavádzač nebol nájdený Žiadny skript nebol nájdený Výber diskových oddielov Prosím, zadajte reťazec zariadenia! Náhľad: Binárny súbor proxy nebol nájdený! Odoberie skript z konfigurácie Uloží konfiguráciu a vygeneruje nový súbor  Skript, ktorý sa má vložiť: sekúnd Vybrať _oddiel... Vyberte a pripojte váš koreňový oddiel Vyberte ďalšie požadované body pripojenia Zavádzač bol úspešne naištalovaný Vygenerovaná konfigurácia nebola totožná s konfiguráciou uloženou pri štarte. Takže to, čo vidíte teraz, nemusí byť to, čo uvidíte po reštartovaní počítača. Na odstránenie tohoto problému kliknite na Aktualizovať! Uložená konfigurácia nie je aktuálna! Toto sú prípojné body vášho súboru fstab.
Prosím, vyberte všetky oddiely súvisiace so zavádzačom. Táto voľba nefunguje, ak skript "os-prober" nájde iné operačné systémy. Zakážte "%1", ak nepotrebujete zavádzať iné operačné systémy. Zdá sa, že toto nie je koreňový súborový systém (žiadny súbor fstab nebol nájdený) Časový limit: Aby sa použili vyššie vybrané farby,
musíte vybrať obrázok pozadia! Odpojiť pripojený súborový systém Vybrali ste možnosť výberu iného diskového oddielu.
Nezabudnite: os-prober nemusí nájsť aktuálne spustený systém.
Preto spustite Grub Customizer na cieľovom systéme
znova a uložte konfiguráciu (alebo spustite "update-grub"/"update-Burg"),
aby ste získali položku späť! Spustili ste Grub Customizer pomocou live CD. Uvidíte všetky položky (neprispôsobené) keď spúšťate Grub. Táto chyba sa vyskytuje (vo väčšine prípadov), keď sa Grub Customizer nenainštaloval správne. _Pokročilé _Zariadenie:  _Upraviť _Súbor _Hlavné _Pomocník _Nainštalovať do MBR... _Ukončiť bez uloženia _Ukončiť bez aktualizácie U_ložiť a ukončiť _Aktualizovať a ukončiť _Zobraziť _použiť iný oddiel:  farba pozadia Obrázok pozadia čierna modrá hnedá nebolo možné presunúť túto položku vlastné rozlíšenie:  azúrová tmavošedá Predvolená položka farba písma generovať položky na obnovu zelená zvýraznené: inštaluje sa zavádzač... aktívne Parametre jadra menovka svetlomodrá svetloazúrová svetlošedá svetlozelená svetlopurpurová svetločervená načítava sa konfigurácia... hľadať iné operačné systémy purpurová Farby ponuky meno normálne: oddiel pred_definovaná:  predtým _použitá položka červená Znova načíta konfiguráciu odstrániť pozadie Nastavenia zobraziť menu priehľadná typ Odpojenie zlyhalo! aktualizuje sa konfigurácia hodnota Viditeľnosť biela žltá 