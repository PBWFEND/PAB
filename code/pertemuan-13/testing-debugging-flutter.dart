// ============================================================================
// PAB — Pertemuan 13: Testing, Debugging, dan Perbaikan — Demo
// ============================================================================
//
// Tujuan:
//   Menunjukkan validator form, status pemeriksaan, dan pesan debug yang aman.
//
// Cara menjalankan:
//   flutter pub get
//   flutter analyze
//   flutter run -d chrome
//
// Catatan:
//   Demo ini tidak mencetak token atau data pribadi. Pemeriksaan server tetap
//   diperlukan ketika data benar-benar dikirim ke backend.
// ============================================================================

import 'package:flutter/material.dart';

void main() {
  /// Menjalankan aplikasi demo testing dan debugging.
  runApp(const MyApp());
}

/// Menyediakan tema dan halaman awal aplikasi demo.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing dan Debugging',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo)),
      home: const HalamanTesting(),
    );
  }
}

/// Menyediakan form yang dapat diuji dengan skenario valid dan tidak valid.
class HalamanTesting extends StatefulWidget {
  const HalamanTesting({super.key});

  @override
  State<HalamanTesting> createState() => _HalamanTestingState();
}

class _HalamanTestingState extends State<HalamanTesting> {
  final _formKey = GlobalKey<FormState>();
  final _judulController = TextEditingController();
  bool _sedangMenyimpan = false;
  String _status = 'Belum ada skenario yang dijalankan.';

  @override
  void dispose() {
    _judulController.dispose();
    super.dispose();
  }

  /// Memvalidasi form dan mensimulasikan penyimpanan satu kali.
  void _simpan() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      setState(() {
        _status = 'TC-02: input tidak valid.';
      });
      return;
    }
    if (_sedangMenyimpan) return;

    setState(() {
      _sedangMenyimpan = true;
      _status = 'Memproses data...';
    });

    Future<void>.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      setState(() {
        _sedangMenyimpan = false;
        _status = 'TC-01: data valid diproses satu kali.';
      });
    });
  }

  /// Memeriksa judul wajib diisi dan memiliki panjang yang wajar.
  String? _validasiJudul(String? value) {
    final judul = value?.trim() ?? '';
    if (judul.isEmpty) return 'Judul wajib diisi';
    if (judul.length > 100) return 'Judul maksimal 100 karakter';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Testing Pengajuan')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            TextFormField(
              controller: _judulController,
              decoration: const InputDecoration(labelText: 'Judul pengajuan'),
              validator: _validasiJudul,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _sedangMenyimpan ? null : _simpan,
              child: Text(_sedangMenyimpan ? 'Memproses...' : 'Simpan'),
            ),
            const SizedBox(height: 20),
            Text(_status),
          ],
        ),
      ),
    );
  }
}
