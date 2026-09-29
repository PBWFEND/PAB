// ============================================================================
// PAB — Pertemuan 10: Latihan Integrasi Data dan Proses Bisnis — TODO
// ============================================================================
//
// Tujuan:
//   Melatih penggabungan data dari endpoint pengguna dan pengajuan, parsing
//   JSON ke model Dart, Future.wait, service layer, dan state halaman.
//
// Cara menjalankan:
//   Tambahkan package http pada pubspec.yaml, jalankan flutter pub get,
//   lalu gunakan file ini sebagai lib/main.dart dan jalankan flutter run -d chrome.
//
// TODO:
//   1. Lengkapi model DataPengguna dan DataPengajuan.
//   2. Lengkapi dua request pada IntegrasiService.
//   3. Gabungkan hasil request berdasarkan userId.
//   4. Lengkapi state loading, data, kosong, dan error.
//   5. Tampilkan data ringkas pada ListView.builder.
// ============================================================================

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Integrasi Proses',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo)),
      home: const HalamanPengajuan(),
    );
  }
}

// TODO 1 — Lengkapi model pengguna dan pengajuan.
class DataPengguna {
  // TODO: tambahkan field final int id dan final String nama.
  // TODO: tambahkan constructor const dan factory fromJson.
}

class DataPengajuan {
  // TODO: tambahkan field id, userId, ruang, dan status.
  // TODO: tambahkan constructor const dan factory fromJson.
}

class DataPengajuanRingkas {
  const DataPengajuanRingkas({
    required this.id,
    required this.namaPemohon,
    required this.ruang,
    required this.status,
  });

  final int id;
  final String namaPemohon;
  final String ruang;
  final String status;
}

// TODO 2 & 3 — Lengkapi service dan penggabungan data.
class IntegrasiService {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com';

  // TODO: buat _ambilPengguna() dengan http.get dan status code 200.
  // TODO: buat _ambilPengajuan() dengan http.get dan parsing JSON list.
  // TODO: buat ambilDataTerintegrasi() menggunakan Future.wait.
  // Hubungkan pengajuan dengan pengguna menggunakan userId.
}

class HalamanPengajuan extends StatefulWidget {
  const HalamanPengajuan({super.key});

  @override
  State<HalamanPengajuan> createState() => _HalamanPengajuanState();
}

class _HalamanPengajuanState extends State<HalamanPengajuan> {
  // TODO 4: tambahkan state _sedangMemuat, _pesanError, dan _daftar.

  @override
  void initState() {
    super.initState();
    // TODO: panggil _muatData().
  }

  // TODO: buat _muatData() dengan try-catch dan setState.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengajuan Laboratorium'),
        actions: [
          // TODO: hubungkan tombol dengan _muatData.
          IconButton(
            onPressed: null,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      // TODO 5: tampilkan loading, error + Coba Lagi, data kosong,
      // atau ListView.builder sesuai state.
      body: const Center(
        child: Text('Selesaikan TODO, lalu ganti widget ini.'),
      ),
    );
  }
}
