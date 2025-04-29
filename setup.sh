#!/data/data/com.termux/files/usr/bin/bash

clear
## instalasi dependensi
echo "instalasi dependensi"
apt update
apt install -y qemu-user-x86-64 libdw unzip postgresql wget tar gzip netcat-openbsd

clear
## download exo cbt dan inisialisasi folder
echo "Download Ekstraordinary"
wget https://s3.ekstraordinary.com/extraordinarycbt/release-rosetta/4.6.1-linux.zip -O cbt.zip
unzip cbt.zip -d ./cbt
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

clear
## sentuhan terakhir
mkdir -p cbt/tzdata
wget https://github.com/dfbro/exocbt-termux/raw/refs/heads/main/timezone.tar.gz -O tz.tar.gz
tar -xzf tz.tar.gz -C ./cbt/tzdata
rm tz.tar.gz
sed -i 's|^STORAGE_PATH=.*|STORAGE_PATH='"$PWD"'/cbt/storage|' ./cbt/.env
sed -i 's|^SERVER_BEHIND_PROXY=.*|SERVER_BEHIND_PROXY='"true"'|' ./cbt/.env || true
wget https://raw.githubusercontent.com/dfbro/exocbt-termux/refs/heads/main/startexo
chmod +x ./startexo
chmod +x ./cbt/main-amd64
echo "ketik ./startexo lalu enter untuk menjalankan Ekstraordinary CBT"
