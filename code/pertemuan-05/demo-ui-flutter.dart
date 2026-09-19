// ============================================================================
// PAB — Pertemuan 5: UI/UX Mobile — Demo (Penyelesaian CBL)
// ============================================================================
//
// Tujuan:
//   Menunjukkan penerjemahan wireframe menjadi halaman Flutter: tema
//   terpusat (ThemeData), kartu daftar (Card + ListTile), status berwarna
//   (ternary + warna tema), aksi utama (FloatingActionButton.extended),
//   dan keadaan kosong.
//
// Konteks:
//   Halaman utama mahasiswa pada aplikasi peminjaman ruang laboratorium —
//   melanjutkan kasus CBL Pertemuan 4 (memenuhi F-03; titik masuk menuju F-01).
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
//   Ubah konstanta `daftarKosong` menjadi true, simpan, lalu amati
//   keadaan kosong (hot reload / hot restart).
//
// Konsep yang ditunjukkan (Pertemuan 5):
//   - ThemeData + ColorScheme.fromSeed : warna terpusat dari satu warna benih.
//   - Card + ListTile                  : satu item daftar sebagai kartu.
//   - Chip + ternary                   : status dibedakan warna dari tema.
//   - FloatingActionButton.extended    : aksi utama dengan target sentuh memadai.
//   - Keadaan kosong                   : layar tidak pernah putih tanpa penjelasan.
// ============================================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Widget akar. Tema didefinisikan sekali di sini — seluruh halaman
/// mengambil warna dari [colorScheme] hasil benih indigo.
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
      home: const HalamanUtamaMahasiswa(),
    );
  }
}

/// Halaman utama mahasiswa — memenuhi F-03 (melihat status pengajuan)
/// dan menjadi titik masuk menuju F-01 (mengajukan peminjaman).
class HalamanUtamaMahasiswa extends StatelessWidget {
  const HalamanUtamaMahasiswa({super.key});

  /// Ubah menjadi true untuk mengamati keadaan kosong.
  static const bool daftarKosong = false;

  /// Data statis untuk demonstrasi — pada Minggu 7 digantikan data lokal.
  static const List<Map<String, String>> daftarPengajuan = [
    {
      'ruang': 'Lab Komputer 1',
      'tanggal': 'Senin, 19 Okt',
      'jam': '10:00-12:00',
      'durasi': '2 jam',
      'status': 'disetujui',
    },
    {
      'ruang': 'Lab Jaringan',
      'tanggal': 'Rabu, 21 Okt',
      'jam': '13:00-15:00',
      'durasi': '2 jam',
      'status': 'menunggu',
    },
    {
      'ruang': 'Lab Komputer 2',
      'tanggal': 'Kamis, 22 Okt',
      'jam': '08:00-10:00',
      'durasi': '2 jam',
      'status': 'ditolak',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Peminjaman Ruang Lab')),
      body: daftarKosong
          ? const KeadaanKosong()
          : Column(
              children: [
                const RingkasanPengguna(),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: daftarPengajuan.length,
                    itemBuilder: (context, index) {
                      final pengajuan = daftarPengajuan[index];
                      return KartuPengajuan(pengajuan: pengajuan);
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigasi ke form pengajuan (F-01) dibangun pada Pertemuan 6.
        },
        icon: const Icon(Icons.add),
        label: const Text('Ajukan Peminjaman'),
      ),
    );
  }
}

/// Area ringkasan atas — hierarki visual: judul tebal, keterangan redup.
class RingkasanPengguna extends StatelessWidget {
  const RingkasanPengguna({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Halo, Rani!', style: textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(
              '3 pengajuan semester ini — tekan tombol di bawah untuk mengajukan.',
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

/// Satu item daftar: Card + ListTile + status berwarna.
class KartuPengajuan extends StatelessWidget {
  const KartuPengajuan({super.key, required this.pengajuan});

  final Map<String, String> pengajuan;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const Icon(Icons.meeting_room_outlined),
        title: Text(
          pengajuan['ruang'] ?? '-',
          style: textTheme.titleMedium,
        ),
        subtitle: Text(
          '${pengajuan['tanggal'] ?? '-'} • '
          '${pengajuan['jam'] ?? '-'} (${pengajuan['durasi'] ?? '-'})',
          style: textTheme.bodySmall,
        ),
        trailing: ChipStatus(
          status: pengajuan['status'] ?? 'menunggu',
        ),
      ),
    );
  }
}

/// Status sebagai Chip berwarna — warna diambil dari tema, bukan ditulis
/// langsung. Pembedaan warna memakai ternary (materi P2).
class ChipStatus extends StatelessWidget {
  const ChipStatus({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final (Color latar, Color teks) = status == 'disetujui'
        ? (colorScheme.tertiaryContainer, colorScheme.onTertiaryContainer)
        : status == 'ditolak'
            ? (colorScheme.errorContainer, colorScheme.onErrorContainer)
            : (colorScheme.secondaryContainer, colorScheme.onSecondaryContainer);
    return Chip(
      label: Text(status),
      backgroundColor: latar,
      labelStyle: TextStyle(color: teks, fontWeight: FontWeight.w600),
      visualDensity: VisualDensity.compact,
    );
  }
}

/// Keadaan kosong — pengguna baru tidak boleh melihat layar putih.
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
            'Tekan tombol "Ajukan Peminjaman" untuk membuat pengajuan pertama.',
            style: textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
