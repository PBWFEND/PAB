// ============================================================================
// PAB — Pertemuan 13: Latihan Testing, Debugging, dan Bug Fixes — TODO
// ============================================================================
//
// Tujuan:
//   Melatih pembuatan validator, pencegahan data ganda, pencatatan status,
//   dan penyusunan skenario test case.
//
// Cara menjalankan:
//   flutter pub get
//   flutter analyze
//   flutter run -d chrome
//
// TODO:
//   1. Lengkapi validator judul.
//   2. Tampilkan status penolakan saat form tidak valid.
//   3. Tampilkan status penyimpanan saat form valid.
//   4. Cegah pemrosesan ganda saat tombol ditekan lebih dari sekali.
//   5. Lengkapi ringkasan menjadi minimal enam test case.
// ============================================================================

import 'package:flutter/material.dart';

void main() {
  /// Menjalankan aplikasi latihan testing.
  runApp(const MyApp());
}

/// Menyediakan tema dan halaman latihan.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Testing',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
      home: const HalamanLatihan(),
    );
  }
}

/// Halaman latihan untuk melengkapi validasi dan skenario bug fix.
class HalamanLatihan extends StatefulWidget {
  const HalamanLatihan({super.key});

  @override
  State<HalamanLatihan> createState() => _HalamanLatihanState();
}

class _HalamanLatihanState extends State<HalamanLatihan> {
  final _formKey = GlobalKey<FormState>();
  final _judulController = TextEditingController();
  String _status = 'Lengkapi TODO dan jalankan test case.';

  @override
  void dispose() {
    _judulController.dispose();
    super.dispose();
  }

  /// TODO 1: Tolak judul kosong dan judul lebih dari 100 karakter.
  String? _validasiJudul(String? value) {
    return null;
  }

  /// TODO 2: Jalankan validator dan ubah status melalui setState.
  void _simpan() {
    // TODO 2: Jika form tidak valid, tampilkan status penolakan.
    // TODO 3: Jika valid, ubah _status menjadi hasil penyimpanan.
    // TODO 4: Cegah pemrosesan ganda ketika tombol ditekan lebih dari sekali.
  }

  /// TODO 5: Lengkapi ringkasan menjadi minimal enam test case dari perilaku halaman ini.
  void _tampilkanSkenarioTest() {
    setState(() {
      _status = 'TC-01: input valid; TC-02: judul kosong; TC-03: batas panjang.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Latihan Testing')),
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
              onPressed: _simpan,
              child: const Text('Simpan'),
            ),
            OutlinedButton(
              onPressed: _tampilkanSkenarioTest,
              child: const Text('Tampilkan skenario test'),
            ),
            const SizedBox(height: 20),
            Text(_status),
          ],
        ),
      ),
    );
  }
}
