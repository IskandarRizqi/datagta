import 'package:apm/screens/detailtabungan.dart';
import 'package:flutter/material.dart';
import 'package:apm/model/produktabunganmodel.dart';

class produkTabungan extends StatefulWidget {
  const produkTabungan({super.key});

  @override
  State<produkTabungan> createState() => _produkTabunganState();
}

class _produkTabunganState extends State<produkTabungan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF00923F), // Warna latar belakang AppBar
          title: Text('Tabungan'), // Judul AppBar
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
        body: Center(
            child: Column(children: [
          SizedBox(height: 10),
          Expanded(
              child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: Tabungan.tabungans.length,
            itemBuilder: (ctx, index) {
              final tabungan = Tabungan.tabungans[index];
              return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DetailTabungan(tabungans: tabungan),
                      ),
                    );
                  },
                  child: _buildProductCard(tabungan.imageUrl, tabungan.title));
            },
          )),
        ])));
  }

  Widget _buildProductCard(String imageUrl, String title) {
    return Container(
      width: 160.0,
      height: 120.0, // Atur lebar kartu sesuai kebutuhan Anda
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20.0), // Atur radius sesuai kebutuhan Anda
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity, // Atur lebar gambar sesuai kebutuhan Anda
              height: 100, // Atur tinggi gambar sesuai kebutuhan Anda
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              title,
              maxLines: 1, // Batasi teks judul menjadi dua baris
              overflow: TextOverflow
                  .ellipsis, // Tampilkan titik-titik jika teks melebihi dua baris
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 0.0),
          ],
        ),
      ),
    );
  }
}
