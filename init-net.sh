#!/bin/bash

t="team2"
nku=".hh.nku.edu"
netconfig="/etc/sysconfig/network-scripts/ifcfg-ens33"


if [ "$HOSTNAME" =  s1$t$nku ]
	then
	echo "IPADDR=10.2.7.229" >> $netconfig
	elif [ "$HOSTNAME" =  c1$t$nku ]
	then echo "IPADDR=10.2.7.225" >> $netconfig
	elif [ "$HOSTNAME" =  c2$t$nku ]
        then echo "IPADDR=10.2.7.226" >> $netconfig
	elif [ "$HOSTNAME" =  c3$t$nku ]
        then echo "IPADDR=10.2.7.227" >> $netconfig
	elif [ "$HOSTNAME" =  c4$t$nku ]
        then echo "IPADDR=10.2.7.228" >> $netconfig
fi
sed -i 's~BOOTPROTO=dhcp~BOOTPROTO=static~g' $netconfig
echo "PREFIX=23" >> $netconfig
echo "GATEWAY=10.2.6.1" >> $netconfig
echo "DNS1=10.14.1.10" >> $netconfig
echo "DNS2=10.11.0.51" >> $netconfig
#systemctl restart network
