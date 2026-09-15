// ============================================================================
// PAB — Pertemuan 2: Latihan Dasar Dart (TODO Terbimbing)
// ============================================================================
// Kasus: skema penilaian mata kuliah PAB.
//
// Setiap TODO harus diselesaikan sesuai spesifikasi. Setelah selesai,
// jalankan:
//   dart latihan-dasar-dart.dart
// dan pastikan keluaran sesuai contoh pada akhir tiap TODO.
// ============================================================================

void main() {
  // ---------- Data ----------
  final daftarKomponen = [
    {'nama': 'Tugas', 'bobot': 30, 'skor': 28},
    {'nama': 'Praktikum', 'bobot': 25, 'skor': 24},
    {'nama': 'UTS', 'bobot': 20, 'skor': 15},
    {'nama': 'UAS', 'bobot': 25, 'skor': 23},
  ];

  // ============================================================
  // TODO 1 — Konstanta dan variabel
  // Deklarasikan `const int jumlahKomponen` = panjang daftar,
  // lalu `final String namaKuliah = 'PAB'`.
  // Cetak: "Jumlah komponen penilaian: 4 (mata kuliah PAB)."
  // ============================================================

  // ============================================================
  // TODO 2 — Percabangan
  // Buat fungsi `predikat(int nilai)` yang mengembalikan:
  //   86 ke atas -> 'A', 76-85 -> 'B', 61-75 -> 'C', selain itu
  //   -> 'Perlu perbaikan'.
  // Cetak predikat untuk nilai 88 dan 50.
  // ============================================================

  // ============================================================
  // TODO 3 — Perulangan
  // Jalankan for-loop pada `daftarKomponen` dan cetak tiap baris:
  //   "Tugas: bobot 30, skor 28, capaian 93%"
  // (capaian = skor / bobot * 100, bulatkan ke bilangan bulat
  //  menggunakan ((...).round() atau ~/ ).
  // ============================================================

  // ============================================================
  // TODO 4 — Accumulator
  // Gunakan perulangan untuk menjumlahkan seluruh `bobot` dan
  // seluruh `skor` dari daftar di atas.
  // Cetak: "Total bobot: 100, total skor: 90, ratarata: 90.0%."
  // (ratartar skor / bobot * 100)
  // ============================================================

  // ============================================================
  // TODO 5 — Map dan destructuring (pola dekonstruksi entri)
  // Ambil komponen dengan `nama == 'UAS'` (gunakan `firstWhere`
  // dengan `orElse`). Cetak kode dan bobotnya:
  //   "Kode komponen UAS: UAS (bobot 25)."
  // ============================================================

  // ============================================================
  // TODO 6 — Fungsi arrow
  // Tulis fungsi arrow `kalikanSkor(int skor, int faktor) => ...`
  // lalu cetak `kalikanSkor(90, 2)`.
  // ============================================================
}
