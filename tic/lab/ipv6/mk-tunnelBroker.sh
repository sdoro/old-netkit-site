tunctl -u doro
ifconfig tap0 hw ether 0:0:0:f:f:f
ifconfig tap0 0.0.0.0 up
/etc/init.d/tspc start
