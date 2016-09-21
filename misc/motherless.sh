#!/bin/bash

DLIST=$(curl ${1} | grep _self |awk '{print $2}' | awk 'BEGIN{FS="/"}{print $4}'|sed 's/"//g')

for name in $DLIST
do
  curl http://cdn4.videos.motherlessmedia.com/videos/${name}.mp4 > ${name}.mp4
done
