// ============================================================================
// PAB — Pertemuan 2: Solusi Referensi Dasar Dart (untuk dosen)
// ============================================================================
// Solusi lengkap dari latihan-dasar-dart.dart untuk acuan penilaian.
//
// Cara menjalankan:
//   dart solusi-dasar-dart.dart
// ============================================================================

void main() {
  // ---------- Data ----------
  final daftarKomponen = [
    {'nama': 'Tugas', 'bobot': 30, 'skor': 28},
    {'nama': 'Praktikum', 'bobot': 25, 'skor': 24},
    {'nama': 'UTS', 'bobot': 20, 'skor': 15},
    {'nama': 'UAS', 'bobot': 25, 'skor': 23},
  ];

  // TODO 1
  const int jumlahKomponen = 4;
  final String namaKuliah = 'PAB';
  print('Jumlah komponen penilaian: $jumlahKomponen (mata kuliah $namaKuliah).');

  // TODO 2
  print('Predikat 88: ${predikat(88)}.');
  print('Predikat 50: ${predikat(50)}.');

  // TODO 3
  for (var i = 0; i < daftarKomponen.length; i++) {
    final komponen = daftarKomponen[i];
    final capaian = ((komponen['skor'] as int) / (komponen['bobot'] as int) * 100).round();
    print('${komponen['nama']}: bobot ${komponen['bobot']}, skor ${komponen['skor']}, capaian ${capaian}%');
  }

  // TODO 4
  var totalBobot = 0;
  var totalSkor = 0;
  for (final komponen in daftarKomponen) {
    totalBobot += komponen['bobot'] as int;
    totalSkor += komponen['skor'] as int;
  }
  final rataRata = totalSkor / totalBobot * 100;
  print('Total bobot: $totalBobot, total skor: $totalSkor, ratarata: ${rataRata.toStringAsFixed(1)}%.');

  // TODO 5
  final komponenUas = daftarKomponen.firstWhere(
    (komponen) => komponen['nama'] == 'UAS',
    orElse: () => {'nama': 'Belum ada', 'bobot': 0, 'skor': 0},
  );
  print('Kode komponen UAS: ${komponenUas['nama']} (bobot ${komponenUas['bobot']}).');

  // TODO 6
  final kalikanSkor = (int skor, int faktor) => skor * faktor;
  print('Hasil kalikanSkor(90, 2) = ${kalikanSkor(90, 2)}.');
}

String predikat(int nilai) {
  if (nilai >= 86) return 'A';
  if (nilai >= 76) return 'B';
  if (nilai >= 61) return 'C';
  return 'Perlu perbaikan';
}
