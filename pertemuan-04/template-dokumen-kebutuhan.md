# Template — Dokumen Kebutuhan

Template ini digunakan pada Latihan Individu dan Tugas 4 (Pertemuan 4). Ganti seluruh teks petunjuk dalam tanda kurung siku dengan hasil analisis Anda. Jangan mengubah struktur judul bagian — struktur ini dinilai pada rubrik.

---

## 1. Deskripsi Aplikasi

> Tulis satu paragraf: nama aplikasi, masalah yang dihadapi pengguna, dan alasan solusi berbentuk aplikasi mobile (bukan web desktop atau manual).

## 2. User Persona

> Minimal 2 persona dengan 2 peran berbeda. Setiap persona memuat kelima komponen. Hapus komponen yang tidak berpengaruh pada keputusan fitur — jangan menambah aspek yang tidak relevan.

### Persona 1 — [Nama singkat] — [Peran]

| Komponen | Isi |
|:---------|:----|
| Nama dan peran | [Contoh: Rani — mahasiswa peminjam] |
| Tujuan | [Apa yang ingin dicapai dengan aplikasi] |
| Kendala | [Kondisi yang mempersulit mencapai tujuan] |
| Perangkat dan konteks | [Ponsel/_target web_; kapan dan di mana aplikasi dipakai] |
| Frekuensi penggunaan | [Seberapa sering peran ini memakai aplikasi] |

### Persona 2 — [Nama singkat] — [Peran]

| Komponen | Isi |
|:---------|:----|
| Nama dan peran | [...] |
| Tujuan | [...] |
| Kendala | [...] |
| Perangkat dan konteks | [...] |
| Frekuensi penggunaan | [...] |

## 3. Kebutuhan Fungsional

> Minimal 6 kebutuhan, bernomor berurutan, pola: **[aktor] dapat [aksi] [objek] [kondisi/hasil]**. Satu pernyataan = satu fungsi. Jangan menyebut teknologi implementasi (SQLite, library tertentu).

| ID | Rumusan Kebutuhan | Terkait Persona |
|:---|:------------------|:----------------|
| F-01 | [Aktor] dapat [aksi] [objek] [kondisi/hasil] | Persona 1 |
| F-02 | [...] | Persona 2 |
| F-03 | [...] | [...] |

## 4. Kebutuhan Nonfungsional

> Minimal 2 kebutuhan dengan kriteria terukur (angka, kondisi yang dapat diamati). Kategori yang lazim: kegunaan, kinerja, keamanan, kompatibilitas.

| ID | Kategori | Rumusan | Kriteria Terukur |
|:---|:---------|:--------|:-----------------|
| NF-01 | [Kegunaan] | [...] | [Contoh: tugas utama selesai maksimal 5 langkah] |
| NF-02 | [Kinerja] | [...] | [Contoh: daftar tampil kurang dari 3 detik] |

## 5. Prioritas Fitur (MoSCoW)

> Seluruh kebutuhan fungsional wajib berprioritas. Must have **maksimal 5 fitur**. Setiap kategori disertai alasan yang merujuk pada persona atau tujuan aplikasi.

| Prioritas | ID Kebutuhan | Alasan |
|:----------|:-------------|:-------|
| Must have | F-01, F-02, ... | [Alasan teknis/akademis] |
| Should have | F-0x, ... | [...] |
| Could have | F-0x, ... | [...] |
| Won't have (saat ini) | F-0x, ... | [Alasan penundaan — bukan dihapus begitu saja] |

## 6. Pemetaan Kebutuhan ke Antarmuka

> Setiap kebutuhan fungsional dipetakan ke halaman dan widget yang direncanakan dari materi Pertemuan 3 (`Scaffold`, `AppBar`, `Column`, `Row`, `ListView.builder`, `ListTile`, `Card`). Widget bukan keputusan final — diperhalus pada Pertemuan 5.

| ID Kebutuhan | Rumusan (ringkas) | Prioritas | Halaman yang Memenuhi | Widget yang Direncanakan (P3) |
|:-------------|:------------------|:----------|:----------------------------|:------------------------------|
| F-01 | [...] | Must | [Halaman form pengajuan] | [`Scaffold` + `Column`] |
| F-02 | [...] | Must | [...] | [`ListView.builder` + `ListTile`] |

---

## Daftar Pemeriksaan Sebelum Mengumpulkan

- [ ] Seluruh teks petunjuk `[...]` telah diganti.
- [ ] Setiap persona memuat kelima komponen.
- [ ] Setiap kebutuhan fungsional mengikuti pola aktor–aksi–hasil dan satu fungsi per pernyataan.
- [ ] Kebutuhan nonfungsional memiliki kriteria terukur.
- [ ] Seluruh kebutuhan fungsional berprioritas; Must have ≤ 5.
- [ ] Setiap kebutuhan fungsional muncul pada tabel pemetaan.
