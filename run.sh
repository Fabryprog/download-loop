#!/bin/sh
#
# EXT
# USER
# PASSWD
# URL
# SLEEP

mkdir -p /opt/out
previous=''
level=4.0

while true; do
	d=/opt/out/$(date +%F)/$(date +%H)
	mkdir -p $d
	current=$(date +%F_+%T).$EXT
	wget --output-document=/tmp/$current --user=$USER --password=$PASSWD $URL
	if [ -z "$previous" ]; then
		mv /tmp/$current $d/$current
    previous=$d/$current
	else
		comparison=$(python3 scrypt.py $previous /tmp/$current $level)

		#echo "Differences (%): $perc - $level"
    echo "Comparison: $comparison"

    if [ "$comparison" = "True" ]; then
      echo "Saving new image! /tmp/$current -> $d/$current"

			mv /tmp/$current $d/$current
	    previous=$d/$current
	  else
			echo "Image discarded!"
		fi
  fi

	sleep $SLEEP;
done
