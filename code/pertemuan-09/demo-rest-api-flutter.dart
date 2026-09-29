// ============================================================================
// PAB — Pertemuan 9: Integrasi REST API — Demo (Penyelesaian CBL)
// ============================================================================
//
// Tujuan:
//   Menunjukkan konsumsi REST API pada aplikasi Flutter: mengirim HTTP GET
//   dan POST, mengurai response JSON menjadi model data, serta menangani
//   tiga kondisi antarmuka — loading, sukses, dan error.
//
// Konteks:
//   Aplikasi pengajuan peminjaman ruang laboratorium — melanjutkan kasus CBL
//   Pertemuan 4–7. Data pengajuan tidak lagi disimpan pada memori perangkat,
//   melainkan diambil dari dan dikirim ke backend melalui REST API sehingga
//   dapat diakses bersama oleh seluruh pengguna.
//
// Endpoint yang digunakan (API simulasi publik, aman untuk latihan):
//   GET  https://jsonplaceholder.typicode.com/posts?_limit=10
//   POST https://jsonplaceholder.typicode.com/posts
//
// Catatan: jsonplaceholder adalah API tiruan. Response POST tidak benar-benar
// menyimpan data pada server, sehingga daftar hanya berubah setelah aplikasi
// memuat ulang data dari endpoint GET.
//
// Cara menjalankan (DartPad — tanpa instalasi):
//   1. Buka https://dartpad.dev/?template=app
//   2. Ganti seluruh isi panel kiri dengan isi file ini.
//   3. Tekan Run, lalu amati indikator loading dan daftar yang muncul.
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
// Konsep yang ditunjukkan (Pertemuan 9):
//   - Arsitektur client–server  : aplikasi mobile sebagai client REST API
//   - Future + async/await      : operasi jaringan tanpa membekukan antarmuka
//   - package http              : http.get dan http.post
//   - Uri.parse                 : membentuk alamat endpoint
//   - jsonDecode + fromJson     : mengubah teks JSON menjadi objek Dart
//   - jsonEncode + toJson       : mengubah objek Dart menjadi teks JSON
//   - FutureBuilder             : menangani loading, sukses, dan error
//   - try-catch + timeout       : penanganan kegagalan jaringan
//   - Lapisan Service           : memisahkan logika jaringan dari widget UI
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
      title: 'Integrasi REST API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HalamanDaftarPengajuan(),
    );
  }
}

// ============================================================================
// MODEL DATA
// ============================================================================

/// Model data — satu pengajuan peminjaman ruang laboratorium.
/// Field bersifat final: perubahan data menghasilkan objek baru.
///
/// Contoh JSON yang diuraikan endpoint simulasi:
///   {
///     "userId": 1,
///     "id": 1,
///     "title": "Peminjaman Lab Multimedia",
///     "body": "Tanggal 2026-11-15, jam 08:00 - 10:00"
///   }
class DataPengajuan {
  const DataPengajuan({
    required this.id,
    required this.ruang,
    required this.tanggal,
    required this.status,
  });

  final int id;
  final String ruang;
  final String tanggal;
  final String status;

  /// Mengubah Map hasil jsonDecode menjadi objek DataPengajuan.
  /// Nilai default dipakai bila field tidak tersedia pada response, sehingga
  /// aplikasi tidak error saat struktur JSON tidak lengkap.
  factory DataPengajuan.fromJson(Map<String, dynamic> json) {
    return DataPengajuan(
      id: json['id'] as int? ?? 0,
      ruang: json['title'] as String? ?? 'Tanpa Nama Ruang',
      tanggal: json['body'] as String? ?? '-',
      status: json['status'] as String? ?? 'menunggu',
    );
  }

  /// Mengubah objek menjadi Map untuk dikirim sebagai body JSON (POST).
  Map<String, dynamic> toJson() {
    return {
      'title': ruang,
      'body': tanggal,
      'status': status,
      'userId': 1,
    };
  }
}

// ============================================================================
// LAPISAN SERVICE — memisahkan logika jaringan dari widget antarmuka
// ============================================================================

/// Service API — mengisolasi seluruh interaksi HTTP pada satu tempat,
/// sehingga widget hanya peduli pada tampilan, bukan pada URL dan parsing.
class PengajuanService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const Duration _timeout = Duration(seconds: 10);

  /// GET — mengambil daftar pengajuan dari server.
  static Future<List<DataPengajuan>> ambilDaftar() async {
    final url = Uri.parse('$_baseUrl/posts?_limit=8');

    try {
      final response = await http.get(url).timeout(_timeout);

      if (response.statusCode == 200) {
        final List<dynamic> dataMentah =
            jsonDecode(response.body) as List<dynamic>;
        return dataMentah
            .map((item) => DataPengajuan.fromJson(item as Map<String, dynamic>))
            .toList();
      } else if (response.statusCode == 404) {
        throw Exception('Data tidak ditemukan di server (404).');
      } else {
        throw Exception('Server menolak permintaan (HTTP ${response.statusCode}).');
      }
    } on TimeoutException {
      throw Exception('Waktu tunggu habis. Periksa koneksi internet Anda.');
    } catch (e) {
      throw Exception('Gagal memuat data: $e');
    }
  }

  /// POST — mengirim pengajuan baru ke server.
  static Future<DataPengajuan> kirimPengajuan({
    required String ruang,
    required String tanggal,
  }) async {
    final url = Uri.parse('$_baseUrl/posts');
    final dataBaru = DataPengajuan(
      id: 0,
      ruang: ruang,
      tanggal: tanggal,
      status: 'menunggu',
    );

    try {
      final response = await http
          .post(
            url,
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: jsonEncode(dataBaru.toJson()),
          )
          .timeout(_timeout);

      if (response.statusCode == 201 || response.statusCode == 200) {
        final Map<String, dynamic> jsonItem =
            jsonDecode(response.body) as Map<String, dynamic>;
        return DataPengajuan.fromJson(jsonItem);
      } else {
        throw Exception('Gagal mengirim pengajuan (HTTP ${response.statusCode}).');
      }
    } on TimeoutException {
      throw Exception('Waktu tunggu habis saat mengirim data.');
    } catch (e) {
      throw Exception('Gagal mengirim pengajuan: $e');
    }
  }
}

