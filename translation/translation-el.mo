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
        $     *  �  1     �  c   �  G   Y  #   �  #   �     �  �        �  :   �     �          $  �  >  0   �  Z   &  `   �  +   �  P      T   _   U   �   9   
!     D!  5   Y!  E   �!  �   �!  M   x"  �   �"  !   �#  (   �#  V   �#  Z   <$  Z   �$  ,   �$      %     @%  )   ]%  g   �%     �%  #   &  ?   /&  Q   o&  $   �&     �&  (   �&  ^   ('  V   �'  9   �'  �  (  R   �)  �   *  U  �*  y   .,  $   �,  �   �,  \   c-     �-  g   �/  R  I0  "   �1     �1     �1     �1     �1     2  &   2  -   <2  +   j2  )   �2  '   �2     �2  -   �2  c   &3  
   �3  #   �3  
   �3     �3     �3  b   �3  +   94  
   e4     p4  /   �4  '   �4  B   �4     !5     05  +   F5     r5  !   �5     �5     �5     �5     �5     6     #6     96  (   W6  F   �6     �6     �6  
   �6     �6     7     7  V   87     �7  /   �7  '   �7  c   �7     Z8     m8     �8  
   �8  .   �8  )   �8     �8     9  
   9     %9        /   1                -              +   c       k       x   A   j          T   "          !   &   `   l   *   C   <       ,       (   m      w   @              i       b   q          
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
PO-Revision-Date: 2012-04-09 16:19+0000
Last-Translator: Stavros K. Filippidis <Unknown>
Language-Team: Greek <el@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Launchpad-Export-Date: 2012-05-07 21:56+0000
X-Generator: Launchpad (build 15195)
  (προσαρμοσμένη) %1 δεν μπόρεσε να εκτελεσθεί επιτυχώς. Μήνυμα λάθους:
 %2 %1 δεν βρέθηκε. Έχει εγκατασταθεί το grub2; (νέες Είσοδοι από %1) (νέες καταχωρήσεις) (script κώδικας) AND: οι τροποποιήσεις σας δεν έχουν αποθηκευτεί ακόμη, η ενημέρωση θα αποθηκεύσει και αυτές! Ε_μφάνιση Προσθήκη script στη διαμόρφωσή σας Προσθήκη script Κατάσταση BURG Βρέθηκε το BURG! Πριν μπορέσετε να επεξεργασθείτε την διαμόρφωση του grub σας πρέπει να
προσαρτήσετε τις απαραίτητες κατατμήσεις.

Αυτός ο βοηθός θα σας βοηθήσει σε αυτό.


