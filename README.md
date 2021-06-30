Credits to https://gist.github.com/jwalanta/53f55d03fcf5265938b64ffd361502d5 i just edit it to my needs

# Install at OpenWRT the following packages
mosquitto-client-ssl
libmosquitto-ssl

# Add the following line in /etc/dnsmasq.conf
dhcp-script=/etc/detect_new_device.sh

# Add at /root/detect_new_device.sh the follow
```
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

if [ "$1" == "add" ]; then

  msg="New device $*"

  mosquitto_pub -h $mqtt_host -p $mqtt_port -t $mqtt_topic -m "$msg"

fi
```
