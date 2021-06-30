#!/bin/sh

# this will be called by dnsmasq everytime a new device is connected with the following arguments
# $1 = add | old
# $2 = mac address
# $3 = ip address
# $4 = device name

mqtt_host=
mqtt_port=
mqtt_topic=

if [ "$1" == "add" ]; then

  msg="New device $*"

  mosquitto_pub -h $mqtt_host -p $mqtt_port -t $mqtt_topic -m "$msg"

fi
