// ============================================================================
// PAB — Pertemuan 3: Latihan Widget Flutter (TODO Terbimbing)
// ============================================================================
//
// Kasus: membangun halaman aplikasi Perpustakaan dari sketsa —
// mahasiswa merangkai widget yang sudah dipelajari (Scaffold, AppBar,
// Column, Row, Padding, ListView, dan Text) menjadi satu halaman.
//
// Setiap TODO harus diselesaikan sesuai spesifikasi. Setelah selesai,
// jalankan:
//
//   Jalur 1 — DartPad (tanpa instalasi):
//     Buka https://dartpad.dev/?template=app, salin seluruh file ini,
//     tekan Run.
//
//   Jalur 2 — Flutter SDK (sesuai panduan/Panduan-Lengkap-PAB.md):
//     Salin file ini ke lib/main.dart pada project hasil `flutter create`,
//     lalu jalankan `flutter run` atau `flutter run -d chrome`.
//
// Pastikan hasil tampilan sesuai deskripsi pada tiap TODO.
// ============================================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Widget akar.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAB — Latihan Widget',
      debugShowCheckedModeBanner: false,
      home: const HalamanPerpustakaan(),
    );
  }
}

/// Halaman utama aplikasi perpustakaan — bangun strukturnya langkah
/// per langkah sesuai TODO berikut.
class HalamanPerpustakaan extends StatelessWidget {
  const HalamanPerpustakaan({super.key});

  @override
  Widget build(BuildContext context) {
    // ============================================================
    // TODO 3 — Data buku
    // Deklarasikan `final daftarBuku` di sini (di dalam build,
    // sebelum return). Gunakan `List<Map<String, String>>`
    // dengan minimal 4 entri, kunci: `judul`, `penulis`, `stok`
    // (stok sebagai String agar konsisten dengan tipe
    // Map<String, String>).
    //
    // Contoh entri:
    // {'judul': '...', 'penulis': '...', 'stok': '12'}
    // ============================================================
    final daftarBuku = [
      // TODO 3 — ubah atau tambah entri sesuai domain SI Anda.
      // Minimal 4 entri dengan kunci konsisten: judul, penulis, stok.
      {'judul': 'Dasar Pemrograman Dart', 'penulis': 'Tim PAB', 'stok': '12'},
      {'judul': 'Sistem Informasi Terapan', 'penulis': 'Andi, S.Kom.', 'stok': '4'},
      {'judul': 'Flutter dari Nol', 'penulis': 'Rina, M.Kom.', 'stok': '0'},
      {'judul': 'Basis Data Akademik', 'penulis': 'Budi, M.T.', 'stok': '7'},
    ];

    // ============================================================
    // TODO 1 — Scaffold + AppBar
    // Balikan `Scaffold` dengan `appBar` berisi `AppBar` yang
    // menampilkan teks "Perpustakaan Kampus" (centerTitle: true).
    // ============================================================
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perpustakaan Kampus'),
        centerTitle: true,
      ),

      // ============================================================
      // TODO 2 — Body: Column dengan tiga bagian
      // Isi `body` dengan `Column` yang berisi (atas ke bawah):
      //   a. `Text` sapaan: "Halo, Pengguna!"
      //   b. `SizedBox(height: 16)`
      //   c. `ListView` dari daftar buku di bawah
      // Tambahkan `mainAxisAlignment: MainAxisAlignment.start`.
      //
      // PENTING: saat `ListView` ditambahkan ke dalam `Column`,
      // hapus `const` dari `Column(...)` karena `ListView`
      // (dengan `shrinkWrap: true`) tidak dapat menjadi const.
      // Gunakan `shrinkWrap: true` pada `ListView` agar tidak
      // terjadi RenderFlex overflow.
      // ============================================================
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Halo, Pengguna!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          // ============================================================
          // TODO 4 — ListView.builder
          // Ganti placeholder di TODO 2c dengan `ListView.builder` yang:
          //   - `itemCount` = panjang daftarBuku
          //   - `itemBuilder` mengembalikan `BukuListTile`
          //
          // `BukuListTile` didefinisikan di bawah — lengkapi
          // parameter required-nya dari data `daftarBuku[index]`.
          // ============================================================
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: daftarBuku.length,
            itemBuilder: (context, index) {
              final buku = daftarBuku[index];
              return BukuListTile(
                judul: buku['judul']!,
                penulis: buku['penulis']!,
                stok: buku['stok']!,
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Satu baris buku: Row berisi leading (ikon), Column (judul + penulis),
/// dan trailing (teks stok).
class BukuListTile extends StatelessWidget {
  const BukuListTile({
    super.key,
    required this.judul,
    required this.penulis,
    required this.stok,
  });

  final String judul;
  final String penulis;
  final String stok;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // TODO 5 — Tambahkan padding horizontal 16, vertikal 8
      // menggunakan `EdgeInsets.symmetric(horizontal: 16, vertical: 8)`.
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.menu_book),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(judul, style: const TextStyle(fontSize: 15)),
                Text(
                  penulis,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
          // TODO 6 — Ganti `stok` tetap dengan `Text` yang menampilkan
          // teks stok, berwarna abu-abu jika stok == '0', biru jika > 0.
          // Gunakan ekspresi ternary (mengulang materi P2).
          Text(
            'Stok: $stok',
            style: TextStyle(
              color: stok == '0' ? Colors.grey : Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}