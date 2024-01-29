import 'package:apm/model/produkdepositmodel.dart';
import 'package:apm/screens/pengajuan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailDepositPage extends StatefulWidget {
  final Deposit deposits;

  DetailDepositPage({required this.deposits});

  @override
  State<DetailDepositPage> createState() => _DetailDepositPageState();
}

class _DetailDepositPageState extends State<DetailDepositPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00923F), // Warna latar belakang AppBar
        title: Text('Detail Deposito'), // Judul AppBar
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
              widget.deposits.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.deposits.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.deposits.description),
          ),
          SizedBox(height: 10.0),
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
                'Ajukan Deposito',
                style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
              ))
        ]),
      ),
    );
  }
}
