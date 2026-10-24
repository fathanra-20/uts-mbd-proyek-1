# UTS Manajemen Basis Data: PostgreSQL dengan Docker

- **Nama:** Fathan Rafif Athaya
- **NIM:** 1247050044
- **Prodi:** Informatika, UIN Sunan Gunung Djati Bandung

Proyek ini menjalankan PostgreSQL 15 dan pgAdmin 4 memakai Docker Compose, lalu membuat schema `SALAM`, tabel dengan constraint, dan role dengan hak akses berbeda.

## Struktur Proyek

```
.
├── docker-compose.yml   # Service PostgreSQL dan pgAdmin
├── .env.example         # Contoh konfigurasi (tanpa password asli)
├── .gitignore           # Mengabaikan .env
├── sql/
│   ├── 01_schema.sql    # Schema SALAM, tabel, data, view
│   └── 02_roles.sql     # Role dan hak akses
└── README.md
```

## Konfigurasi

| Komponen | Nilai |
|---|---|
| PostgreSQL | versi 15, container `postgres_FathanRafifAthaya`, port eksternal `22044` |
| pgAdmin 4 | container `pgadmin_FathanRafifAthaya`, port eksternal `44044` |
| Database | `uts_db` |

## Cara Menjalankan

1. Salin `.env.example` menjadi `.env`, lalu isi password sendiri:

   ```bash
   cp .env.example .env
   ```

2. Jalankan container:

   ```bash
   docker compose up -d
   docker compose ps
   ```

3. Akses layanan:
   - pgAdmin: http://localhost:44044 (host server di pgAdmin: `postgres`, port `5432`)

4. Jalankan script SQL sebagai user `postgres` pada database `uts_db`, berurutan:
   1. `sql/01_schema.sql`
   2. `sql/02_roles.sql` (ganti password placeholder terlebih dahulu)

## Isi Database

- **Schema `SALAM`** berisi tabel `mahasiswas` dengan constraint PRIMARY KEY, UNIQUE (`nim`, `email`), NOT NULL, dan CHECK (`ipk` antara 0 dan 4).
- **View `v_mahasiswas_ringkas`** mengelompokkan mahasiswa menjadi kategori Istimewa (IPK >= 3.50) atau Reguler.

## Role dan Hak Akses

| Role | Hak akses |
|---|---|
| `backend_dev` | SELECT, INSERT, UPDATE, DELETE |
| `bi_dev` | SELECT saja |
| `data_engineer` | Mengelola objek (CREATE, ALTER, DROP), owner schema `SALAM` |

## Catatan

File `.env` berisi kredensial dan tidak di-commit ke repository.
