# Panduan Pengerjaan — Tugas 3: Halaman Aplikasi Sederhana

Dokumen ini membantu Anda memahami **apa yang harus dikerjakan** pada Tugas 3. Perhatikan bahwa dokumen ini berisi **kerangka kerja dan definisi, bukan contoh jawaban**. Tugas 3 dinilai berdasarkan kemampuan Anda menerapkan struktur Flutter dan widget dari materi Pertemuan 3.

| | |
|:--|:--|
| **Tenggat** | Sebelum Pertemuan 4 |
| **Pengumpulan** | Push ke repository GitHub kelas |
| **Nilai** | Rubrik Tugas 3 pada materi Pertemuan 3 (Σ bobot = 100%, Nilai = Σ(bobot×skor)/16×100) |

---

## 1. Komponen Tugas

### 1.1 Struktur `MaterialApp` + `Scaffold`

Bangun satu halaman dengan struktur minimal:

```dart
MaterialApp(
  title: 'Nama Aplikasi Anda',
  home: Scaffold(
    appBar: AppBar(title: Text('Judul Halaman')),
    body: /* isi halaman Anda */,
  ),
)
```

| Aspek | Yang diharapkan |
|:------|:----------------|
| `MaterialApp` | Memiliki `title` yang sesuai nama aplikasi di domain SI Anda |
| `Scaffold` | Berisi `AppBar` dan `body` yang terisi |
| Tanpa error | Kode dapat dijalankan melalui DartPad atau `flutter run -d chrome` |

### 1.2 Layout — Minimal 3 Jenis

Gunakan minimal **3 layout berbeda** dalam satu halaman:

| Layout | Peruntukan umum |
|:-------|:----------------|
| `Column` | Menyusun elemen secara vertikal |
| `Row` | Menyusun elemen secara horizontal dalam satu baris |
| `Stack` | Menumpuk widget di ruang yang sama (overlay) |
| `Padding` | Menambahkan spasi di sekeliling widget |
| `ListView` / `ListView.builder` | Menampilkan daftar data yang dapat digulir |

Pilih **3** dari 5 layout di atas. Contoh kombinasi: `Column` (konten utama) + `Row` (satu baris kartu) + `ListView.builder` (daftar data).

> **Kesalahan yang perlu dihindari:** menempatkan `ListView` langsung sebagai anak `Column` tanpa `Expanded` dapat menghasilkan error `RenderFlex overflow`. Solusi: bungkus dengan `Expanded(child: ListView(...))`.

### 1.3 Data — Minimal 4 Entri

Tampilkan data statis di dalam kode (bukan dari API atau database):

```dart
final daftarLayanan = [
  {'nama': '...', 'kategori': '...', 'status': 'Tersedia'},
  {'nama': '...', 'kategori': '...', 'status': 'Penuh'},
  // tambahkan minimal 2 entri lagi
];
```

| Aspek | Yang diharapkan |
|:------|:----------------|
| Jumlah | Minimal **4** entri |
| Kunci | Konsisten di setiap entri |
| Relevansi | Data sesuai domain SI Anda (mis. buku, layanan, jadwal, pengumuman) |

### 1.4 Widget Tree

Gambarkan widget tree halaman Anda:

- Gunakan [Excalidraw](https://excalidraw.com/) atau [Mermaid Live Editor](https://mermaid.live/).
- Minimal **3 tingkat**: `MaterialApp` → `Scaffold` → (komponen yang Anda gunakan).
- Simpan sebagai `widget-tree.png` (hasil ekspor) **dan** file sumbernya (`.excalidraw` / `.mmd`).

Contoh struktur widget tree yang diharapkan:

```
MaterialApp
└── Scaffold
    ├── AppBar: "Judul"
    ├── body: Column
    │   ├── Text (sapaan)
    │   ├── ListView.builder
    │   │   ├── Row (ikon + teks)
    │   │   ├── Row
    │   │   └── ...
    │   └── Padding
    └── floatingActionButton
```

### 1.5 Dokumentasi dan Refleksi

| Berkas | Isi |
|:-------|:----|
| `README.md` | Nama aplikasi, deskripsi halaman (1 paragraf), domain SI yang dipilih, dan refleksi 3 kalimat |
| `screenshot-halaman.png` | Tangkapan layar hasil halaman di browser (Chrome) atau DartPad |
| `widget-tree.png` | Diagram widget tree (hasil ekspor) |

**Refleksi (tepat 3 kalimat):** widget layout mana yang paling sulit Anda rangkai, dan mengapa?

---

## 2. Struktur Folder Pengumpulan

```text
tugas-3/<nim>-<nama>/
├── halaman_aplikasi.dart
├── widget-tree.png
├── screenshot-halaman.png
└── README.md
```

## 3. Cara Menilai Jawaban Anda Sendiri

Sebelum mengumpulkan, periksa kembali jawaban Anda dengan pertanyaan berikut:

- [ ] `MaterialApp` memiliki `title` dan `home` berisi `Scaffold`?
- [ ] Minimal 3 layout berbeda digunakan (`Column`, `Row`, dan salah satu dari `Stack`/`Padding`/`ListView`)?
- [ ] Data menampilkan minimal 4 entri yang relevan dengan domain SI Anda?
- [ ] Tidak ada error `RenderFlex overflow` saat halaman dijalankan?
- [ ] Widget tree digambar minimal 3 tingkat dan sesuai dengan kode Anda?
- [ ] Kode dapat dijalankan melalui DartPad (template App) atau `flutter run -d chrome`?
- [ ] Screenshot dan diagram tersimpan di folder tugas?
- [ ] Refleksi tepat 3 kalimat dan menyebut widget spesifik (bukan pernyataan umum)?
