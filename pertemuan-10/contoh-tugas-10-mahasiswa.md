# Panduan Pengerjaan — Tugas 10: Integrasi Data dan Proses Bisnis

Dokumen ini berisi kerangka pengerjaan dan kriteria tugas, bukan contoh jawaban. Tugas dinilai berdasarkan kemampuan Anda menggabungkan data dari beberapa endpoint dan menerapkan proses bisnis pada aplikasi Flutter.

| | |
|:--|:--|
| **Tenggat** | Sebelum Pertemuan 11 |
| **Pengumpulan** | Push ke repository GitHub kelas |
| **Nilai** | Rubrik Tugas 10 pada materi Pertemuan 10 |

## 1. Komponen Tugas

### 1.1 Model Data

Buat minimal dua model Dart yang memiliki:

- field sesuai response API;
- constructor dengan `required` jika diperlukan;
- factory `fromJson`;
- nilai default untuk field yang tidak tersedia;
- identifier yang digunakan untuk menghubungkan data.

### 1.2 Service Integrasi

Buat service yang memiliki minimal dua method request. Service wajib:

- menggunakan package `http`;
- memeriksa HTTP status code;
- menerapkan `try-catch` dan `timeout`;
- mengurai response JSON;
- mengembalikan model Dart, bukan JSON mentah kepada widget.

### 1.3 Penggabungan Data

Gabungkan data dari dua endpoint. Contoh proses:

- endpoint pengguna menyediakan nama pemohon;
- endpoint pengajuan menyediakan `userId`, ruang, dan status;
- service menggabungkan data berdasarkan `userId`;
- halaman menampilkan satu daftar ringkas yang mudah dipahami.

Jika request tidak saling bergantung, gunakan `Future.wait` dan jelaskan alasan penggunaannya pada README.

### 1.4 Halaman Flutter

Halaman wajib membedakan kondisi berikut:

- loading;
- data berhasil dimuat;
- data kosong;
- error request;
- tombol coba lagi.

Logika HTTP dan parsing tidak boleh ditulis langsung di dalam method `build`.

### 1.5 Dokumentasi Integrasi

Buat `README.md` yang memuat:

- endpoint dan metode HTTP yang digunakan;
- tabel pemetaan field JSON ke model Dart;
- identifier yang digunakan untuk menggabungkan data;
- diagram alur request dan response;
- cara menjalankan aplikasi;
- batasan API simulasi.

### 1.6 Refleksi dan Deklarasi AI

Tuliskan refleksi singkat tentang:

1. bagian integrasi data yang paling sulit;
2. cara menangani response kosong atau error;
3. alasan pemisahan service dan widget.

Jika menggunakan AI, tuliskan penggunaannya sesuai ketentuan pada materi.

## 2. Struktur Folder Pengumpulan

```text
tugas-10/<nim>-<nama>/
├── lib/
│   ├── main.dart
│   ├── models/
│   └── services/
├── pubspec.yaml
├── README.md
└── refleksi.md
```

## 3. Pemeriksaan Sebelum Pengumpulan

- [ ] Minimal dua endpoint digunakan.
- [ ] Model memiliki `fromJson`.
- [ ] Data digabungkan berdasarkan identifier.
- [ ] Service terpisah dari widget.
- [ ] Loading, sukses, kosong, dan error ditampilkan.
- [ ] Tombol coba lagi menjalankan request ulang.
- [ ] README menjelaskan pemetaan field dan cara menjalankan.
- [ ] Tidak ada token atau data pribadi pada source code.
- [ ] Aplikasi diuji pada target yang ditentukan dosen.
