# USA-WP2360241 — Pemrograman Aplikasi Bergerak

[![Flutter](https://img.shields.io/badge/Flutter-stable-02569B?logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-stable-0175C2?logo=dart&logoColor=white)](https://dart.dev/)
[![Semester](https://img.shields.io/badge/Semester-2026%2F2027%20Gasal-blue)](./TIMELINE.md)
[![Pertemuan](https://img.shields.io/badge/Pertemuan-16%20Minggu-purple)](./TIMELINE.md)

## Daftar Isi

| No. | Dokumen | Deskripsi |
|:---:|:--------|:----------|
| 01 | [Timeline Pertemuan — `TIMELINE.md`](./TIMELINE.md) | Rencana 16 pertemuan untuk kelas SI-VIIB dan SI-VIIA: CPMK, materi, aktivitas, dan output/asesmen |
| 02 | [Milestone — `MILESTONE.md`](./MILESTONE.md) | Tahapan project M0–M10, deliverable, dan kriteria selesai |
| 03 | [Panduan Lengkap — `panduan/Panduan-Lengkap-PAB.md`](./panduan/Panduan-Lengkap-PAB.md) | Dokumen terpadu: skenario instalasi (ringan/standar/lengkap), target web tanpa emulator, tautan unduhan tool, syarat minimum laptop, alur praktikum Flutter, hot reload, serta troubleshooting |
| 04 | [Instalasi Flutter SDK (Windows) — `panduan/Instalasi-Flutter-SDK-Windows.md`](./panduan/Instalasi-Flutter-SDK-Windows.md) | Tutorial langkah-demi-langkah skenario Standar dengan screenshot: unduh bundle, ekstrak, konfigurasi User PATH, verifikasi `flutter`/`dart`, `flutter doctor`, `flutter devices` |
| 05 | [Glosarium — `panduan/Glosarium.md`](./panduan/Glosarium.md) | Definisi istilah Flutter, Dart, IDE, SDK, emulator, iOS Simulator, API, dan runtime |
| 06 | [Pertemuan 1 — `pertemuan-01/01-Pertemuan-1.md`](./pertemuan-01/01-Pertemuan-1.md) | Konsep aplikasi bergerak dalam SI, Flutter, Dart, arsitektur client–server, setup environment, CBL, kuis, dan Tugas 1 |
| 07 | Kode praktikum Pertemuan 1 — [`code/pertemuan-01/`](./code/pertemuan-01/) | Project Flutter pertama dan latihan terbimbing |
| 08 | [Pertemuan 2 — `pertemuan-02/02-Pertemuan-2.md`](./pertemuan-02/02-Pertemuan-2.md) | Dasar pemrograman Dart: variabel, tipe data, operator, percabangan, perulangan, fungsi, dan koleksi |
| 09 | Kode praktikum Pertemuan 2 — [`code/pertemuan-02/`](./code/pertemuan-02/) | `demo-dasar-dart.dart`, `latihan-dasar-dart.dart` (TODO terbimbing), dan solusi referensi |
| 10 | [Pertemuan 3 — `pertemuan-03/03-Pertemuan-3.md`](./pertemuan-03/03-Pertemuan-3.md) | Struktur Flutter dan widget: `MaterialApp`, `Scaffold`, widget tree, layout dasar, dan dua jalur verifikasi (DartPad & Flutter SDK) |
| 11 | Kode praktikum Pertemuan 3 — [`code/pertemuan-03/`](./code/pertemuan-03/) | `demo-struktur-flutter.dart`, `latihan-widget-flutter.dart` (TODO terbimbing), dan solusi referensi |
| 12 | [Pertemuan 4 — `pertemuan-04/04-Pertemuan-4.md`](./pertemuan-04/04-Pertemuan-4.md) | Analisis kebutuhan dan user flow: user persona, kebutuhan fungsional/nonfungsional, prioritas MoSCoW, user flow Mermaid, template dokumen, dan Tugas 4 |
| 13 | [Pertemuan 5 — `pertemuan-05/05-Pertemuan-5.md`](./pertemuan-05/05-Pertemuan-5.md) | UI/UX mobile: information architecture, wireframe, prinsip antarmuka, tema dan komponen visual Flutter, serta Tugas 5 |
| 14 | RPS — acuan mata kuliah | Rencana Pembelajaran Semester, CPMK, Sub-CPMK, indikator, asesmen, dan rubrik project |

## Referensi dan Materi Pendukung Dart

Dokumentasi resmi Dart disediakan untuk membantu mahasiswa memperdalam topik tertentu. Mahasiswa cukup mempelajari bagian yang berkaitan dengan materi perkuliahan.

| Rentang Minggu | Fokus sesuai `TIMELINE.md` | Cakupan Dart yang diperlukan | Referensi pendukung |
|:---------------|:---------------------------|:-----------------------------|:--------------------|
| 1 | Konsep aplikasi bergerak, Flutter, Dart, setup | Pengenalan Dart, `main()`, menjalankan project, dan hubungan Flutter SDK dengan Dart SDK | [Dart and Flutter Getting Started pathway](https://docs.flutter.dev/get-started/codelab) |
| 2 | Dasar pemrograman Dart | Variabel, tipe data, operator, kontrol alur, fungsi, null safety dasar, `List`, `Set`, dan `Map` | [Interactivity](https://dart.dev/learn/tutorial/interactivity) |
| 3–8 | Widget, kebutuhan, UI/UX, navigasi, data lokal, UTS | Menerapkan sintaks Dart pada widget, state, form, navigasi, dan model data sesuai kebutuhan project | [Dart Language Tour](https://dart.dev/guides/language/language-tour) |
| 9–10 | REST API dan integrasi proses bisnis SI | `Future`, `async`/`await`, package `http`, `Uri`, JSON, parsing, dan request/response | [Async](https://dart.dev/learn/tutorial/async), [Data and JSON](https://dart.dev/learn/tutorial/data-and-json), [Fetch data](https://dart.dev/learn/tutorial/fetch-data) |
| 11–12 | Fitur perangkat, validasi, dan keamanan | Asynchronous flow, validasi input, permission, dan penggunaan package sesuai kebutuhan | [Error handling](https://dart.dev/learn/tutorial/error-handling) |
| 13–16 | Testing, project, presentasi, dan UAS | Testing, debugging, refactoring, dokumentasi, dan penguatan konsep yang digunakan project | [Testing](https://dart.dev/learn/tutorial/testing), [Logging](https://dart.dev/learn/tutorial/logging) |

Topik Dart lanjutan, seperti package/library, inheritance, enum, extension, JSON, dan logging, dipelajari hanya jika diperlukan oleh project dan jadwal perkuliahan. Topik di luar RPS dan `TIMELINE.md` tidak menjadi kewajiban mahasiswa.

## Referensi Terkait

### 01-Pertemuan-1.md — Konsep Aplikasi Bergerak, Flutter & Dart

- [Flutter — Get Started](https://docs.flutter.dev/get-started/install) — instalasi Flutter SDK dan setup environment
- [Flutter — Getting Started pathway](https://docs.flutter.dev/get-started/codelab) — menyiapkan environment dan membuat aplikasi Flutter pertama
- [Flutter — Widget tree](https://docs.flutter.dev/resources/architectural-overview) — konsep widget, `MaterialApp`, `Scaffold`, dan struktur aplikasi
- [Dart — Language Tour](https://dart.dev/guides/language/language-tour) — sintaks dasar Dart: variabel, tipe data, fungsi, dan kontrol alur
- [Material Design — Material 3](https://m3.material.io/) — prinsip dan komponen antarmuka Material yang digunakan Flutter
- [Android Developers — User interface design](https://developer.android.com/develop/ui) — karakteristik ukuran layar, interaksi sentuh, dan sesi penggunaan singkat
- [Apple Developer — Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/) — prinsip interaksi dan aksesibilitas di perangkat iOS

### 02-Pertemuan-2.md — Dasar Pemrograman Dart

- [Dart — Language Tour](https://dart.dev/guides/language/language-tour) — variabel, tipe data, operator, kontrol alur, dan fungsi
- [Dart — Collections guide](https://dart.dev/guides/language/collections) — `List`, `Set`, `Map`, dan method collection
- [Dart — null safety](https://dart.dev/null-safety) — aturan null safety dan konvensinya
- [Dart API Documentation](https://api.dart.dev/) — referensi library inti Dart

### 03-Pertemuan-3.md — Struktur Flutter dan Widget

- [Flutter — Widgets](https://docs.flutter.dev/ui/widgets) — daftar dan penjelasan widget Flutter
- [Flutter — Widget tree](https://docs.flutter.dev/resources/architectural-overview) — struktur aplikasi dari `MaterialApp` hingga widget anak
- [Flutter — Layouts](https://docs.flutter.dev/ui/layout) — `Column`, `Row`, `Stack`, `Padding`, `ListView`, dan aturan layout
- [Flutter — Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html) — referensi API `Scaffold` dan komponennya
- [Flutter — ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html) — referensi API `ListView` dan `ListView.builder`
- [Flutter — Widgets in Action (Cookbook)](https://docs.flutter.dev/cookbook) — contoh praktis per widget


### 04-Pertemuan-4.md — Analisis Kebutuhan dan User Flow

- [ProductPlan — MoSCoW Prioritization](https://www.productplan.com/glossary/moscow-prioritization/) — definisi dan praktik prioritas Must/Should/Could/Won't have
- [IxDF — Personas](https://ixdf.org/literature/topics/personas) — cara menyusun user persona dan komponennya
- [Mermaid — Flowchart](https://mermaid.js.org/syntax/flowchart.html) — sintaks diagram alur yang dipakai pada template user flow
- [Mermaid Live Editor](https://mermaid.live/) — alat daring untuk menggambar dan mengekspor diagram Mermaid
- [Nielsen Norman Group — Task Analysis](https://www.nngroup.com/articles/task-analysis/) — hubungan tugas dan tujuan pengguna dengan rancangan alur
- [Excalidraw](https://excalidraw.com/) — alternatif penggambar diagram alur berbentuk gambar

### 05-Pertemuan-5.md — UI/UX Mobile

- [Material Design 3 — Color system](https://m3.material.io/styles/color/system) — skema warna Material 3 yang dipakai `ColorScheme.fromSeed`
- [Flutter — Themes](https://docs.flutter.dev/cookbook/design/themes) — penggunaan `ThemeData` dan akses warna/teks dari tema
- [Flutter — Card](https://api.flutter.dev/flutter/material/Card-class.html) — referensi API `Card` untuk item daftar
- [Flutter — ListTile](https://api.flutter.dev/flutter/material/ListTile-class.html) — referensi API `ListTile` dan variasinya
- [Flutter — Chip](https://api.flutter.dev/flutter/material/Chip-class.html) — referensi API `Chip` untuk label status
- [Material Design — Accessibility](https://m3.material.io/foundations/accessible-design/overview) — target sentuh, kontras, dan aksesibilitas pada Material
- [Nielsen Norman Group — Wireframes](https://www.nngroup.com/articles/wireframes/) — fungsi wireframe dan tingkat fidelitasnya
- [Excalidraw](https://excalidraw.com/) — alat penggambar wireframe low fidelity berbasis peramban
- [Figma](https://www.figma.com/) — alternatif alat wireframe dan prototype daring

### Repositori Kelas

- https://github.com/PBWFEND/SI-VIIA-Mobile

- https://github.com/PBWFEND/SI-VIIB-Mobile