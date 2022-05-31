#!/bin/bash

# Dosyanın crontabda ve tüm dizinlerde çalıştırılabilmesi için aşağıdaki yöntem kullanılmıştır .
FOLDER=$(dirname "$(readlink -f "$0")")

# İstenilen; her 10 saniyede 1 durmaksızın hello.txt dosyasına 'Hello world' yazmak için while döngüsü kullanılmıştır. '
while :
do
# 10 saniye bekletmek için sleep methodu kullanılmıştır.
sleep 10
# echo'nun append  >> özelliği ile istenilen değeri istenilen dosyaya aktarılmıştır.
echo "Hello World ! " >> $FOLDER/hello.txt
done

