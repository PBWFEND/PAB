# Panduan Penggunaan

Proyek ini berisi materi dan contoh praktikum **Pemrograman Aplikasi Bergerak** menggunakan Flutter dan Dart. Praktikum pada pertemuan awal menggunakan project Flutter bawaan, sehingga belum membutuhkan package tambahan.

## Persiapan

Sebelum menjalankan program, siapkan:

- Flutter SDK versi 3.x (termasuk Dart SDK)
- Visual Studio Code atau Android Studio beserta plugin Flutter
- Emulator Android (AVD) atau perangkat Android fisik
- Terminal atau Command Prompt

Flutter SDK adalah kumpulan tool untuk membangun aplikasi dengan Flutter. Dart SDK ikut terpasang bersama Flutter SDK, sehingga tidak perlu diinstal terpisah.

Unduh Flutter SDK dari [docs.flutter.dev](https://docs.flutter.dev/get-started/install). Pilih sesuai sistem operasi Anda dan ikuti langkah instalasinya.

Setelah instalasi selesai, periksa kesiapan lingkungan pengembangan:

```bash
flutter --version
flutter doctor
```

Perintah `flutter doctor` menampilkan laporan keadaan seluruh komponen: Flutter SDK, Android toolchain, editor, dan perangkat yang tersedia. Perbaiki setiap bagian yang bertanda ✗ sebelum lanjut ke praktikum. Pada Windows, buka kembali terminal setelah instalasi jika perintah belum dikenali.

## Latihan Dasar Dart di Browser (DartPad)

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

## Membuka Folder Proyek

Buka terminal pada folder `PAB`:

```bash
cd /path/ke/Materi/PAB
```

Ganti `/path/ke/Materi` sesuai lokasi folder pada komputer masing-masing. Di VS Code, folder proyek juga dapat dibuka melalui menu **File > Open Folder**.

Project Flutter Pertemuan 1 berada pada folder berikut:

```text
code/pertemuan-01/
```

## Membuat Project Flutter Pertama

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

## Menyiapkan Perangkat Uji

Aplikasi Flutter dapat dijalankan pada emulator atau perangkat fisik. Periksa daftar perangkat yang tersedia:

```bash
flutter devices
```

### Emulator Android

1. Buka **Android Studio > More Actions > Virtual Device Manager**.
2. Buat perangkat virtual (AVD) baru, misalnya Pixel 7 dengan API level terbaru yang tersedia.
3. Jalankan AVD dari tombol ▶, lalu periksa kembali `flutter devices`.

### Perangkat Android fisik

1. Aktifkan **Developer Options** melalui **Settings > About Phone > Build Number** (ketuk 7 kali).
2. Aktifkan **USB Debugging** pada menu Developer Options.
3. Sambungkan ponsel ke komputer, lalu setujui dialog otorisasi yang muncul di ponsel.
4. Periksa kembali `flutter devices`.

## Menjalankan Program

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

## Menguji Perubahan dengan Hot Reload

1. Buka `lib/main.dart`.
2. Ubah teks pada widget `Text`, misalnya menjadi `Halo, Flutter!`.
3. Simpan berkas (`Ctrl+S` / `Cmd+S`) — perubahan tampil dalam hitungan detik.
4. Tekan `R` di terminal dan amati perbedaannya dengan hot reload.

## Menjalankan dari VS Code

1. Buka folder project (`pab_p1_<nim>`) di VS Code.
2. Pastikan plugin **Flutter** dan **Dart** sudah terpasang.
3. Pilih perangkat pada bilah status kanan bawah (atau `Ctrl+Shift+P` > **Flutter: Launch Emulator**).
4. Tekan `F5` untuk menjalankan dengan debugger, atau buka terminal dan jalankan `flutter run`.

Ekstensi yang disarankan:

- [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) — perintah Flutter, hot reload, dan debugging
- [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) — dukungan bahasa Dart (ikut terpasang bersama plugin Flutter)

## Mengatasi Error Umum

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

## Catatan Penting

- Gunakan versi Flutter **stable** terbaru agar sesuai dengan materi dan package pada pertemuan berikutnya.
- Jangan menonaktifkan USB Debugging saat perangkat masih dipakai untuk pengembangan.
- Perhatikan huruf besar dan kecil pada nama folder, nama berkas, dan perintah `flutter`.
- Simpan project di lokasi tanpa spasi pada nama folder untuk menghindari masalah build pada beberapa sistem.
