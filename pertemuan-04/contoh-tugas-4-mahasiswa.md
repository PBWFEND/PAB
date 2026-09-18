# Panduan Pengerjaan — Tugas 4: Dokumen Kebutuhan dan User Flow

Dokumen ini membantu Anda memahami **apa yang harus dikerjakan** pada Tugas 4. Perhatikan bahwa dokumen ini berisi **kerangka kerja dan definisi, bukan contoh jawaban**. Tugas 4 dinilai berdasarkan kemampuan Anda menganalisis kebutuhan dan merancang user flow sesuai materi Pertemuan 4.

| | |
|:--|:--|
| **Tenggat** | Sebelum Pertemuan 5 |
| **Pengumpulan** | Push ke repository GitHub kelas |
| **Nilai** | Rubrik Tugas 4 pada materi Pertemuan 4 (Σ bobot = 100%, Nilai = Σ(bobot×skor)/16×100) |

---

## 1. Komponen Tugas

### 1.1 Deskripsi Aplikasi

Satu paragraf yang memuat: nama aplikasi, masalah pengguna pada domain SI Anda, dan alasan solusi berbentuk aplikasi mobile. Gunakan konteks domain yang sama dengan Tugas 1–3.

### 1.2 User Persona — Minimal 2 Persona, 2 Peran

Setiap persona memuat **kelima komponen** berikut:

| Komponen | Yang diharapkan |
|:---------|:----------------|
| Nama dan peran | Merepresentasikan peran, bukan individu nyata |
| Tujuan | Yang ingin dicapai pengguna dengan aplikasi Anda |
| Kendala | Kondisi yang mempersulit pencapaian tujuan |
| Perangkat dan konteks | Kapan dan dengan apa aplikasi dipakai |
| Frekuensi penggunaan | Seberapa sering peran ini memakai aplikasi |

> **Yang perlu dihindari:** aspek yang tidak berpengaruh pada keputusan fitur (hobi, kepribadian) dan persona tanpa keterkaitan dengan domain SI Anda.

### 1.3 Kebutuhan Fungsional — Minimal 6, Bernomor

- Pola penulisan: **[aktor] dapat [aksi] [objek] [kondisi/hasil]**.
- Satu pernyataan memuat **satu fungsi** — jangan menggabungkan ("mendaftar, masuk, dan mengedit profil" adalah tiga kebutuhan).
- Jangan menyebut teknologi implementasi ("menggunakan SQLite") — simpan pada tingkat kebutuhan.
- Beri nomor `F-01`, `F-02`, dan seterusnya.

**Uji keterukuran:** untuk setiap kebutuhan, jawab pertanyaan "bagaimana cara memverifikasi kebutuhan ini terpenuhi?" Bila tidak dapat dijawab, rumuskan ulang.

### 1.4 Kebutuhan Nonfungsional — Minimal 2, Terukur

Pilih kategori yang benar-benar berpengaruh pada aplikasi Anda (kegunaan, kinerja, keamanan, kompatibilitas). Setiap rumusan memiliki **kriteria terukur** — ganti kata "cepat" dan "mudah" dengan angka atau kondisi yang dapat diamati. Beri nomor `NF-01`, `NF-02`, dan seterusnya.

### 1.5 Prioritas MoSCoW

| Aturan | Keterangan |
|:-------|:-----------|
| Cakupan | Seluruh kebutuhan fungsional wajib berprioritas |
| Batas | Kategori Must have **maksimal 5 fitur** |
| Alasan | Setiap kategori disertai alasan yang merujuk persona atau tujuan aplikasi |
| Won't have | Dicatat dengan alasan penundaan, bukan dihapus begitu saja |

### 1.6 User Flow — Minimal 8 Langkah, 2 Keputusan

- Satu diagram menggambarkan **satu tujuan pengguna** (pilih alur utama pengguna utama Anda).
- Minimal **8 langkah** dan **2 titik keputusan**; setiap keputusan memiliki **cabang gagal** yang ditindaklanjuti.
- Gunakan [Mermaid Live Editor](https://mermaid.live/) atau [Excalidraw](https://excalidraw.com/).
- Sertakan kode diagram Mermaid di dalam `dokumen-kebutuhan.md` **dan/atau** hasil ekspor `user-flow.png` — dokumen harus dapat dibaca tanpa alat tambahan.
- Gunakan [`template-user-flow.md`](./template-user-flow.md) sebagai kerangka awal.

### 1.7 Pemetaan Kebutuhan ke Antarmuka

Tabel yang menautkan: setiap kebutuhan fungsional → layar yang memenuhinya → widget yang direncanakan dari materi Pertemuan 3. Kolom widget bukan keputusan final — diperhalus pada Pertemuan 5.

### 1.8 Refleksi dan Deklarasi AI

| Berkas | Isi |
|:-------|:----|
| `README.md` | Deskripsi singkat tugas, refleksi 3 kalimat, dan deklarasi penggunaan AI (bila ada) |

**Refleksi (tepat 3 kalimat):** bagian analisis mana yang paling sulit Anda tetapkan — persona, rumusan kebutuhan, prioritas, atau alur — dan mengapa?

**Deklarasi penggunaan AI** (bila menggunakan AI) ditulis pada akhir dokumen:

```text
Deklarasi penggunaan AI: [nama AI] — [aktivitas spesifik yang dibantu];
hasilnya dirumuskan ulang oleh penulis.
```

---

## 2. Struktur Folder Pengumpulan

```text
tugas-4/<nim>-<nama>/
├── dokumen-kebutuhan.md
├── user-flow.png        # opsional bila diagram Mermaid sudah ada di dokumen
└── README.md
```

## 3. Cara Menilai Jawaban Anda Sendiri

Sebelum mengumpulkan, periksa kembali jawaban Anda dengan pertanyaan berikut:

- [ ] Deskripsi aplikasi memuat masalah pengguna dan alasan solusi mobile?
- [ ] Minimal 2 persona dengan 2 peran berbeda, kelima komponen lengkap?
- [ ] Minimal 6 kebutuhan fungsional dengan pola aktor–aksi–hasil, satu fungsi per pernyataan?
- [ ] Setiap kebutuhan dapat diverifikasi (lolos uji "bagaimana cara memverifikasi")?
- [ ] Minimal 2 kebutuhan nonfungsional dengan kriteria terukur?
- [ ] Seluruh kebutuhan fungsional berprioritas MoSCoW; Must have ≤ 5; setiap kategori beralasan?
- [ ] User flow minimal 8 langkah dan 2 keputusan, semua keputusan memiliki cabang gagal?
- [ ] Diagram dapat ditelusuri tanpa penjelasan lisan — sudah dites pada satu teman sekelas?
- [ ] Tabel pemetaan memuat setiap kebutuhan fungsional beserta layar dan widgetnya?
- [ ] Refleksi tepat 3 kalimat dan menyebut bagian spesifik (bukan pernyataan umum)?
- [ ] Deklarasi penggunaan AI tercantum bila AI digunakan?
