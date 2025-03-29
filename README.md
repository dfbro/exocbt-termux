# Ekstraordinary CBT di Termux
Instalasi Ekstraordinary CBT di termux tanpa VPS

## Instalasi

1. Update, dan install cURL:

```
apt update && apt install curl -y
```

2. Simpel, hanya perlu:

```
curl -s https://raw.githubusercontent.com/dfbro/exocbt-termux/refs/heads/main/setup.sh | bash
```

## Bug

Bug ini adalah zona waktu, terdeteksi bahws zona waktu berada di UTC jadi saat membuat jadwal maka harus dikurang 7 jam

contoh: ada ujian jam 09:00 maka di jadwal harus menjadi 02:00


## Credit

1. [Shellrean Developer](https://github.com/shellrean-dev)
2. [Termux](https://github.com/termux/termux-app)
