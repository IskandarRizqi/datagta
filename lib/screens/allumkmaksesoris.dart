import 'package:apm/model/umkmaksesorismodel.dart';
import 'package:apm/model/umkmkendaraanmodel.dart';
import 'package:apm/screens/detailumkmaksesoris.dart';
import 'package:apm/screens/detailumkmkendaraan.dart';
import 'package:flutter/material.dart';
import 'package:apm/model/umkmsembakomodel.dart';
import 'package:apm/screens/detailumkmsembako.dart';

class AllAksesoris extends StatefulWidget {
  const AllAksesoris({super.key});

  @override
  State<AllAksesoris> createState() => _AllAksesorisState();
}

class _AllAksesorisState extends State<AllAksesoris> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00923F), // Warna latar belakang AppBar
        title: Text(' Semua Aksesoris'), // Judul AppBar
        iconTheme: IconThemeData(color: Colors.white),
        toolbarTextStyle: TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ).bodyMedium,
        titleTextStyle: TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ).titleLarge,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing:
                      8.0, // Atur jarak antara item di sumbu utama (vertikal)
                  crossAxisSpacing:
                      5.0, // Atur jarak antara item di sumbu lintang (horizontal)
                ),
                itemCount: UmkmAksesoris.umkmaksesoriss.length,
                itemBuilder: (ctx, index) {
                  final umkmaksesoris = UmkmAksesoris.umkmaksesoriss[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DetailUmkmAksesoris(
                              umkmaksesoriss: umkmaksesoris),
                        ),
                      );
                    },
                    child: _buildProductCard(
                      umkmaksesoris.imageUrl,
                      umkmaksesoris.title,
                      umkmaksesoris.description,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(String imageUrl, String title, String description) {
    return Container(
      width: 150.0,
      height: 200.0, // Tinggikan kartu sesuai kebutuhan
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        // Tambahkan padding di sini untuk bagian kiri dan kanan
        margin: EdgeInsets.symmetric(horizontal: 17.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 60, // Sesuaikan tinggi gambar sesuai kebutuhan
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: null,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    maxLines: null,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height:
                  2.0, // Tambahkan spasi di antara elemen-elemen dalam kartu
            ),
          ],
        ),
      ),
    );
  }
}
