#!/bin/bash
file=/home/james/Dropbox/ip_dat/$(date -u +%Y_%m_%d)
ip=$(/home/james/remote/prog/github/scripts/bin/getip)
echo $ip > $file

