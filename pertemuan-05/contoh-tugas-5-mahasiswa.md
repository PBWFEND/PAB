# Panduan Pengerjaan — Tugas 5: Prototype UI/UX

Dokumen ini membantu Anda memahami **apa yang harus dikerjakan** pada Tugas 5. Dokumen ini berisi **kerangka kerja dan definisi, bukan contoh jawaban**. Tugas 5 dinilai berdasarkan kemampuan Anda menerjemahkan kebutuhan (Tugas 4) menjadi rancangan dan halaman Flutter sesuai materi Pertemuan 5.

| | |
|:--|:--|
| **Tenggat** | Sebelum Pertemuan 6 |
| **Pengumpulan** | Push ke repository GitHub kelas |
| **Nilai** | Rubrik Tugas 5 pada materi Pertemuan 5 (Σ bobot = 100%, Nilai = Σ(bobot×skor)/16×100) |

---

## 1. Komponen Tugas

### 1.1 Information Architecture — `information-architecture.md`

| Isi | Keterangan |
|:----|:-----------|
| Inventaris layar | Daftar layar dari tabel pemetaan Tugas 4 — setiap layar mencantumkan ID kebutuhan yang dipenuhi |
| Diagram IA | Mermaid (`flowchart TD`); layar utama ditetapkan dan layar pendukung menggantung di bawahnya |
| Alasan layar utama | 1–2 kalimat: layar utama memenuhi kebutuhan Must have yang mana |

> **Yang perlu dihindari:** layar tanpa kebutuhan, dan nama layar yang berbeda dari tabel pemetaan Tugas 4.

### 1.2 Wireframe — `wireframe.png`

- Minimal **2 layar**: layar utama + satu layar pendukung dari IA.
- **Low fidelity** — kotak, garis, blok abu-abu; belum perlu warna final.
- Setiap area **beranotasi**: fungsi area + ID kebutuhan (mis. "daftar pengajuan — F-03").
- Salah satu layar menampilkan **keadaan kosong atau status menunggu**.
- Alat: [Excalidraw](https://excalidraw.com/) atau [Figma](https://www.figma.com/); ekspor ke PNG.

### 1.3 Halaman Flutter — `halaman-utama.dart`

Implementasi **layar utama** dari wireframe Anda:

| Wajib ada | Acuan materi |
|:----------|:-------------|
| `MaterialApp` + `ThemeData` (`ColorScheme.fromSeed`, `useMaterial3: true`) | Bagian 7.1 |
| `Scaffold` + `AppBar` + `ListView.builder` dengan `Card` + `ListTile` | Bagian 8, materi P3 |
| Status berwarna dengan ternary, warna dari tema | Bagian 7.2 |
| Satu aksi utama: `FloatingActionButton.extended` atau `FilledButton` | Bagian 7.2 |
| Keadaan kosong (`Center` + ikon + teks) | Bagian 8 |
| **Tanpa `Navigator`** — navigasi menjadi materi Pertemuan 6 | Batas cakupan |

Gunakan [`latihan-ui-flutter.dart`](../code/pertemuan-05/latihan-ui-flutter.dart) sebagai dasar, kemudian sesuaikan dengan domain dan wireframe Anda — jangan meniru mentah tanpa penyesuaian.

### 1.4 Tangkapan Layar — `screenshot-halaman.png`

Jalankan halaman melalui DartPad atau `flutter run -d chrome`, tangkap layar hasilnya, dan simpan sebagai `screenshot-halaman.png`. Tangkapan layar adalah bukti bahwa kode berjalan — pastikan seluruh layar terlihat (bukan potongan sebagian).

### 1.5 Catatan Keputusan UI/UX — `catatan-keputusan-ui.md`

Tabel keputusan dengan minimal empat baris:

| Keputusan | Pilihan Anda | Alasan (merujuk kebutuhan/persona/prinsip) |
|:----------|:-------------|:--------------------------------------------|
| Warna benih | [...] | [...] |
| Bentuk status | [...] | [...] |
| Posisi aksi utama | [...] | [...] |
| Hierarki teks | [...] | [...] |

### 1.6 README, Refleksi, dan Deklarasi AI

| Berkas | Isi |
|:-------|:----|
| `README.md` | Deskripsi singkat tugas, refleksi 3 kalimat, dan deklarasi penggunaan AI (bila ada) |

**Refleksi (tepat 3 kalimat):** bagian mana yang paling sulit dipertahankan konsistensinya antara wireframe, kode, dan catatan keputusan — dan mengapa?

**Deklarasi penggunaan AI** (bila menggunakan AI) ditulis pada akhir dokumen:

```text
Deklarasi penggunaan AI: [nama AI] — [aktivitas spesifik yang dibantu];
hasilnya dirumuskan ulang oleh penulis.
```

---

## 2. Struktur Folder Pengumpulan

```text
tugas-5/<nim>-<nama>/
├── information-architecture.md
├── wireframe.png
├── halaman-utama.dart
├── screenshot-halaman.png
├── catatan-keputusan-ui.md
└── README.md
```

## 3. Cara Menilai Jawaban Anda Sendiri

Sebelum mengumpulkan, periksa kembali jawaban Anda dengan pertanyaan berikut:

- [ ] Setiap layar pada IA berasal dari satu baris tabel pemetaan Tugas 4?
- [ ] Layar utama dipilih dengan alasan yang merujuk kebutuhan Must have?
- [ ] Wireframe memuat minimal 2 layar dengan anotasi fungsi + ID kebutuhan?
- [ ] Keadaan kosong atau status menunggu tampak pada wireframe?
- [ ] Warna berasal dari `ThemeData`, bukan ditulis langsung di setiap widget?
- [ ] Status dibedakan warna dengan ternary dan warna tema?
- [ ] Aksi utama berbentuk tombol besar, bukan tautan teks?
- [ ] Keadaan kosong terimplementasi di kode (uji dengan mengosongkan daftar)?
- [ ] Tangkapan layar menampilkan seluruh halaman hasil berjalan?
- [ ] Catatan keputusan memuat minimal 4 keputusan, seluruhnya beralasan?
- [ ] Refleksi tepat 3 kalimat dan menyebut bagian spesifik?
- [ ] Deklarasi penggunaan AI tercantum bila AI digunakan?
