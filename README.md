# Example

## Grep cam images every 1 second

docker run -d --name download-loop  -v /home/pi/cam:/opt/out -e EXT=jpg -e USER=user -e PASSWD=password -e URL=http://192.168.1.169/tmpfs/auto.jpg -e SLEEP=1  download-loop:latest
