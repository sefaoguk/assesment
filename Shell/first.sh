#!/bin/bash



nohup ./first.sh >/dev/null 2>&1

while :
do
echo $(date +%S)
sleep 10
echo "Hello World ! " >> hello.txt
echo "Ekleme Başarılı !"

done


