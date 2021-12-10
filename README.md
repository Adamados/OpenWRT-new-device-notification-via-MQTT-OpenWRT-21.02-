Credits to https://gist.github.com/jwalanta/53f55d03fcf5265938b64ffd361502d5 i just edit it to my needs

# Install at OpenWRT the following packages
mosquitto-client-ssl

libmosquitto-ssl

# Add the following line in /etc/dnsmasq.conf
dhcp-script=/root/detect_new_device.sh

# Add at /root/detect_new_device.sh the script
And give Execute permissions
