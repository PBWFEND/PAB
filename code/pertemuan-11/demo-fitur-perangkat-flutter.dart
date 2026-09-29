// ============================================================================
// PAB — Pertemuan 11: Fitur Perangkat — Demo image_picker
// ============================================================================
//
// Tujuan:
//   Memilih gambar dari kamera atau galeri, menampilkan preview, dan
//   membedakan kondisi berhasil, dibatalkan, dan error.
//
// Dependency pubspec.yaml:
//   image_picker: ^1.1.2
//
// Cara menjalankan:
//   flutter pub get
//   flutter run -d chrome
//   Untuk kamera langsung, gunakan target perangkat yang mendukung kamera.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

/// Aplikasi utama.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lampiran Foto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HalamanLampiranFoto(),
    );
  }
}

/// Service yang memisahkan image_picker dari widget.
class FotoService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pilihDariGaleri() {
    return _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1600,
      imageQuality: 80,
    );
  }

  Future<XFile?> ambilDenganKamera() {
    return _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1600,
      imageQuality: 80,
    );
  }
}

/// Halaman yang menampilkan hasil pemilihan foto.
class HalamanLampiranFoto extends StatefulWidget {
  const HalamanLampiranFoto({super.key});

  @override
  State<HalamanLampiranFoto> createState() => _HalamanLampiranFotoState();
}

class _HalamanLampiranFotoState extends State<HalamanLampiranFoto> {
  final FotoService _fotoService = FotoService();
  XFile? _foto;
  bool _sedangMemuat = false;
  String? _pesanError;

  Future<void> _pilihFoto(Future<XFile?> Function() sumber) async {
    setState(() {
      _sedangMemuat = true;
      _pesanError = null;
    });
    try {
      final foto = await sumber();
      if (!mounted) return;
      setState(() {
        _foto = foto;
        _sedangMemuat = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _pesanError = 'Foto tidak dapat dipilih: $error';
        _sedangMemuat = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lampiran Foto Pengajuan')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            if (_sedangMemuat) const LinearProgressIndicator(),
            if (_pesanError != null) ...[
              Text(_pesanError!),
              const SizedBox(height: 12),
            ],
            Expanded(
              child: Center(
                child: _foto == null
                    ? const Text('Belum ada foto dipilih.')
                    : FutureBuilder<Widget>(
                        future: _foto!.readAsBytes().then(
                          (bytes) => Image.memory(bytes),
                        ),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const CircularProgressIndicator();
                          }
                          return snapshot.data!;
                        },
                      ),
              ),
            ),
            Wrap(
              spacing: 12,
              children: [
                FilledButton.icon(
                  onPressed: _sedangMemuat
                      ? null
                      : () => _pilihFoto(_fotoService.pilihDariGaleri),
                  icon: const Icon(Icons.photo_library),
                  label: const Text('Galeri'),
                ),
                OutlinedButton.icon(
                  onPressed: _sedangMemuat
                      ? null
                      : () => _pilihFoto(_fotoService.ambilDenganKamera),
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Kamera'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
