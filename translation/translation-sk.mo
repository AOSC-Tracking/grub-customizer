��    u      �  �   l      �	  	   �	  "   �	  >   
     M
     m
  E   {
     �
  "   �
  
   �
  	   �
       1       C  %   `  &   �     �  /   �  '   �  -        C     Y     _  %   v  M   �  "   �  q             �     �  &   �  $   �               %     5     G     d     m  '   �  &   �     �     �     �  $        )  .   H  �   w  *   (  ^   S  �   �  8   F       G   �     �    �  .   �  �     	   �  	   �     �     �     �     �     �     �               '     6     <  
   U     `     q     w     |     �     �     �  	   �     �  
   �     �     �  
   �        	        '     9  
   ?  
   J  
   U     `     l  	   z     �      �     �     �     �     �  	   �     �     �               )     ;  	   D     N     Z     _     n     �  
   �     �     �  �  �     A  ,   M  <   z  '   �     �  K   �     <      E     f  	   u       d  �     �  .     .   @     o  /   �     �  +   �     �            "   <  M   _  +   �  j   �     D     X  '   n  .   �  0   �     �               6  %   Q  	   w     �     �  )   �     �     �        *      '   G   '   o      �   )   �!  u   �!  �   8"  U   �"     ##  U   1#  +   �#  7  �#  -   �$  �   %     �%     �%     �%     �%     �%  
   �%     &     &     5&     P&     f&  	   �&     �&     �&     �&     �&     �&     �&     �&     �&  	   '     '     !'     6'     C'     a'     i'     v'     �'     �'  
   �'     �'     �'     �'     �'     �'      (     (  !   0(  
   R(     ](     k(  
   r(     }(     �(     �(  	   �(     �(     �(  
   �(     �(     )     )     )     /)     L)     T)     b)     h)     "   Q   P   
   h       D   	   #          2          u          !   )   E      H   *   o       A   i   S       =      <           c   :   K      %   ?   N          \       9          .      m       L      l   5       @   `       J       '          Z   /             6   G   W   7                  X   k          M   C           [   R   I   U           3      a   e   1   q          >                  r   Y      j      f   O       d   _           $       &   8                T      ;   g   b   0          -      +   t   s   ,      p   V       4       F       n       B      ]       (       ^     (custom)  command not found, cannot proceed  couldn't be executed successfully. You must run this as root!  not found. Is grub2 installed? (new Entries) AND: your modifications are still unsaved, update will save them too! A_ppearance Add a script to your configuration Add script BURG Mode BURG found! Before you can edit your grub configuration we have to
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
to get the entry back! You started Grub Customizer using the live CD. You will see all entries (uncustomized) when you run grub. This error accurs (in most cases), when you didn't install grub gustomizer currectly. _Advanced _Device:  _Edit _File _General _Help _Install to MBR … _Quit without saving _Quit without update _Save & Quit _Update & Quit _View _use another partition:  background background image black blue brown copy to grub directory custom resolution:  cyan dark-gray default entry font color generate recovery entries green highlight: installing the bootloader… is active kernel parameters label light-blue light-cyan light-gray light-green light-magenta light-red loading configuration… look for other operating systems magenta menu colors name normal: partition pre_defined:  previously _booted entry red reload configuration remove background settings show menu transparent type umount failed! updating configuration value visibility white yellow Project-Id-Version: grub-customizer
Report-Msgid-Bugs-To: FULL NAME <EMAIL@ADDRESS>
POT-Creation-Date: 2010-11-28 22:09+0100
PO-Revision-Date: 2011-05-18 07:33+0000
Last-Translator: DAG Software <Unknown>
Language-Team: Slovak <sk@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Launchpad-Export-Date: 2011-09-13 22:00+0000
X-Generator: Launchpad (build 13921)
  (vlastné)  príkaz nenájdený, nemôžem pokračovať  nemôžem vykonať operáciu. Musíš ju spustiť ako root!  nenájdené. Je grub2 nainštalovaný? (nové položky) A: Vaše úpravy sú stále neuložené, uložia sa spolu s aktualizáciou! V_zhľad Pridať skript pre konfiguráciu Pridať script mód BURG BURG nájdený! Než budete môcť upravovať svoju grub konfiguráciu musíme
pripojiť požadované diskové oddiely.

Tento pomocník vám pomôže ako to urobiť.


Uistite sa prosím, cieľový systém je založený na rovnakej CPU architektúre
ako na práve bežiacom systéme.
Ak sa tak nestane, dostanete chybové hlásenie pri pokuse o načítanie konfigurácie. Konfikurácia bola uložená Nemôžem namontovať vybraný diskový oddiel Nemôžem odmontovať vybraný diskový oddiel Predvolený názov:  Do you want to configure BURG instead of grub2? Prajete si uložiť zmeny? Chcete si vybrať iný koreňový adresár? Editovať grub nastavenia Položka Položka %1 (podľa pozície) Chyba pri inštalácii zavádzača Grub Customizer je grafické rozhranie na konfiguráciu nastavení grub2/burg Grub Customizer: Výber diskových oddielov Nainštalovať zavádzač do MBR a vložiť nejaké
súbory do adresára zavádzača
(ak už neexistujú). Inštalovať do MBR Namontovanie zlyhalo! Namontovať vybraný súborový systém Posunúť nadol vybranú položku alebo skript Zaradiť vyššie vybranú položku alebo skript Názov položky Bootloader nenájdený Žiadny nájdený script Výber diskových oddielov Prosím, zadajte reťazec zariadenia! Náhľad: Proxy binárky nenájdené! Odobrať skript z konfigurácie Uložiť konfiguráciu a vytvoriť novú  Skript pre vloženie: sekundy Vyberte _partíciu ... Vyberte a pripojte váš koreňový oddiel Vyberte požadované podbody pripojenia Zavádzač bol úspešne naištalovaný Vygenerovaná konfigurácia nebola totožná uloženej konfigurácii pri štarte. Takže to, čo vidíte teraz nemusí byť to, čo uvidíte, pri reštartovaní Vášho počítača. Ak chcete tento problém odstrániť, kliknite na tlačidlo Aktualizovať! Uložená konfigurácia nie je aktuálna! Toto sú Vaše prípojné body Vášho fstab súboru.
Prosím, vyberte každú grub/zavádzajúcu súvisiacu oblasť. Táto voľba nefunguje ak "os-preber" skript nájde iné operačné systémy. Zakážte "% 1", ak nepotrebujete zavádzať iné operačné systémy. Zdá sa, že toto nie je koreňový súborový systém (žiadny "fstab" sa nenašiel) Čas vypršal Ak chcete aby vyššie vybrané farby sa zobrazili,
musíte vybrať obrázok pozadia! Odmontovať namontovaný súborový systém Vybrali ste možnosť výberu iného diskového oddielu.
Vezmite prosím na vedomie: "os-prober" nemusí nájsť Váš aktuláne spustení systém.
Takže spustite "Grub Customizer" na cieľovom systéme
znova a uložte konfiguráciu (alebo spustite "update-grub/update-burg"),
aby ste získali položku späť! Spustili ste Grub Customizer pomocou live CD. Uvidíte všetky položky (neprispôsobené) keď spustíte grub. Táto chyba sa vyskytuje (vo väčšine prípadov), keď ste nenainštalovali "grub customizer" korektne. _Pokročilé _Zariadenie:  Upraviť _Súbor _Hlavné _Pomocník _Inštalujem do MBR... _Ukončiť bez uloženia _Ukončiť bez aktualázie _Uložiť a Ukončiť _Aktualizovať a Ukončiť Zobraziť _použiť inú partíciu:  pozadie obrázok pozadia čierna modrá hnedá skopírovať do adresára grub vlastné rozlíšenie  azúrová tmavošedá predvolená položka farba písma generovať položky na obnovu zelená zvýrazniť: inštalujem zavádzač... je aktívne parametre jadra označenie svetlomodrá svetloazúrová svetlošedá svetlozelená svetlopurpurová svetločervená načítavanie konfigurácie ... hľadať iné operačné systémy purpurová ponuka farieb názov normálne: oddiel pred_definované  skôr _zavädená položka červená znovu načítať konfiguráciu odstrániť pozadie nastavenia zobraziť menu priehľadná typ odmontovanie zlyhalo! aktualizovanie konfigurácie hodnota viditeľnosť biela žltá 