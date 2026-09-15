# Panduan Pengerjaan — Tugas 1: Identifikasi Kebutuhan Aplikasi Bergerak

Dokumen ini membantu Anda memahami **apa yang harus dikerjakan** pada Tugas 1. Perhatikan bahwa dokumen ini berisi **kerangka kerja dan definisi, bukan contoh jawaban**. Contoh jawaban lengkap tidak disediakan — Tugas 1 dinilai berdasarkan kemampuan Anda mengidentifikasi kebutuhan dari domain pilihan Anda sendiri.

| | |
|:--|:--|
| **Tenggat** | Sebelum Pertemuan 2 |
| **Pengumpulan** | Push ke repository GitHub kelas (lihat bagian pengumpulan) |
| **Nilai** | Rubrik Tugas 1 pada materi pertemuan 1 (Σ bobot = 100%, Nilai = Σ(bobot×skor)/16×100) |

---

## 1. Pilih Satu Domain Sistem Informasi

Pilih **satu** domain berikut:

- Perpustakaan kampus
- Laboratorium
- Kantin kampus
- Absensi organisasi
- Usaha mikro (mis. koperasi, warung, toko)

Domain dipilih **satu kali** untuk seluruh semester — keputusan ini menjadi dasar project Anda dari Minggu 1 sampai UAS.

## 2. Kelima Komponen Tugas

### 2.1 Deskripsi Sistem (1 paragraf)

Jawab tiga pertanyaan dalam satu paragraf:

| Pertanyaan | Apa yang diharapkan |
|:-----------|:--------------------|
| Siapa penggunanya? | Sebutkan peran pengguna utama (mis. mahasiswa) dan pengguna lain (mis. petugas) |
| Apa masalahnya? | Masalah nyata pada proses bisnis saat ini, bukan keinginan umum |
| Mengapa solusinya berbentuk aplikasi mobile? | Kaitkan dengan **minimal 2 karakteristik aplikasi bergerak** dari materi pertemuan 1: konektivitas terbatas, layar kecil, interaksi sentuh, sesi penggunaan singkat, daya dan data terbatas, konteks bergerak, atau variasi perangkat |

### 2.2 Diagram Arsitektur

Gambar alur: `Aplikasi Mobile → HTTP Request → Backend SI → Database → HTTP Response → Aplikasi Mobile`.

- Gunakan **tool diagram digital** — disarankan [Excalidraw](https://excalidraw.com/); alternatif: [draw.io / diagrams.net](https://app.diagrams.net/) atau [Mermaid Live Editor](https://mermaid.live/).
- Ekspor sebagai **PNG/SVG** (`diagram.png`), dan sertakan juga **file sumbernya** (`.excalidraw` / `.drawio` / `.mmd`) agar mudah direvisi.

### 2.3 Tabel Kebutuhan (minimal 6 kebutuhan)

Gunakan struktur tabel berikut:

| No. | Permintaan | Pengguna | Karakteristik Mobile yang Terkait | Fitur Aplikasi | Materi Pemenuh |
|:---:|:-----------|:---------|:----------------------------------|:---------------|:----------------|
| 1 | | | | | |

Penjelasan kolom:

| Kolom | Isi |
|:------|:----|
| **Permintaan** | Apa yang diminta pengguna (mis. "melihat daftar buku dan detail buku") |
| **Pengguna** | Siapa yang melakukan (mahasiswa, petugas, dsb.) |
| **Karakteristik mobile yang terkait** | Pilih dari daftar karakteristik di materi pertemuan 1; jelaskan mengapa karakteristik itu relevan |
| **Fitur aplikasi** | Fitur apa yang akan dibangun di aplikasi (halaman, form, tombol, notifikasi, penyimpanan lokal) |
| **Materi pemenuh** | Perkiraan minggu berapa kebutuhan ini dipenuhi (lihat `TIMELINE.md`) |

> **Perhatian:** identifikasi juga kebutuhan yang **tidak** menjadi tugas aplikasi mobile (mis. pengelolaan data oleh petugas = tugas backend SI). Cantumkan baris tersebut dengan keterangan "Di luar lingkup (backend SI)" — kemampuan membatasi lingkup aplikasi mobile adalah bagian yang dinilai.

### 2.4 Bukti Environment Siap

Siapkan tiga tangkapan layar:

| Bukti | File |
|:------|:-----|
| `flutter doctor -v` sebelum perbaikan (ada tanda ✗) | `flutter-doctor/sebelum.png` |
| `flutter doctor -v` sesudah perbaikan (bersih) | `flutter-doctor/sesudah.png` |
| Aplikasi counter berjalan di emulator/perangkat | `aplikasi.png` |

### 2.5 Refleksi (3 kalimat)

Jawab dalam **tepat 3 kalimat**: fitur perangkat apa (kamera, lokasi, file, atau notifikasi) yang paling relevan untuk domain yang Anda pilih, dan mengapa.

## 3. Struktur Folder Pengumpulan

```text
tugas-1/<nim>-<nama>/
├── README.md                 # deskripsi sistem, tabel kebutuhan, refleksi (cantumkan Nama + NIM)
├── diagram.png               # hasil ekspor diagram arsitektur
├── diagram.mmd               # file sumber diagram (atau .excalidraw / .drawio)
├── flutter-doctor/
│   ├── sebelum.png
│   └── sesudah.png
└── aplikasi.png
```

## 4. Cara Menilai Jawaban Anda Sendiri

Sebelum mengumpulkan, periksa kembali jawaban Anda dengan pertanyaan berikut:

- [ ] Deskripsi sistem menyebutkan **minimal 2 karakteristik mobile** secara eksplisit?
- [ ] Diagram arsitektur menunjukkan **dua arah** alur (request dan response)?
- [ ] Tabel kebutuhan memiliki **minimal 6 baris** dengan kelima kolom terisi lengkap?
- [ ] Ada minimal satu baris yang menunjukkan kebutuhan **di luar** aplikasi mobile (backend)?
- [ ] Tiga tangkapan layar bukti environment tersedia dan terbaca jelas?
- [ ] Refleksi tepat 3 kalimat dan menyebut fitur perangkat beserta alasannya?
