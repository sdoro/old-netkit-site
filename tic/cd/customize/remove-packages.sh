#!/bin/sh
# $Id: remove-packages.sh,v 1.11 2007-02-10 16:35:29 doros Exp $

dpkg -P openoffice-de-en ttf-openoffice
rm -rf /opt/*
rm -rf /usr/share/applnk/Office
rm -rf /usr/share/fonts/truetype/openoffice/
#dpkg -P kernel-headers-2.6.11
dpkg -P kde-i18n-tr kde-i18n-pl kde-i18n-fr
dpkg -P kde-i18n-de kde-i18n-nl kde-i18n-ja kde-i18n-es
dpkg -P gimp gimp-data gimp-print
dpkg -P winetools wine
dpkg -P xbattle xgalaga
rm -f /var/games/*
dpkg -P gtans ksokoban
dpkg -P manpages-de imaze xskat ktuberling
dpkg -P freeglut3 mesa-utils
dpkg -P libkdegames1 kbattleship kmahjongg kreversi katomic
dpkg -P ace-of-penguins gnuchess
dpkg -P xfonts-bolkhov-cp1251-75dpi xfonts-bolkhov-cp1251-misc
dpkg -P libsane sane sane-utils libkscan1 kooka xsane libsane-extras
rm -rf /etc/sane.d
dpkg -P fb-music-low frozen-bubble
dpkg -P alevt audacity bonnie++ brltty
rm -rf /etc/brltty
dpkg -P efax kfax
dpkg -P gocr 
dpkg -P gphoto2 libgphoto2-2 libgphoto2-port0 kamera gtkam
dpkg -P kismet
dpkg -P aalib-bin aalib1 xaos bb
dpkg -P gqcam
dpkg -P fortune-mod fortunes-min
dpkg -P kteatime xboard xawtv xawtv-plugins \
        scribus knode radio  scantv pia configure-xawtv
dpkg -P icewm
dpkg -P doc-base 

# new
dpkg -P frozen-bubble-data
#??dpkg --force-all -P sun-java5-demo
dpkg -P ksudoku
dpkg -P info

# nessus
dpkg -P libnessus2 nessus nessus-plugins nessusd startnessus-knoppix libnasl2


# rm -rf usr/share/cups/doc-root
# bot
