// ============================================================================
// PAB — Pertemuan 6: Latihan Navigasi Flutter (TODO Terbimbing)
// ============================================================================
//
// Kasus: aplikasi Perpustakaan Kampus versi bernavigasi — menghubungkan
// daftar buku (Pertemuan 5) ke form peminjaman dan detail buku melalui
// route bernama, form validasi, dan feedback SnackBar. File ini SUDAH
// dapat dijalankan; selesaikan setiap TODO untuk menghasilkan versi final
// sesuai spesifikasi.
//
//   Jalur 1 — DartPad (tanpa instalasi):
//     Buka https://dartpad.dev/?template=app, ganti seluruh isi panel kiri
//     dengan isi file ini, lalu tekan Run.
//
//   Jalur 2 — Flutter SDK (sesuai panduan/Panduan-Lengkap-PAB.md):
//     Gunakan file ini sebagai isi lib/main.dart pada project hasil
//     `flutter create`, lalu jalankan `flutter run` atau `flutter run -d chrome`.
//
// Setiap TODO merujuk materi Bagian 4-7 pada 06-Pertemuan-6.md.
// Pastikan hasil alur sesuai deskripsi pada tiap TODO.
// ============================================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Widget akar.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAB — Latihan Navigasi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),

      // ============================================================
      // TODO 1 — Peta route bernama:
      // Tambahkan `initialRoute: '/'` dan peta `routes` berisi:
      //   '/'       -> HalamanDaftarBuku
      //   '/pinjam' -> FormPeminjaman
      //   '/detail' -> DetailBuku
      // ============================================================
      home: const HalamanDaftarBuku(),
    );
  }
}

/// Satu data buku — struktur sederhana; model formal menjadi
/// materi Pertemuan 7.
class DataBuku {
  const DataBuku({
    required this.judul,
    required this.penulis,
    required this.status,
  });

  final String judul;
  final String penulis;
  final String status;
}

/// Data statis untuk latihan — pada Minggu 7 digantikan data lokal.
const List<DataBuku> daftarBuku = [
  DataBuku(judul: 'Basis Data', penulis: 'A. Silberschatz', status: 'tersedia'),
  DataBuku(judul: 'Struktur Data', penulis: 'R. Lafore', status: 'tersedia'),
  DataBuku(
    judul: 'Jaringan Komputer',
    penulis: 'A. Tanenbaum',
    status: 'habis',
  ),
  DataBuku(
    judul: 'Interaksi Manusia Komputer',
    penulis: 'A. Dix',
    status: 'tersedia',
  ),
];

/// Halaman daftar buku — titik masuk alur peminjaman.
class HalamanDaftarBuku extends StatelessWidget {
  const HalamanDaftarBuku({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perpustakaan Kampus')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: daftarBuku.length,
        itemBuilder: (context, index) {
          return KartuBuku(buku: daftarBuku[index]);
        },
      ),

      // ============================================================
      // TODO 2 — Aksi menuju form:
      // Tambahkan FloatingActionButton.extended berlabel "Pinjam" yang
      // memanggil Navigator.pushNamed(context, '/pinjam').
      // ============================================================
    );
  }
}

/// Satu item daftar sebagai kartu — mengetuk kartu membuka detail.
class KartuBuku extends StatelessWidget {
  const KartuBuku({super.key, required this.buku});

  final DataBuku buku;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.menu_book_outlined),
        title: Text(buku.judul),
        subtitle: Text(buku.penulis),
        // Versi sementara — digantikan ChipStatus pada TODO 4.
        trailing: StatusSementara(status: buku.status),

        // ==========================================================
        // TODO 3 — Navigasi dengan data:
        // Tambahkan onTap yang memanggil Navigator.pushNamed dengan
        // route '/detail' dan arguments: buku. Tambahkan splashColor
        // dari Theme.of(context).colorScheme.primaryContainer agar
        // feedback sentuhan mengikuti tema.
        // ==========================================================
      ),
    );
  }
}

/// Versi sementara — digantikan ChipStatus pada TODO 4.
class StatusSementara extends StatelessWidget {
  const StatusSementara({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Text(status);
  }
}

// ============================================================================
// TODO 4 — Status berwarna:
// Buat widget `ChipStatus` (StatelessWidget) yang menerima `status`
// (String) dan mengembalikan Chip dengan warna dari
// Theme.of(context).colorScheme menggunakan ternary:
//   'tersedia' -> tertiaryContainer / onTertiaryContainer
//   selain itu -> errorContainer / onErrorContainer
// Lalu ganti pemanggilan StatusSementara pada KartuBuku menjadi
// ChipStatus setelah widget ini selesai.
// Pola lengkap tersedia pada demo-navigasi-flutter.dart (ChipStatus).
// ============================================================================

/// Form peminjaman — validasi sebelum aksi kirim.
class FormPeminjaman extends StatefulWidget {
  const FormPeminjaman({super.key});

  @override
  State<FormPeminjaman> createState() => _FormPeminjamanState();
}

class _FormPeminjamanState extends State<FormPeminjaman> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    super.dispose();
  }

  // ================================================================
  // TODO 5 — Aksi kirim dengan validasi dan feedback:
  // Buat method `_kirim(BuildContext context)` yang:
  //   1. memeriksa `!_formKey.currentState!.validate()` lalu return;
  //   2. membaca `_namaController.text.trim()`;
  //   3. menampilkan SnackBar "Peminjaman atas nama ... dicatat
  //      (simulasi).";
  //   4. memanggil Navigator.pop(context).
  // Pola lengkap tersedia pada demo-navigasi-flutter.dart (_kirim).
  // ================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Peminjaman')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                hintText: 'cth. Sinta Maharani',
                border: OutlineInputBorder(),
              ),
              // ====================================================
              // TODO 6 — Validator tiap field:
              // Tambahkan validator pada kedua field: kembalikan pesan
              // "Nama wajib diisi." / "NIM wajib diisi." ketika value
              // null atau kosong setelah trim; kembalikan null bila valid.
              // ====================================================
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _nimController,
              decoration: const InputDecoration(
                labelText: 'NIM',
                hintText: 'cth. 2301010001',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              // Ganti null dengan () => _kirim(context) setelah TODO 5.
              onPressed: null,
              icon: const Icon(Icons.send_outlined),
              label: const Text('Kirim Peminjaman'),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// TODO 7 — Detail buku (read-only):
// Buat widget `DetailBuku` (StatelessWidget) yang membaca data melalui
//   final args = ModalRoute.of(context)?.settings.arguments;
//   final buku = args is DataBuku ? args : null;
// Tampilkan Scaffold + AppBar "Detail Buku"; bila buku null tampilkan
// teks "Data buku tidak tersedia."; bila ada tampilkan Card + ListTile
// (judul, penulis, ChipStatus) dan FilledButton.tonalIcon "Kembali"
// yang memanggil Navigator.pop(context).
// Pola lengkap tersedia pada demo-navigasi-flutter.dart (DetailPengajuan).
// ============================================================================
