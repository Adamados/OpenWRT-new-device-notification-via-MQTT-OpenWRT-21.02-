#!/bin/sh

# script to detect new dhcp lease

# this will be called by dnsmasq everytime a new device is connected
# with the following arguments
# $1 = add | old
# $2 = mac address
# $3 = ip address
# $4 = device name

mqtt_host=
mqtt_port=
mqtt_topic=
user=
pass=

known_mac_addr="/etc/config/dhcp"

#Convert MAC to uppercase                   
mac=$(echo "$2" | awk '{print toupper($0)}')                                                                                                     

# check if the mac is in known devices list
grep -q "$mac" "$known_mac_addr"                                                                                                                 
unknown_mac_addr=$?                                        

if [ "$1" == "add" ] && [ "$unknown_mac_addr" -ne 0 ]; then

  msg="Unknown device connected: $mac $3 $4"                                                                                                                                          

  echo `date` "LAN" $msg >> /tmp/dhcpmasq.log
# https://mosquitto.org/man/mosquitto_pub-1.html
  mosquitto_pub -h $mqtt_host -p $mqtt_port -u $user -P $pass -t $mqtt_topic -m "$msg"

fi  
