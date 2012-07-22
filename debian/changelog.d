#!/bin/sh
cat << EOF
grub-customizer (2.0.6-0ubuntu1~ppa2$1) $2; urgency=medium

   * Brasilian translation updated (now complete)

 -- Daniel Richter <danielrichter2007@web.de>  Wed, 08 Dec 2010 20:45:42 +0100

grub-customizer (2.0.6-0ubuntu1~ppa1$1) $2; urgency=medium

   * first upstream release (LP: #684977)
   * lintian and compiler warnings removed
   * manpage created
   * using su-to-root instead of gksu in the menu entry

 -- Daniel Richter <danielrichter2007@web.de>  Wed, 08 Dec 2010 20:45:42 +0100

grub-customizer (2.0.5-0ubuntu1~ppa1$1) $2; urgency=medium

   * translations updated

 -- Daniel Richter <danielrichter2007@web.de>  Tue, 30 Nov 2010 18:44:45 +0100

grub-customizer (2.0.4-0ubuntu1~ppa1$1) $2; urgency=medium

   * chineese translation added, frensh and turkish translation updated
   * fixed: timeout not settable when "show menu" not selected
   * renamed "black" to "transparent" in background selection

 -- Daniel Richter <danielrichter2007@web.de>  Sun, 28 Nov 2010 21:17:47 +0100

grub-customizer (2.0.3-0ubuntu1~ppa1$1) $2; urgency=medium

   * fixed: crash when choosing an img which can not be displayed by gtk
   * polish translation updated

 -- Daniel Richter <danielrichter2007@web.de>  Tue, 23 Nov 2010 21:04:34 +0100

grub-customizer (2.0.2-0ubuntu1~ppa1$1) $2; urgency=medium

   * translations (Greek and Ukrainian) updated

 -- Daniel Richter <danielrichter2007@web.de>  Mon, 22 Nov 2010 21:44:56 +0100

grub-customizer (2.0.1-0ubuntu1~ppa1$1) $2; urgency=medium

   * Bulgarian and Turkish translation updated
   * some partition chooser bugfixes

 -- Daniel Richter <danielrichter2007@web.de>  Mon, 22 Nov 2010 00:01:43 +0100

grub-customizer (2.0-0ubuntu1~ppa1$1) $2; urgency=medium

   * settings manager included

 -- Daniel Richter <danielrichter2007@web.de>  Sun, 21 Nov 2010 17:42:31 +0100

grub-customizer (1.6.4-0ubuntu1~ppa1$1) $2; urgency=low

   * translations updated

 -- Daniel Richter <danielrichter2007@web.de>  Tue, 16 Nov 2010 20:22:00 +0200

grub-customizer (1.6.3-0ubuntu1~ppa1$1) $2; urgency=low

   * translations updated

 -- Daniel Richter <danielrichter2007@web.de>  Sat, 06 Nov 2010 09:00:00 +0200

grub-customizer (1.6.2-0ubuntu1~ppa1$1) $2; urgency=low

   * greek translation updated
   * translators added to the about dialog

 -- Daniel Richter <danielrichter2007@web.de>  Sat, 22 Oct 2010 11:43:00 +0200

grub-customizer (1.6.1-0ubuntu1~ppa1$1) $2; urgency=medium

   * fixed burg mode indentfier (has not been updated)
   * translations included

 -- Daniel Richter <danielrichter2007@web.de>  Sat, 22 Oct 2010 11:43:00 +0200

grub-customizer (1.6-0-0ubuntu1~ppa1$1) $2; urgency=medium
 
   * bug #661304 fixed (multiple scripts using the same basename will not be overwritten anymore)
   * (new entries) will be displayed on uncustomized scripts too (the old behaviour was to fuzzy)
   * the test, if a script requires a proxy, is now solved dynamically (the previous behaviour was: when it's modified, set proxy_required)
   * the live cd setup assistant is now (renamed to partition chooser) accessible after loading (by menubutton click) or if no bootloader found too
   * the toolbar button for saving the configuration is now marked as is_important (will be displayed larger in most cases)
 
 -- Daniel Richter <danielrichter2007@web.de>  Sat, 22 Oct 2010 11:43:00 +0200

EOF