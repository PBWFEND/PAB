# Glosarium PAB

Glosarium ini menjelaskan istilah yang sering digunakan dalam materi Pemrograman Aplikasi Bergerak. Gunakan dokumen ini ketika menemukan istilah yang belum dipahami pada materi, panduan instalasi, atau kode praktikum.

Jika istilah yang Anda cari belum tersedia, sampaikan kepada dosen pengampu agar dapat ditambahkan pada pembaruan berikutnya.

## A

### Android SDK

Kumpulan alat untuk membuat, membangun, dan menguji aplikasi Android. Android SDK diperlukan ketika aplikasi Flutter dijalankan pada emulator Android atau perangkat Android.

### API

Antarmuka yang mengatur cara satu program meminta layanan atau data dari program lain. Pada aplikasi mobile, API sering digunakan untuk menghubungkan aplikasi dengan backend Sistem Informasi.

### AVD (Android Virtual Device)

Konfigurasi perangkat Android virtual yang dijalankan melalui emulator. AVD dapat memiliki model perangkat, ukuran layar, dan versi Android tertentu.

## C

### Compiler

Program yang menerjemahkan kode sumber menjadi bentuk yang dapat dijalankan oleh platform tertentu. Flutter menggunakan compiler Dart untuk membangun aplikasi pada target seperti web, Android, dan iOS.

## D

### Dart

Bahasa pemrograman yang digunakan untuk menulis kode Flutter. Dart menyediakan fitur seperti variabel, fungsi, class, asynchronous programming, dan null safety.

### Debugging

Proses menemukan penyebab error atau perilaku program yang tidak sesuai, kemudian memperbaikinya melalui pemeriksaan kode dan pengujian.

### Dependency

Library atau package tambahan yang digunakan oleh project. Dependency dicatat dalam `pubspec.yaml` dan dikelola menggunakan perintah `flutter pub` atau `dart pub`.

## E

### Emulator

Program yang mensimulasikan perangkat tertentu pada komputer. Emulator Android dapat digunakan untuk menjalankan dan menguji aplikasi tanpa perangkat Android fisik.

## F

### Framework

Kerangka kerja yang menyediakan struktur, komponen, dan aturan untuk membangun aplikasi. Flutter adalah framework UI yang menggunakan Dart.

## H

### Hot reload

Fitur Flutter yang menerapkan perubahan kode ke aplikasi yang sedang berjalan tanpa memulai ulang seluruh aplikasi. Fitur ini membantu proses pengembangan dan pengujian tampilan.

### Hot restart

Fitur Flutter yang menjalankan ulang aplikasi dari awal dan menghapus state yang sedang tersimpan. Gunakan hot restart ketika perubahan tidak dapat diterapkan melalui hot reload.

## I

### IDE (Integrated Development Environment)

Aplikasi yang menyediakan editor kode, bantuan penulisan, debugging, dan alat untuk menjalankan project. Contoh IDE yang digunakan dalam materi ini adalah VS Code dan Android Studio.

### Instansiasi

Proses membuat object berdasarkan class yang telah didefinisikan. Dalam Dart, contohnya adalah `final buku = Buku();`.

### iOS Simulator

Perangkat iOS virtual yang dijalankan melalui Xcode pada macOS. Simulator digunakan untuk menguji aplikasi Flutter pada target iOS tanpa iPhone fisik.

## J

### JSON

Format teks terstruktur yang sering digunakan untuk pertukaran data antara aplikasi mobile dan backend melalui API.

## L

### Library

Kumpulan kode yang menyediakan fungsi tertentu dan dapat digunakan kembali oleh project. Library dapat berasal dari Dart SDK, Flutter SDK, atau package dari pub.dev.

## N

### Null safety

Fitur Dart yang membantu mencegah penggunaan nilai `null` secara tidak sengaja. Dart membedakan tipe yang dapat bernilai `null` dan tipe yang wajib memiliki nilai.

## P

### Package

Kumpulan kode yang dapat ditambahkan ke project untuk menyediakan fungsi tertentu. Package Dart dan Flutter biasanya tersedia melalui [pub.dev](https://pub.dev/).

### PATH

Variabel lingkungan yang berisi daftar folder tempat sistem mencari perintah seperti `flutter` dan `dart`. Flutter tidak dapat dijalankan dari terminal jika folder `flutter/bin` belum masuk ke PATH.

### Plugin atau extension

Komponen tambahan pada IDE yang memberikan dukungan untuk bahasa atau framework tertentu. Plugin Flutter dan Dart membantu IDE mengenali project, menjalankan perintah, dan menyediakan fitur debugging; plugin tidak menggantikan Flutter SDK.

### `pubspec.yaml`

Berkas konfigurasi utama project Dart atau Flutter. Berkas ini menyimpan nama project, versi, dependency, dan konfigurasi lain yang diperlukan.

## R

### REST API

API yang menggunakan pola HTTP seperti `GET`, `POST`, `PUT`, dan `DELETE` untuk mengakses atau mengubah resource pada backend.

### Runtime

Lingkungan ketika program sedang dijalankan. Perbedaan runtime, seperti web, Android, dan iOS, dapat memengaruhi fitur perangkat yang tersedia.

## S

### SDK (Software Development Kit)

Kumpulan compiler, library, command-line tool, dan komponen lain untuk mengembangkan aplikasi pada platform tertentu. Flutter SDK sudah menyertakan Dart SDK.

### State

Data yang menyimpan keadaan aplikasi pada waktu tertentu. Perubahan state dapat menyebabkan tampilan aplikasi diperbarui.

## T

### Target

Platform atau perangkat yang dipilih untuk menjalankan aplikasi, misalnya Chrome, emulator Android, iOS Simulator, atau perangkat fisik.

## W

### Widget

Komponen dasar antarmuka Flutter. Teks, tombol, layout, dan halaman aplikasi direpresentasikan sebagai widget.

## Referensi

- [Flutter documentation](https://docs.flutter.dev/) — dokumentasi resmi Flutter.
- [Dart documentation](https://dart.dev/guides) — panduan resmi bahasa Dart.
- [Dart API documentation](https://api.dart.dev/) — referensi library Dart.
- [pub.dev](https://pub.dev/) — repositori package Dart dan Flutter.

