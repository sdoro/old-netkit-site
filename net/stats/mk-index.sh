#! /bin/sh
# $Id: mk-index.sh,v 1.1 2004/02/24 09:12:37 doros Exp $

cd /var/lib/ntop/rrd/interfaces/eth0
dirs=`find . -type d | grep -v images`
for i in $dirs;
  do
  html=/var/www/rrd/$i/index.html

  echo "<html>" > $html
  echo "<head>" >> $html
  echo "<title>Gestione della infrastruttura tecnologica</title>" >> $html
  echo "<link rel="StyleSheet" href="/net/html/my.css" type="text/css"  media="screen">
" >> $html
  echo "<link rel="StyleSheet" href="/net/html/myp.css" type="text/css"  media="screen">
" >> $html
  echo "</head>" >> $html


  echo "<body>" >> $html
  echo "<h1 class="center">Gestione della infrastruttura tecnologica</h1>" >> $html
  echo "<h2 class="center">Statistiche rrdtool dettagliate per giorno, settimana, mese e anno</h2>" >> $html

  j=`echo $i | cut -c3-`
  echo "Processing $html "

  rrds=`find $i -type f -name '*.rrd' -maxdepth 1 | cut -c2-`
 
  for k in $rrds;
    do
    l=`echo $k | sed 's/.rrd//' | cut -c2-`
    m=`basename $k .rrd`
    if [ -d $l ];
      then
 
      echo "<a HREF=$m/>$m<br>" >> $html
      echo "<img src=$m-day.png border=0>" >> $html
      echo "<img src=$m-week.png border=0>" >> $html
      echo "<img src=$m-month.png border=0>" >> $html
      echo "<img src=$m-year.png border=0>" >> $html
      echo "</a><br>" >> $html

    else
      echo "<h3>$m</h3><br>" >> $html
      echo "<img src=$m-day.png border=0>" >> $html
      echo "<img src=$m-week.png border=0>" >> $html
      echo "<img src=$m-month.png border=0>" >> $html
      echo "<img src=$m-year.png border=0>" >> $html
      echo "<br>" >> $html
    fi
  done
  echo "</body></html>" >> $html
done
