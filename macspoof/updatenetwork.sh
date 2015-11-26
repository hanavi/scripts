#!/bin/bash

##########################################################################
# Name: upadatenetwork.sh (updatenetwork.command)
# Author: James Casey
# Version: 0.1
# Date Created: 2015-11-26
# Date Last Modified: 2015-11-26
# Description:  This was designed to set the MAC address on a Macbook Pro
# running El Capitan to a random value.
##########################################################################

# Start with a valid vendor prefix
# Dell and Lenovo from some website...
START=( f8:cf:c5 ec:89:f5 e8:91:20 e4:90:7e e0:2c:b2 d8:71:57 d4:22:3f \
        cc:07:e4 c8:dd:c9 ac:38:70 a4:8c:db a0:32:99 98:ff:d0 88:70:8c \
        84:10:0d 80:cf:41 74:04:2b 70:72:0d 6c:5f:1c 60:d9:a0 60:99:d1 \
        5c:51:88 50:3c:c4 44:80:eb 24:da:9b 20:76:93 1c:56:fe 14:9f:e8 \
        14:36:c6 00:59:07 00:12:fe 00:06:1b f8:db:88 f8:ca:b8 f8:bc:12 \
        f8:b1:56 f0:4d:a2 f0:1f:af ec:f4:bb e0:db:55 d4:be:d9 d4:ae:52 \
        d0:67:e5 d0:43:1e c8:1f:66 bc:30:5b b8:ca:3a b8:ac:6f b8:2a:72 \
        b0:83:fe a4:ba:db a4:1f:72 98:90:96 90:b1:1c 84:8f:69 84:2b:bc \
        84:2b:2b 78:45:c4 78:2b:cb 74:e6:e2 74:86:7a 64:00:6a 5c:f9:dd \
        5c:26:0a 54:9f:35 4c:76:25 44:a8:42 34:e6:d7 34:17:eb 28:c8:25 \
        24:b6:fd 24:6e:96 20:47:47 1c:40:24 18:fb:7b 18:a9:9b 18:03:73 \
        14:fe:b5 14:18:77 10:98:36 00:c0:4f 00:b0:d0 00:26:b9 00:25:bd \
        00:25:64 00:24:e8 00:23:ae 00:22:19 00:21:9b 00:21:70 00:1e:c9 \
        00:1e:4f 00:1d:09 00:1c:23 00:1a:a0 00:19:b9 00:18:8b 00:16:f0 \
        00:15:c5 00:14:22 00:13:72 00:12:3f 00:11:43 00:0f:1f 00:0d:56 \
        00:0b:db 00:08:74 00:06:5b )

# Select prefix at random
n=$(python -c "import random; print(random.randint(0,107))")

# Get a random identifier for the last part of the MAC
END=$(openssl rand -hex 3 | sed 's/\(..\)/\1:/g; s/.$//')

# Join the prefix and the ending to get the new MAC address
NEWMAC="${START[${n}]}:${END}"

echo ""
echo ""
echo "Changing MAC address: ${NEWMAC}"

# Change the MAC address for en0 (This may be different on other machines!)
sudo /sbin/ifconfig en0 ether ${NEWMAC}

# Bring the network down so the changes can go into effect
sudo /sbin/ifconfig en0 down

# Wait a couple seconds before bring the network back up
sleep 2

# Get everything up again... This should also rerun DHCP with the new MAC
sudo /sbin/ifconfig en0 up

# Make sure the changes actually happened
check=$(ifconfig en0 |grep ether |awk '{print $2}')

echo "Verify MAC:           ${check}"
echo ""
echo "----------------------------------------------------------"
echo "NOTE: if the both addresses are not the same, you probably"
echo "need to rerun the script."
echo "----------------------------------------------------------"
echo ""
echo ""

# Give the user a sec to compare the MACs
read -p 'Press Enter to continue...'

