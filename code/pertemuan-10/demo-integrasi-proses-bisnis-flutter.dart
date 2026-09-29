// ============================================================================
// PAB — Pertemuan 10: Integrasi Data dan Proses Bisnis SI — Demo
// ============================================================================
//
// Tujuan:
//   Menggabungkan data pengguna dan data pengajuan dari dua endpoint REST API,
//   memetakan response JSON ke model Dart, dan menampilkan status proses.
//
// Cara menjalankan:
//   1. Tambahkan dependency http pada pubspec.yaml.
//   2. Jalankan flutter pub get.
//   3. Jalankan flutter run -d chrome.
//
// Endpoint simulasi:
//   GET https://jsonplaceholder.typicode.com/users
//   GET https://jsonplaceholder.typicode.com/posts?_limit=10
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
      title: 'Integrasi Proses Bisnis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HalamanPengajuan(),
    );
  }
}

/// Model pengguna dari endpoint /users.
class DataPengguna {
  const DataPengguna({required this.id, required this.nama});

  final int id;
  final String nama;

  factory DataPengguna.fromJson(Map<String, dynamic> json) {
    return DataPengguna(
      id: json['id'] as int? ?? 0,
      nama: json['name'] as String? ?? 'Tanpa Nama',
    );
  }
}

/// Model pengajuan dari endpoint /posts.
class DataPengajuan {
  const DataPengajuan({
    required this.id,
    required this.userId,
    required this.ruang,
    required this.status,
  });

  final int id;
  final int userId;
  final String ruang;
  final String status;

  factory DataPengajuan.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as int? ?? 0;
    return DataPengajuan(
      id: id,
      userId: json['userId'] as int? ?? 0,
      ruang: 'Laboratorium ${(id % 3) + 1}',
      status: id.isEven ? 'disetujui' : 'menunggu',
    );
  }
}

/// Model ringkas untuk kebutuhan tampilan halaman.
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

/// Service yang menggabungkan data dari beberapa endpoint.
class IntegrasiService {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const _timeout = Duration(seconds: 10);

  static Future<List<DataPengguna>> _ambilPengguna() async {
    final response = await http
        .get(Uri.parse('$_baseUrl/users'))
        .timeout(_timeout);
    if (response.statusCode != 200) {
      throw Exception('Data pengguna tidak dapat dimuat.');
    }
    final data = jsonDecode(response.body) as List<dynamic>;
    return data
        .map((item) => DataPengguna.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  static Future<List<DataPengajuan>> _ambilPengajuan() async {
    final response = await http
        .get(Uri.parse('$_baseUrl/posts?_limit=10'))
        .timeout(_timeout);
    if (response.statusCode != 200) {
      throw Exception('Data pengajuan tidak dapat dimuat.');
    }
    final data = jsonDecode(response.body) as List<dynamic>;
    return data
        .map((item) => DataPengajuan.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  static Future<List<DataPengajuanRingkas>> ambilDataTerintegrasi() async {
    final hasil = await Future.wait<Object>([
      _ambilPengguna(),
      _ambilPengajuan(),
    ]);
    final pengguna = hasil[0] as List<DataPengguna>;
    final pengajuan = hasil[1] as List<DataPengajuan>;
    final penggunaById = {
      for (final data in pengguna) data.id: data,
    };

    return pengajuan.map((data) {
      final pemohon = penggunaById[data.userId];
      return DataPengajuanRingkas(
        id: data.id,
        namaPemohon: pemohon?.nama ?? 'Pemohon tidak ditemukan',
        ruang: data.ruang,
        status: data.status,
      );
    }).toList();
  }
}

/// Halaman yang menampilkan data gabungan dan empat kondisi proses.
class HalamanPengajuan extends StatefulWidget {
  const HalamanPengajuan({super.key});

  @override
  State<HalamanPengajuan> createState() => _HalamanPengajuanState();
}

class _HalamanPengajuanState extends State<HalamanPengajuan> {
  bool _sedangMemuat = true;
  String? _pesanError;
  List<DataPengajuanRingkas> _daftar = [];

  @override
  void initState() {
    super.initState();
    _muatData();
  }

  Future<void> _muatData() async {
    setState(() {
      _sedangMemuat = true;
      _pesanError = null;
    });
    try {
      final data = await IntegrasiService.ambilDataTerintegrasi();
      if (!mounted) return;
      setState(() {
        _daftar = data;
        _sedangMemuat = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _pesanError = error.toString();
        _sedangMemuat = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengajuan Laboratorium'),
        actions: [
          IconButton(
            onPressed: _muatData,
            icon: const Icon(Icons.refresh),
            tooltip: 'Muat ulang data',
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_sedangMemuat) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_pesanError != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_pesanError!),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: _muatData,
              child: const Text('Coba Lagi'),
            ),
          ],
        ),
      );
    }
    if (_daftar.isEmpty) {
      return const Center(child: Text('Data pengajuan belum tersedia.'));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _daftar.length,
      itemBuilder: (context, index) {
        final data = _daftar[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(child: Text('${data.id}')),
            title: Text(data.namaPemohon),
            subtitle: Text(data.ruang),
            trailing: Text(data.status),
          ),
        );
      },
    );
  }
}
