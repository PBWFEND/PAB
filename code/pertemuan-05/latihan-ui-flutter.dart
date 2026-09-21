// ============================================================================
// PAB — Pertemuan 5: Latihan UI Flutter (TODO Terbimbing)
// ============================================================================
//
// Kasus: halaman utama Perpustakaan Kampus versi rapi — menerapkan tema
// terpusat, hierarki visual, kartu daftar, status berwarna, dan keadaan
// kosong. File ini SUDAH dapat dijalankan; selesaikan setiap TODO untuk
// menghasilkan versi final sesuai spesifikasi.
//
//   Jalur 1 — DartPad (tanpa instalasi):
//     Buka https://dartpad.dev/?template=app, ganti seluruh isi panel kiri
//     dengan isi file ini, lalu tekan Run.
//
//   Jalur 2 — Flutter SDK (sesuai panduan/Panduan-Lengkap-PAB.md):
//     Gunakan file ini sebagai isi lib/main.dart pada project hasil
//     `flutter create`, lalu jalankan `flutter run` atau `flutter run -d chrome`.
//
// Setiap TODO merujuk materi Bagian 5-8 pada 05-Pertemuan-5.md.
// Pastikan hasil tampilan sesuai deskripsi pada tiap TODO.
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
      title: 'PAB — Latihan UI',
      debugShowCheckedModeBanner: false,
      home: const HalamanPerpustakaan(),

      // ============================================================
      // TODO 1 — Tema terpusat:
      // Tambahkan parameter `theme` berisi ThemeData dengan
      // ColorScheme.fromSeed (pilih satu warna benih, mis. Colors.teal)
      // dan useMaterial3: true.
      // ============================================================
    );
  }
}

/// Halaman utama aplikasi perpustakaan.
class HalamanPerpustakaan extends StatelessWidget {
  const HalamanPerpustakaan({super.key});

  /// Ubah menjadi true untuk menguji keadaan kosong (TODO 6).
  static const bool semuaDipinjam = false;

  static const List<Map<String, String>> daftarBuku = [
    {'judul': 'Basis Data', 'penulis': 'A. Silberschatz', 'status': 'tersedia'},
    {'judul': 'Struktur Data', 'penulis': 'R. Lafore', 'status': 'tersedia'},
    {'judul': 'Jaringan Komputer', 'penulis': 'A. Tanenbaum', 'status': 'habis'},
    {'judul': 'Interaksi Manusia Komputer', 'penulis': 'A. Dix', 'status': 'tersedia'},
  ];

  @override
  Widget build(BuildContext context) {
    // Kondisi keadaan kosong: gabungan daftar kosong atau semua dipinjam.
    // `semuaDipinjam` diubah menjadi true pada TODO 6 untuk pengujian.
    final tampilkanKeadaanKosong = daftarBuku.isEmpty || semuaDipinjam;

    return Scaffold(
      appBar: AppBar(title: const Text('Perpustakaan Kampus')),
      body: Column(
        children: [
          // ============================================================
          // TODO 2 — Ringkasan atas (hierarki visual):
          // Tampilkan Card berisi nama perpustakaan (titleLarge) dan
          // keterangan jumlah buku tersedia (bodyMedium, warna redup).
          // ============================================================
          const Placeholder(fallbackHeight: 64),

          Expanded(
            child: tampilkanKeadaanKosong
                ? const KeadaanKosong()
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: daftarBuku.length,
                    itemBuilder: (context, index) {
                      final buku = daftarBuku[index];
                      // ==================================================
                      // TODO 3 — Ganti pemanggilan BukuSederhana di bawah
                      // menjadi KartuBuku setelah TODO 4 dan 5 selesai.
                      // ==================================================
                      return BukuSederhana(buku: buku);
                    },
                  ),
            // ============================================================
            // Catatan TODO 6 — keadaan kosong:
            // Ubah konstanta `semuaDipinjam` menjadi true, lalu amati
            // keadaan kosong (hot reload / hot restart).
            // ============================================================
          ),
        ],
      ),
    );
  }
}

/// Versi sementara — digantikan KartuBuku pada TODO 4.
class BukuSederhana extends StatelessWidget {
  const BukuSederhana({super.key, required this.buku});

  final Map<String, String> buku;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(buku['judul'] ?? '-'));
  }
}

// ============================================================================
// TODO 4 — Kartu buku:
// Buat widget `KartuBuku` (StatelessWidget) yang menerima `buku`
// (Map<String, String>) dan mengembalikan Card berisi ListTile:
//   - leading : Icon(Icons.menu_book_outlined)
//   - title   : judul buku (titleMedium)
//   - subtitle: nama penulis (bodySmall)
//   - trailing: hasil ChipStatus dari TODO 5
// Lalu gunakan KartuBuku pada ListView.builder (TODO 3).
// ============================================================================

// ============================================================================
// TODO 5 — Status berwarna:
// Buat widget `ChipStatus` yang menerima `status` (String) dan
// mengembalikan Chip dengan warna dari Theme.of(context).colorScheme
// menggunakan ternary:
//   'tersedia' -> tertiaryContainer / onTertiaryContainer
//   selain itu -> errorContainer / onErrorContainer
// ============================================================================

/// Keadaan kosong — sudah tersedia; pelajari strukturnya.
class KeadaanKosong extends StatelessWidget {
  const KeadaanKosong({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.inbox_outlined, size: 56, color: colorScheme.outline),
          const SizedBox(height: 12),
          Text('Tidak ada buku tersedia', style: textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            'Semua koleksi sedang dipinjam. Coba lagi besok.',
            style: textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