Παρακαλώ βεβαιωθείτε ότι το σύστημα στόχος βασίζεται στην ίδια αρχιτεκτονική επεξεργαστή
με αυτό που πραγματικά εκτελείται αυτή τη στιγμή.
Αν όχι, θα εμφανιστεί ένα μήνυμα λάθους κατά την προσπάθεια φόρτωσης της διαμόρφωσης. Η διαμόρφωση αποθηκεύτηκε Αποτυχία προσάρτησης της επιλεγμένης κατάτμησης Αποτυχία αποπροσάρτησης της επιλεγμένης κατάτμησης Προεπιλεγμένος τίτλος:  Θέλετε να διαμορφώσετε το BURG αντί για το grub2; Θέλετε να αποθηκεύσετε τις τροποποιήσεις σας; Θέλετε να επιλέξετε άλλη ριζική (root) κατάτμηση; Επεξεργασία προτιμήσεων του grub Καταχώρηση Καταχώρηση %1 (ως προς τη θέση) Σφάλμα κατά την εγκατάσταση του bootloader Ο Διαμορφωτής του Grub είναι μια γραφική διεπαφή για τη διαμόρφωση των ρυθμίσεων του grub2/burg Διαμορφωτής του Grub: Επιλογέας κατατμήσεων Εγκατάσταση του bootloader στο MBR και τοποθέτηση μερικών
αρχείων στον κατάλογο δεδομένων των bootloader
(αν δεν υπάρχουν ήδη). Εγκατάσταση στο MBR Αποτυχία προσάρτησης! Προσάρτηση του επιλεγμένου συστήματος αρχείων Μετακινήστε κάτω την επιλεγμένη καταχώρηση ή script Μετακινήστε πάνω την επιλεγμένη καταχώρηση ή script Ονομάστε την καταχώρηση Δεν βρέθηκε Bootloader Δεν βρέθηκε script Επιλογέας κατατμήσεων Παρακαλούμε πληκτρολογήστε ένα αλφαριθμητικό συσκευής! Προεπισκόπηση: Δεν βρέθηκε proxy binary! Αφαίρεση script από τη διαμόρφωσή σας Αποθήκευση διαμόρφωσης και δημιουργία νέας  Script που θα εισαχθεί: Δευτερόλεπτα Επιλογή _κατάτμησης … Επιλέξτε και προσαρτήσετε την ριζική σας κατάτμηση Επιλέξτε τα απαιτούμενα υποσημεία προσάρτησης Ο bootloader εγκαταστάθηκε επιτυχώς Η δημιουργημένη διαμόρφωση δεν είναι ίδια με την αποθηκευμένη διαμόρφωση κατά την εκκίνηση. Έτσι, ό,τι βλέπετε τώρα μπορεί να μην είναι ό,τι θα δείτε όταν επανεκκινήσετε τον υπολογιστή σας. Για να το διορθώσετε, πατήστε ενημέρωση! Η αποθηκευμένη διαμόρφωση δεν είναι ενήμερη! Αυτά είναι τα σημεία προσάρτησης του αρχείου σας fstab.
Παρακαλούμε επιλέξτε κάθε σχετική με το grub/boot κατάτμηση. Αυτή η επιλογή δεν δουλεύει όταν το σενάριο ενεργειών (script) "os-prober" βρίσκει άλλα λειτουργικά συστήματα. Απενεργοποιήστε το "%1" αν δεν χρειάζεται να εκκινείτε με άλλα λειτουργικά συστήματα. Αυτό δεν φαίνεται να είναι ριζικό σύστημα αρχείων (δεν βρέθηκε fstab) Λήξη χρονικού ορίου Για να δουλέψουν τα παραπάνω χρώματα,
πρέπει να επιλέξετε μια εικόνα παρασκηνίου! Αποπροσάρτηση του επιλεγμένου συστήματος αρχείων Επιλέξατε να χρησιμοποιήσετε άλλη κατάτμηση.
Παρακαλώ σημειώστε: Το os-prober (ανίχνευση λειτουργικού) μπορεί να μη βρει το λειτουργικό που εκτελείτε.
Έτσι εκτελέστε τον Διαμορφωτή του Grub στο σύστημα στόχο
ξανά και αποθηκεύστε τη διαμόρφωση (ή εκτελέστε update-grub/update-burg)
για να ξαναβάλετε την καταχώρηση! Εκκινήσατε το Διαμορφωτή του Grub χρησιμοποιώντας το live CD. Βλέπετε όλες τις καταχωρήσεις (χωρίς διαμόρφωση) όταν εκτελείτε το grub. Αυτό το σφάλμα συμβαίνει (στις περισσότερες περιπτώσεις), όταν δεν έχετε εγκαταστήσει τον διαμορφωτή του grub σωστά. Για προ_χωρημένους _Συσκευή:  _Επεξεργασία _Αρχείο _Γενικά _Βοήθεια Ε_γκατάσταση στο MBR … Έξο_δος χωρίς αποθήκευση Έ_ξοδος χωρίς ενημέρωση _Αποθήκευση και έξοδος _Ενημέρωση και έξοδος _Προβολή _χρήση άλλης κατάτμησης:  προσθήκη αυτής της καταχώρισης από το τρέχον υπομενού φόντο εικόνα παρασκηνίου μαύρο μπλε καφέ δεν γίνεται να μετακινηθεί η συγκεκριμένη καταχώριση προσαρμοσμένη ανάλυση:  κυανό σκούρο γκρι προεπιλεγμένη καταχώρηση χρώμα γραμματοσειράς δημιουργία καταχωρήσεων επαναφοράς πράσινο επισήμανση: εγκατάσταση του bootloader… είναι ενεργή παράμετροι πυρήνα ετικέτα ανοιχτό μπλε ανοιχτό κυανό ανοιχτό γκρι ανοιχτό πράσινο ανοιχτό μωβ ανοιχτό κόκκινο φόρτωση διαμόρφωσης… έρευνα για άλλα λειτουργικά συστήματα μωβ χρώματα μενού όνομα κανονικό: κατάτμηση προ_καθορισμένο:  καταχώρηση _προηγούμενης εκκίνησης συστήματος κόκκινο επαναφόρτωση διαμόρφωσης αφαίρεση παρασκηνίου αφαίρεση αυτής της καταχώρισης από το τρέχον υπομενού ρυθμίσεις εμφάνιση μενού διαφανές τύπος Αποτυχία αποπροσάρτησης! ενημέρωση διαμόρφωσης τιμή ορατότητα λευκό κίτρινο 