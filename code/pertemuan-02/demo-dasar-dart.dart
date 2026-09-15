// ============================================================================
// PAB — Pertemuan 2: Dasar Pemrograman Dart
// ============================================================================
// Tujuan:
//   Menunjukkan sintaks dasar Dart yang digunakan di seluruh materi Flutter:
//   variabel dan konstanta, tipe data, operator, percabangan, perulangan,
//   fungsi, dan koleksi (List, Set, Map).
//
// Cara menjalankan:
//   dart demo-dasar-dart.dart
//
// Catatan:
//   File ini tidak memerlukan dependency eksternal dan tidak memerlukan
//   Flutter SDK. Cukup Dart SDK yang disertakan dalam instalasi Flutter.
// ============================================================================

void main() {
  // ------------------------------------------------------------------
  // 1. Variabel dan konstanta
  // ------------------------------------------------------------------
  var namaMataKuliah = 'Pemrograman Aplikasi Bergerak'; // var — tipe ditelusuri otomatis
  int pertemuan = 2; // int — tipe eksplisit
  double bobot = 1.5; // double
  String kodeMk = 'USA-WP2360241'; // String
  bool sudahPraktikum = true; // bool
  const int totalPertemuan = 16; // const — nilai tetap sejak awal
  final tanggalMulai = 'September 2026'; // final — tidak boleh diubah setelah diinisialisasi

  print('=== Variabel dan Konstanta ===');
  print('Mata kuliah: $namaMataKuliah ($kodeMk)');
  print('Pertemuan ke-$pertemuan dari $totalPertemuan (bobot $bobot SKS).');
  print('Sudah praktikum? $sudahPraktikum. Mulai: $tanggalMulai.');
  // tanggalMulai = 'Oktober'; // error: final tidak boleh diubah setelah diinisialisasi

  // ------------------------------------------------------------------
  // 2. Operasi penggabungan string
  // ------------------------------------------------------------------
  final daftarMateri = ['Variabel', 'Tipe data', 'Fungsi', 'Koleksi'];
  final materiGabungan = daftarMateri.join(', ');

  print('\n=== Penggabungan String ===');
  print('Materi pertemuan ini: $materiGabungan.');

  // ------------------------------------------------------------------
  // 3. Tipe data dan konversi
  // ------------------------------------------------------------------
  final skorUts = '75'; // String
  final skorUtsInt = int.parse(skorUts); // konversi String menjadi int
  final ratarata = skorUtsInt / 2; // pembagian menghasilkan double

  print('\n=== Konversi Tipe Data ===');
  print('Skor UTS: $skorUtsInt, setengahnya: $ratarata (tipe double).');

  // ------------------------------------------------------------------
  // 4. Operator perbandingan
  // ------------------------------------------------------------------
  final nilaiSisa = 100 - skorUtsInt;

  print('\n=== Operator ===');
  print('Nilai yang hilang: $nilaiSisa.');
  print('Skor sudah cukup (>= 60)? ${skorUtsInt >= 60}.');
  print('Kurang dari 90? ${skorUtsInt < 90}.');

  // ------------------------------------------------------------------
  // 5. Percabangan
  // ------------------------------------------------------------------
  String predikat;
  if (skorUtsInt >= 86) {
    predikat = 'A';
  } else if (skorUtsInt >= 76) {
    predikat = 'B';
  } else if (skorUtsInt >= 61) {
    predikat = 'C';
  } else {
    predikat = 'Perlu remedial';
  }

  // Ekspresi nullish: gunakan nilai cadangan ketika hasil null
  final skorUas = 88;
  final total = skorUas ?? 0;

  print('Predikat UTS: $predikat. Total dengan UAS: ${total + skorUtsInt}.');

  // ------------------------------------------------------------------
  // 6. Perulangan
  // ------------------------------------------------------------------
  print('\n=== Perulangan ===');

  for (var i = 1; i <= 3; i++) {
    print('Materi ke-$i dari $totalPertemuan');
  }

  final daftarKelas = ['SI-VIIB', 'SI-VIIA'];
  for (var kelas in daftarKelas) {
    print('Jadwal: $kelas mengikuti praktikum sesuai TIMELINE.md.');
  }

  var j = 0;
  while (j < 2) {
    print('Progres tahap $j');
    j++;
  }

  // ------------------------------------------------------------------
  // 7. Fungsi
  // ------------------------------------------------------------------
  print('\n=== Fungsi ===');
  print('Predikat total: ${hitungPredikat(total + skorUtsInt)}.');
  print('Selisih: ${selisih(90, skorUtsInt)}.');

  // Fungsi dengan parameter default
  final jadwal = buatJadwal('SI-VIIB', hari: 'Rabu');
  print('Jadwal: $jadwal.');

  // Arrow function
  final kaliDua = (int nilai) => nilai * 2;
  print('Hasil kaliDua(7) = ${kaliDua(7)}.');

  // ------------------------------------------------------------------
  // 8. Koleksi: List, Set, Map
  // ------------------------------------------------------------------
  print('\n=== Koleksi ===');

  final daftarSkor = [75, 88, 61, 88];
  print('Daftar skor: $daftarSkor.');
  print('Jumlah skor: ${daftarSkor.length}.');
  daftarSkor.add(92);
  print('Setelah menambah 92: $daftarSkor.');

  final mataKuliahKonsentrasi = {'Flutter', 'Dart', 'REST API'};
  print('Materi unik (Set): $mataKuliahKonsentrasi.');

  final detailMk = {
    'kode': kodeMk,
    'nama': 'Pemrograman Aplikasi Bergerak',
    'sks': 3,
    'semester': 7,
  };
  print('Detail MK: ${detailMk['nama']} (SKS ${detailMk['sks']}).');
  for (final (kunci, nilai) in detailMk.entries) {
    print('- $kunci: $nilai');
  }
}

// Fungsi: menentukan predikat dari total nilai
String hitungPredikat(int nilai) {
  if (nilai >= 86) return 'A';
  if (nilai >= 76) return 'B';
  if (nilai >= 61) return 'C';
  return 'Perlu remedial';
}

// Fungsi dua parameter
int selisih(int a, int b) {
  return a - b;
}

// Fungsi dengan parameter default (named parameter)
String buatJadwal(String kelas, {String hari = 'Rabu', String jam = '16:00'}) {
  return '$kelas ($hari, $jam)';
}
