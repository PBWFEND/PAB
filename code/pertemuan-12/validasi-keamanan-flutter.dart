// ============================================================================
// PAB — Pertemuan 12: Validasi Input dan Keamanan Praktis — Demo
// ============================================================================
//
// Tujuan:
//   Menunjukkan validasi field wajib, batas panjang input, validasi email,
//   dan pemisahan pemeriksaan client dari pemeriksaan server.
//
// Cara menjalankan:
//   flutter pub get
//   flutter run -d chrome
//
// Catatan keamanan:
//   Demo ini tidak memakai token atau data pribadi. Pesan pada halaman hanya
//   menunjukkan hasil validasi client, bukan bukti bahwa server sudah menerima data.
// ============================================================================

import 'package:flutter/material.dart';

void main() {
  /// Menjalankan aplikasi demo validasi input.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  /// Menyediakan tema dan halaman awal aplikasi demo validasi.

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Validasi Project',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo)),
      home: const HalamanValidasi(),
    );
  }
}

class HalamanValidasi extends StatefulWidget {
  /// Menyediakan halaman form yang memeriksa input sebelum diproses.

  const HalamanValidasi({super.key});

  @override
  State<HalamanValidasi> createState() => _HalamanValidasiState();
}

class _HalamanValidasiState extends State<HalamanValidasi> {
  /// Kunci untuk menjalankan seluruh validator pada Form.
  final _formKey = GlobalKey<FormState>();

  /// Controller untuk membaca dan mengelola input nama pemohon.
  final _namaController = TextEditingController();

  /// Controller untuk membaca dan mengelola input email pemohon.
  final _emailController = TextEditingController();

  /// Pesan hasil pemeriksaan yang ditampilkan pada halaman.
  String _hasil = 'Belum ada data yang diperiksa.';

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  /// Menjalankan validator dan memperbarui pesan hasil pemeriksaan.
  void _periksaInput() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      setState(() {
        _hasil = 'Input belum valid.';
      });
      return;
    }
    setState(() {
      _hasil = 'Input valid dan siap diperiksa oleh server.';
    });
  }

  /// Memeriksa nama wajib diisi dan tidak melebihi 100 karakter.
  String? _validasiNama(String? value) {
    final nama = value?.trim() ?? '';
    if (nama.isEmpty) return 'Nama wajib diisi';
    if (nama.length > 100) return 'Nama maksimal 100 karakter';
    return null;
  }

  /// Memeriksa email wajib diisi dan memiliki format dasar.
  String? _validasiEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return 'Email wajib diisi';
    if (!email.contains('@')) return 'Format email belum benar';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    /// Form hanya memberi feedback awal; server tetap wajib memvalidasi ulang.
    return Scaffold(
      appBar: AppBar(title: const Text('Validasi Pengajuan')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: 'Nama pemohon'),
              validator: _validasiNama,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: _validasiEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: _periksaInput,
              child: const Text('Periksa input'),
            ),
            const SizedBox(height: 20),
            Text(_hasil),
            const SizedBox(height: 24),
            const Text('Catatan: token dan password tidak ditampilkan pada halaman ini.'),
          ],
        ),
      ),
    );
  }
}
