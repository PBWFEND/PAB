# Panduan Pengerjaan — UTS: Evaluasi Tengah Semester (Milestone M4)

Dokumen ini membantu Anda memahami **apa yang harus diisi** pada UTS dan bagaimana mengisi tiap bagiannya dengan benar. Dokumen ini berisi **struktur dan aturan pengisian, bukan contoh jawaban**. UTS terdiri atas dua komponen dengan bobot berbeda:

| Komponen | Bobot | Bentuk pengisian |
|:---------|:-----:|:-----------------|
| Tes Konsep | 40% | 10 soal esai dijawab pada file `tes-konsep-uts.md`, di-push ke repository |
| Evaluasi Progress Project | 60% | Laporan progress (template di bawah) + demo + push ke repository |

Tenggat dan cara pengumpulan tercantum pada [Bagian 6](08-Pertemuan-8.md#6-evaluasi-progress-project) materi Pertemuan 8.

---

## 1. Tes Konsep — Isian File `tes-konsep-uts.md`

Jawab **semua Soal 1–10** pada file `tes-konsep-uts.md` di folder `tugas-8/` repository kelas Anda. Setiap jawaban harus menyertakan **alasan** — bukan sekadar menyebut istilah atau menyalin kode. Tes konsep dikerjakan secara mandiri, tidak dilakukan di dalam kelas; AI, peramban, catatan, dan referensi lain tidak digunakan selama pengerjaan.

### Petunjuk Pengisian

- Buat file `tes-konsep-uts.md` di folder `tugas-8/`, salin kerangka jawaban di bawah sebagai isi awal file tersebut, dan lengkapi setiap bagian.
- Setiap jawaban memuat **konsep + alasan teknis + kaitan dengan studi kasus**. Jawaban yang hanya menyebut istilah tanpa alasan memperoleh skor rendah.
- Jika memakai diagram atau tabel, tuliskan langsung pada file agar dapat diperiksa.
- Struktur file yang disarankan:

```text
# Tes Konsep UTS — <Nama> <NIM>

## Soal 1 — Konsep Aplikasi Bergerak dalam SI
[jawaban]

## Soal 2 — Dasar Pemrograman Dart
[jawaban]

... hingga Soal 10
```

---

### Soal 1 — Konsep Aplikasi Bergerak dalam SI (CPMK-1)

> Sebuah kampus ingin mengembangkan aplikasi mobile untuk layanan pengajuan surat keterangan mahasiswa. Saat ini, mahasiswa harus datang ke loket administrasi untuk mengambil formulir, mengisi secara manual, dan menunggu antrian. Jelaskan **tiga karakteristik aplikasi bergerak** yang menjadikan solusi mobile lebih tepat dibandingkan aplikasi web desktop untuk kebutuhan ini. Untuk setiap karakteristik, berikan contoh penerapan pada kasus pengajuan surat.

**Jawaban Anda:**

```text
1. Karakteristik:
   Contoh penerapan:

2. Karakteristik:
   Contoh penerapan:

3. Karakteristik:
   Contoh penerapan:
```

---

### Soal 2 — Dasar Pemrograman Dart (CPMK-1)

> Jelaskan **fungsi setiap bagian** kode berikut: `List<String>`, parameter `String jenis`, `isEmpty`, `return` pada kondisi error, `add`, dan perulangan `for`. Kemudian jelaskan **satu kesalahan umum** yang dapat terjadi bila validasi `isEmpty` dihapus.

**Jawaban Anda:**

```text
- List<String> daftarSurat = []:
- Parameter String jenis:
- jenis.isEmpty:
- return pada kondisi error:
- daftarSurat.add(jenis):
- Perulangan for:

Kesalahan umum bila validasi isEmpty dihapus:
```

---

### Soal 3 — Struktur Flutter dan Widget (CPMK-1)

> Jelaskan **fungsi setiap widget** (`MaterialApp`, `Scaffold`, `AppBar`, `Column`, `Text`, `ListView.builder`) dalam struktur halaman daftar surat. Kemudian jelaskan **satu masalah** yang dapat terjadi bila `ListView.builder` ditempatkan langsung di dalam `Column` tanpa `Expanded` — apa penyebabnya dan bagaimana memperbaikinya?

**Jawaban Anda:**

```text
- MaterialApp:
- Scaffold:
- AppBar:
- Column:
- Text:
- ListView.builder:

Masalah bila ListView.builder di dalam Column tanpa Expanded:
Penyebab:
Perbaikan:
```

---

### Soal 4 — Analisis Kebutuhan dan User Flow (CPMK-2)

> Pisahkan tiga permintaan mahasiswa berikut menjadi **kebutuhan fungsional** dan **kebutuhan nonfungsional**, tentukan prioritas **MoSCoW** untuk setiap kebutuhan beserta alasannya, dan susun **user flow** sederhana untuk kebutuhan *Must*.

| No. | Permintaan |
|:---:|:-----------|
| 1 | "Saya ingin mengajukan surat keterangan aktif kuliah." |
| 2 | "Saya ingin melihat status pengajuan saya." |
| 3 | "Saya ingin menerima notifikasi saat surat siap diambil." |

**Jawaban Anda:**

```text
Klasifikasi dan prioritas:

| No. | Permintaan | Fungsional/Nonfungsional | Prioritas MoSCoW | Alasan |
|:---:|:-----------|:-------------------------|:----------------:|:-------|
| 1   |            |                           |                  |        |
| 2   |            |                           |                  |        |
| 3   |            |                           |                  |        |

User flow untuk kebutuhan Must:
1.
2.
3.
4.
5.
6.
7.
```

---

### Soal 5 — UI/UX Mobile (CPMK-2)

> Jelaskan **tiga prinsip UI/UX mobile** yang perlu diperhatikan pada halaman daftar 20 jenis surat. Untuk setiap prinsip, jelaskan **keputusan desain** yang Anda ambil dan **alasannya**. Pertimbangkan: ukuran layar, interaksi sentuh, dan sesi penggunaan singkat.

**Jawaban Anda:**

```text
1. Prinsip:
   Keputusan desain:
   Alasan:

2. Prinsip:
   Keputusan desain:
   Alasan:

3. Prinsip:
   Keputusan desain:
   Alasan:
```

---

### Soal 6 — Navigasi dan Interaksi (CPMK-2)

> Jelaskan bagaimana Anda mengimplementasikan **navigasi antar tiga halaman** (daftar, form pengajuan, detail status) menggunakan `Navigator` — sebutkan metode yang digunakan dan kapan masing-masing digunakan. Kemudian jelaskan bagaimana **data jenis surat** dikirim dari halaman daftar ke halaman form, dan bagaimana **feedback** diberikan setelah form dikirim.

**Jawaban Anda:**

```text
Metode navigasi dan kapan digunakan:
- push:
- pushNamed:
- pop:

Pengiriman data jenis surat ke halaman form:

Feedback setelah form dikirim:
```

---

### Soal 7 — Model Data dan State (CPMK-3)

> Jelaskan **mengapa setiap field bersifat `final`** dan **mengapa `id` wajib ada** pada model `PengajuanSurat`. Jelaskan perbedaan `StatelessWidget` dan `StatefulWidget`, mana yang digunakan untuk halaman daftar pengajuan dan **mengapa**. Terakhir, jelaskan **fungsi `setState`** dan apa yang terjadi bila data ditambah tanpa `setState`.

**Jawaban Anda:**

```text
Mengapa setiap field bersifat final:
Mengapa id wajib ada:

Perbedaan StatelessWidget dan StatefulWidget:
Halaman daftar menggunakan (StatelessWidget/StatefulWidget):
Alasan:

Fungsi setState:
Apa yang terjadi bila data ditambah tanpa setState:
```

---

### Soal 8 — CRUD Lokal (CPMK-3)

> Jelaskan **empat operasi CRUD** (Create, Read, Update, Delete) beserta **method `List`** yang digunakan untuk setiap operasi pada Flutter. Jelaskan **mengapa `id` digunakan sebagai kunci** operasi update dan delete, bukan index daftar — apa konsekuensinya bila index digunakan sebagai kunci?

**Jawaban Anda:**

```text
| Operasi | Method List / mekanisme |
|:--------|:------------------------|
| Create  |                        |
| Read    |                        |
| Update  |                        |
| Delete  |                        |

Mengapa id digunakan sebagai kunci update dan delete:
Konsekuensi bila index digunakan sebagai kunci:
```

---

### Soal 9 — Persistensi Data Lokal (CPMK-3)

> Jelaskan **perbedaan penyimpanan in-memory dengan persistensi** menggunakan package `shared_preferences`. Mengapa operasi `shared_preferences` bersifat **asinkron** (`Future`), dan apa yang terjadi bila kata kunci `await` diabaikan saat menyimpan data? Berikan contoh situasi di mana in-memory sudah cukup dan situasi di mana persistensi mutlak diperlukan.

**Jawaban Anda:**

```text
Perbedaan in-memory dan persistensi:

Mengapa operasi shared_preferences asinkron (Future):
Apa yang terjadi bila await diabaikan:

Contoh situasi in-memory sudah cukup:
Contoh situasi persistensi mutlak diperlukan:
```

---

### Soal 10 — Integrasi Konsep Lintas Pertemuan (CPMK-1 s.d. CPMK-3)

> Rancang solusi aplikasi mobile untuk unit perpustakaan kampus yang mengintegrasikan konsep dari Pertemuan 1–7 dengan menjawab empat poin berikut:

**Jawaban Anda:**

```text
1. Arsitektur:
   Hubungan aplikasi mobile, penyimpanan lokal, dan backend Sistem Informasi:

2. Kebutuhan & Alur:
   Dua kebutuhan Must have:
   Alur pengguna dari membuka aplikasi hingga tugas selesai:

3. Struktur Komponen:
   Halaman katalog dan form peminjaman, serta navigasi antarhalaman:

4. Data & State:
   Definisi model data Buku (minimal 4 field):
   Cara operasi Create (meminjam) dan Read (melihat riwayat) dikelola dalam state:
```

---

## 2. Evaluasi Progress Project — Laporan Progress

Laporan progress adalah dokumen yang Anda susun dan simpan sebagai `laporan-progress-uts.md` di folder pengumpulan UTS. Isi laporan mengikuti [template pada Bagian 8](08-Pertemuan-8.md#8-template-laporan-progress-project) materi Pertemuan 8. Struktur pengisian di bawah adalah versi ringkas yang dapat Anda gunakan sebagai kerangka awal.

### Petunjuk Pengisian Laporan

- Lengkapi tabel identitas pada bagian 2.1.
- Isi setiap bagian 2.2–2.8 sesuai instruksi di dalamnya.
- Status milestone menggunakan nilai **Selesai** atau **Sebagian**.
- Sertakan minimal 3 tangkapan layar pada bagian 2.5.
- Refleksi pembelajaran menggunakan 3–4 kalimat.
- Cantumkan deklarasi penggunaan AI bila Anda memakai AI selama Minggu 1–7.

---

### 2.1 Tabel Identitas

| | |
|:--|:--|
| **Nama** | [Nama Anda] |
| **NIM** | [NIM Anda] |
| **Kelas** | SI-VIIB / SI-VIIA |
| **Domain SI** | [Domain yang Anda pilih, mis. Layanan Peminjaman Alat Laboratorium] |
| **Judul Aplikasi** | [Nama aplikasi mobile Anda] |
| **Tautan Repository** | [URL folder `tugas-8` di repository GitHub kelas] |

### 2.2 Ringkasan Eksekutif Project

[Jelaskan dalam 1–2 paragraf: masalah apa yang diselesaikan aplikasi ini, siapa penggunanya, dan mengapa solusi mobile dipilih.]

### 2.3 Ketercapaian Milestone (M1 s.d. M3)

| Milestone | Deliverable | Status (Selesai / Sebagian) | Catatan / Bukti |
|:----------|:------------|:----------------------------|:----------------|
| M1: Kebutuhan | Dokumen kebutuhan + User Flow | [Status] | [File di Tugas 4] |
| M2: UI/UX | Wireframe + Navigasi | [Status] | [File di Tugas 5 & 6] |
| M3: MVP Awal | Model data + CRUD lokal | [Status] | [File `crud-lokal.dart` di Tugas 7] |

### 2.4 Matriks Kebutuhan ke Implementasi

Lengkapi matriks berikut dengan menelusuri setiap kebutuhan fungsional dari Tugas 4 ke halaman dan operasi data yang memenuhinya:

| ID Kebutuhan | Deskripsi Kebutuhan | Prioritas MoSCoW | Halaman Pemenuh | Operasi Data Terkait |
|:-------------|:-------------------|:----------------:|:----------------|:---------------------|
| F-01 | [Deskripsi] | Must/Should/Could/Won't | [Nama halaman] | Create/Read/Update/Delete |
| F-02 | [Deskripsi] | [Prioritas] | [Nama halaman] | [Operasi] |
| F-03 | [Deskripsi] | [Prioritas] | [Nama halaman] | [Operasi] |
| F-04 | [Deskripsi] | [Prioritas] | [Nama halaman] | [Operasi] |

### 2.5 Tangkapan Layar Aplikasi Berjalan

Sertakan minimal 3 tangkapan layar:

| No. | File | Mengisi Bukti |
|:---:|:-----|:--------------|
| 1 | `screenshot-daftar.png` | Halaman utama / daftar data |
| 2 | `screenshot-form.png` | Halaman form pengisian data dengan validasi |
| 3 | `screenshot-hapus.png` | Dialog konfirmasi aksi (ubah/hapus) |

### 2.6 Kendala dan Solusi Teknis

Jelaskan **minimal dua kendala teknis** yang Anda hadapi selama implementasi Minggu 1–7 dan bagaimana Anda mengatasinya:

| No. | Kendala | Cara Mengatasinya |
|:---:|:--------|:-------------------|
| 1 | [Kendala] | [Solusi] |
| 2 | [Kendala] | [Solusi] |

### 2.7 Rencana Pengembangan Milestone M5 (REST API)

[Jelaskan data apa yang nantinya akan diambil dari REST API pada Minggu 9–10 dan layanan backend yang dibutuhkan.]

### 2.8 Refleksi Pembelajaran Tengah Semester

[Tuliskan refleksi 3–4 kalimat mengenai pemahaman Anda terhadap arsitektur Flutter, pengelolaan state, dan tantangan membangun aplikasi mobile.]

### 2.9 Deklarasi Penggunaan AI

Cantumkan bila Anda menggunakan AI selama Minggu 1–7 untuk project atau laporan. Format:

```text
Deklarasi penggunaan AI: [nama AI] — [aktivitas spesifik yang dibantu];
perbaikan kode, pengujian, dan penjelasan dilakukan serta diverifikasi
oleh penulis.
```

---

## 3. Pengecekan Sebelum Mengumpulkan

Periksa kembali jawaban Anda dengan pertanyaan berikut:

- [ ] Seluruh 10 soal tes konsep dijawab pada file `tes-konsep-uts.md`, dan setiap jawaban memuat alasan teknis?
- [ ] Jawaban soal 4 memuat tabel klasifikasi fungsional/nonfungsional, prioritas MoSCoW, dan user flow?
- [ ] Jawaban soal 10 menjawab keempat poin (arsitektur, kebutuhan & alur, struktur komponen, data & state) dan konsisten satu sama lain?
- [ ] Laporan progress: tabel identitas lengkap, seluruh status milestone terisi (Selesai / Sebagian)?
- [ ] Matriks kebutuhan menelusuri setiap kebutuhan fungsional ke halaman dan operasi data?
- [ ] Minimal 3 tangkapan layar tersedia dan terbaca jelas?
- [ ] Minimal 2 kendala teknis beserta cara mengatasinya tercantum?
- [ ] Rencana M5 dan refleksi 3–4 kalimat terisi?
- [ ] Deklarasi penggunaan AI tercantum bila AI digunakan?
- [ ] File `tes-konsep-uts.md` dan `laporan-progress-uts.md` tersimpan di folder `tugas-8/`?
- [ ] Seluruh artefak di-push ke repository dan Pull Request dari branch UTS ke `main` dibuat?
