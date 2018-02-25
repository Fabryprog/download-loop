#!/bin/sh
#
# EXT
# USER
# PASSWD
# URL
# SLEEP

mkdir -p /opt/out

while true; do
	d=/opt/out/$(date +%F)/$(date +%H)
	mkdir -p $d
	wget --output-document=$d/$(date +%F_+%T).$EXT --user=$USER --password=$PASSWD $URL 

	sleep $SLEEP;
done
