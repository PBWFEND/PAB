// ============================================================================
// PAB — Pertemuan 12: Latihan Validasi Input dan Security Checklist — TODO
// ============================================================================
//
// Tujuan:
//   Melatih validator Form, pemeriksaan batas input, dan pencatatan pemeriksaan
//   keamanan yang relevan dengan project.
//
// Cara menjalankan:
//   flutter pub get
//   flutter run -d chrome
//
// TODO:
//   1. Lengkapi validator nama.
//   2. Lengkapi validator email.
//   3. Lengkapi method pemeriksaan Form.
//   4. Tampilkan tiga item security checklist.
// ============================================================================

import 'package:flutter/material.dart';

void main() {
  /// Menjalankan aplikasi latihan validasi.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  /// Menyediakan tema dan halaman awal aplikasi latihan.

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Keamanan',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
      home: const HalamanLatihan(),
    );
  }
}

class HalamanLatihan extends StatefulWidget {
  /// Halaman latihan untuk melengkapi validator dan checklist keamanan.

  const HalamanLatihan({super.key});

  @override
  State<HalamanLatihan> createState() => _HalamanLatihanState();
}

class _HalamanLatihanState extends State<HalamanLatihan> {
  /// Kunci untuk menjalankan validator pada Form.
  final _formKey = GlobalKey<FormState>();

  /// Controller untuk input nama pemohon.
  final _namaController = TextEditingController();

  /// Controller untuk input email pemohon.
  final _emailController = TextEditingController();

  /// Pesan status yang ditampilkan setelah pemeriksaan input.
  // Nilai berubah melalui setState setelah TODO 3 diimplementasikan.
  // ignore: prefer_final_fields
  String _pesan = 'Lengkapi TODO validasi.';

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  /// TODO: Tolak nama kosong dan nama lebih dari 100 karakter.
  String? _validasiNama(String? value) {
    // TODO 1: Tolak nama kosong dan nama lebih dari 100 karakter.
    return null;
  }

  /// TODO: Tolak email kosong dan email tanpa karakter '@'.
  String? _validasiEmail(String? value) {
    // TODO 2: Tolak email kosong dan email tanpa karakter '@'.
    return null;
  }

  /// TODO: Jalankan validate() dan ubah _pesan melalui setState.
  void _periksaInput() {
    // TODO 3: Jalankan validate(). Jika valid, ubah _pesan melalui setState.
  }

  @override
  Widget build(BuildContext context) {
    /// Menampilkan Form, pesan hasil, dan ruang untuk checklist keamanan.
    return Scaffold(
      appBar: AppBar(title: const Text('Latihan Validasi')),
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
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: _periksaInput,
              child: const Text('Periksa input'),
            ),
            const SizedBox(height: 20),
            Text(_pesan),
            const SizedBox(height: 24),
            // TODO 4: Tambahkan tiga pemeriksaan security checklist dalam UI.
          ],
        ),
      ),
    );
  }
}
