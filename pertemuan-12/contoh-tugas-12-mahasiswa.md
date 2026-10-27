# Panduan Pengerjaan Tugas 12 — Security Checklist dan Validasi Project

Dokumen ini adalah kerangka pengerjaan mahasiswa, bukan contoh jawaban. Gunakan domain project yang sama dengan Tugas 1–11.

## 1. Berkas yang Dikumpulkan

```text
tugas-12/
├── security-checklist.md
├── validasi-input.md
├── kode project yang diperbarui/
├── README.md
└── refleksi.md
```

## 2. `security-checklist.md`

Gunakan tabel berikut:

| No. | Risiko atau pemeriksaan | Status | Bukti |
|:---:|:------------------------|:------:|:------|
| 1 | Input wajib divalidasi | | |
| 2 | Format input diperiksa | | |
| 3 | HTTPS digunakan untuk data sensitif | | |
| 4 | Token tidak ditulis pada source code | | |
| 5 | Token tidak dicetak pada log | | |
| 6 | Token dihapus saat logout | | |
| 7 | Permission sesuai fitur | | |
| 8 | Permission ditolak ditangani | | |
| 9 | Pesan error tidak membocorkan data | | |
| 10 | Dependency dan batasan didokumentasikan | | |

Status dapat berupa `Selesai`, `Sebagian`, atau `Belum`. Kolom bukti harus menunjuk pada file, test, screenshot, atau hasil pemeriksaan yang benar-benar ada.

## 3. `validasi-input.md`

| Input | Aturan client | Pemeriksaan server | Pesan error |
|:------|:--------------|:-------------------|:------------|
| | | | |
| | | | |
| | | | |
| | | | |
| | | | |

## 4. Validasi Kode

Tambahkan minimal tiga validator pada project. Contoh kategori:

- field wajib;
- batas panjang teks;
- format email;
- tanggal atau rentang nilai;
- ukuran dan format file.

Jelaskan lokasi validator dan cara mengujinya. Jangan mencantumkan secret atau data nyata.

## 5. README dan Refleksi

README harus mencantumkan dependency, cara menjalankan project, target pengujian, batasan keamanan, dan deklarasi AI jika digunakan.

Refleksi berisi tiga kalimat:

1. Risiko keamanan paling penting pada project adalah ...
2. Mitigasi yang dipilih adalah ...
3. Hal yang masih perlu diperbaiki adalah ...

## 6. Pemeriksaan Sebelum Pull Request

- [ ] Branch aktif menggunakan NIM mahasiswa.
- [ ] Folder tugas bernama `tugas-12/`.
- [ ] Minimal 10 pemeriksaan security checklist ditulis.
- [ ] Minimal 5 input memiliki aturan validasi.
- [ ] Minimal 3 validator dapat diuji.
- [ ] Tidak ada token, password, atau data pribadi pada repository.
- [ ] README dan refleksi tersedia.
- [ ] Pull Request dibuat ke branch `main`.
