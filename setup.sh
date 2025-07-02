#!/data/data/com.termux/files/usr/bin/bash

clear
## instalasi dependensi
echo "instalasi dependensi"
apt update
apt install -y proot proot-distro qemu-user-x86-64 libdw unzip postgresql wget tar gzip netcat-openbsd


clear
## download exo cbt dan inisialisasi folder
echo "Download Ekstraordinary"
wget https://s3.ekstraordinary.com/extraordinarycbt/release-rosetta/4.6.2-linux.zip -O cbt.zip
mkdir cbt
unzip cbt.zip -d ./cbt | tee ./cbt/.unzip.log
rm cbt.zip

clear
## inisialisasi postgresql
echo "Inisialisasi Database"
mkdir -p ./cbt/database
initdb ./cbt/database
echo "host all postgres 0.0.0.0/0 md5" >> ./cbt/database/pg_hba.conf
pg_ctl -D ./cbt/database -l ./cbt/database.log start
createuser -s postgres
psql -U postgres -c "ALTER USER postgres WITH PASSWORD 'postgres';"
psql -U postgres -c "CREATE DATABASE exo;"
sql=$(ls ./cbt/exo*sql 2>/dev/null | head -n 1)
psql -U postgres -d exo -f "$sql"
pg_ctl -D ./cbt/database stop

## install tzdata
clear
pd install --override-alias tzdata alpine
pd login tzdata --isolated -- apk add --update tzdata

clear
## sentuhan terakhir
sed -i 's|^STORAGE_PATH=.*|STORAGE_PATH='"$PWD"'/cbt/storage|' ./cbt/.env
sed -i 's|^SERVER_BEHIND_PROXY=.*|SERVER_BEHIND_PROXY='"true"'|' ./cbt/.env || true
wget https://raw.githubusercontent.com/dfbro/exocbt-termux/refs/heads/main/startexo
chmod +x ./startexo
echo "ketik ./startexo lalu enter untuk menjalankan Ekstraordinary CBT"
