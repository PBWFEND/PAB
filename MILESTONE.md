# Milestone — Pemrograman Aplikasi Bergerak

Milestone disusun berdasarkan [`TIMELINE.md`](./TIMELINE.md), RPS OBE, dan tahapan project aplikasi mobile untuk kelas SI-VIIB dan SI-VIIA. Tanggal target berbeda sesuai jadwal kelas, sedangkan capaian dan deliverable tetap sama.

## Ringkasan Milestone

| Milestone | Fase | Minggu | Target SI-VIIB | Target SI-VIIA | CPMK | Deliverable Utama |
|:---------:|:-----|:------:|:---------------|:---------------|:----:|:------------------|
| M0 | Inisiasi project | 1 | 16 Sep 2026 | 19 Sep 2026 | CPMK-1 | Ide project, domain, dan target pengguna |
| M1 | Analisis kebutuhan | 2–4 | 7 Okt 2026 | 10 Okt 2026 | CPMK-2 | Dokumen kebutuhan dan user flow |
| M2 | UI/UX prototype | 5–6 | 21 Okt 2026 | 24 Okt 2026 | CPMK-2 | Prototype UI/UX dan navigation flow |
| M3 | Implementasi mobile awal | 6–7 | 28 Okt 2026 | 31 Okt 2026 | CPMK-3 | Prototype fungsional / MVP awal |
| M4 | UTS project review | 8 | **4 Nov 2026** | **7 Nov 2026** | CPMK-1 s.d. CPMK-3 | **Progress project + UTS** |
| M5 | Integrasi REST API | 9–10 | 18 Nov 2026 | 21 Nov 2026 | CPMK-3 | Fitur API terintegrasi |
| M6 | Fitur perangkat | 11 | 25 Nov 2026 | 28 Nov 2026 | CPMK-3 | Minimal satu fitur perangkat |
| M7 | Quality dan security | 12–13 | 9 Des 2026 | 12 Des 2026 | CPMK-4 | Test case, security checklist, dan bug fixes |
| M8 | Candidate release | 14 | 16 Des 2026 | 19 Des 2026 | CPMK-5 | Candidate release |
| M9 | Presentasi final | 15 | 23 Des 2026 | 26 Des 2026 | CPMK-5 | Demo dan dokumentasi |
| M10 | UAS / final release | 16 | **30 Des 2026** | **2 Jan 2027** | CPMK-5 | **Final app, laporan, dan UAS** |

---

## M0 — Inisiasi Project (CPMK-1)

**Tujuan:** Mahasiswa mampu menentukan domain Sistem Informasi, masalah pengguna, dan alasan penggunaan aplikasi bergerak.

### Deliverables
- [ ] Ide project dan domain SI.
- [ ] Identifikasi target pengguna.
- [ ] Deskripsi masalah dan alasan solusi berbentuk aplikasi mobile.
- [ ] Project Flutter awal dan bukti environment siap.

### Kriteria Selesai
- Domain project sesuai kebutuhan Sistem Informasi.
- Masalah dan target pengguna dijelaskan dengan jelas.
- Project Flutter dapat dijalankan pada emulator atau perangkat.

## M1 — Analisis Kebutuhan (CPMK-2)

**Tujuan:** Mahasiswa mampu menganalisis pengguna, kebutuhan, proses bisnis, dan alur penggunaan aplikasi.

### Deliverables
- [ ] User persona atau deskripsi pengguna.
- [ ] Daftar kebutuhan fungsional dan nonfungsional.
- [ ] Prioritas fitur utama.
- [ ] User flow aplikasi.

### Kriteria Selesai
- Kebutuhan memiliki hubungan yang jelas dengan masalah pengguna.
- User flow menunjukkan alur utama dari awal hingga selesai.
- Tugas aplikasi mobile dibedakan dari tugas backend SI.

## M2 — UI/UX Prototype (CPMK-2)

**Tujuan:** Mahasiswa mampu merancang antarmuka, struktur halaman, navigasi, dan interaksi berdasarkan kebutuhan pengguna.

### Deliverables
- [ ] Information architecture sederhana.
- [ ] Wireframe atau prototype digital.
- [ ] Navigation flow.
- [ ] Catatan keputusan UI/UX.

### Kriteria Selesai
- Struktur halaman mendukung user flow.
- Navigasi dan label mudah dipahami.
- Prototype memperhatikan ukuran layar, interaksi sentuh, dan feedback pengguna.

## M3 — Implementasi Mobile Awal (CPMK-3)

**Tujuan:** Mahasiswa mampu mengimplementasikan halaman utama, state dasar, dan pengelolaan data lokal sesuai rancangan.

### Deliverables
- [ ] Halaman utama dan halaman pendukung.
- [ ] Navigasi antarlayar.
- [ ] Form dan validasi dasar.
- [ ] Data lokal dan CRUD sederhana.
- [ ] MVP awal yang dapat didemonstrasikan.

### Kriteria Selesai
- Alur utama dapat dijalankan dari UI.
- Data dapat dibuat, dibaca, diubah, dan dihapus sesuai kebutuhan.
- MVP memiliki hubungan yang jelas dengan dokumen kebutuhan.

