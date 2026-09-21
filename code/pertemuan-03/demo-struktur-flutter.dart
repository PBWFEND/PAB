// ============================================================================
// PAB — Pertemuan 3: Struktur Flutter dan Widget
// ============================================================================
//
// Tujuan:
//   Menunjukkan widget tree yang dibangun oleh aplikasi Flutter:
//   runApp -> MyApp -> MaterialApp -> Scaffold -> (AppBar, body).
//   File ini juga menjadi kerangka latihan individu dengan TODO terbimbing.
//
// Cara menjalankan (DartPad — tanpa instalasi):
//   1. Buka https://dartpad.dev/?template=app
//   2. Salin seluruh isi file ini ke panel kiri.
//   3. Tekan Run. Amati hasil di panel kanan.
//
// Cara menjalankan (Flutter SDK — sesuai panduan/Panduan-Lengkap-PAB.md):
//   1. Salin file ini ke lib/main.dart pada project hasil `flutter create`.
//   2. Jalankan dari folder project:
//        flutter run
//      Untuk target web: flutter run -d chrome
//
// Konsep yang ditunjukkan (Pertemuan 3):
//   - runApp        : memasang widget utama ke layar.
//   - MaterialApp   : kerangka aplikasi Material Design; mengatur tema
//                    dan halaman awal (home).
//   - Scaffold      : struktur dasar satu halaman; menyediakan appBar, body,
//                    dan area untuk floatingActionButton / bottomNavigationBar.
//   - Widget tree   : setiap widget adalah fungsi yang mengembalikan widget;
//                    widget anak ditempatkan pada parent melalui parameter
//                    (child, children).
//
// Catatan:
//   Hot reload (r) menerapkan perubahan build(); hot restart (R)
//   mengulang aplikasi dari awal.
// ============================================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Aplikasi utama. MaterialApp mengatur tema dan halaman awal.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAB — Struktur Flutter',
      debugShowCheckedModeBanner: false,
      home: const KatalogHalaman(),
    );
  }
}

/// Satu halaman aplikasi: Scaffold + AppBar + body (ListView).
///
/// Struktur widget tree yang dibangun:
///
///   MaterialApp
///   └── KatalogHalaman (Scaffold)
///       ├── AppBar:  "Katalog Buku"
///       ├── body:    ListView
///       │   ├── BukuRow: "Dasar Pemrograman Dart" (judul, penulis, stok, tombol pinjam)
///       │   ├── BukuRow: ...
///       │   └── ...
///       └── floatingActionButton: "+"
class KatalogHalaman extends StatelessWidget {
  const KatalogHalaman({super.key});

  @override
  Widget build(BuildContext context) {
    // Data katalog statis — pada materi berikutnya (minggu 7, 9)
    // data ini berasal dari penyimpanan lokal atau REST API.
    final daftarBuku = [
      {'judul': 'Dasar Pemrograman Dart', 'penulis': 'Tim PAB', 'stok': 12},
      {'judul': 'Sistem Informasi Terapan', 'penulis': 'Andi, S.Kom.', 'stok': 4},
      {'judul': 'Flutter dari Nol', 'penulis': 'Rina, M.Kom.', 'stok': 0},
      {'judul': 'Basis Data Akademik', 'penulis': 'Budi, M.T.', 'stok': 7},
    ];

    return Scaffold(
      // ----------------------------------------------------------------
      // AppBar — bilah judul di bagian atas halaman
      // ----------------------------------------------------------------
      appBar: AppBar(
        title: const Text('Katalog Buku — Perpustakaan'),
        centerTitle: true,
        // TODO 1: Tambahkan ikon "refresh" (Icons.refresh) pada sisi
        // kanan AppBar menggunakan parameter `actions`.
      ),

      // ----------------------------------------------------------------
      // Body — konten utama halaman
      // ----------------------------------------------------------------
      body: ListView.builder(
        itemCount: daftarBuku.length,
        itemBuilder: (context, index) {
          final buku = daftarBuku[index];
          return BukuRow(
            judul: buku['judul'] as String,
            penulis: buku['penulis'] as String,
            stok: buku['stok'] as int,
          );
        },
      ),

      // ----------------------------------------------------------------
      // FloatingActionButton — tombol aksi mengambang
      // ----------------------------------------------------------------
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // TODO 2: tampilkan SnackBar saat ditekan
        tooltip: 'Tambah buku',
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Satu baris pada daftar: Row berisi Column (judul + penulis) dan
/// indikator stok + tombol pinjam.
class BukuRow extends StatelessWidget {
  const BukuRow({
    required this.judul,
    required this.penulis,
    required this.stok,
  });

  final String judul;
  final String penulis;
  final int stok;

  @override
  Widget build(BuildContext context) {
    final tersedia = stok > 0;

    return ListTile(
      // Layout dasar: Row menyisipkan dua bagian secara horizontal.
      // Di sini ListTile (widget bawaan) sudah menerapkan Row secara
      // internal — bagian kiri: leading + judul + subjudul.
      leading: CircleAvatar(
        backgroundColor: tersedia ? Colors.blue : Colors.grey,
        child: Text('$stok'),
      ),
      title: Text(judul),
      subtitle: Text(
        penulis,
        style: TextStyle(
          color: tersedia ? Colors.black54 : Colors.grey,
          fontStyle: FontStyle.italic,
        ),
      ),
      // Widget anak pada sisi kanan — hanya tampil jika stok tersedia.
      // Pola ternary (mengulang materi P2) pada baris berikut.
      trailing: tersedia
          ? TextButton(
              onPressed: () {
                // TODO 3: tampilkan SnackBar berisi
                // "Peminjaman dicatat untuk $judul".
                debugPrint('Pinjam: $judul (stok $stok)');
              },
              child: const Text('Pinjam'),
            )
          : const Text('Habis', style: TextStyle(color: Colors.red)),
    );
  }
}
