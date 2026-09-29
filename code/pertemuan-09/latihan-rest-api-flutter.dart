// ============================================================================
// PAB — Pertemuan 9: Integrasi REST API — Latihan (TODO Terbimbing)
// ============================================================================
//
// Tujuan:
//   Melatih konsumsi REST API: model data dengan fromJson, pemanggilan
//   http.get, deserialisasi JSON list, dan penanganan tiga kondisi
//   antarmuka (loading, sukses, error).
//
// Konteks:
//   Aplikasi katalog buku perpustakaan — daftar buku diambil dari REST API
//   dan ditampilkan pada antarmuka. Pengguna dapat memuat ulang data dan
//   mencoba lagi saat terjadi kegagalan jaringan.
//
// Endpoint yang digunakan (API simulasi publik, aman untuk latihan):
//   GET https://jsonplaceholder.typicode.com/posts?_limit=10
//
// Cara menjalankan (DartPad — tanpa instalasi):
//   1. Buka https://dartpad.dev/?template=app
//   2. Ganti seluruh isi panel kiri dengan isi file ini.
//   3. Selesaikan setiap TODO, lalu tekan Run.
//
// Cara menjalankan (Flutter SDK — sesuai panduan/Panduan-Lengkap-PAB.md):
//   1. Tambahkan package http pada pubspec.yaml:
//        dependencies:
//          http: ^1.2.0
//      lalu jalankan: flutter pub get
//   2. Gunakan file ini sebagai isi lib/main.dart pada project hasil
//      `flutter create`.
//   3. Jalankan dari folder project (target web, tanpa emulator):
//        flutter run -d chrome
//
// Daftar TODO (6 langkah):
//   TODO 1 — Lengkapi model DataBuku dan factory constructor fromJson.
//   TODO 2 — Buat method ambilKatalog() pada class service (http.get).
//   TODO 3 — Terapkan deserialisasi JSON list menjadi List<DataBuku>.
//   TODO 4 — Kelola state loading, data sukses, dan error pada StatefulWidget.
//   TODO 5 — Tampilkan data katalog menggunakan ListView.builder dan Card.
//   TODO 6 — Tambahkan tombol "Coba Lagi" saat kondisi error terjadi.
// ============================================================================

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

/// Aplikasi utama.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog Buku API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HalamanKatalogBuku(),
    );
  }
}

// ============================================================================
// TODO 1 — Lengkapi model DataBuku dan factory constructor fromJson.
// ============================================================================

/// Model data — satu buku pada katalog perpustakaan.
///
/// Petunjuk:
///   - Tambahkan field: id (int), judul (String), penulis (String).
///   - Tulis factory constructor fromJson yang membaca key 'id', 'title',
///     dan 'body' dari response jsonplaceholder.
///   - Gunakan nilai default bila key tidak tersedia (mis. ?? 0, ?? '-').
class DataBuku {
  // TODO 1a: tambahkan konstruktor const dengan field required.
  // Contoh:
  //   const DataBuku({required this.id, required this.judul, required this.penulis});
  //   final int id;
  //   final String judul;
  //   final String penulis;

  // TODO 1b: tulis factory DataBuku.fromJson(Map<String, dynamic> json).
  // Contoh:
  //   factory DataBuku.fromJson(Map<String, dynamic> json) {
  //     return DataBuku(
  //       id: json['id'] as int? ?? 0,
  //       judul: json['title'] as String? ?? 'Tanpa Judul',
  //       penulis: json['body'] as String? ?? '-',
  //     );
  //   }
}

// ============================================================================
// TODO 2 & 3 — Service: http.get dan deserialisasi JSON list.
// ============================================================================

/// Service API katalog buku.
class KatalogService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  // TODO 2: buat method static Future<List<DataBuku>> ambilKatalog().
  // Petunjuk:
  //   - Bentuk Uri: Uri.parse('$_baseUrl/posts?_limit=10')
  //   - Kirim request: await http.get(url).timeout(const Duration(seconds: 10))
  //   - Periksa response.statusCode == 200 sebelum mengurai body.
  //   - Bungkus dengan try-catch dan lempar Exception yang informatif.

  // TODO 3: uraikan response.body menjadi List<DataBuku>.
  // Petunjuk:
  //   - final List<dynamic> dataMentah = jsonDecode(response.body) as List<dynamic>;
  //   - return dataMentah.map((item) => DataBuku.fromJson(item as Map<String, dynamic>)).toList();
}

// ============================================================================
// TODO 4, 5, 6 — Halaman katalog dengan tiga kondisi antarmuka.
// ============================================================================

/// Layar katalog buku yang mengambil data dari REST API.
class HalamanKatalogBuku extends StatefulWidget {
  const HalamanKatalogBuku({super.key});

  @override
  State<HalamanKatalogBuku> createState() => _HalamanKatalogBukuState();
}

class _HalamanKatalogBukuState extends State<HalamanKatalogBuku> {
  // TODO 4a: tambahkan tiga variabel state:
  //   bool _sedangMemuat = true;
  //   String? _pesanError;
  //   List<DataBuku> _daftar = [];

  // TODO 4b: panggil method pemuatan data pada initState.
  // Contoh:
  //   @override
  //   void initState() {
  //     super.initState();
  //     _muatData();
  //   }

  // TODO 4c: tulis method Future<void> _muatData() yang:
  //   - mengatur _sedangMemuat = true dan _pesanError = null via setState,
  //   - memanggil KatalogService.ambilKatalog() di dalam try,
  //   - menyimpan hasil ke _daftar dan _sedangMemuat = false via setState,
  //   - menangkap error ke _pesanError dan _sedangMemuat = false via setState.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Buku'),
        actions: [
          // TODO 4d: hubungkan tombol refresh ke method _muatData().
          IconButton(
            onPressed: null, // ganti null dengan _muatData
            icon: const Icon(Icons.refresh),
            tooltip: 'Muat ulang',
          ),
        ],
      ),
      // TODO 5 & 6: ganti placeholder di bawah dengan logika tiga kondisi:
      //   - bila _sedangMemuat: tampilkan Center(CircularProgressIndicator()).
      //   - bila _pesanError != null: tampilkan pesan error + tombol "Coba Lagi".
      //   - bila _daftar kosong: tampilkan teks "Data kosong."
      //   - selain itu: tampilkan ListView.builder dengan Card + ListTile.
      body: const Center(
        child: Text('Selesaikan TODO 4–6, lalu ganti widget ini.'),
      ),
    );
  }
}