## M4 — UTS: Project Review (CPMK-1 s.d. CPMK-3)

**Tujuan:** Mengevaluasi pemahaman konsep, rancangan, dan progress implementasi hingga Minggu 7.

### Deliverables
- [ ] Ujian atau tes konsep.
- [ ] Demo progress project.
- [ ] Dokumen kebutuhan, prototype, dan MVP awal.
- [ ] Catatan perbaikan setelah review.

### Kriteria Selesai
- Mahasiswa dapat menjelaskan konsep mobile, UI/UX, navigasi, dan data lokal.
- Progress project dapat dijalankan dan didemonstrasikan.
- Masukan review dicatat sebagai dasar pengembangan berikutnya.

## M5 — Integrasi REST API (CPMK-3)

**Tujuan:** Mahasiswa mampu mengonsumsi REST API dan menghubungkan data mobile dengan proses bisnis Sistem Informasi.

### Deliverables
- [ ] Request `GET` dan/atau `POST` sesuai kebutuhan.
- [ ] Parsing response JSON.
- [ ] Loading state dan error handling.
- [ ] Integrasi data dengan user flow project.

### Kriteria Selesai
- Aplikasi dapat mengirim request dan menampilkan response dengan benar.
- Kondisi loading, berhasil, dan error ditangani.
- Integrasi API sesuai kontrak layanan backend.

## M6 — Fitur Perangkat (CPMK-3)

**Tujuan:** Mahasiswa mampu menggunakan minimal satu fitur perangkat yang memiliki alasan teknis dan hubungan dengan kebutuhan pengguna.

### Deliverables
- [ ] Minimal satu fitur: kamera, lokasi, file/media, atau notification.
- [ ] Handling permission sesuai platform.
- [ ] Penjelasan hubungan fitur dengan proses bisnis.

### Kriteria Selesai
- Fitur berjalan pada emulator atau perangkat yang mendukungnya.
- Permission dan kondisi penolakan ditangani dengan baik.
- Fitur tidak ditambahkan tanpa justifikasi kebutuhan.

## M7 — Quality dan Security (CPMK-4)

**Tujuan:** Mahasiswa mampu menerapkan validasi, keamanan praktis, testing, debugging, dan perbaikan kualitas.

### Deliverables
- [ ] Validasi input.
- [ ] Checklist HTTPS, token, secure storage, permission, dan data sensitif.
- [ ] Test case alur utama dan kondisi error.
- [ ] Daftar bug dan bukti perbaikannya.

### Kriteria Selesai
- Input tidak valid menghasilkan feedback yang sesuai.
- Data sensitif tidak disimpan secara sembarangan.
- Test case mencakup kondisi berhasil dan gagal.
- Bug utama telah diperbaiki dan hasil uji dicatat.

## M8 — Candidate Release (CPMK-5)

**Tujuan:** Mahasiswa mampu mengintegrasikan seluruh fitur dan menyiapkan versi kandidat rilis.

### Deliverables
- [ ] Integrasi fitur utama.
- [ ] Penyempurnaan UI/UX.
- [ ] Build aplikasi yang dapat dipasang atau dijalankan.
- [ ] Catatan versi dan konfigurasi dasar.

### Kriteria Selesai
- Alur utama berjalan tanpa error penghambat.
- Fitur project telah terintegrasi.
- Candidate release dapat diuji oleh pihak lain.

## M9 — Presentasi Final (CPMK-5)

**Tujuan:** Mahasiswa mampu mendemonstrasikan aplikasi dan menjelaskan kesesuaian solusi dengan kebutuhan Sistem Informasi.

### Deliverables
- [ ] Demo aplikasi.
- [ ] Presentasi arsitektur, fitur, dan keputusan desain.
- [ ] Dokumentasi penggunaan.
- [ ] Hasil peer review dan tindak lanjut.

### Kriteria Selesai
- Demo mengikuti user flow yang telah dirancang.
- Keputusan teknis dapat dijelaskan berdasarkan kebutuhan.
- Dokumentasi memungkinkan orang lain menjalankan dan memahami project.

## M10 — UAS: Final Release (CPMK-5)

**Tujuan:** Mahasiswa mampu mempertanggungjawabkan solusi aplikasi bergerak melalui produk, laporan, demonstrasi, dan evaluasi ketercapaian CPMK.

### Deliverables
- [ ] Final app.
- [ ] Repository dan dokumentasi final.
- [ ] Laporan project.
- [ ] Presentasi, demonstrasi, dan refleksi.

### Kriteria Selesai
- Final app sesuai kebutuhan dan proses bisnis yang ditetapkan.
- Integrasi, keamanan, dan pengujian terdokumentasi.
- Mahasiswa dapat menjelaskan manfaat, batasan, dan hasil pengembangan project.

## Catatan

- Deliverable dicentang setelah selesai dan diverifikasi pada pertemuan terkait.
- SI-VIIB mengikuti jadwal Rabu, sedangkan SI-VIIA mengikuti jadwal Sabtu.
- Perubahan kalender akademik tidak mengubah urutan milestone tanpa keputusan pengelola mata kuliah.
