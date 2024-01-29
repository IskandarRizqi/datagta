import 'package:apm/screens/pengajuan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/produktabunganmodel.dart';

class DetailTabungan extends StatefulWidget {
  final Tabungan tabungans;

  DetailTabungan({required this.tabungans});

  @override
  State<DetailTabungan> createState() => _DetailTabunganState();
}

class _DetailTabunganState extends State<DetailTabungan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00923F),
        title: Text('Detail Tabungan'),
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
        child: Column(
          children: [
            SizedBox(height: 10.0),
            FractionallySizedBox(
              widthFactor: 1.0,
              child: Image.network(
                widget.tabungans.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.tabungans.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.tabungans.description),
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
                  'Ajukan Tabungan',
                  style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                ))
          ],
        ),
      ),
    );
  }
}
