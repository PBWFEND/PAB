# Panduan Pengerjaan — Tugas 11: Integrasi Fitur Perangkat

Dokumen ini berisi kerangka pengerjaan dan kriteria tugas, bukan contoh jawaban. Tugas dinilai berdasarkan kemampuan Anda memilih dan menerapkan fitur perangkat sesuai kebutuhan aplikasi.

| | |
|:--|:--|
| **Tenggat** | Sebelum Pertemuan 12 |
| **Pengumpulan** | Push ke repository GitHub kelas |
| **Nilai** | Rubrik Tugas 11 pada materi Pertemuan 11 |

## 1. Komponen Tugas

### 1.1 Analisis Kebutuhan Fitur

Pilih minimal satu fitur perangkat: kamera, lokasi, file, atau notification. Jelaskan:

- aktor yang menggunakan fitur;
- tujuan fitur pada proses bisnis;
- data keluaran fitur;
- permission yang diperlukan;
- target platform yang digunakan;
- konsekuensi ketika permission ditolak atau pengguna membatalkan aksi.

### 1.2 Service Fitur Perangkat

Buat service yang memisahkan package perangkat dari widget. Service harus:

- menyediakan method asynchronous;
- mengembalikan hasil fitur atau nilai `null` ketika aksi dibatalkan;
- membedakan pembatalan dan error;
- tidak menampilkan widget secara langsung.

### 1.3 Halaman Flutter

Halaman wajib menampilkan:

- indikator loading ketika fitur sedang diproses;
- hasil fitur jika berhasil;
- state sebelumnya jika pengguna membatalkan aksi;
- pesan permission atau error yang informatif;
- tombol atau tindakan untuk mencoba kembali.

### 1.4 Dokumentasi Konfigurasi

Buat `README.md` yang memuat:

- dependency pada `pubspec.yaml`;
- konfigurasi permission platform jika diperlukan;
- target verifikasi yang digunakan;
- langkah menjalankan aplikasi;
- batasan pengujian pada target web atau perangkat.

### 1.5 Skenario Pengujian

Dokumentasikan minimal empat skenario:

| Skenario | Expected result | Actual result |
|:---------|:----------------|:--------------|
| Fitur berhasil digunakan |  |  |
| Pengguna membatalkan aksi |  |  |
| Permission ditolak |  |  |
| Package atau perangkat menghasilkan error |  |  |

### 1.6 Refleksi dan Deklarasi AI

Tuliskan alasan teknis pemilihan fitur dan kesulitan konfigurasi yang ditemui. Jika menggunakan AI, tuliskan penggunaannya sesuai ketentuan pada materi.

## 2. Struktur Folder Pengumpulan

```text
tugas-11/<nim>-<nama>/
├── lib/
│   ├── main.dart
│   └── services/
├── pubspec.yaml
├── README.md
└── refleksi.md
```

## 3. Pemeriksaan Sebelum Pengumpulan

- [ ] Fitur perangkat memiliki tujuan yang jelas pada proses bisnis.
- [ ] Dependency tercatat pada `pubspec.yaml`.
- [ ] Permission dijelaskan dan diuji sesuai target platform.
- [ ] Service terpisah dari widget.
- [ ] Loading, berhasil, batal, permission ditolak, dan error ditangani.
- [ ] Skenario pengujian memiliki expected result dan actual result.
- [ ] Tidak ada token atau data pribadi pada source code.
- [ ] README menjelaskan cara menjalankan aplikasi.
