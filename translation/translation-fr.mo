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
        $     *  �  1     �  @   �  +   "     N     i     ~  Z   �  
   �  (   �       	   0     :  i  J  %   �  0   �  3        ?  3   U  ,   �  5   �  !   �            7   3  Z   k  *   �  �   �     |     �  ,   �  :   �  ;         N   %   _      �      �   2   �      �      �   *   !  :   A!     |!     �!     �!  *   �!  2   �!  9   "    S"  2   Z#  k   �#  �   �#  E   �$     %  Z   %%  /   �%  �  �%  6   2'  �   i'     +(     4(     H(     Q(  
   Z(     e(     k(     �(     �(     �(     �(  
   �(  !   �(  -   )     H)     V)     d)     i)     n)  &   u)     �)     �)     �)     �)     �)  '   �)     *  
   !*  *   ,*  	   W*     a*  
   v*  
   �*  
   �*  
   �*  
   �*     �*     �*  !   �*  +   �*     +     +     /+     3+  	   <+     F+      V+     w+     }+     �+  ,   �+     �+     �+     �+     ,     ,      (,     I,     P,     \,     b,        /   1                -              +   c       k       x   A   j          T   "          !   &   `   l   *   C   <       ,       (   m      w   @              i       b   q          
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
PO-Revision-Date: 2012-01-11 17:19+0000
Last-Translator: Mohamed SEDKI <Unknown>
Language-Team: French <fr@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Launchpad-Export-Date: 2012-06-11 21:08+0000
X-Generator: Launchpad (build 15376)
  (personnalisé) %1 ne peut pas s’exécuter correctement. Message d'erreur :
%2 %1 not found. grub2 est-il bien installé ? (nouvelles entrées de %1) (nouvelles entrées) (script du code) AND: Vos modifications ne sont pas enregistrées, la mise à jour le fera automatiquement! A_pparence Ajouter un script à votre configuration Ajouter un script mode BURG BURG trouvé ! Avant de pouvoir éditer votre configuration de grub, nous devons
monter les partitions nécessaires.

Cet assistant va vous aider à faire ceci.


Veuillez vous assurer que le système cible est basé sur la même architecture cpu
que celle actuellement démarrée.
Sinon, vous obtiendrez un message d'erreur lorsque vous essayerez de charger la configuration. La configuration a été enregistrée Impossible de monter la partition sélectionnée Impossible de démonter la partition sélectionnée Titre par défaut :  Voulez-vous configurer BURG à la place de grub2 ? Voulez-vous enregistrer vos modifications ? Voulez-vous sélectionner une autre partition root ? Éditer les préférences de grub Entrée Entrée %1 (par emplacement) Erreur durant l'installation du programme de démarrage Grub Customizer est une interface graphique de configuration des paramètres de grub2/burg Grub Customizer : Sélecteur de partition Installe le programme de démarrage dans le MBR et copie quelques
fichiers dans son répertoire de données
(s'ils ne sont pas présents). Installer sur le MBR Le montage a échoué ! Monter le système de fichiers sélectionné Déplacer vers le bas l'entrée ou le script sélectionné Déplacer vers le haut l'entrée ou le script sélectionné Nommer l'entrée Aucun programme de démarrage trouvé Aucun script trouvé Sélecteur de partition Veuillez introduire une chaîne de périphérique! Prévisualiser : Binaire du proxy non trouvé ! Supprimer un script de votre configuration Enregistrer la configuration et en générer une nouvelle  Script à insérer : Secondes Sélectionner une _partition... Sélectionne et monte votre partition root Choisissez les sous-points de montage nécessaires Le programme de démarrage a été installé avec succès La configuration générée n'est pas identique à la configuration enregistrée au démarrage. Ainsi ce que vous voyez maintenant peut ne pas être ce que vous verrez lorsque vous redémarrerez votre ordinateur. Pour corrigez ceci, cliquez sur mettre à jour ! La configuration enregistrée n'est pas à jour ! Ce sont les points de montage de votre fichier fstab.
Veuillez choisir chaque partition liée à grub/boot. Cette option ne fonctionne pas lorsque le script de "détection de système" trouve d'autres systèmes d'exploitation. Désactiver "%1" si vous n'avez pas besoin de démarrer d'autres systèmes d'exploitation. Cela ne semble pas être un fichier système root (fstab non trouvé) Délai d'expiration Pour que les couleurs ci-dessus fonctionnent,
vous devez sélectionner une image de fond ! Démonter le système de fichiers sélectionné Vous avez choisi l'option pour choisir une autre partition.
Notez : Le'xplorateur de système d'exploitation pourrait ne pas trouver votre système actuellement en cours d'utilisation.
En conséquence, lancez à nouveau le logiciel de personnalisation de Grub sur le système de destination et enregistrez la configuration (ou lancez update-grub/update-burg) pour retrouver l'entrée ! Vous avez lancé Grub Customizer à l'aide du live CD. Vous verrez toutes les entrées (non personnalisées) quand vous lancerez grub. Cette erreur apparaît (dans la plupart des cas), lorsque vous n'avez pas installé grub customizer correctement. _Avancé _Périphérique :  _Éditer _Fichier _Général _Aide _Installation dans le MBR _Quitter sans enregistrer _Quitter sans mettre à jour _Enregistrer & Quitter _Mettre à jour & Quitter _Affichage _utiliser une autre partition :  ajouter cette entrée à un nouveau sous-menu arrière-plan Image de fond noir bleu marron Cette entrée ne peut être déplacée résolution personnalisée :  cyan gris foncé entrée par défaut couleur de la police génère les entrées de récupération vert éclairé: Installation du programme de démarrage... est actif paramètres du noyau étiquette bleu clair cyan clair gris clair vert clair magenta clair rouge clair chargement de la configuration... recherche d'autres systèmes d'exploitation magenta couleur des menus Nom normal : partition pré_défini :  entrée précédemment _amorcée rouge Recharger la configuration supprime l'image de fond supprimer cette entrée du sous-menu courant paramètres afficher le menu transparent type Le démontage a échoué ! mise à jour de la configuration valeur visibilité blanc jaune 