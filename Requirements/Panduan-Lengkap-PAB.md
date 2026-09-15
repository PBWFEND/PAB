# Panduan Lengkap Praktikum

**USA-WP2360241 — Pemrograman Aplikasi Bergerak**

| | |
|:---|:---|
| **Prodi** | Sistem Informasi |
| **Semester** | 2026/2027 Gasal |
| **Platform** | Flutter (stable) + Dart |


---

## Daftar Isi

- [Panduan Lengkap Praktikum](#panduan-lengkap-praktikum)
  - [Daftar Isi](#daftar-isi)
- [Bagian I — Perencanaan: Memilih Skenario Instalasi](#bagian-i--perencanaan-memilih-skenario-instalasi)
  - [1. Pendahuluan](#1-pendahuluan)
  - [2. Tiga Skenario Instalasi](#2-tiga-skenario-instalasi)
  - [2.1 Peta Kebutuhan Environment per Pertemuan](#21-peta-kebutuhan-environment-per-pertemuan)
  - [3. Perkiraan Konsumsi Disk dan RAM per Skenario](#3-perkiraan-konsumsi-disk-dan-ram-per-skenario)
    - [3.1 Windows](#31-windows)
    - [3.2 macOS](#32-macos)
    - [3.3 Linux (Ubuntu/Debian)](#33-linux-ubuntudebian)
  - [4. Syarat Minimum Laptop untuk Mahasiswa](#4-syarat-minimum-laptop-untuk-mahasiswa)
    - [4.1 Jika laptop Anda tidak memenuhi syarat](#41-jika-laptop-anda-tidak-memenuhi-syarat)
  - [5. Ringkasan Keputusan](#5-ringkasan-keputusan)
- [Bagian II — Persiapan: Instalasi Tool](#bagian-ii--persiapan-instalasi-tool)
  - [6. Daftar Tool dan Tautan Unduhan](#6-daftar-tool-dan-tautan-unduhan)
    - [6.1 Dart SDK (Skenario Ringan, Standar, dan Lengkap)](#61-dart-sdk-skenario-ringan-standar-dan-lengkap)
    - [6.2 Flutter SDK (Skenario Standar dan Lengkap)](#62-flutter-sdk-skenario-standar-dan-lengkap)
    - [6.3 Visual Studio Code (Semua Skenario)](#63-visual-studio-code-semua-skenario)
    - [6.4 Google Chrome (Skenario Standar dan Lengkap — target web)](#64-google-chrome-skenario-standar-dan-lengkap--target-web)
    - [6.5 Android Studio + Android SDK + Emulator (Hanya Skenario Lengkap)](#65-android-studio--android-sdk--emulator-hanya-skenario-lengkap)
    - [6.6 Perangkat Fisik Android (Opsional, semua skenario dengan target fisik)](#66-perangkat-fisik-android-opsional-semua-skenario-dengan-target-fisik)
  - [7. Verifikasi Kesehatan Environment](#7-verifikasi-kesehatan-environment)
    - [7.1 Cek Versi](#71-cek-versi)
    - [7.2 Jalankan `flutter doctor`](#72-jalankan-flutter-doctor)
    - [7.3 Cek Perangkat yang Tersedia](#73-cek-perangkat-yang-tersedia)
    - [7.4 Cek RAM dan Disk (Opsional)](#74-cek-ram-dan-disk-opsional)
- [Bagian III — Praktikum: Menggunakan Flutter](#bagian-iii--praktikum-menggunakan-flutter)
  - [8. Membuka Folder Proyek](#8-membuka-folder-proyek)
  - [9. Membuat Project Flutter Pertama](#9-membuat-project-flutter-pertama)
  - [10. Menyiapkan Perangkat Uji](#10-menyiapkan-perangkat-uji)
    - [10.1 Emulator Android](#101-emulator-android)
    - [10.2 Perangkat Android fisik](#102-perangkat-android-fisik)
  - [11. Menjalankan Program](#11-menjalankan-program)
  - [12. Menguji Perubahan dengan Hot Reload](#12-menguji-perubahan-dengan-hot-reload)
  - [13. Menjalankan dari VS Code](#13-menjalankan-dari-vs-code)
- [Bagian IV — Penunjang](#bagian-iv--penunjang)
  - [14. Latihan Dasar Dart di Browser (DartPad)](#14-latihan-dasar-dart-di-browser-dartpad)
  - [15. Mengatasi Error Umum](#15-mengatasi-error-umum)
    - [`flutter: command not found`](#flutter-command-not-found)
    - [`flutter doctor` menandai Android toolchain](#flutter-doctor-menandai-android-toolchain)
    - [`No devices found` saat `flutter run`](#no-devices-found-saat-flutter-run)
    - [Build pertama lambat atau terhenti](#build-pertama-lambat-atau-terhenti)
    - [`Unable to locate Android SDK`](#unable-to-locate-android-sdk)
    - [Hot reload tidak menerapkan perubahan](#hot-reload-tidak-menerapkan-perubahan)
  - [16. Troubleshooting Kapasitas](#16-troubleshooting-kapasitas)
  - [17. Catatan Penting](#17-catatan-penting)
  - [18. Catatan untuk Pengelola Kelas / Lab](#18-catatan-untuk-pengelola-kelas--lab)

---

# Bagian I — Perencanaan: Memilih Skenario Instalasi

## 1. Pendahuluan

Proyek ini berisi materi dan contoh praktikum **Pemrograman Aplikasi Bergerak** menggunakan Flutter dan Dart. Dokumen ini membantu Anda: (a) memilih skenario instalasi yang sesuai dengan kapasitas laptop atau komputer lab, dan (b) menyiapkan serta menggunakan lingkungan pengembangan untuk praktikum.

Praktikum PAB dapat dilakukan **tanpa emulator** (target web atau perangkat fisik), sehingga beban instalasi bervariasi tergantung skenario yang dipilih. Untuk materi awal, target web (`flutter run -d chrome`) dapat digunakan sebagai alternatif yang setara untuk menguji aplikasi tanpa perlu emulator. Praktikum pada pertemuan awal menggunakan project Flutter bawaan, sehingga belum membutuhkan `package` tambahan.

**Sasaran pengguna dokumen ini:**

| Sasaran | Tujuan penggunaan |
|:--------|:------------------|
| Mahasiswa | Menentukan skenario instalasi, menyiapkan tool, dan mengikuti alur kerja praktikum |
| Pengelola lab | Menyiapkan lingkungan lab sebelum praktikum dimulai |
| Dosen/asisten | Merujuk standar lingkungan dan penanganan kendala teknis |

## 2. Tiga Skenario Instalasi

Tiga skenario tersedia:

| Skenario | Peruntukan | Beban instalasi |
|:---------|:-----------|:----------------|
| **Ringan** | Laptop low-end, lab komputer terbatas, atau hanya materi Pertemuan 1–2 | ~200 MB – 1 GB |
| **Standar** | Praktikum Flutter dengan target web (Chrome) | ~1–3 GB |
| **Lengkap** | Praktikum Flutter dengan target web + perangkat fisik/emulator (opsional) | ~15–25 GB |

Pilih satu skenario sesuai kapasitas mesin Anda. Skenario ringan dan standar tidak memerlukan Android Studio atau emulator.

Flutter SDK adalah kumpulan tool untuk membangun aplikasi dengan Flutter. Dart SDK ikut terpasang bersama Flutter SDK, sehingga tidak perlu diinstal terpisah bila Anda memilih skenario standar atau lengkap. Untuk skenario ringan, Anda cukup menggunakan `DartPad` atau `Dart SDK` tanpa instalasi Flutter penuh. Jika laptop Anda tidak sanggup menjalankan emulator, pilih target web atau DartPad dan lanjutkan materi sesuai kebutuhan.

> **Catatan:** Praktikum PAB dapat berjalan tanpa emulator; target web (`flutter run -d chrome`) adalah alternatif yang setara. Pada pertemuan awal, emulator bukan prasyarat karena materi dapat dilakukan dengan DartPad, Dart SDK, atau target web. Peta kebutuhan environment per rentang pertemuan disajikan pada [Bagian 2.1](#21-peta-kebutuhan-environment-per-pertemuan).

### 2.1 Peta Kebutuhan Environment per Pertemuan

Berdasarkan [`TIMELINE.md`](../TIMELINE.md), berikut rentang pertemuan beserta skenario minimum yang dibutuhkan. Urutan pertemuan sama untuk SI-VIIB (Rabu) dan SI-VIIA (Sabtu); tanggal lengkap merujuk pada timeline.

| Rentang Minggu | Fokus Materi | Skenario Minimum | Keterangan |
|:---------------|:-------------|:-----------------|:-----------|
| 1–2 | Konsep aplikasi bergerak; dasar pemrograman Dart | **Ringan** | DartPad atau Dart SDK sudah cukup; belum memerlukan Flutter SDK |
| 3–8 | Struktur Flutter & widget, analisis kebutuhan, UI/UX, navigasi & interaksi, pengelolaan data lokal, UTS | **Standar** | Flutter SDK + target web (Chrome) memfasilitasi seluruh materi |
| 9–10 | Integrasi REST API; integrasi data & proses bisnis SI | **Standar** | Target web dapat digunakan; perangkat fisik/emulator disarankan saat backend dijalankan di mesin lokal |
| **11** | **Fitur perangkat: kamera, lokasi, file, notification** | **Lengkap** | **Wajib perangkat fisik atau emulator** — plugin fitur perangkat tidak berfungsi pada target web. Perangkat fisik disarankan untuk kamera; emulator memadai untuk lokasi (simulasi) dan notification |
| 12 | Validasi & keamanan praktis: permission, secure storage | **Lengkap** | Permission runtime dan secure storage perlu diuji pada perangkat/emulator |
| 13–16 | Testing & debugging runtime, finalisasi project, demo, presentasi, UAS | **Lengkap (disarankan)** | Pengujian runtime dan demo final paling representatif dijalankan di perangkat |

> **Rencanakan dari awal:** skenario lengkap baru menjadi kebutuhan utama mulai **Minggu 11 (fitur perangkat)**. Mahasiswa dengan laptop terbatas tetap dapat mengikuti Minggu 1–10 dengan skenario ringan atau standar, lalu beralih ke lab komputer atau perangkat fisik pribadi untuk Minggu 11 ke atas.

## 3. Perkiraan Konsumsi Disk dan RAM per Skenario

### 3.1 Windows

| Skenario | Komponen yang diinstal | Disk (kira-kira) | RAM minimum | RAM disarankan |
|:---------|:-----------------------|:-----------------|:------------|:---------------|
| Ringan | Dart SDK | ~200 MB | 2 GB | 4 GB |
| Standar | Flutter SDK + Dart SDK + VS Code + Chrome | ~1–2 GB | 4 GB | 8 GB |
| Lengkap | + Android Studio + Android SDK + AVD (emulator) | ~15–25 GB | 8 GB | 16 GB |

**Catatan penempatan folder di Windows:**

| Komponen | Lokasi disarankan | Alasannya |
|:---------|:------------------|:----------|
| Flutter SDK (`C:\flutter` atau `D:\flutter`) | SSD | Build Flutter melibatkan banyak I/O file kecil; SSD lebih responsif |
| Project Flutter (workspace mahasiswa) | SSD | Folder kerja VS Code sebaiknya di SSD |
| Android SDK (`C:\Users\<user>\AppData\Local\Android\Sdk`) | HDD (bila tersedia) | Jarang diakses saat development, hanya saat build; ukuran besar |
| Gradle cache (`C:\Users\<user>\.gradle\caches`) | HDD (bila tersedia) | Cache build dapat mencapai beberapa GB; tidak membutuhkan I/O cepat |

Jika hanya ada SSD 128 GB, disarankan memilih skenario standar (tanpa Android SDK). Skenario lengkap hanya layak jika SSD 256 GB atau lebih, atau Android SDK dan Gradle cache dipindahkan ke HDD.

### 3.2 macOS

| Skenario | Komponen yang diinstal | Disk (kira-kira) | RAM minimum | RAM disarankan |
|:---------|:-----------------------|:-----------------|:------------|:---------------|
| Ringan | Dart SDK | ~200 MB | 2 GB | 4 GB |
| Standar | Flutter SDK + Dart SDK + VS Code + Chrome | ~1–3 GB | 4 GB | 8 GB |
| Lengkap | + Android Studio + Android SDK + AVD (emulator) | ~15–25 GB | 8 GB | 16 GB |

**Catatan:**

- Pada macOS, semua komponen berada di satu filesystem (tidak ada pilihan partisi terpisah). Letakkan Flutter SDK di home directory (`~/flutter`).
- Android SDK default berada di `~/Library/Android/sdk`.
- Build Flutter web lebih ringan dibandingkan build Android; skenario standar lebih cocok untuk laptop Mac dengan RAM 8 GB.
- Jika menggunakan Mac dengan chip Apple Silicon (M1/M2), pilih Flutter versi yang mendukung ARM64 (tersedia otomatis sejak Flutter 3.x).

### 3.3 Linux (Ubuntu/Debian)

| Skenario | Komponen yang diinstal | Disk (kira-kira) | RAM minimum | RAM disarankan |
|:---------|:-----------------------|:-----------------|:------------|:---------------|
| Ringan | Dart SDK | ~200 MB | 2 GB | 4 GB |
| Standar | Flutter SDK + Dart SDK + VS Code + Chrome | ~1–3 GB | 4 GB | 8 GB |
| Lengkap | + Android Studio + Android SDK + AVD (memerlukan KVM) | ~15–25 GB | 8 GB | 16 GB |

**Catatan:**

- Emulator Android di Linux memerlukan **KVM** (Kernel-based Virtual Machine) untuk kinerja yang memadai. Periksa dukungan KVM dengan perintah `egrep -c '(svm|vmx)' /proc/cpuinfo` (harus mengembalikan nilai ≥ 1).
- Jika KVM tidak tersedia, emulator akan berjalan sangat lambat — disarankan memilih skenario standar (target web) atau perangkat fisik.

## 4. Syarat Minimum Laptop untuk Mahasiswa

Gunakan tabel berikut untuk menilai apakah laptop Anda memenuhi syarat.

| Aspek | Skenario Ringan | Skenario Standar | Skenario Lengkap |
|:------|:----------------|:-----------------|:-----------------|
| **OS** | Windows 10/11, macOS 12+, Linux (Ubuntu 20.04+) | Sama | Sama |
| **RAM** | 2 GB (minimum), 4 GB (disarankan) | 4 GB (minimum), 8 GB (disarankan) | 8 GB (minimum), 16 GB (disarankan) |
| **Storage free** | 1 GB | 5 GB | 25 GB |
| **CPU** | x86_64 / ARM64 | Sama | Sama + virtualisasi CPU aktif (VT-x/AMD-V) untuk emulator |
| **Koneksi internet** | Stabil (download Dart/Flutter ~200 MB – 1 GB) | Sama | Sama |

### 4.1 Jika laptop Anda tidak memenuhi syarat

| Kondisi | Alternatif yang tersedia |
|:--------|:-------------------------|
| RAM < 2 GB | Gunakan [DartPad](https://dartpad.dev/) — editor Dart di browser, tanpa instalasi apa pun. Cukup untuk materi Pertemuan 1–2 (sintaks Dart dasar). |
| Storage < 5 GB | Pilih skenario ringan saja (Dart CLI). Skip instalasi Flutter SDK. |
| Storage < 25 GB | Pilih skenario standar (tanpa emulator). Jalankan aplikasi di target web (`flutter run -d chrome`). |
| CPU tidak mendukung virtualisasi (untuk skenario lengkap) | Gunakan target web atau perangkat fisik; emulator tidak dapat dijalankan. |
| Tidak memenuhi semua syarat | Praktikum di **lab komputer** kampus dengan skenario standar. |

> **Penting:** Mahasiswa yang tidak mampu melakukan instalasi penuh tetap dapat mengikuti seluruh materi PAB dengan skenario ringan (DartPad) atau standar (target web). Skenario lengkap dengan emulator bersifat **opsional**, bukan prasyarat nilai.

## 5. Ringkasan Keputusan

Gunakan tabel berikut untuk memilih skenario secara cepat:

| Kondisi Anda | Skenario yang direkomendasikan |
|:-------------|:-------------------------------|
| Laptop hanya untuk browsing, RAM 2 GB | **Ringan** — pakai DartPad di browser |
| Laptop RAM 4 GB, storage 10 GB | **Standar** — install Flutter SDK, target web (Chrome) |
| Laptop RAM 8 GB+, storage 30 GB+ | **Lengkap** — install Android Studio + emulator, atau tetap target web bila lebih ringan |
| Lab komputer kampus | **Standar** — target web; emulator biasanya tidak tersedia di lab |
| Tidak ada laptop pribadi | Gunakan **lab komputer** dengan skenario standar; untuk materi Pertemuan 2 (Dart dasar), cukup DartPad |

---

# Bagian II — Persiapan: Instalasi Tool

## 6. Daftar Tool dan Tautan Unduhan

Berikut tool yang diperlukan per skenario, dengan tautan unduhan resmi.

### 6.1 Dart SDK (Skenario Ringan, Standar, dan Lengkap)

Dart SDK disertakan dalam instalasi Flutter SDK, sehingga tidak perlu diunduh terpisah jika Anda memilih skenario standar atau lengkap. Untuk skenario ringan saja, unduh Dart SDK:

- [Dart SDK — unduhan per platform](https://dart.dev/get-dart)
- Alternatif instalasi via manajer paket:
  - macOS: `brew install dart`
  - Linux (Ubuntu): `sudo apt install dart` (jika tersedia di repository) atau unduh langsung dari tautan di atas
  - Windows: unduh dari tautan resmi di atas

### 6.2 Flutter SDK (Skenario Standar dan Lengkap)

- [Flutter SDK — instalasi per OS](https://docs.flutter.dev/get-started/install)
- Halaman instalasi menyediakan langkah untuk **Windows**, **macOS**, dan **Linux**.
- Cara paling praktis: unduh arsip dari [Flutter Downloads](https://docs.flutter.dev/get-started/install/desktop), ekstrak, dan tambahkan `flutter/bin` ke PATH.
- Alternatif via Homebrew (macOS): `brew install --cask flutter`

### 6.3 Visual Studio Code (Semua Skenario)

- [VS Code — unduhan](https://code.visualstudio.com/Download)
- Ekstensi yang perlu dipasang di VS Code:
  - [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) — perintah Flutter, hot reload, dan debugging
  - [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) — dukungan bahasa Dart (ikut terpasang bersama extensi Flutter)

### 6.4 Google Chrome (Skenario Standar dan Lengkap — target web)

- [Chrome — unduhan](https://www.google.com/chrome/)
- Diperlukan untuk menjalankan `flutter run -d chrome`.

### 6.5 Android Studio + Android SDK + Emulator (Hanya Skenario Lengkap)

Komponen ini hanya diperlukan jika Anda ingin menjalankan aplikasi di **emulator Android** (AVD). Jika Anda memilih target web atau perangkat fisik, bagian ini dapat dilewati.

- [Android Studio — unduhan](https://developer.android.com/studio)
- [Android SDK Command-line Tools](https://developer.android.com/studio/releases/command-line-tools)
- Setelah instalasi Android Studio:
  1. Buka **Tools > SDK Manager**.
  2. Pasang **Android SDK Platform** dan **Android Emulator**.
  3. Buat **Virtual Device (AVD)** — misalnya Pixel 7, API level 34.
- Alternatif tanpa Android Studio (hanya SDK command-line):
  - Unduh [Android SDK command-line tools](https://developer.android.com/studio/releases/command-line-tools)
  - Pasang platform dan emulator melalui `sdkmanager`
  - Jalankan emulator dengan `emulator -avd <nama-avd>`

> **Catatan:** Emulator membutuhkan virtualisasi CPU (Intel VT-x / AMD-V) yang aktif di BIOS. Jika virtualisasi tidak diaktifkan, emulator tidak akan berjalan.

### 6.6 Perangkat Fisik Android (Opsional, semua skenario dengan target fisik)

Tidak ada unduhan tambahan — cukup:

1. Aktifkan **Developer Options** pada ponsel Android (Settings > About Phone > ketuk Build Number 7 kali).
2. Aktifkan **USB Debugging** di Developer Options.
3. Sambungkan ponsel ke komputer dengan kabel USB.
4. Setujui dialog otorisasi yang muncul di ponsel.
5. Verifikasi dengan `flutter devices`.

**Prasyarat umum sebelum praktikum:** VS Code dengan ekstensi Flutter dan Dart, terminal atau Command Prompt, serta — untuk skenario standar/lengkap — Flutter SDK versi 3.x (termasuk Dart SDK). Chrome untuk target web bila tidak menggunakan emulator; Android Studio + emulator atau perangkat fisik Android hanya bila memilih skenario lengkap atau target fisik.

## 7. Verifikasi Kesehatan Environment

Setelah instalasi, periksa kesiapan environment dengan langkah berikut.

### 7.1 Cek Versi

```bash
flutter --version
dart --version
```

Pastikan versi Flutter **stable** terbaru agar sesuai dengan materi dan package pada pertemuan berikutnya.

### 7.2 Jalankan `flutter doctor`

```bash
flutter doctor
```

Perintah `flutter doctor` menampilkan laporan keadaan seluruh komponen: Flutter SDK, Android toolchain, editor, dan perangkat yang tersedia. Periksa laporan:

- Bagian bertanda **✓** berarti komponen siap digunakan.
- Bagian bertanda **✗** harus diperbaiki sebelum lanjut ke praktikum. Perbaiki setiap bagian yang bertanda ✗ sebelum lanjut.

Pada Windows, buka kembali terminal setelah instalasi jika perintah belum dikenali. Untuk skenario tanpa emulator, fokus utama adalah memastikan Flutter SDK dan Chrome dapat terdeteksi dengan benar.

Contoh perbaikan umum (lihat juga [Bagian 15](#15-mengatasi-error-umum)):

| Masalah | Perbaikan |
|:--------|:----------|
| `Flutter command not found` | Tambahkan folder `flutter/bin` ke variabel PATH; tutup dan buka kembali terminal |
| `Some Android licenses not accepted` | Jalankan `flutter doctor --android-licenses` dan jawab `y` |
| `No devices found` | Jalankan `flutter devices`; pastikan emulator aktif atau perangkat fisik tersambung |
| `Unable to locate Android SDK` | Instal Android Studio (mengikut sertakan SDK) atau pasang SDK Command-line Tools saja |

### 7.3 Cek Perangkat yang Tersedia

```bash
flutter devices
```

Daftar perangkat yang dapat dijadikan target:

- **Chrome** — untuk target web (skenario standar)
- **Perangkat Android fisik** — terhubung via USB
- **AVD (emulator)** — hanya jika skenario lengkap dan emulator berjalan

### 7.4 Cek RAM dan Disk (Opsional)

| OS | Perintah |
|:---|:---------|
| macOS / Linux | `free -h` (RAM) dan `df -h /` (disk) |
| Windows | Buka **Task Manager** (Ctrl+Shift+Esc) untuk RAM; buka **File Explorer > This PC** untuk kapasitas disk |

Gunakan hasil untuk memastikan Anda memiliki ruang dan memori yang cukup sesuai skenario pilihan.

---

# Bagian III — Praktikum: Menggunakan Flutter

## 8. Membuka Folder Proyek

Buka terminal pada folder `PAB`:

```bash
cd /path/ke/Materi/PAB
```

Ganti `/path/ke/Materi` sesuai lokasi folder pada komputer masing-masing. Di VS Code, folder proyek juga dapat dibuka melalui menu **File > Open Folder**.

Project Flutter Pertemuan 1 berada pada folder berikut:

```text
code/pertemuan-01/
```

## 9. Membuat Project Flutter Pertama

Jalankan perintah berikut dari root proyek:

```bash
flutter create pab_p1_<nim>
cd pab_p1_<nim>
```

Ganti `<nim>` dengan NIM Anda. Struktur folder yang penting:

```text
pab_p1_<nim>/
├── lib/
│   └── main.dart          # titik masuk aplikasi
├── pubspec.yaml           # konfigurasi project dan dependency
├── android/               # konfigurasi khusus Android
├── ios/                   # konfigurasi khusus iOS
└── test/                  # unit test
```

Ganti isi `lib/main.dart` dengan kode dari `code/pertemuan-01/main.dart`, atau gunakan sebagai pembanding dengan aplikasi counter bawaan.

## 10. Menyiapkan Perangkat Uji

Aplikasi Flutter dapat dijalankan pada target web, emulator, atau perangkat fisik. Pada tahap awal praktikum, emulator tidak wajib; target web (`flutter run -d chrome`) atau DartPad sudah cukup untuk materi dasar. Periksa daftar perangkat yang tersedia dengan `flutter devices` (lihat [Bagian 7.3](#73-cek-perangkat-yang-tersedia)).

### 10.1 Emulator Android

1. Buka **Android Studio > More Actions > Virtual Device Manager**.
2. Buat perangkat virtual (AVD) baru, misalnya Pixel 7 dengan API level terbaru yang tersedia.
3. Jalankan AVD dari tombol ▶, lalu periksa kembali `flutter devices`.

### 10.2 Perangkat Android fisik

1. Aktifkan **Developer Options** melalui **Settings > About Phone > Build Number** (ketuk 7 kali).
2. Aktifkan **USB Debugging** pada menu Developer Options.
3. Sambungkan ponsel ke komputer, lalu setujui dialog otorisasi yang muncul di ponsel.
4. Periksa kembali `flutter devices`.

## 11. Menjalankan Program

Aplikasi dijalankan dari dalam folder project:

```bash
flutter run
```

Jika terdapat lebih dari satu perangkat, pilih target yang diminta:

```bash
flutter run -d <device-id>
```

Perintah di atas mengompilasi kode, memasang aplikasi pada perangkat, lalu membuka sesi interaktif. Selama sesi berjalan:

| Tombol | Fungsi |
|:-------|:-------|
| `r` | Hot reload — menerapkan perubahan kode tanpa mengulang aplikasi |
| `R` | Hot restart — mengulang aplikasi dari awal (keadaan diatur ulang) |
| `q` | Menghentikan aplikasi dan keluar dari sesi |

Untuk menjalankan aplikasi counter bawaan tanpa mengubah apa pun:

```bash
flutter create app_counter
cd app_counter
flutter run
```

## 12. Menguji Perubahan dengan Hot Reload

1. Buka `lib/main.dart`.
2. Ubah teks pada widget `Text`, misalnya menjadi `Halo, Flutter!`.
3. Simpan berkas (`Ctrl+S` / `Cmd+S`) — perubahan tampil dalam hitungan detik.
4. Tekan `R` di terminal dan amati perbedaannya dengan hot reload.

## 13. Menjalankan dari VS Code

1. Buka folder project (`pab_p1_<nim>`) di VS Code.
2. Pastikan plugin **Flutter** dan **Dart** sudah terpasang.
3. Pilih perangkat pada bilah status kanan bawah (atau `Ctrl+Shift+P` > **Flutter: Launch Emulator**).
4. Tekan `F5` untuk menjalankan dengan debugger, atau buka terminal dan jalankan `flutter run`.

Ekstensi yang disarankan (lihat juga [Bagian 6.3](#63-visual-studio-code-semua-skenario)):

- [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) — perintah Flutter, hot reload, dan debugging
- [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) — dukungan bahasa Dart (ikut terpasang bersama plugin Flutter)

---

# Bagian IV — Penunjang

## 14. Latihan Dasar Dart di Browser (DartPad)

Jika Anda ingin mencoba kode Dart tanpa menunggu proses setup emulator atau perangkat, gunakan [DartPad](https://dartpad.dev/). DartPad menjalankan kode Dart secara langsung di browser, sehingga tidak memerlukan instalasi Flutter SDK maupun emulator.

1. Buka [dartpad.dev](https://dartpad.dev/) di browser.
2. Tulis atau salin kode Dart dasar (variabel, fungsi, kontrol alur, collection).
3. Tekan **Run** untuk melihat keluaran di panel console.

Contoh yang dapat dicoba:

```dart
void main() {
  final nama = 'DartPad';
  final buku = ['Flutter', 'Dart', 'Material Design'];

  print('Halo, $nama!');
  print('Jumlah buku: ${buku.length}');

  for (var i = 0; i < buku.length; i++) {
    print('${i + 1}. ${buku[i]}');
  }
}
```

Hasil yang diharapkan:

```text
Halo, DartPad!
Jumlah buku: 3
1. Flutter
2. Dart
3. Material Design
```

DartPad hanya mendukung kode Dart yang dapat dieksekusi secara mandiri. Kode Flutter (widget, `MaterialApp`, `Scaffold`) tetap harus dijalankan melalui `flutter run` pada project Flutter.

## 15. Mengatasi Error Umum

### `flutter: command not found`

Flutter SDK belum terpasang atau belum masuk ke PATH. Tambahkan folder `flutter/bin` ke variabel PATH sesuai sistem operasi Anda, lalu tutup dan buka kembali terminal.

### `flutter doctor` menandai Android toolchain

Pesan yang sering muncul: `android-license-administrator` atau `Some Android licenses not accepted`. Selesaikan dengan:

```bash
flutter doctor --android-licenses
```

Jawab `y` pada setiap pertanyaan. Jika toolchain masih bermasalah, pastikan **Android Studio** dan **Android SDK Command-line Tools** terpasang melalui **Android Studio > Settings > Languages & Frameworks > Android SDK > SDK Tools**.

### `No devices found` saat `flutter run`

Tidak ada emulator yang berjalan dan tidak ada perangkat fisik yang tersambung. Jalankan AVD dari Android Studio atau sambungkan ponsel dengan USB Debugging aktif, lalu periksa `flutter devices`.

### Build pertama lambat atau terhenti

Proses build pertama mengunduh komponen Gradle dan Android SDK sehingga membutuhkan waktu lebih lama. Pastikan koneksi internet stabil dan tunggu hingga selesai. Jika terhenti karena network, periksa koneksi atau ulangi perintah.

### `Unable to locate Android SDK`

Android SDK belum terpasang. Instal Android Studio (yang menyertakan SDK) atau pasang SDK Command-line Tools saja, lalu jalankan kembali `flutter doctor`.

### Hot reload tidak menerapkan perubahan

Pastikan aplikasi dijalankan melalui `flutter run` atau `F5` (bukan aplikasi yang sudah di-install sebelumnya), dan berkas yang diubah sudah tersimpan. Jika perubahan terkait `main()` atau variabel global, gunakan hot restart (`R`) karena hot reload tidak menjalankan ulang `main()`.

## 16. Troubleshooting Kapasitas

| Gejala | Kemungkinan penyebab | Langkah perbaikan |
|:-------|:---------------------|:------------------|
| Build pertama sangat lambat atau gagal | Unduhan komponen Gradle/Android SDK terputus | Pastikan koneksi stabil; ulangi `flutter run` |
| Disk penuh saat build | Cache Gradle dan `.dart_tool` menumpuk | Jalankan `flutter clean`; hapus folder `build/`; pindahkan Gradle cache ke HDD (Windows) |
| Emulator error / tidak muncul | RAM tidak mencukupi atau virtualisasi CPU tidak aktif | Kurangi RAM AVD (2–4 GB); periksa virtualisasi di BIOS; jika tetap gagal, gunakan target web |
| `flutter run -d chrome` tidak bisa menjalankan | Chrome tidak terpasang atau tidak terdaftar | Pasang [Chrome](https://www.google.com/chrome/); verifikasi dengan `flutter devices` |
| Flutter tidak terdeteksi di VS Code | Ekstensi Dart/Flutter belum aktif | Reload window VS Code (`Ctrl+Shift+P` > **Developer: Reload Window**) |
| RAM laptop terlalu kecil untuk skenario lengkap | Laptop tidak memenuhi 8 GB | Beralih ke skenario standar (web) atau lab komputer |

## 17. Catatan Penting

- Gunakan versi Flutter **stable** terbaru agar sesuai dengan materi dan package pada pertemuan berikutnya.
- Jangan menonaktifkan USB Debugging saat perangkat masih dipakai untuk pengembangan.
- Perhatikan huruf besar dan kecil pada nama folder, nama berkas, dan perintah `flutter`.
- Simpan project di lokasi tanpa spasi pada nama folder untuk menghindari masalah build pada beberapa sistem.

## 18. Catatan untuk Pengelola Kelas / Lab

- Lab komputer sebaiknya sudah terpasang **Flutter SDK + VS Code + Chrome** (skenario standar) sebelum praktikum dimulai.
- Jika lab tidak dapat menjalankan emulator, target web (`flutter run -d chrome`) menjadi alternatif yang setara untuk seluruh materi PAB.
- Mahasiswa dapat mengerjakan seluruh proyek PAB menggunakan target web; perbedaan target (web vs Android fisik) tidak memengaruhi logika aplikasi Flutter.
- Untuk skenario perangkat fisik, mahasiswa menyiapkan ponsel Android sendiri; tidak diperlukan unduhan tambahan di komputer.
