// ============================================================================
// PAB — Pertemuan 3: Solusi Referensi Dosen
// ============================================================================
//
// Solusi lengkap untuk latihan-widget-flutter.dart (Tugas 3 / Latihan
// Individu). Gunakan sebagai acuan setelah mahasiswa mengerjakan
// latihan secara mandiri; jangan dibagikan sebelum tenggat tugas.
//
// Cara menjalankan:
//   Jalur 1 — DartPad: https://dartpad.dev/?template=app
//   Jalur 2 — Flutter SDK:
//     Salin file ini ke lib/main.dart pada project hasil
//     `flutter create`, lalu jalankan `flutter run -d chrome`.
// ============================================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAB — Latihan Widget (Solusi)',
      debugShowCheckedModeBanner: false,
      home: const HalamanPerpustakaan(),
    );
  }
}

class HalamanPerpustakaan extends StatelessWidget {
  const HalamanPerpustakaan({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO 3 (solusi) — data buku sebagai List<Map<String, String>>
    final daftarBuku = [
      {
        'judul': 'Dasar Pemrograman Dart',
        'penulis': 'Tim PAB',
        'stok': '12',
      },
      {
        'judul': 'Sistem Informasi Terapan',
        'penulis': 'Andi, S.Kom.',
        'stok': '4',
      },
      {
        'judul': 'Flutter dari Nol',
        'penulis': 'Rina, M.Kom.',
        'stok': '0',
      },
      {
        'judul': 'Basis Data Akademik',
        'penulis': 'Budi, M.T.',
        'stok': '7',
      },
    ];

    return Scaffold(
      appBar: const AppBar(
        title: Text('Perpustakaan Kampus'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Halo, Pengguna!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
      ),
    );
  }
}

class BukuListTile extends StatelessWidget {
  const BukuListTile({
    required this.judul,
    required this.penulis,
    required this.stok,
  });

  final String judul;
  final String penulis;
  final String stok;

  @override
  Widget build(BuildContext context) {
    final stokAngka = int.parse(stok);
    final tersedia = stokAngka > 0;

    return Padding(
      // TODO 5 (solusi) — padding horizontal 16, vertikal 8
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
          // TODO 6 (solusi) — teks stok berwarna sesuai ketersediaan
          Text(
            'Stok: $stok',
            style: TextStyle(
              color: tersedia ? Colors.blue : Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
