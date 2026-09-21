// ============================================================================
// PAB — Pertemuan 7: Persistensi Data Lokal — Demo (Jalur 2: Flutter SDK)
// ============================================================================
//
// Tujuan:
//   Menunjukkan persistensi dasar dengan package `shared_preferences`:
//   data yang disimpan pada perangkat bertahan setelah aplikasi ditutup.
//
// Konteks:
//   Melanjutkan `demo-data-lokal-flutter.dart` (CRUD in-memory). File ini
//   menambahkan dua operasi: menyimpan daftar sebagai teks JSON dan memuat
//   kembali saat aplikasi dibuka.
//
// Cara menjalankan (Flutter SDK — sesuai panduan/Panduan-Lengkap-PAB.md):
//   1. Gunakan file ini sebagai isi lib/main.dart pada project hasil
//      `flutter create`.
//   2. Tambahkan `shared_preferences` pada pubspec.yaml:
//        dependencies:
//          flutter:
//            sdk: flutter
//          shared_preferences: ^2.3.0
//   3. Jalankan `flutter pub get`, lalu:
//        flutter run -d chrome
//
// Catatan: `shared_preferences` TIDAK berjalan pada DartPad — file ini
// hanya untuk Jalur 2 (Flutter SDK).
//
// Eksperimen:
//   Tambah pengajuan, tutup aplikasi, buka kembali — data tetap tampil.
//
// Konsep yang ditunjukkan (Pertemuan 7, Bagian 7):
//   - SharedPreferences.getInstance() : akses penyimpanan (asinkron)
//   - jsonEncode / jsonDecode         : model data <-> teks JSON
//   - setString / getString           : simpan dan baca pasangan kunci-nilai
//   - initState                       : memuat data saat layar dibuka
// ============================================================================

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peminjaman Ruang Lab — Persistensi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HalamanDaftarPengajuan(),
    );
  }
}

/// Model data — sama dengan demo-data-lokal-flutter.dart.
class DataPengajuan {
  const DataPengajuan({
    required this.id,
    required this.ruang,
    required this.tanggal,
    required this.jam,
    required this.status,
  });

  final String id;
  final String ruang;
  final String tanggal;
  final String jam;
  final String status;
}

class HalamanDaftarPengajuan extends StatefulWidget {
  const HalamanDaftarPengajuan({super.key});

  @override
  State<HalamanDaftarPengajuan> createState() => _HalamanDaftarPengajuanState();
}

class _HalamanDaftarPengajuanState extends State<HalamanDaftarPengajuan> {
  final List<DataPengajuan> _daftar = [];

  @override
  void initState() {
    super.initState();
    _muatDariPenyimpanan();
  }

  /// Memuat data dari penyimpanan saat layar dibuka.
  Future<void> _muatDariPenyimpanan() async {
    final prefs = await SharedPreferences.getInstance();
    final teks = prefs.getString('daftar_pengajuan');
    if (teks == null) {
      return; // Penyimpanan kosong — daftar tetap kosong.
    }
    final data = jsonDecode(teks) as List<dynamic>;
    setState(() {
      _daftar.clear();
      _daftar.addAll(
        data.map((item) => DataPengajuan(
              id: item['id'] as String,
              ruang: item['ruang'] as String,
              tanggal: item['tanggal'] as String,
              jam: item['jam'] as String,
              status: item['status'] as String,
            )),
      );
    });
  }

  /// Menyimpan daftar sebagai teks JSON setelah setiap perubahan.
  Future<void> _simpanKePenyimpanan() async {
    final prefs = await SharedPreferences.getInstance();
    final teks = jsonEncode(
      _daftar
          .map((p) => {
                'id': p.id,
                'ruang': p.ruang,
                'tanggal': p.tanggal,
                'jam': p.jam,
                'status': p.status,
              })
          .toList(),
    );
    await prefs.setString('daftar_pengajuan', teks);
  }

  void _tambah() {
    final pengajuan = DataPengajuan(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      ruang: 'Lab Komputer ${_daftar.length + 1}',
      tanggal: 'Senin, 2 Nov',
      jam: '10:00-12:00',
      status: 'menunggu',
    );
    setState(() {
      _daftar.add(pengajuan);
    });
    _simpanKePenyimpanan();
  }

  void _hapus(String id) {
    setState(() {
      _daftar.removeWhere((p) => p.id == id);
    });
    _simpanKePenyimpanan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengajuan Ruang Lab (persisten)')),
      body: _daftar.isEmpty
          ? const Center(
              child: Text(
                'Belum ada pengajuan.\nTekan + untuk menambah.',
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: _daftar.length,
              itemBuilder: (context, index) {
                final pengajuan = _daftar[index];
                return Card(
                  child: ListTile(
                    title: Text(pengajuan.ruang),
                    subtitle: Text('${pengajuan.tanggal} — ${pengajuan.jam}'),
                    trailing: IconButton(
                      tooltip: 'Hapus',
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => _hapus(pengajuan.id),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _tambah,
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),
    );
  }
}