import 'package:apm/model/produkkreditmodel.dart';
import 'package:apm/screens/pengajuan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailKreditPage extends StatefulWidget {
  final Kredit kredits;

  DetailKreditPage({required this.kredits});

  @override
  State<DetailKreditPage> createState() => _DetailKreditPageState();
}

class _DetailKreditPageState extends State<DetailKreditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00923F), // Warna latar belakang AppBar
        title: Text('Detail Kredit'), // Judul AppBar
        iconTheme: IconThemeData(color: Colors.white),
        toolbarTextStyle: TextTheme(
          // Ganti warna teks ikon kembali ke putih
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20, // Atur ukuran teks
          ),
        ).bodyMedium,
        titleTextStyle: TextTheme(
          // Ganti warna teks ikon kembali ke putih
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20, // Atur ukuran teks
          ),
        ).titleLarge,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 10.0),
          FractionallySizedBox(
            widthFactor: 1.0,
            child: Image.network(
              widget.kredits.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.kredits.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.kredits.description),
          ),
          ElevatedButton(
              onPressed: (() {
                Get.to(() => Pengajuan(
                      prevPage: '',
                    ));
              }),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF30318B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(110, 40),
              ),
              child: Text(
                'Ajukan Kredit',
                style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
              ))
        ]),
      ),
    );
  }
}
