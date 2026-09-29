# Panduan Pengerjaan — Tugas 9: Implementasi Konsumsi REST API

Dokumen ini membantu Anda memahami **apa yang harus dikerjakan** pada Tugas 9. Dokumen ini berisi **kerangka kerja dan definisi, bukan contoh jawaban**. Tugas 9 dinilai berdasarkan kemampuan Anda mengonsumsi REST API dan menangani kondisi antarmuka sesuai materi Pertemuan 9.

| | |
|:--|:--|
| **Tenggat** | Sebelum Pertemuan 10 |
| **Pengumpulan** | Push ke repository GitHub kelas |
| **Nilai** | Rubrik Tugas 9 pada materi Pertemuan 9 (Σ bobot = 100%, Nilai = Σ(bobot×skor)/16×100) |

---

## 1. Komponen Tugas

### 1.1 Service API — `service-api.dart`

Implementasi **lapisan service** yang mengisolasi seluruh interaksi HTTP:

| Wajib ada | Acuan materi |
|:----------|:-------------|
| Model data dengan field, konstruktor, dan factory `fromJson` | Bagian 7.1 |
| Method `GET` untuk mengambil daftar data dari endpoint | Bagian 6.3 |
| Method `POST` untuk mengirim data baru ke endpoint | Bagian 6.4 |
| Header `Content-Type: application/json` pada `POST` | Bagian 6.4 |
| `try-catch`, penanganan status code, dan `timeout` | Bagian 8.4 |
| Class service terpisah dari widget antarmuka | Bagian 9 |

> **Yang perlu dihindari:** menulis kode `http.get` atau `http.post` langsung di dalam method `build` widget. Logika jaringan wajib berada pada class service tersendiri.

### 1.2 Antarmuka Pengguna — `halaman-api.dart`

Implementasi halaman yang mengonsumsi service dan menangani tiga kondisi:

| Wajib ada | Acuan materi |
|:----------|:-------------|
| Halaman daftar yang memanggil method `GET` dari service | Bagian 8.3 |
| Indikator loading saat data sedang diambil | Bagian 8.1 |
| Tampilan data sukses dengan `ListView.builder` | Bagian 8.3 |
| Pesan error informatif saat kegagalan terjadi | Bagian 8.4 |
| Tombol "Coba Lagi" (*retry*) saat kondisi error | Bagian 8.3 |
| Form sederhana yang memanggil method `POST` | Bagian 6.4 |
| Tombol kirim dinonaktifkan selama proses pengiriman | Bagian 10 |

Gunakan [`latihan-rest-api-flutter.dart`](../code/pertemuan-09/latihan-rest-api-flutter.dart) sebagai dasar pola, kemudian sesuaikan dengan domain dan model data project Anda.

### 1.3 Tangkapan Layar Bukti Eksekusi

Jalankan aplikasi melalui DartPad atau `flutter run -d chrome`, lalu ambil tiga tangkapan layar berikut:

| File | Kondisi yang Ditangkap | Cara Memicu |
|:-----|:-----------------------|:------------|
| `screenshot-loading.png` | Indikator loading aktif | Tangkap layar saat aplikasi baru dibuka dan data sedang dimuat |
| `screenshot-sukses.png` | Data berhasil dimuat dan tampil | Tunggu hingga daftar data muncul, lalu tangkap layar |
| `screenshot-error.png` | Pesan error tampil | Ubah URL endpoint menjadi salah (mis. tambahkan karakter acak), jalankan ulang, tangkap layar pesan error |

### 1.4 Catatan Teknis — `catatan-integrasi-api.md`

Dokumen catatan dengan sekurang-kurangnya struktur berikut:

```markdown
# Catatan Integrasi API — Tugas 9

## 1. Endpoint yang Digunakan

| Operasi | Metode HTTP | URL Endpoint | Payload Request |
|:--------|:-----------|:-------------|:----------------|
| Ambil daftar | GET | https://... | — |
| Kirim data baru | POST | https://... | {"field": "nilai"} |

## 2. Struktur Model Data

| Field | Tipe Dart | Key JSON | Sumber Nilai |
|:------|:----------|:---------|:-------------|
| id | int | "id" | Server |
| ... | ... | ... | ... |

## 3. Penanganan Error

[Jelaskan strategi try-catch, timeout, dan pesan error yang ditampilkan kepada pengguna.]
```

### 1.5 Deklarasi Penggunaan AI dan Refleksi

- **Deklarasi penggunaan AI** (bila ada) sesuai format pada [Bagian 13](09-Pertemuan-9.md#13-pemanfaatan-ai-sebagai-coding-assistant).
- **Refleksi** — tepat tiga kalimat: bagian mana yang paling sulit dipahami antara asynchronous programming, parsing JSON, dan penanganan error — serta mengapa?

---

## 2. Struktur Folder Pengumpulan

```text
tugas-9/<nim>-<nama>/
├── README.md                        # identitas, refleksi 3 kalimat, deklarasi AI
├── service-api.dart
├── halaman-api.dart
├── screenshot-loading.png
├── screenshot-sukses.png
├── screenshot-error.png
└── catatan-integrasi-api.md
```

---

## 3. Cara Menilai Jawaban Anda Sendiri

Sebelum mengumpulkan, periksa kembali jawaban Anda dengan daftar berikut:

- [ ] Model data memiliki factory `fromJson` dengan penanganan null (`??`)?
- [ ] Class service terpisah dari widget dan memiliki method `GET` serta `POST`?
- [ ] Header `Content-Type: application/json` disertakan pada `POST`?
- [ ] `try-catch` dan `timeout` diterapkan pada setiap pemanggilan HTTP?
- [ ] Antarmuka menangani tiga kondisi: loading, sukses, dan error?
- [ ] Tombol "Coba Lagi" tersedia saat kondisi error?
- [ ] Tombol kirim dinonaktifkan selama proses pengiriman data?
- [ ] Tiga tangkapan layar tersedia dan terbaca jelas?
- [ ] Catatan teknis berisi tabel endpoint dan struktur model data?
- [ ] Refleksi terdiri atas tepat tiga kalimat dan menyebutkan bagian yang sulit?
