// ============================================================================
// PAB — Pertemuan 6: Navigasi dan Interaksi — Demo (Penyelesaian CBL)
// ============================================================================
//
// Tujuan:
//   Menunjukkan alur navigasi antarlayar pada aplikasi Flutter: route
//   bernama, `Navigator.push` / `Navigator.pop`, pengiriman data antarlayar
//   (melalui konstruktor), form dengan validasi, dan feedback interaksi
//   (`SnackBar`).
//
// Konteks:
//   Aplikasi peminjaman ruang laboratorium — melanjutkan kasus CBL
//   Pertemuan 4–5 (daftar pengajuan → form pengajuan → detail → peninjauan).
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
// Eksperimen:
//   Tekan tombol pengajuan, isi form, tekan kirim, amati feedback.
//   Kembali dengan tombol kembali AppBar atau pop — data tetap tampil.
//
// Konsep yang ditunjukkan (Pertemuan 6):
//   - Route bernama (`initialRoute`, `routes`) : peta layar terpusat.
//   - Navigator.pushNamed / pop               : berpindah dan kembali.
//   - ModalRoute.settings.arguments           : data antarlayar (read-only).
//   - Form + GlobalKey<FormState>             : validasi sebelum aksi.
//   - TextEditingController + dispose         : mengelola input; dibersihkan.
//   - SnackBar                                : feedback setelah aksi pengguna.
// ============================================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Widget akar. Peta layar didefinisikan sekali di sini — setiap layar
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
        '/': (context) => const HalamanUtamaMahasiswa(),
        '/form': (context) => const FormPengajuan(),
        '/detail': (context) => const DetailPengajuan(),
      },
    );
  }
}

/// Satu data pengajuan — struktur sederhana; model formal menjadi
/// materi Pertemuan 7 (state dan data lokal).
class DataPengajuan {
  const DataPengajuan({
    required this.ruang,
    required this.tanggal,
    required this.jam,
    required this.status,
  });

  final String ruang;
  final String tanggal;
  final String jam;
  final String status;
}

/// Data statis untuk demonstrasi — pada Minggu 7 digantikan data lokal.
const List<DataPengajuan> daftarPengajuan = [
  DataPengajuan(
    ruang: 'Lab Komputer 1',
    tanggal: 'Senin, 19 Okt',
    jam: '10:00-12:00',
    status: 'disetujui',
  ),
  DataPengajuan(
    ruang: 'Lab Jaringan',
    tanggal: 'Rabu, 21 Okt',
    jam: '13:00-15:00',
    status: 'menunggu',
  ),
  DataPengajuan(
    ruang: 'Lab Komputer 2',
    tanggal: 'Kamis, 22 Okt',
    jam: '08:00-10:00',
    status: 'ditolak',
  ),
];

/// Halaman utama mahasiswa — memenuhi F-03 (melihat status pengajuan)
/// dan menjadi titik masuk menuju F-01 (form pengajuan).
class HalamanUtamaMahasiswa extends StatelessWidget {
  const HalamanUtamaMahasiswa({super.key});

  /// Ubah menjadi true untuk mengamati keadaan kosong.
  static const bool daftarKosong = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Peminjaman Ruang Lab')),
      body: daftarKosong || daftarPengajuan.isEmpty
          ? const KeadaanKosong()
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: daftarPengajuan.length,
              itemBuilder: (context, index) {
                return KartuPengajuan(pengajuan: daftarPengajuan[index]);
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Berpindah ke form melalui route bernama — nama route
          // berasal dari peta `routes` pada MyApp.
          Navigator.pushNamed(context, '/form');
        },
        icon: const Icon(Icons.add),
        label: const Text('Ajukan'),
      ),
    );
  }
}

/// Satu item daftar sebagai kartu — mengetuk kartu membuka detail
/// dengan data pengajuan sebagai arguments.
class KartuPengajuan extends StatelessWidget {
  const KartuPengajuan({super.key, required this.pengajuan});

