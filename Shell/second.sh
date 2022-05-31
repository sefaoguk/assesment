#!/bin/bash

# Dosyanın crontabda ve tüm dizinlerde çalıştırılabilmesi için aşağıdaki yöntem kullanılmıştır.
FOLDER=$(dirname "$(readlink -f "$0")")


# firs.sh dosyasını sürekli kontrol etmek için while döngüsü kullanılmıştır.
while :
do

	# wc -l komutu sayesinde hello.txt içerisindeki satır sayısı baz alınarak kaç adet Hello World olduğu belirlenmesi amaçlanmıştır.
	textCount=$(wc -l < $FOLDER/hello.txt)
	# first.sh dosyası çalıştığında, çalışan processi kırabilmek için ID'si bir değişkende tutulmuştur.
	killFile=$(pgrep first.sh)
	# While döngüsünün sürekli çalışmaması için 2 saniyelik sleep özelliğini ekledim -arkaplanda çalıştırılmadan processin gidişatını izlemek için tercihen eklendi.-
	sleep 2
	echo 'TEXT COUNT : ' $textCount ' && KILL FILE : ' $killFile

	# hello.txt dosyasının içerisinde 10dan fazla varsa aşağıdaki işlemlerin yapılması için if bloğu yerleştirildi.
	if [ $textCount -ge 10 ]
	then
	# first.sh dosyası çalışırken tutulan process ID'inin kill komutu ile kırılması
	kill $killFile
	# hello.txt dosyasının silinmesi
	rm -r $FOLDER/hello.txt
	# hello.txt dosyasının yeniden oluşturulması
	touch $FOLDER/hello.txt
	# first.sh dosyasının arkaplanda çalışması için gerekli parametre ile çalışması
	$FOLDER/first.sh &
	fi

done



