// ============================================================================
// PAB — Pertemuan 11: Latihan Fitur Perangkat — TODO Terbimbing
// ============================================================================
//
// Tujuan:
//   Melatih penggunaan image_picker, service layer, state loading, hasil
//   pemilihan, pembatalan, dan error pada aplikasi Flutter.
//
// Dependency pubspec.yaml:
//   image_picker: ^1.1.2
//
// Cara menjalankan:
//   1. Tambahkan dependency image_picker dan jalankan flutter pub get.
//   2. Gunakan file ini sebagai lib/main.dart.
//   3. Jalankan flutter run -d chrome atau target perangkat yang sesuai.
//
// TODO:
//   1. Lengkapi FotoService.
//   2. Lengkapi state dan method _pilihFoto.
//   3. Tampilkan preview gambar.
//   4. Tampilkan kondisi batal dan error.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Lampiran Foto',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo)),
      home: const HalamanLampiranFoto(),
    );
  }
}

class FotoService {
  final ImagePicker _picker = ImagePicker();

  // TODO 1: buat pilihDariGaleri() yang mengembalikan Future<XFile?>.
  // Gunakan _picker.pickImage(source: ImageSource.gallery).

  // TODO 2: buat ambilDenganKamera() yang mengembalikan Future<XFile?>.
  // Gunakan _picker.pickImage(source: ImageSource.camera).
}

class HalamanLampiranFoto extends StatefulWidget {
  const HalamanLampiranFoto({super.key});

  @override
  State<HalamanLampiranFoto> createState() => _HalamanLampiranFotoState();
}

class _HalamanLampiranFotoState extends State<HalamanLampiranFoto> {
  final FotoService _fotoService = FotoService();

  // TODO 3: tambahkan XFile? _foto, bool _sedangMemuat, String? _pesanError.

  // TODO 4: buat _pilihFoto dengan parameter Future<XFile?> Function().
  // Atur loading, panggil sumber, simpan hasil, dan tangani error.
  // Jika hasil null, pertahankan state sebelumnya karena pengguna membatalkan.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lampiran Foto Pengajuan')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // TODO 5: tampilkan indikator loading dan pesan error.
            Expanded(
              child: Center(
                // TODO 6: tampilkan preview ketika _foto tersedia.
                child: const Text('Selesaikan TODO, lalu ganti widget ini.'),
              ),
            ),
            // TODO 7: tambahkan tombol Galeri dan Kamera.
          ],
        ),
      ),
    );
  }
}
