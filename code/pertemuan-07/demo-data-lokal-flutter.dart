// ============================================================================
// PAB — Pertemuan 7: Pengelolaan Data Lokal — Demo (Penyelesaian CBL)
// ============================================================================
//
// Tujuan:
//   Menunjukkan pengelolaan data lokal pada aplikasi Flutter: model data,
//   state dengan `StatefulWidget` dan `setState`, serta CRUD lokal
//   (Create, Read, Update, Delete) pada data yang disimpan dalam memori.
//
// Konteks:
//   Aplikasi peminjaman ruang laboratorium — melanjutkan kasus CBL
//   Pertemuan 4–6 (daftar pengajuan → form pengajuan → detail → peninjauan).
//   Data pengajuan kini dibuat dari form, disimpan dalam state, ditampilkan
//   pada daftar, dapat diubah statusnya, dan dapat dihapus.
//
// Cara menjalankan (DartPad — tanpa instalasi):
//   1. Buka https://dartpad.dev/?template=app
//   2. Ganti seluruh isi panel kiri dengan isi file ini.
//   3. Tekan Run. Amati hasil di panel kanan.
//
// Cara menjalankan (Flutter SDK — sesuai panduan/Panduan-Lengkap-PAB.md):
//   1. Gunakan file ini sebagai isi lib/main.dart pada project hasil
//      `flutter create`.
//   2. Jalankan dari folder project:
//        flutter run -d chrome
//
// Persistensi (data bertahan setelah aplikasi ditutup) dengan package
// `shared_preferences` ditunjukkan pada file terpisah:
//   code/pertemuan-07/demo-persistensi-flutter.dart
//
// Eksperimen:
//   Tambah pengajuan dari form, amati daftar bertambah. Ubah status pada
//   detail, amati daftar diperbarui. Hapus pengajuan dengan konfirmasi.
//
// Konsep yang ditunjukkan (Pertemuan 7):
//   - Model data (class + field final + konstruktor + toString)
//   - StatefulWidget + State : data disimpan pada state
//   - setState               : pembaruan tampilan setelah data berubah
//   - CRUD lokal             : add, itemCount/itemBuilder, indexWhere, removeWhere
//   - id unik                : kunci operasi update dan delete
//   - AlertDialog            : konfirmasi sebelum hapus
// ============================================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Aplikasi utama. Peta layar didefinisikan sekali di sini — setiap layar
/// dirujuk melalui namanya, bukan melalui konstruktor tersebar.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peminjaman Ruang Lab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HalamanDaftarPengajuan(),
        '/form': (context) => const FormPengajuan(),
        '/detail': (context) => const DetailPengajuan(),
      },
    );
  }
}

/// Model data — satu pengajuan peminjaman ruang laboratorium.
/// Field bersifat final: perubahan (mis. status) menghasilkan objek baru.
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

  @override
  String toString() => 'Pengajuan $ruang — $tanggal ($jam)';
}

/// Layar daftar pengajuan — StatefulWidget karena menyimpan data yang
/// berubah (daftar pengajuan) pada state.
class HalamanDaftarPengajuan extends StatefulWidget {
  const HalamanDaftarPengajuan({super.key});

  @override
  State<HalamanDaftarPengajuan> createState() => _HalamanDaftarPengajuanState();
}

class _HalamanDaftarPengajuanState extends State<HalamanDaftarPengajuan> {
  /// State — satu sumber data yang dibaca seluruh layar.
  final List<DataPengajuan> _daftar = [];

  /// Read — menampilkan daftar dari state.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengajuan Ruang Lab')),
      body: _daftar.isEmpty
          ? const Center(
              child: Text(
                'Belum ada pengajuan.\nTekan + untuk mengajukan.',
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
                    trailing: ChipStatus(status: pengajuan.status),
                    onTap: () => _bukaDetail(pengajuan),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/form'),
        icon: const Icon(Icons.add),
        label: const Text('Ajukan'),
      ),
    );
  }

  /// Membuka detail — data dikirim melalui arguments (Pertemuan 6).
  void _bukaDetail(DataPengajuan pengajuan) {
    Navigator.pushNamed(context, '/detail', arguments: pengajuan);
  }

  /// Create — menambah pengajuan dari form (dipanggil layar form).
  void tambahPengajuan(DataPengajuan pengajuan) {
    setState(() {
      _daftar.add(pengajuan);
    });
  }

  /// Update — mengubah status pengajuan (dipanggil layar detail).
  void ubahStatus(String id, String statusBaru) {
    setState(() {
      final index = _daftar.indexWhere((p) => p.id == id);
      if (index != -1) {
        final lama = _daftar[index];
        _daftar[index] = DataPengajuan(
          id: lama.id,
          ruang: lama.ruang,
          tanggal: lama.tanggal,
          jam: lama.jam,
          status: statusBaru,
        );
      }
    });
  }

  /// Delete — menghapus pengajuan berdasarkan id.
  void hapusPengajuan(String id) {
    setState(() {
      _daftar.removeWhere((p) => p.id == id);
    });
  }
}

