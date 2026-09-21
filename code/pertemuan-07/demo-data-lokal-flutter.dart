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
// Pola state yang digunakan:
//   Layar daftar memegang state (source of truth). Layar form dan detail
//   TIDAK mencari state tersebut — layar daftar mengirim callback (fungsi)
//   ke layar form/detail melalui konstruktor saat berpindah layar. Layar
//   tujuan memanggil callback untuk meminta perubahan data; layar daftar
//   yang membungkus perubahannya dengan `setState`.
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
//   - Callback melalui konstruktor: layar tujuan tidak mencari state layar daftar
// ============================================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Aplikasi utama.
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
      home: const HalamanDaftarPengajuan(),
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

  /// Membuat salinan objek dengan field baru — digunakan pada Update.
  DataPengajuan salinDengan({String? status}) {
    return DataPengajuan(
      id: id,
      ruang: ruang,
      tanggal: tanggal,
      jam: jam,
      status: status ?? this.status,
    );
  }
}

/// Layar daftar pengajuan — StatefulWidget karena menyimpan data yang
/// berubah (daftar pengajuan) pada state. Layar ini adalah satu-satunya
/// pemilik state `_daftar`; layar form dan detail memintanya mengubah
/// data melalui callback yang dikirim lewat konstruktor.
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
        onPressed: _bukaForm,
        icon: const Icon(Icons.add),
        label: const Text('Ajukan'),
      ),
    );
  }

  /// Membuka form — mengirim callback `tambahPengajuan` yang dapat
  /// dipanggil layar form untuk menyimpan data baru.
  void _bukaForm() {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) =>
            FormPengajuan(onKirim: (pengajuan) => tambahPengajuan(pengajuan)),
      ),
    );
  }

  /// Membuka detail — mengirim callback ubah status dan hapus yang dapat
  /// dipanggil layar detail untuk meminta perubahan data.
  void _bukaDetail(DataPengajuan pengajuan) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => DetailPengajuan(
          pengajuan: pengajuan,
          onUbahStatus: (status) => ubahStatus(pengajuan.id, status),
          onHapus: () => _konfirmasiHapus(pengajuan),
        ),
      ),
    );
  }

  /// Create — menambah pengajuan dari form (callback layar form).
  void tambahPengajuan(DataPengajuan pengajuan) {
    setState(() {
      _daftar.add(pengajuan);
    });
  }

  /// Update — mengubah status pengajuan (callback layar detail).
  void ubahStatus(String id, String statusBaru) {
    setState(() {
      final index = _daftar.indexWhere((p) => p.id == id);
      if (index != -1) {
        _daftar[index] = _daftar[index].salinDengan(status: statusBaru);
      }
    });
  }

  Future<bool> _konfirmasiHapus(DataPengajuan pengajuan) async {
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
    if (yakin != true) {
      return false;
    }
    setState(() {
      _daftar.removeWhere((p) => p.id == pengajuan.id);
    });
    return true;
  }
}

/// Form pengajuan — validasi (Pertemuan 6) dilanjutkan dengan penyimpanan
/// ke daftar melalui callback `onKirim` yang diterima dari layar daftar.
class FormPengajuan extends StatefulWidget {
  const FormPengajuan({super.key, required this.onKirim});

  /// Callback yang dipanggil saat data valid — diisi layar daftar.
  final void Function(DataPengajuan pengajuan) onKirim;

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
    widget.onKirim(
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
              FilledButton(onPressed: _kirim, child: const Text('Kirim')),
            ],
          ),
        ),
      ),
    );
  }
}

/// Detail pengajuan — read-only (Pertemuan 6) ditambah aksi ubah status
/// dan hapus. Perubahan data diminta melalui callback ke layar daftar;
/// konfirmasi hapus ditampilkan di layar daftar (pemilik state).
class DetailPengajuan extends StatelessWidget {
  const DetailPengajuan({
    super.key,
    required this.pengajuan,
    required this.onUbahStatus,
    required this.onHapus,
  });

  final DataPengajuan pengajuan;

  /// Callback ubah status — diisi layar daftar.
  final void Function(String status) onUbahStatus;

  /// Callback hapus (menampilkan konfirmasi, menghapus bila disetujui).
  /// Menghasilkan true bila data dihapus — layar detail menutup dirinya
  /// hanya pada kondisi tersebut; bila dibatalkan, detail tetap tampil.
  final Future<bool> Function() onHapus;

  void _ubahStatus(BuildContext context, String status) {
    onUbahStatus(status);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Status "${pengajuan.ruang}" menjadi $status.')),
    );
    Navigator.pop(context);
  }

  Future<void> _mintaHapus(BuildContext context) async {
    final dihapus = await onHapus();
    if (dihapus && context.mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Pengajuan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pengajuan.ruang,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text('${pengajuan.tanggal} — ${pengajuan.jam}'),
            const SizedBox(height: 8),
            ChipStatus(status: pengajuan.status),
            const SizedBox(height: 24),
            Row(
              children: [
                FilledButton(
                  onPressed: () => _ubahStatus(context, 'disetujui'),
                  child: const Text('Setujui'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () => _ubahStatus(context, 'ditolak'),
                  child: const Text('Tolak'),
                ),
                const Spacer(),
                IconButton(
                  tooltip: 'Hapus',
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => _mintaHapus(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
