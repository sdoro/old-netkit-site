#!/bin/sh
# $Id: mk.sh,v 1.1 2005/12/08 21:25:49 doros Exp $

PROFDATA=/mnt/profdata
SHARES="Dati;applicazioni;Desktop;Documenti;Menu Avvio;Cookies;Impostazioni locali;Recent"

makedir () {
  IFS=";"
  # per user structure
  cd $1
  mkdir -p $2
  for i in $SHARES
  do
    mkdir $2/$i
  done
  chown -R $2:Domain\ Users $2
  chmod -R 750 $2
}

mkdir -p $PROFDATA
chown root:root $PROFDATA
chmod 755 $PROFDATA

makedir $PROFDATA utest

# bot