/// Form pengajuan — validasi (Pertemuan 6) dilanjutkan dengan penyimpanan
/// ke daftar melalui callback yang diterima dari layar daftar.
class FormPengajuan extends StatefulWidget {
  const FormPengajuan({super.key});

  @override
  State<FormPengajuan> createState() => _FormPengajuanState();
}

class _FormPengajuanState extends State<FormPengajuan> {
  final _formKey = GlobalKey<FormState>();
  final _ruangController = TextEditingController();
  final _tanggalController = TextEditingController();
  final _jamController = TextEditingController();

  @override
  void dispose() {
    _ruangController.dispose();
    _tanggalController.dispose();
    _jamController.dispose();
    super.dispose();
  }

  void _kirim() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    // Membaca layar daftar dari stack Navigator untuk memanggil callback.
    final daftarState = context
        .findAncestorStateOfType<_HalamanDaftarPengajuanState>();
    if (daftarState == null) {
      return;
    }
    daftarState.tambahPengajuan(
      DataPengajuan(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        ruang: _ruangController.text.trim(),
        tanggal: _tanggalController.text.trim(),
        jam: _jamController.text.trim(),
        status: 'menunggu',
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Pengajuan "${_ruangController.text.trim()}" disimpan.'),
      ),
    );
    Navigator.pop(context);
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
                  labelText: 'Tanggal',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Tanggal wajib diisi.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _jamController,
                decoration: const InputDecoration(
                  labelText: 'Jam',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Jam wajib diisi.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: _kirim,
                child: const Text('Kirim'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Detail pengajuan — read-only (Pertemuan 6) ditambah aksi ubah status
/// dan hapus yang memanggil callback layar daftar.
class DetailPengajuan extends StatelessWidget {
  const DetailPengajuan({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final pengajuan = args is DataPengajuan ? args : null;

    if (pengajuan == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detail Pengajuan')),
        body: const Center(child: Text('Data tidak tersedia.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Pengajuan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(pengajuan.ruang, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('${pengajuan.tanggal} — ${pengajuan.jam}'),
            const SizedBox(height: 8),
            ChipStatus(status: pengajuan.status),
            const SizedBox(height: 24),
            Row(
              children: [
                FilledButton(
                  onPressed: () => _ubahStatus(context, pengajuan, 'disetujui'),
                  child: const Text('Setujui'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () => _ubahStatus(context, pengajuan, 'ditolak'),
                  child: const Text('Tolak'),
                ),
                const Spacer(),
                IconButton(
                  tooltip: 'Hapus',
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => _konfirmasiHapus(context, pengajuan),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _ubahStatus(BuildContext context, DataPengajuan pengajuan, String status) {
    final daftarState = context
        .findAncestorStateOfType<_HalamanDaftarPengajuanState>();
    daftarState?.ubahStatus(pengajuan.id, status);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Status "${pengajuan.ruang}" menjadi $status.')),
    );
    Navigator.pop(context);
  }

  Future<void> _konfirmasiHapus(
      BuildContext context, DataPengajuan pengajuan) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus pengajuan?'),
        content: Text('Pengajuan ${pengajuan.ruang} akan dihapus.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
    if (yakin == true) {
      final daftarState = context
          .findAncestorStateOfType<_HalamanDaftarPengajuanState>();
      daftarState?.hapusPengajuan(pengajuan.id);
      Navigator.pop(context);
    }
  }
}

/// Chip status — label visual untuk status pengajuan (Pertemuan 5–6).
class ChipStatus extends StatelessWidget {
  const ChipStatus({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final warna = switch (status) {
      'disetujui' => Colors.green,
      'ditolak' => Colors.red,
      _ => Colors.orange,
    };
    return Chip(
      label: Text(status),
      backgroundColor: warna.withValues(alpha: 0.15),
      side: BorderSide(color: warna),
    );
  }
}