import 'package:apm/components/footer.dart';

import 'package:flutter/material.dart';

class Kebijakan extends StatefulWidget {
  Kebijakan({super.key});

  final routeNames = '';
  @override
  State<Kebijakan> createState() => _profilState();
}

class _profilState extends State<Kebijakan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00923F), // Warna latar belakang AppBar
        title: Text('Kebijakan Privasi'), // Judul AppBar
        iconTheme: IconThemeData(color: Colors.white),
        toolbarTextStyle: TextTheme(
          // Ganti warna teks ikon kembali ke putih
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 20, // Atur ukuran teks
          ),
        ).bodyText2,
        titleTextStyle: TextTheme(
          // Ganti warna teks ikon kembali ke putih
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 20, // Atur ukuran teks
          ),
        ).headline6,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(children: [
            SizedBox(height: 20.0),
            Padding(
              padding:
                  EdgeInsets.all(22.0), // Tambahkan padding ke teks deskripsi
              child: Text(
                'Deskripsi ini adalah deskripsi menge nahfahdaohoahodhao aldnajdadoajod doaodjoajdoa akbfsbfjfjf aidaihdhadohpha kaeoajejnai halaman Tautan Terkait firda jelek',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 120.0),
            footer(),
          ]),
        ),
      ),
    );
  }
}
