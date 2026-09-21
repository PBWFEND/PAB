# Panduan Pengerjaan — Tugas 7: MVP Awal dengan Data Lokal

Dokumen ini membantu Anda memahami **apa yang harus dikerjakan** pada Tugas 7. Dokumen ini berisi **kerangka kerja dan definisi, bukan contoh jawaban**. Tugas 7 dinilai berdasarkan kemampuan Anda menyusun model data dan mengelola data lokal (CRUD) sesuai materi Pertemuan 7.

| | |
|:--|:--|
| **Tenggat** | Sebelum Pertemuan 8 (UTS) |
| **Pengumpulan** | Push ke repository GitHub kelas |
| **Nilai** | Rubrik Tugas 7 pada materi Pertemuan 7 (Σ bobot = 100%, Nilai = Σ(bobot×skor)/16×100) |

---

## 1. Komponen Tugas

### 1.1 Model Data — `model-data.md`

| Isi | Keterangan |
|:----|:-----------|
| Daftar entitas | Tabel: entitas, field, tipe data, kebutuhan yang dipenuhi (ID dari Tugas 4) |
| Sumber nilai | Penjelasan singkat dari mana setiap field berasal: form, sistem, atau perhitungan |

> **Yang perlu dihindari:** field tanpa kebutuhan, dan entitas yang tidak memiliki hubungan dengan dokumen kebutuhan Tugas 4.

### 1.2 Kode Flutter — `crud-lokal.dart`

Implementasi **CRUD lokal** dari model data Anda:

| Wajib ada | Acuan materi |
|:----------|:-------------|
| Model data: class, field `final`, konstruktor `required`, `toString` | Bagian 4 |
| Layar daftar sebagai `StatefulWidget`; data pada `State` | Bagian 5.1 |
| `setState` pada setiap aksi yang mengubah data | Bagian 5.2 |
| Create: tambah dari form dengan `setState` | Bagian 6.1 |
| Read: `ListView.builder` membaca state | Bagian 6.2 |
| Update: penggantian objek dengan `indexWhere` | Bagian 6.3 |
| Delete: `removeWhere` dengan `id` + konfirmasi `AlertDialog` | Bagian 6.4 |
| `id` unik sebagai kunci operasi update dan delete | Bagian 6.5 |
| **Tanpa package tambahan** — hanya API bawaan Flutter (persistensi opsional) | Batas cakupan |

Gunakan [`latihan-data-lokal-flutter.dart`](../code/pertemuan-07/latihan-data-lokal-flutter.dart) sebagai dasar, kemudian sesuaikan dengan domain dan model data Anda — jangan meniru mentah tanpa penyesuaian.

### 1.3 Tangkapan Layar — `screenshot-daftar.png` dan `screenshot-hapus.png`

Jalankan CRUD melalui DartPad atau `flutter run -d chrome`, lalu ambil dua tangkapan layar berikut dan simpan:

- `screenshot-daftar.png` — daftar berisi data hasil tambah (bukti Create dan Read berjalan).
- `screenshot-hapus.png` — dialog konfirmasi hapus tampil (bukti Delete berjalan).

Tangkapan layar adalah bukti bahwa CRUD berjalan — pastikan seluruh layar terlihat (bukan potongan sebagian).

### 1.4 Catatan Keputusan Data — `catatan-keputusan-data.md`

Tabel keputusan dengan sekurang-kurangnya empat baris:

| Keputusan | Pilihan Anda | Alasan (merujuk kebutuhan) |
|:----------|:-------------|:---------------------------|
| Field model | [...] | [...] |
| Kunci data (`id`) | [...] | [...] |
| Operasi CRUD per kebutuhan | [...] | [...] |
| Keputusan persistensi | [...] | [...] |

### 1.5 Deklarasi Penggunaan AI dan Refleksi

- **Deklarasi penggunaan AI** (bila ada) sesuai format pada [Bagian 12](07-Pertemuan-7.md#12-pemanfaatan-ai-sebagai-coding-assistant).
- **Refleksi** — tepat tiga kalimat: bagian mana yang paling sulit dipertahankan konsistensinya antara model data, CRUD, dan kebutuhan, serta mengapa?

## 2. Struktur Folder Pengumpulan

```text
tugas-7/<nim>-<nama>/
├── README.md                        # deskripsi singkat + refleksi + deklarasi AI
├── model-data.md
├── crud-lokal.dart
├── screenshot-daftar.png
├── screenshot-hapus.png
└── catatan-keputusan-data.md
```

## 3. Cara Menilai Jawaban Anda Sendiri

Sebelum mengumpulkan, periksa kembali jawaban Anda dengan pertanyaan berikut:

- [ ] Setiap field model berasal dari kebutuhan Tugas 4 dan memiliki sumber nilai?
- [ ] Layar daftar adalah `StatefulWidget` dan data disimpan pada `State`?
- [ ] Setiap aksi yang mengubah data dibungkus `setState`?
- [ ] Create, Read, Update, Delete semuanya berjalan dari antarmuka pengguna?
- [ ] `id` unik digunakan sebagai kunci update dan delete, bukan index daftar?
- [ ] Hapus data menampilkan konfirmasi `AlertDialog` sebelum dihapus?
- [ ] Dua tangkapan layar tersedia dan terbaca jelas?
- [ ] Refleksi terdiri atas tepat tiga kalimat dan menyebutkan alasan konsistensi?