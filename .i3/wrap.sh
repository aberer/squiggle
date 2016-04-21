#! /bin/bash

i3status | while :
           do
               read line
               echo -e  "mystuf | $line " || exit
           done 


[{"name":"path_exists","instance":"/proc/sys/net/ipv4/conf/tun0","color":"#88b090","full_text":"VPN: yes"}
 ,{"name":"wireless","instance":"wlan0","color":"#88b090","full_text":"W: (100% at valinor) 192.168.178.20 {6.5 Mb/s}"}
 ,{"name":"ethernet","instance":"eth0","color":"#e89393","full_text":"E: down"}
 ,{"name":"battery","instance":"/sys/class/power_supply/BAT0/uevent","full_text":"BAT 87.93%"}
 ,{"name":"load","full_text":"0.39 0.17 0.15"}
 ,{"name":"volume","instance":"default.Master.0","color":"#ccdc90","full_text":"♪: muted (67%)"}
 ,{"name":"tztime","full_text":"2015-10-11 10:49"}]
