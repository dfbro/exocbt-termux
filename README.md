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

[Zona Waktu](https://t.me/c/1403650697/21656/56322?single): terdeteksi bahwa zona waktu berada di UTC jadi saat membuat jadwal maka harus dikurang 7 jam

contoh pertama: ada ujian jam 09:13 maka jadwal harus menjadi 02:13

contoh kedua: ada ujian pada tangga 2 april 2025 pada jam 06:30 maka jadwal harus menjadi tanggal 1 april 2025 jam 23:30

## Credit

1. [Shellrean Developer](https://github.com/shellrean-dev)
2. [Termux](https://github.com/termux/termux-app)
