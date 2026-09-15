# Panduan Pengerjaan — Tugas 2: Modul Hitung Nilai

Dokumen ini membantu Anda memahami **apa yang harus dikerjakan** pada Tugas 2. Perhatikan bahwa dokumen ini berisi **kerangka kerja dan definisi, bukan contoh jawaban**. Tugas 2 dinilai berdasarkan kemampuan Anda menerapkan sintaks dasar Dart dari materi pertemuan 2.

| | |
|:--|:--|
| **Tenggat** | Sebelum Pertemuan 3 |
| **Pengumpulan** | Push ke repository GitHub kelas |
| **Nilai** | Rubrik Tugas 2 pada materi pertemuan 2 (Σ bobot = 100%, Nilai = Σ(bobot×skor)/16×100) |

---

## 1. Kelima Komponen Tugas

### 1.1 Struktur Data: `List<Map<String, Object>>`

Simpan daftar komponen penilaian dalam bentuk `List` yang berisi `Map`:

```dart
final komponen = [
  {'nama': 'Tugas', 'bobot': 30, 'skor': 28},
  {'nama': 'Praktikum', 'bobot': 25, 'skor': 24},
  // tambahkan minimal 3 komponen lagi
];
```

| Aspek | Yang diharapkan |
|:------|:----------------|
| Jumlah | Minimal **5** komponen |
| Kunci Map | Setiap Map memakai kunci yang konsisten: `nama`, `bobot`, `skor` |
| Tipe | `nama` = `String`, `bobot` = `int`, `skor` = `int` (skor maksimal = bobot) |

### 1.2 Fungsi `hitungRataRata`

Tuliskan fungsi:

```dart
double hitungRataRata(List<Map<String, Object>> komponen) {
  // jumlahkan seluruh skor, bagi dengan jumlah komponen
}
```

| Aspek | Yang diharapkan |
|:------|:----------------|
| Parameter | Exact sesuai tanda fungsi di atas |
| Return type | `double`, bukan `int` |
| Perhitungan | Skor rata-rata = jumlah seluruh skor / jumlah komponen |

### 1.3 Fungsi `predikat`

Tuliskan fungsi `predikat(double nilai)` yang mengembalikan `String`. **Tentukan aturan rentang Anda sendiri** dan dokumentasikan di komentar di atas fungsi, contoh:

```dart
// Aturan predikat:
// >= 86 -> A
// 76 - 85 -> B
// 61 - 75 -> C
// < 61 -> Perlu perbaikan
String predikat(double nilai) {
  // ...
}
```

| Aspek | Yang diharapkan |
|:------|:----------------|
| Cakupan rentang | Tidak ada nilai yang tidak tercakup oleh cabang mana pun |
| Dokumentasi | Aturan rentang tertulis di komentar fungsi |

### 1.4 Blok `main()`

Blok `main()` menampilkan:

1. Nama mata kuliah (mis. "Pemrograman Aplikasi Bergerak").
2. Daftar komponen: nama, bobot, skor (satu baris per komponen).
3. Rata-rata skor seluruh komponen.
4. Predikat akhir berdasarkan rata-rata.

### 1.5 Refleksi (3 kalimat)

Jawab dalam **tepat 3 kalimat**: sintaks dasar Dart apa (dari pertemuan 2) yang paling sering Anda salahgunakan, dan mengapa?

---

## 2. Struktur Folder Pengumpulan

```text
tugas-2/<nim>-<nama>/
├── hitung_nilai.dart   # kode modul
└── README.md           # hasil keluaran program + refleksi 3 kalimat
```

## 3. Cara Menilai Jawaban Anda Sendiri

Sebelum mengumpulkan, periksa kembali jawaban Anda dengan pertanyaan berikut:

- [ ] `List<Map<String, Object>>` berisi minimal 5 komponen dengan kunci konsisten?
- [ ] Fungsi `hitungRataRata` mengembalikan `double` dan benar untuk input Anda?
- [ ] Fungsi `predikat` mencakup seluruh rentang nilai (tidak ada nilai yang tak tertangani)?
- [ ] Aturan `predikat` terdokumentasi di komentar?
- [ ] Blok `main()` menampilkan keempat bagian sesuai urutan?
- [ ] `dart hitung_nilai.dart` berjalan tanpa error?
- [ ] Refleksi tepat 3 kalimat dan menyebut sintaks spesifik (bukan pernyataan umum)?
