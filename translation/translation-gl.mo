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
   |     �     �  �  �     F  L   W  $   �     �     �  Q   �     A  '   M     u  	   �     �  <  �     �  1   �  4   &     [  )   t     �  )   �     �            5   +  Z   a  (   �  �   �     k     {  *   �  2   �  2   �     ,  $   =     b       "   �     �     �  )   �  *         <      Q      Z   )   u   7   �   /   �   �   !  /   �!  m   
"  �   x"  J    #     k#  M   �#  (   �#  !  �#  )   %  �   F%  	   �%     �%     &  	   &     &     !&     (&     <&     N&     d&     t&     �&     �&     �&     �&     �&     �&     �&  "   �&     �&     '     '     '     5'  !   D'     f'  
   l'  $   w'     �'     �'     �'  
   �'  
   �'  
   �'     �'     �'     (     (  !   /(     Q(     Y(     h(     m(  
   u(     �(     �(     �(     �(     �(     �(     �(     )     )  "   )     8)     V)     \)     h)     o)     "   Q   P   
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
PO-Revision-Date: 2011-10-18 16:12+0000
Last-Translator: Miguel Anxo Bouzada <mbouzada@gmail.com>
Language-Team: Galician <gl@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Launchpad-Export-Date: 2011-11-17 22:40+0000
X-Generator: Launchpad (build 14291)
  (personalizada)  non puido ser executado correctamente. Ten que executalo como superusuario.  non atopado. Está instalado grub2? (nova entrada de %1) (Entradas novas) E: as modificacións aínda non foron gardadas, actualizar gardará tamén estas. A_pariencia Engadir un script a súa configuración Engadir script Modo BURG Atopouse BURG! Antes de modificar a configuración do «grub» é necesario
montar a partición requirida.

Este asistente axudaralle a facelo.


Asegúrese de que o sistema estea baseado na mesma arquitectura de CPU
que o que se atopa en execución.
De non ser así, obterá unha mensaxe de erro ao tentar cargar a configuración. Gardouse a configuración Non foi posíbel montar a partición seleccionada Non foi posíbel desmontar a partición seleccionada Título predeterminado:  Desexa configurar BURG no canto de grub2? Quere gardar as modificacións? Quere seleccionar outra partición raíz? Editar as preferencias de grub Entrada Entrada %1 (pola posición) Produciuse un erro ao instalar o cargador de arranque Grub Customizer é unha interface gráfica para configurar as preferencias de grub2 e burg Grub Customizer: selector de particións Instale o cargador de arranque no MBR e poña algúns
ficheiros no directorio de datos dos cargadores de arranque
(se non existe xa). Instalar no MBR Produciuse un fallo de montaxe! Montar o sistema de ficheiros seleccionado Mover cara abaixo a entrada ou script seleccionado Mover cara arriba a entrada ou script seleccionado Nomear a entrada Non se atopou o cargador de arranque Non se atopou ningún script Selector de particións Escriba unha cadea de dispositivo! Vista previa: Non se atopa un Proxy binario! Eliminar un script da súa configuración Gardar a configuración e xerar unha nova  Script para inserir: Segundos Seleccionar _partición... Seleccione e monte a súa partición root Seleccione os puntos de montaxe subordinados requiridos O cargador de arranque instalouse correctamente A configuración xerada non é igual á configuración gardada no inicio. Así que o que vemos agora pode non ser o que se verá cando se reinicie a máquina. Para solucionar este problema, prema en actualizar! A configuración gardada non está actualizada! Estes son os puntos de montaxe do ficheiro fstab.
Seleccione todas as particións relacionadas con grub/boot. Esta opción non funciona cando o script «os-prober» atopa outros sistemas operativos. Desactive «%1» se non ten necesidade de arrancar outros sistemas operativos. Isto non parece ser un sistema de ficheiros raíz (non se atopan en fstab) Esgotou o tempo límite Para obter as cores elixidos enriba,
ten que seleccionar unha imaxe de fondo. Desmontar o sistema de ficheiros montado Seleccionou a opción para escoller outra partición.
Atención: «os-prober» podería non atopar o sistema que se está a executar actualmente.
Reinicie Grub Customizer no sistema obxectivo
e garde a configuración (ou execute «update-grub/update-burg»)
para obter novamente a entrada. Iniciou Grub Customizer usando o CD vivo. Poderá ver todas as entradas (non personalizadas) cando execute Grub. Este erro acontece (na maioría dos casos), cando non se instalou  Grub Customizer correctamente. _Avanzado _Dispositivo:  _Editar _Ficheiro _Xeral _Axuda _Instalar no MBR... _Saír sen gardar _Saír sen actualizar _Gardar e saír _Actualizar e saír _Ver _usar outra partición:  fondo imaxe de fondo negro azul marrón non é posíbel mover esta entrada personalizar a resolución  cian gris-escuro entrada predeterminada color da letra xenerar entradas de recuperación verde resaltado: Instalando o cargador de arranque... está activo Parámetros do kernel etiqueta azul-claro cian-claro gris-claro verde-claro maxenta-claro vermello-claro cargando a configuración... buscar outros sistemas operativos maxenta cores do menú nome normal: partición pre_determinado  entrada _iniciada anteriormente vermello volver cargar a configuración retirar fondo configuración amosar menú transparente tipo produciuse un fallo de desmontaxe! actualizando a configuración valor visibilidad branco amarelo 