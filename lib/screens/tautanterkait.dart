import 'package:apm/components/footer.dart';
import 'package:apm/screens/kosong.dart';
import 'package:apm/screens/lelang.dart';

import 'package:flutter/material.dart';

class tautanterkait extends StatefulWidget {
  tautanterkait({super.key});

  final routeNames = '';
  @override
  State<tautanterkait> createState() => _profilState();
}

class _profilState extends State<tautanterkait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF00923F), // Warna latar belakang AppBar
          title: Text('Tautan Terkait'), // Judul AppBar
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
            ListTile(
              onTap: () {
                // Tambahkan logika navigasi ke halaman terkait di sini
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    // Gantilah `YourPage()` dengan halaman yang ingin Anda buka
                    return kosong();
                  },
                ));
              },

              trailing:
                  Icon(Icons.chevron_right), // Ikon ">" di sebelah kanan teks
              title: Text(
                'Tautan Terkait',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                // Tambahkan logika navigasi ke halaman terkait di sini
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    // Gantilah `YourPage()` dengan halaman yang ingin Anda buka
                    return kosong();
                  },
                ));
              },

              trailing:
                  Icon(Icons.chevron_right), // Ikon ">" di sebelah kanan teks
              title: Text(
                'Tautan Terkait',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                // Tambahkan logika navigasi ke halaman terkait di sini
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    // Gantilah `YourPage()` dengan halaman yang ingin Anda buka
                    return kosong();
                  },
                ));
              },

              trailing:
                  Icon(Icons.chevron_right), // Ikon ">" di sebelah kanan teks
              title: Text(
                'Tautan Terkait',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                // Tambahkan logika navigasi ke halaman terkait di sini
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    // Gantilah `YourPage()` dengan halaman yang ingin Anda buka
                    return kosong();
                  },
                ));
              },

              trailing:
                  Icon(Icons.chevron_right), // Ikon ">" di sebelah kanan teks
              title: Text(
                'Tautan Terkait',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                // Tambahkan logika navigasi ke halaman terkait di sini
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    // Gantilah `YourPage()` dengan halaman yang ingin Anda buka
                    return kosong();
                  },
                ));
              },

              trailing:
                  Icon(Icons.chevron_right), // Ikon ">" di sebelah kanan teks
              title: Text(
                'Tautan Terkait',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 180.0),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: footer(),
            ),
          ]),
        )));
  }
}