// ============================================================================
// HALAMAN DAFTAR — menangani tiga kondisi: loading, sukses, dan error
// ============================================================================

/// Layar daftar pengajuan yang mengambil data dari REST API.
/// Menggunakan state manual (bukan FutureBuilder) agar daftar dapat
/// disegarkan setelah pengiriman data baru.
class HalamanDaftarPengajuan extends StatefulWidget {
  const HalamanDaftarPengajuan({super.key});

  @override
  State<HalamanDaftarPengajuan> createState() => _HalamanDaftarPengajuanState();
}

class _HalamanDaftarPengajuanState extends State<HalamanDaftarPengajuan> {
  // State untuk tiga kondisi antarmuka.
  bool _sedangMemuat = true;
  String? _pesanError;
  List<DataPengajuan> _daftar = [];

  @override
  void initState() {
    super.initState();
    _muatData();
  }

  /// Memuat daftar dari API — dipanggil saat halaman dibuka dan saat
  /// pengguna menekan tombol "Coba Lagi" atau menyegarkan daftar.
  Future<void> _muatData() async {
    setState(() {
      _sedangMemuat = true;
      _pesanError = null;
    });

    try {
      final hasil = await PengajuanService.ambilDaftar();
      if (!mounted) return;
      setState(() {
        _daftar = hasil;
        _sedangMemuat = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _pesanError = e.toString().replaceFirst('Exception: ', '');
        _sedangMemuat = false;
      });
    }
  }

  /// Membuka form pengajuan baru; setelah berhasil, daftar dimuat ulang.
  Future<void> _bukaForm() async {
    final berhasil = await Navigator.push<bool>(
      context,
      MaterialPageRoute<bool>(builder: (context) => const FormPengajuan()),
    );

    if (berhasil == true) {
      await _muatData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengajuan Ruang Lab'),
        actions: [
          IconButton(
            onPressed: _muatData,
            icon: const Icon(Icons.refresh),
            tooltip: 'Muat ulang',
          ),
        ],
      ),
      body: _bangunKonten(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _bukaForm,
        icon: const Icon(Icons.add),
        label: const Text('Ajukan'),
      ),
    );
  }

  /// Menentukan tampilan berdasarkan kondisi state saat ini.
  Widget _bangunKonten() {
    // Kondisi 1 — loading.
    if (_sedangMemuat) {
      return const Center(child: CircularProgressIndicator());
    }

    // Kondisi 2 — error.
    if (_pesanError != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cloud_off, size: 48, color: Colors.redAccent),
              const SizedBox(height: 12),
              Text(
                _pesanError!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: _muatData,
                icon: const Icon(Icons.refresh),
                label: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
      );
    }

    // Kondisi 3 — data kosong.
    if (_daftar.isEmpty) {
      return const Center(child: Text('Belum ada pengajuan.'));
    }

    // Kondisi 4 — sukses.
    return RefreshIndicator(
      onRefresh: _muatData,
      child: ListView.builder(
        itemCount: _daftar.length,
        itemBuilder: (context, index) {
          final pengajuan = _daftar[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(pengajuan.ruang),
              subtitle: Text(pengajuan.tanggal),
              trailing: Chip(label: Text(pengajuan.status)),
            ),
          );
        },
      ),
    );
  }
}

// ============================================================================
// FORM PENGAJUAN — mengirim data baru melalui HTTP POST
// ============================================================================

/// Form pengajuan yang mengirim data ke server melalui POST.
/// Mengembalikan `true` melalui Navigator.pop bila pengiriman berhasil.
class FormPengajuan extends StatefulWidget {
  const FormPengajuan({super.key});

  @override
  State<FormPengajuan> createState() => _FormPengajuanState();
}

class _FormPengajuanState extends State<FormPengajuan> {
  final _formKey = GlobalKey<FormState>();
  final _ruangController = TextEditingController();
  final _tanggalController = TextEditingController();

  bool _sedangMengirim = false;

  @override
  void dispose() {
    _ruangController.dispose();
    _tanggalController.dispose();
    super.dispose();
  }

  Future<void> _kirim() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _sedangMengirim = true;
    });

    try {
      await PengajuanService.kirimPengajuan(
        ruang: _ruangController.text.trim(),
        tanggal: _tanggalController.text.trim(),
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pengajuan berhasil dikirim.')),
      );
      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _sedangMengirim = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceFirst('Exception: ', '')),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pengajuan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _ruangController,
                decoration: const InputDecoration(
                  labelText: 'Ruang',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ruang wajib diisi.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _tanggalController,
                decoration: const InputDecoration(
                  labelText: 'Tanggal & Jam',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Tanggal wajib diisi.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              FilledButton.icon(
                // Tombol dinonaktifkan selama pengiriman untuk mencegah
                // penekanan ganda yang menghasilkan data duplikat.
                onPressed: _sedangMengirim ? null : _kirim,
                icon: _sedangMengirim
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.send),
                label: Text(_sedangMengirim ? 'Mengirim...' : 'Kirim'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
