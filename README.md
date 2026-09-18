# USA-WP2360241 — Pemrograman Aplikasi Bergerak

[![Flutter](https://img.shields.io/badge/Flutter-stable-02569B?logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-stable-0175C2?logo=dart&logoColor=white)](https://dart.dev/)
[![Semester](https://img.shields.io/badge/Semester-2026%2F2027%20Gasal-blue)](https://)
[![Pertemuan](https://img.shields.io/badge/Pertemuan-16%20Minggu-purple)](https://)

## Daftar Isi

| No. | Dokumen | Deskripsi |
|:---:|:--------|:----------|
| 01 | [Timeline Pertemuan — `TIMELINE.md`](./TIMELINE.md) | Rencana 16 pertemuan untuk kelas SI-VIIB dan SI-VIIA: CPMK, materi, aktivitas, dan output/asesmen |
| 02 | [Milestone — `MILESTONE.md`](./MILESTONE.md) | Tahapan project M0–M10, deliverable, dan kriteria selesai |
| 03 | [Panduan Lengkap — `panduan/Panduan-Lengkap-PAB.md`](./panduan/Panduan-Lengkap-PAB.md) | Dokumen terpadu: skenario instalasi (ringan/standar/lengkap), target web tanpa emulator, tautan unduhan tool, syarat minimum laptop, alur praktikum Flutter, hot reload, serta troubleshooting |
| 04 | [Glosarium — `panduan/Glosarium.md`](./panduan/Glosarium.md) | Definisi istilah Flutter, Dart, IDE, SDK, emulator, iOS Simulator, API, dan runtime |
| 05 | [Pertemuan 1 — `pertemuan-01/01-Pertemuan-1.md`](./pertemuan-01/01-Pertemuan-1.md) | Konsep aplikasi bergerak dalam SI, Flutter, Dart, arsitektur client–server, setup environment, CBL, kuis, dan Tugas 1 |
| 06 | Kode praktikum Pertemuan 1 — [`code/pertemuan-01/`](./code/pertemuan-01/) | Project Flutter pertama dan latihan terbimbing |
| 07 | [Pertemuan 2 — `pertemuan-02/02-Pertemuan-2.md`](./pertemuan-02/02-Pertemuan-2.md) | Dasar pemrograman Dart: variabel, tipe data, operator, percabangan, perulangan, fungsi, dan koleksi |
| 08 | Kode praktikum Pertemuan 2 — [`code/pertemuan-02/`](./code/pertemuan-02/) | `demo-dasar-dart.dart`, `latihan-dasar-dart.dart` (TODO terbimbing), dan solusi referensi |
| 09 | [Pertemuan 3 — `pertemuan-03/03-Pertemuan-3.md`](./pertemuan-03/03-Pertemuan-3.md) | Struktur Flutter dan widget: `MaterialApp`, `Scaffold`, widget tree, layout dasar, dan dua jalur verifikasi (DartPad & Flutter SDK) |
| 10 | Kode praktikum Pertemuan 3 — [`code/pertemuan-03/`](./code/pertemuan-03/) | `demo-struktur-flutter.dart`, `latihan-widget-flutter.dart` (TODO terbimbing), dan solusi referensi |
| 11 | [Pertemuan 4 — `pertemuan-04/04-Pertemuan-4.md`](./pertemuan-04/04-Pertemuan-4.md) | Analisis kebutuhan dan user flow: user persona, kebutuhan fungsional/nonfungsional, prioritas MoSCoW, user flow Mermaid, template dokumen, dan Tugas 4 |
| 12 | RPS — acuan mata kuliah | Rencana Pembelajaran Semester, CPMK, Sub-CPMK, indikator, asesmen, dan rubrik project |

## Referensi dan Materi Pendukung Dart

Dokumentasi resmi Dart disediakan untuk membantu mahasiswa memperdalam topik tertentu. Mahasiswa cukup mempelajari bagian yang berkaitan dengan materi perkuliahan.

| Rentang Minggu | Fokus sesuai `TIMELINE.md` | Cakupan Dart yang diperlukan | Referensi pendukung |
|:---------------|:---------------------------|:-----------------------------|:--------------------|
| 1 | Konsep aplikasi bergerak, Flutter, Dart, setup | Pengenalan Dart, `main()`, menjalankan project, dan hubungan Flutter SDK dengan Dart SDK | [Build your first app](https://dart.dev/learn/tutorial/first-app) |
| 2 | Dasar pemrograman Dart | Variabel, tipe data, operator, kontrol alur, fungsi, null safety dasar, `List`, `Set`, dan `Map` | [Interactivity](https://dart.dev/learn/tutorial/interactivity) |
| 3–8 | Widget, kebutuhan, UI/UX, navigasi, data lokal, UTS | Menerapkan sintaks Dart pada widget, state, form, navigasi, dan model data sesuai kebutuhan project | [Dart Language Tour](https://dart.dev/guides/language/language-tour) |
| 9–10 | REST API dan integrasi proses bisnis SI | `Future`, `async`/`await`, package `http`, `Uri`, JSON, parsing, dan request/response | [Async](https://dart.dev/learn/tutorial/async), [Data and JSON](https://dart.dev/learn/tutorial/data-and-json), [Fetch data](https://dart.dev/learn/tutorial/fetch-data) |
| 11–12 | Fitur perangkat, validasi, dan keamanan | Asynchronous flow, validasi input, permission, dan penggunaan package sesuai kebutuhan | [Error handling](https://dart.dev/learn/tutorial/error-handling) |
| 13–16 | Testing, project, presentasi, dan UAS | Testing, debugging, refactoring, dokumentasi, dan penguatan konsep yang digunakan project | [Testing](https://dart.dev/learn/tutorial/testing), [Logging](https://dart.dev/learn/tutorial/logging) |

Topik Dart lanjutan, seperti package/library, inheritance, enum, extension, JSON, dan logging, dipelajari hanya jika diperlukan oleh project dan jadwal perkuliahan. Topik di luar RPS dan `TIMELINE.md` tidak menjadi kewajiban mahasiswa.

## Referensi Terkait

### 01-Pertemuan-1.md — Konsep Aplikasi Bergerak, Flutter & Dart

- [Flutter — Get Started](https://docs.flutter.dev/get-started/install) — instalasi Flutter SDK dan setup environment
- [Flutter — Create your first app](https://docs.flutter.dev/get-started/try-your-first-app) — membuat dan menjalankan project Flutter pertama
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

- [Atlassian — MoSCoW method](https://www.atlassian.com/agile/prioritization/moscow-method) — definisi dan praktik prioritas Must/Should/Could/Won't have
- [Interaction Design Foundation — Personas](https://www.interaction-design.org/literature/topics/personas) — cara menyusun user persona dan komponennya
- [Mermaid — Flowchart](https://mermaid.js.org/syntax/flowchart.html) — sintaks diagram alur yang dipakai pada template user flow
- [Mermaid Live Editor](https://mermaid.live/) — alat daring untuk menggambar dan mengekspor diagram Mermaid
- [Nielsen Norman Group — User Goals](https://www.nngroup.com/articles/user-goals-tasks/) — hubungan tujuan pengguna dengan rancangan alur
- [Excalidraw](https://excalidraw.com/) — alternatif penggambar diagram alur berbentuk gambar

### Repositori Kelas

- https://github.com/PBWFEND/SI-VIIA-Mobile

- https://github.com/PBWFEND/SI-VIIB-Mobile