import 'package:flutter/material.dart';

class header extends StatefulWidget {
  const header({super.key});

  @override
  State<header> createState() => _headerState();
}

class _headerState extends State<header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Atur lebar sesuai kebutuhan
      height: 200.0, // Atur tinggi sesuai kebutuhan
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://res.cloudinary.com/dvvbceigh/image/upload/v1695969601/Rectangle_kvlqya.png'), // Ganti dengan URL gambar yang sesuai
          fit: BoxFit
              .cover, // Sesuaikan sesuai kebutuhan Anda (cover, contain, dll.)
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'BPR Datagita Mustika',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight
                    .bold), // Ganti dengan gaya teks yang sesuai (bold, italic, dll
          ),
          SizedBox(height: 8.0), // Jarak antara teks dan tombol
          Text('Selamat datang, senang anda kembali!!',
              style: TextStyle(color: Colors.white, fontSize: 12.0)),
        ],
      ),
      // Ganti dengan widget konten Anda
    );
  }
}
