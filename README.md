# Ekstraordinary CBT 4 Rosetta di Termux
Instalasi [Ekstraordinary CBT](https://ekstraordinary.com/) di termux tanpa VPS

## PERINGATAN

Dianjurkan untuk download [Termux dari F-Droid](https://f-droid.org/en/packages/com.termux/) ataupun [Termux dari rilis GitHub](https://github.com/termux/termux-app/releases) dan bukan dari Google Playstore

## Instalasi

1. Update, dan install cURL:

```
apt update && apt install curl -y
```

2. Simpel, hanya perlu:

```
curl -s https://raw.githubusercontent.com/dfbro/exocbt-termux/refs/heads/main/setup.sh | bash
```

## Menjalankan

Setelah instalasi, Ekstraordinary CBT dapat dijalankan dengan menyalakan hotspot, lalu ketik:

```
./startexo
```

## Upgrade

dari 4.6.1 -> 4.6.2


```
curl -s https://raw.githubusercontent.com/dfbro/exocbt-termux/refs/heads/main/upgrade | bash
```

## Credit

1. [Shellrean Developer](https://github.com/shellrean-dev)
2. [Termux](https://github.com/termux/termux-app)
