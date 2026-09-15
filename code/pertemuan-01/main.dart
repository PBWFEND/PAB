// ============================================================================
// PAB — Pertemuan 1: Project Flutter Pertama
// ============================================================================
//
// Tujuan:
//   Menunjukkan struktur aplikasi Flutter minimal: titik masuk (main),
//   widget akar (MyApp), MaterialApp, Scaffold, dan widget Text.
//   File ini juga menjadi kerangka latihan individu dengan TODO terbimbing.
//
// Cara menjalankan:
//   1. Salin file ini ke lib/main.dart pada project hasil `flutter create`
//      (lihat panduan/Panduan-Lengkap-PAB.md untuk langkah pembuatan project).
//   2. Jalankan dari folder project:
//        flutter run
//      Untuk tahap awal, gunakan target web dengan `flutter run -d chrome`.
//   3. Amati aplikasi pada target yang dipilih, lalu kerjakan TODO di bawah.
//
// Konsep yang ditunjukkan (Pertemuan 1):
//   - main()        : titik masuk aplikasi Dart.
//   - runApp()      : memasang widget akar ke layar.
//   - StatefulWidget  : widget dengan keadaan yang dapat berubah (detail Pertemuan 3).
//   - MaterialApp   : kerangka aplikasi dengan Material Design.
//   - Scaffold      : struktur dasar halaman (appBar, body, dan lainnya).
//   - Text          : widget untuk menampilkan teks.
//
// Catatan: hot reload (r) menerapkan perubahan build(); hot restart (R)
// mengulang aplikasi dari awal.
// ============================================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Widget akar aplikasi. MaterialApp mengatur tema dan halaman awal.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO 1: Ubah title menjadi nama Anda, simpan, lalu amati hot reload.
      title: 'PAB — Pertemuan 1',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // TODO 2: Ubah teks pada AppBar.
          title: const Text('PAB — Pertemuan 1'),
          centerTitle: true,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TODO 3: Ubah teks sapaan ini, simpan, amati hasil hot reload.
              Text(
                'Halo, Flutter!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Aplikasi pertama saya berjalan.'),
              Text('Tekan r di terminal untuk hot reload.'),
            ],
          ),
        ),
      ),
    );
  }
}

/*
// ============================================================================
// REFERENSI: aplikasi counter bawaan `flutter create`
// ============================================================================
//
// Setelah menyelesaikan TODO di atas, bandingkan dengan struktur counter
// bawaan di bawah ini. StatefullWidget dan setState akan dibahas pada
// Pertemuan 3 — untuk saat ini cukup amati bahwa perubahan tampilan
// dipicu oleh perubahan data (counter) melalui setState.
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(colorSchemeSeed: Colors.blue),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('You have pushed the button this many times:'),
//             Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
// ============================================================================
*/
