#!/bin/bash

(
while true
do {  echo -ne "HTTP/1.0 200 OK\r\nContent-Length: $( echo "start play" | wc -c)\r\n\r\n"; ./play.sh; } | nc -l -p 8080 ; done
) & 

echo "start second server"
(
while true
do {  echo -ne "HTTP/1.0 200 OK\r\nContent-Length: $( echo "stop play" | wc -c)\r\n\r\n"; ./pause.sh; } | nc -l -p 8081 ; done
)  &

echo "start third server"
(
while true
do {  echo -ne "HTTP/1.0 200 OK\r\nContent-Length: $( echo "skip" | wc -c)\r\n\r\n"; ./next.sh; } | nc -l -p 8082 ; done
)  &

sleep 1

./pause.sh

while true
do
sleep 100
done