  final DataPengajuan pengajuan;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.meeting_room_outlined),
        title: Text(pengajuan.ruang),
        subtitle: Text('${pengajuan.tanggal} • ${pengajuan.jam}'),
        trailing: ChipStatus(status: pengajuan.status),
        // Mengetuk kartu = navigasi dengan data; warna tertekan
        // mengikuti tema tanpa penulisan warna manual.
        splashColor: colorScheme.primaryContainer,
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: pengajuan);
        },
      ),
    );
  }
}

/// Label status berwarna — warna dari tema melalui ternary,
/// konsisten dengan materi Pertemuan 5.
class ChipStatus extends StatelessWidget {
  const ChipStatus({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final disetujui = status == 'disetujui';
    final menunggu = status == 'menunggu';
    return Chip(
      label: Text(status),
      backgroundColor: disetujui
          ? colorScheme.tertiaryContainer
          : menunggu
          ? colorScheme.secondaryContainer
          : colorScheme.errorContainer,
      labelStyle: TextStyle(
        color: disetujui
            ? colorScheme.onTertiaryContainer
            : menunggu
            ? colorScheme.onSecondaryContainer
            : colorScheme.onErrorContainer,
      ),
      visualDensity: VisualDensity.compact,
    );
  }
}

/// Keadaan kosong — layar tidak pernah putih tanpa penjelasan.
class KeadaanKosong extends StatelessWidget {
  const KeadaanKosong({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.inbox_outlined, size: 56, color: colorScheme.outline),
          const SizedBox(height: 12),
          Text('Belum ada pengajuan', style: textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            'Tekan tombol Ajukan untuk membuat pengajuan pertama.',
            style: textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Form pengajuan — memenuhi F-01 (mengajukan peminjaman).
/// Validasi berjalan sebelum aksi kirim; feedback tampil via SnackBar.
class FormPengajuan extends StatefulWidget {
  const FormPengajuan({super.key});

  @override
  State<FormPengajuan> createState() => _FormPengajuanState();
}

class _FormPengajuanState extends State<FormPengajuan> {
  /// Kunci form — memegang status validasi seluruh field.
  final _formKey = GlobalKey<FormState>();

  /// Controller mengelola teks tiap field; dibersihkan pada dispose
  /// agar tidak terjadi kebocoran memori.
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

  /// Aksi kirim — validasi dahulu, baca input, tampilkan feedback,
  /// lalu kembali ke daftar. Penyimpanan permanen menjadi materi
  /// Pertemuan 7.
  void _kirim(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final ruang = _ruangController.text.trim();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pengajuan "$ruang" dikirim (simulasi).')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pengajuan')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _ruangController,
              decoration: const InputDecoration(
                labelText: 'Ruang',
                hintText: 'cth. Lab Komputer 1',
                border: OutlineInputBorder(),
              ),
              // Feedback validasi tampil otomatis di bawah field
              // ketika validator mengembalikan pesan error.
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
                hintText: 'cth. Senin, 26 Okt',
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
                hintText: 'cth. 10:00-12:00',
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
            FilledButton.icon(
              onPressed: () => _kirim(context),
              icon: const Icon(Icons.send_outlined),
              label: const Text('Kirim Pengajuan'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Detail pengajuan — menerima data melalui arguments route.
/// Layar ini read-only: menampilkan data yang dikirim dari daftar.
class DetailPengajuan extends StatelessWidget {
  const DetailPengajuan({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final pengajuan = args is DataPengajuan ? args : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Pengajuan')),
      body: pengajuan == null
          ? const Center(child: Text('Data pengajuan tidak tersedia.'))
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.meeting_room_outlined),
                    title: Text(pengajuan.ruang),
                    subtitle: Text('${pengajuan.tanggal} • ${pengajuan.jam}'),
                    trailing: ChipStatus(status: pengajuan.status),
                  ),
                ),
                const SizedBox(height: 12),
                FilledButton.tonalIcon(
                  onPressed: () {
                    // Kembali ke daftar — pop menghapus layar teratas
                    // dari stack Navigator.
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Kembali ke Daftar'),
                ),
              ],
            ),
    );
  }
}
