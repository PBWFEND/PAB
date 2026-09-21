// ============================================================================
// PAB — Pertemuan 7: Latihan Data Lokal Flutter (TODO Terbimbing)
// ============================================================================
//
// Kasus: aplikasi Perpustakaan Kampus versi data lokal — daftar buku yang
// dapat ditambah dari form, diubah statusnya, dan dihapus dengan konfirmasi.
// File ini SUDAH dapat dijalankan; selesaikan setiap TODO untuk menghasilkan
// versi final sesuai spesifikasi.
//
//   Jalur 1 — DartPad (tanpa instalasi):
//     Buka https://dartpad.dev/?template=app, ganti seluruh isi panel kiri
//     dengan isi file ini, lalu tekan Run.
//
//   Jalur 2 — Flutter SDK (sesuai panduan/Panduan-Lengkap-PAB.md):
//     Gunakan file ini sebagai isi lib/main.dart pada project hasil
//     `flutter create`, lalu jalankan `flutter run` atau `flutter run -d chrome`.
//
// Setiap TODO merujuk materi Bagian 4-7 pada 07-Pertemuan-7.md.
// Pastikan hasil CRUD sesuai deskripsi pada tiap TODO.
// ============================================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Aplikasi utama.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAB — Latihan Data Lokal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HalamanDaftarBuku(),
    );
  }
}

// ============================================================
// TODO 1 — Model data:
// Definisikan class `DataBuku` dengan field final:
//   id (String), judul (String), penulis (String), status (String)
// Konstruktor dengan `required` untuk seluruh field, dan
// `toString()` yang mengembalikan 'Buku <judul> — <penulis>'.
// ============================================================

// ============================================================
// TODO 2 — State:
// Ubah `HalamanDaftarBuku` menjadi `StatefulWidget` dengan
// `State<HalamanDaftarBuku>` yang menyimpan `final List<DataBuku> _daftar = []`.
// ============================================================
class HalamanDaftarBuku extends StatelessWidget {
  const HalamanDaftarBuku({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Buku')),
      body: const Center(child: Text('Belum ada buku.')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),
    );
  }
}

// ============================================================
// TODO 3 — Create:
// Tambahkan method `tambahBuku(DataBuku buku)` pada state yang
// membungkus `_daftar.add(buku)` dengan `setState`.
// ============================================================

// ============================================================
// TODO 4 — Read:
// Ganti body layar daftar dengan `ListView.builder` yang membaca
// `_daftar` (itemCount + itemBuilder). Tampilkan judul, penulis,
// dan `ChipStatus` pada setiap `Card` + `ListTile`.
// ============================================================

// ============================================================
// TODO 5 — Update:
// Tambahkan method `ubahStatus(String id, String statusBaru)` yang
// mencari posisi dengan `indexWhere`, mengganti objek lama dengan
// objek baru (field lain disalin), dan membungkusnya dengan `setState`.
// ============================================================

// ============================================================
// TODO 6 — Delete:
// Tambahkan method `hapusBuku(String id)` yang memanggil
// `_daftar.removeWhere((b) => b.id == id)` di dalam `setState`.
// ============================================================

/// Chip status — label visual untuk status buku (tersedia/habis).
class ChipStatus extends StatelessWidget {
  const ChipStatus({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final warna = status == 'tersedia' ? Colors.green : Colors.red;
    return Chip(
      label: Text(status),
      backgroundColor: warna.withValues(alpha: 0.15),
      side: BorderSide(color: warna),
    );
  }
}
