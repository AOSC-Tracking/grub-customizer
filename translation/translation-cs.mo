��    x      �  �   �      (
  	   )
  8   3
  !   l
     �
     �
     �
  E   �
       "     
   3  	   >     H  1  T     �  %   �  &   �     �  /      '   0  -   X     �     �     �  %   �  M   �  "   -  q   P     �     �     �  &   �  $         E     T     h     x     �     �     �  '   �  &   �          )     1  $   G     l  .   �  �   �  *   k  ^   �  �   �  8   �     �  G   �         -  .   0  �   _  	   �  	   �          
                    3     H     ]     j     y          �  
   �     �     �     �     �     �     �       	          
   -     8     R  
   X     c  	   �     �     �  
   �  
   �  
   �     �     �  	   �     �            !     )     5     :  	   B     L     Z     s     w     �  *   �     �  	   �     �     �     �     �       
        $     *  �  1     �  ;   �  +   $     P     h     y  H   �     �  $   �     �  	          F  %     l      �     �     �  &   �        )        F     _     e     {  K   �      �  x        �     �  #   �  ,   �  -   �     -     =     Z     r  '   �     �  $   �  #   �  &   �     #      7      >   $   P   (   u   '   �   �   �   '   �!  r   �!  �   C"  V   �"     5#  J   >#  $   �#    �#  .   �$  �   �$     �%     �%     �%     �%     �%     �%     �%     �%     
&     $&     8&  	   Q&     [&  #   u&     �&     �&     �&     �&     �&     �&     �&     '     '     '     +'     8'     U'     ]'     l'     �'     �'     �'     �'     �'     �'     �'     �'     �'     (  "   -(  
   P(  
   [(     f(     m(     y(     �(     �(  	   �(     �(     �(  -   �(  
   )     )     -)     9)     =)     V)     n)     v)     �)     �)        /   1                -              +   c       k       x   A   j          T   "          !   &   `   l   *   C   <       ,       (   m      w   @              i       b   q          
   [       a   ;       o      e   4   .           N           _         F   v   Y   #   s   0   G   I          L   :   6       Q          O   h       ]      K   '   V      \   5   r           E   S       %       7   X   g   H   $       9          Z       D           3   p                 M   U      ^   >   R   n                   2       W   )       P   f   u                          d   	   t          B   =   ?   8       J        (custom) %1 couldn't be executed successfully. error message:
 %2 %1 not found. Is grub2 installed? (new Entries of %1) (new Entries) (script code) AND: your modifications are still unsaved, update will save them too! A_ppearance Add a script to your configuration Add script BURG Mode BURG found! Before you can edit your grub configuration we have to
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
to get the entry back! You started Grub Customizer using the live CD. You will see all entries (uncustomized) when you run grub. This error accurs (in most cases), when you didn't install grub gustomizer currectly. _Advanced _Device:  _Edit _File _General _Help _Install to MBR … _Quit without saving _Quit without update _Save & Quit _Update & Quit _View _use another partition:  add this entry to a new submenu background background image black blue brown cannot move this entry custom resolution:  cyan dark-gray default entry font color generate recovery entries green highlight: installing the bootloader… is active kernel parameters label light-blue light-cyan light-gray light-green light-magenta light-red loading configuration… look for other operating systems magenta menu colors name normal: partition pre_defined:  previously _booted entry red reload configuration remove background remove this entry from the current submenu settings show menu transparent type umount failed! updating configuration value visibility white yellow Project-Id-Version: grub-customizer
Report-Msgid-Bugs-To: FULL NAME <EMAIL@ADDRESS>
POT-Creation-Date: 2011-12-23 17:05+0100
PO-Revision-Date: 2012-02-24 10:35+0000
Last-Translator: Jan Dolejš <jackdown3csr@gmail.com>
Language-Team: Czech <cs@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Launchpad-Export-Date: 2012-06-11 21:08+0000
X-Generator: Launchpad (build 15376)
  (vlastní) %1 nemohlo být správně spuštěno. chybová zpráva:
 %2 %1 nebylo nalezeno. Je grub2 nainstalován? (nových položek z %1) (nové položky) (kód scriptu) A: Vaše úpravy jsou stále neuložené, aktualizací se uloží také! _Vzhled Přidat skript pro vaši konfiguraci Přidat skript BURG mód BURG nalezen! Než budete moci upravovat své grub konfigurace, musíme
připojit požadované oddíly.

Tento pomocník vám s tím pomůže 


Ujistěte se prosím, že cílový systém je založen na stejné CPU architektuře
jako aktuálně spuštěný. 
Pokud není,  objeví se při pokusu o načtení konfigurace chybové hlášení. Konfigurace byla uložena Nemohu připojit vybraný oddíl Nemohu odpojit vybraný oddíl Výchozí název:  Chcete konfigurovat BURG místo grub2? Přejete si uložit změny? Chcete si vybrat jiný kořenový oddíl? Editovat grub předvolby Vstup Vstup% 1 (dle pozice) Chyba při instalaci zavaděče Grub Customizer je grafická nadstavba ke konfiguraci grub2/burg nastavení Grub Customizer: Výběr oddílu Nainstalujte zavaděč do MBR a vložte nějaké
soubory do datového adresáře zavaděče
(pokud ještě neexistují). Instalovat do MBR Připojení se nezdařilo! Připojit vybraný systém souborů Posunout vybrané položky nebo skript dolů Posunout vybrané položky nebo skript nahoru Jméno položky Žádný zavaděč nenalezen Žádný skript nalezen Výběr oddílu Prosím, zadejte řetězec zařízení! Náhled: Spustitelný soubor proxy nenalezen! Odebrat skript z vaší konfigurace Uložit nastavení a vytvářet nové  Skript k vložení: Sekund Vybrat _oddíl... Zvolit a připojit kořenový oddíl Vyberte požadované podbody připojení Zavaděč byl úspěšně nainstalován vytvořená konfigurace není shodná s konfigurací uloženou při startu. To, co vidíte teď nemusí být to, co se zobrazí při restartování pc. Chcete-li tento problém odstranit, klepněte na tlačítko Aktualizovat! Uložená konfigurace není aktuální! Jedná se o přípojné body z vašeho fstab souboru.
Prosím, vyberte každý grub/boot související s oblastí. Tato volba nefunguje, když skript "os-prober" nalezne jíné operační systémy. Vypněte "%1", pokud nepotřebujete zavádět jiné operační systémy Zdá se, že toto není kořenový souborový systém (nebyly nalezeny žádné fstab) Prodleva Aby se barvy uvedené výše použily,
musíte vybrat obrázek na pozadí! Odpojit připojený systém souborů Vybrali jste možnost výběru jiného oddílu.
Vezměte prosím na vědomí: os-prober nemusí najít skutečně běžící systém.
Spusťte Grub Customizer na cílovém systému
znovu a uložte konfigurace (nebo spusťte update-grub/update-burg)
abyste získali vstup zpět! Spustili jste Grub Customizer pomocí live CD. Když spustíte grub, uvidíte všechny záznamy (nepřizpůsobené). Tato chyba se (většinou) objeví, když jste správně nenainstalovali grub přizpůsobovač. _Pokročilé _Zařízení:  _Upravit _Soubor _Obecné _Nápověda _Instalovat do MBR … Uko_nčit bez uložení U_končit bez aktualizace _Uložit & ukončit _Aktualizovat & ukončit _Zobrazit Po_užijte jiný oddíl:  Přidat položku do nového submenu pozadí obrázek na pozadí černá modrá hnědá nelze přesunout tuto položku vlastní rozlišení:  azurová tmavě šedivá výchozí vstup barva písma vytvořit záznamy k obnově zelená zvýraznění: instalace zavaděče... je aktivní parametry jádra popisek světle modrá světlá azurová světle šedivá světle zelená světlá purpurová světle červená načítání konfigurace... hledat další operační systémy purpurová barvy menu jméno normální: oddíl před_definované:  dříve _zavedený záznam červená načíst konfiguraci znovu odstranit pozadí Odebrat tuto položku ze současného submenu nastavení zobrazit menu průhledné typ odpojení se nezdařilo! aktualizace konfigurace hodnota viditelnost bílá žlutá 