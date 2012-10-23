#! /bin/sh
# $Id: update.sh,v 1.1 2004/02/24 09:12:22 doros Exp $

cd /var/lib/ntop/rrd/interfaces/eth0
rrds=`find . -type f -name '*.rrd' | cut -c3-`

for i in $rrds;
  do
  j=`echo $i | sed 's/.rrd//'`
  rrdtool graph /var/www/rrd/$j-day.png \
          --start -86400 -e -300 \
          DEF:cnt=$i:counter:AVERAGE \
          CDEF:f=cnt \
          AREA:f#00dd00 \
          GPRINT:f:MAX:'%7.2lf %sB/s' \
          GPRINT:f:AVERAGE:'%7.2lf %sB/s' \
          GPRINT:f:LAST:'%7.2lf %sB/s'
          

  rrdtool graph /var/www/rrd/$j-week.png \
          --start -604800 -e -1800 \
          DEF:cnt=$i:counter:AVERAGE \
          CDEF:f=cnt \
          AREA:f#00dd00 \
          GPRINT:f:MAX:'%7.2lf %sB/s' \
          GPRINT:f:AVERAGE:'%7.2lf %sB/s' \
          GPRINT:f:LAST:'%7.2lf %sB/s'

  rrdtool graph /var/www/rrd/$j-month.png \
          --start -2592000 -e -7200 \
          DEF:cnt=$i:counter:AVERAGE \
          CDEF:f=cnt \
          AREA:f#00dd00 \
          GPRINT:f:MAX:'%7.2lf %sB/s' \
          GPRINT:f:AVERAGE:'%7.2lf %sB/s' \
          GPRINT:f:LAST:'%7.2lf %sB/s'

  rrdtool graph /var/www/rrd/$j-year.png \
          --start -31536000 -e -86400 \
          DEF:cnt=$i:counter:AVERAGE \
          CDEF:f=cnt \
          AREA:f#00dd00 \
          GPRINT:f:MAX:'%7.2lf %sB/s' \
          GPRINT:f:AVERAGE:'%7.2lf %sB/s' \
          GPRINT:f:LAST:'%7.2lf %sB/s'
done
