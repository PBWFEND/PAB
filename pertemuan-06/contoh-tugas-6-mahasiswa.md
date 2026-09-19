# Panduan Pengerjaan — Tugas 6: Navigation Flow dan Interaksi

Dokumen ini membantu Anda memahami **apa yang harus dikerjakan** pada Tugas 6. Dokumen ini berisi **kerangka kerja dan definisi, bukan contoh jawaban**. Tugas 6 dinilai berdasarkan kemampuan Anda menghubungkan layar (Tugas 5) menjadi alur bernavigasi dengan form dan feedback sesuai materi Pertemuan 6.

| | |
|:--|:--|
| **Tenggat** | Sebelum Pertemuan 7 |
| **Pengumpulan** | Push ke repository GitHub kelas |
| **Nilai** | Rubrik Tugas 6 pada materi Pertemuan 6 (Σ bobot = 100%, Nilai = Σ(bobot×skor)/16×100) |

---

## 1. Komponen Tugas

### 1.1 Navigation Flow — `navigation-flow.md`

| Isi | Keterangan |
|:----|:-----------|
| Daftar route | Tabel: nama route, layar, kebutuhan yang dipenuhi (ID dari Tugas 4–5), dan `initialRoute` |
| Diagram alur | Mermaid (`flowchart TD`); mencakup maju, kembali, dan pengiriman data untuk satu tugas *Must have* |
| Alasan `initialRoute` | 1–2 kalimat: `initialRoute` memenuhi kebutuhan Must have yang mana |

> **Yang perlu dihindari:** route tanpa layar IA, dan nama route yang berbeda antara diagram dan kode.

### 1.2 Kode Flutter — `form-interaksi.dart`

Implementasi **alur navigasi** dari navigation flow Anda:

| Wajib ada | Acuan materi |
|:----------|:-------------|
| `MaterialApp` dengan `initialRoute` + peta `routes` | Bagian 4.1 |
| `Navigator.pushNamed` untuk maju; `Navigator.pop` untuk kembali | Bagian 4.2 |
| Arguments dengan pemeriksaan tipe (`is`) dan cabang null | Bagian 5.1 |
| `Form` + `GlobalKey<FormState>`; validator tiap field | Bagian 6.1 |
| Controller dibersihkan pada `dispose` (layar yang memuat form = `StatefulWidget`) | Bagian 6.3 |
| `SnackBar` setelah aksi kirim; pesan validator pada field | Bagian 7 |
| **Tanpa package tambahan** — hanya API bawaan Flutter | Batas cakupan |

Gunakan [`latihan-navigasi-flutter.dart`](../code/pertemuan-06/latihan-navigasi-flutter.dart) sebagai dasar, kemudian sesuaikan dengan domain dan navigation flow Anda — jangan meniru mentah tanpa penyesuaian.

### 1.3 Tangkapan Layar — `screenshot-alur.png` dan `screenshot-feedback.png`

Jalankan alur melalui DartPad atau `flutter run -d chrome`, lalu ambil dua tangkapan layar berikut dan simpan:

- `screenshot-alur.png` — layar detail terbuka dari daftar (bukti arguments terkirim).
- `screenshot-feedback.png` — `SnackBar` tampil setelah kirim (bukti feedback berjalan).

Tangkapan layar adalah bukti bahwa alur berjalan — pastikan seluruh layar terlihat (bukan potongan sebagian).

### 1.4 Catatan Keputusan Navigasi — `catatan-keputusan-navigasi.md`

Tabel keputusan dengan sekurang-kurangnya empat baris:

| Keputusan | Pilihan Anda | Alasan (merujuk IA/kebutuhan) |
|:----------|:-------------|:------------------------------|
| Nama route | [...] | [...] |
| Data antarlayar | [...] | [...] |
| Validator tiap field | [...] | [...] |
| Feedback tiap aksi | [...] | [...] |

### 1.5 Deklarasi Penggunaan AI dan Refleksi

- **Deklarasi penggunaan AI** (bila ada) sesuai format pada [Bagian 12](06-Pertemuan-6.md#12-pemanfaatan-ai-sebagai-coding-assistant).
- **Refleksi** — tepat tiga kalimat: bagian mana yang paling sulit dipertahankan konsistensinya antara navigation flow, kode, dan catatan keputusan, serta mengapa?

## 2. Struktur Folder Pengumpulan

```text
tugas-6/<nim>-<nama>/
├── README.md                        # deskripsi singkat + refleksi + deklarasi AI
├── navigation-flow.md
├── form-interaksi.dart
├── screenshot-alur.png
├── screenshot-feedback.png
└── catatan-keputusan-navigasi.md
```

## 3. Cara Menilai Jawaban Anda Sendiri

Sebelum mengumpulkan, periksa kembali jawaban Anda dengan pertanyaan berikut:

- [ ] Setiap route pada daftar berasal dari satu layar IA Tugas 5?
- [ ] Nama route sama persis antara diagram, peta `routes`, dan pemanggilan `pushNamed`?
- [ ] Setiap layar dalam menyediakan jalan kembali (`pop`)?
- [ ] Arguments diperiksa tipenya dengan cabang null?
- [ ] Setiap field form memiliki validator dan controller dibersihkan pada `dispose`?
- [ ] `SnackBar` tampil setelah aksi kirim dan pesan validator jelas?
- [ ] Dua tangkapan layar tersedia dan terbaca jelas?
- [ ] Refleksi terdiri atas tepat tiga kalimat dan menyebutkan alasan konsistensi?
