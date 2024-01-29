import 'package:apm/components/footer.dart';
import 'package:apm/model/umkmaksesorismodel.dart';
import 'package:apm/model/umkmkendaraanmodel.dart';
import 'package:apm/model/umkmsembakomodel.dart';
import 'package:apm/screens/allumkmaksesoris.dart';
import 'package:apm/screens/allumkmkendaraan.dart';
import 'package:apm/screens/allumkmsembako.dart';
import 'package:apm/screens/detailumkmaksesoris.dart';
import 'package:apm/screens/detailumkmkendaraan.dart';
import 'package:apm/screens/detailumkmsembako.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class umkmPage extends StatefulWidget {
  const umkmPage({Key? key}) : super(key: key);

  @override
  _umkmPageState createState() => _umkmPageState();
}

class _umkmPageState extends State<umkmPage> {
  final int maxItemsToShow = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00923F),
        title: Text('UMKM'),
        iconTheme: IconThemeData(color: Colors.white),
        toolbarTextStyle: TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
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
            _buildSliderSembako("Sembako", UmkmSembako.umkmsembakos),
            SizedBox(height: 10.0),
            _buildSliderKendaraan("Kendaraan", UmkmKendaraan.umkmkendaraans),
            SizedBox(height: 10.0),
            _buildSliderAksesoris("Aksesoris", UmkmAksesoris.umkmaksesoriss),
            SizedBox(height: 30.0),
            footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderSembako(String title, List<UmkmSembako> umkmsembakos) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Get.to(() => AllSembako());
                },
                child: Text('Lihat Semua'),
              ),
            )
          ],
        ),
        SizedBox(
          height: 200.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: umkmsembakos.length > maxItemsToShow
                ? maxItemsToShow
                : umkmsembakos.length,
            itemBuilder: (BuildContext context, int index) {
              final umkmsembako = UmkmSembako.umkmsembakos[index];
              return GestureDetector(
                onTap: () {
                  // Navigasi ke halaman detail dengan indeks yang sesuai
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>
                          DetailUmkmSembako(umkmsembakos: umkmsembako),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: _buildProductCard(umkmsembako.imageUrl,
                      umkmsembako.title, umkmsembako.description),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSliderKendaraan(
      String title, List<UmkmKendaraan> umkmkendaraans) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Get.to(() => AllKendaraan());
                },
                child: Text('Lihat Semua'),
              ),
            )
          ],
        ),
        SizedBox(
          height: 200.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: umkmkendaraans.length > maxItemsToShow
                ? maxItemsToShow
                : umkmkendaraans.length,
            itemBuilder: (BuildContext context, int index) {
              final umkmkendaraan = UmkmKendaraan.umkmkendaraans[index];
              return GestureDetector(
                onTap: () {
                  // Navigasi ke halaman detail dengan indeks yang sesuai
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>
                          DetailUmkmKendaraan(umkmkendaraans: umkmkendaraan),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: _buildProductCard(umkmkendaraan.imageUrl,
                      umkmkendaraan.title, umkmkendaraan.description),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSliderAksesoris(
      String title, List<UmkmAksesoris> umkmaksesoris) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Get.to(() => AllAksesoris());
                },
                child: Text('Lihat Semua'),
              ),
            )
          ],
        ),
        SizedBox(
          height: 200.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: umkmaksesoris.length > maxItemsToShow
                ? maxItemsToShow
                : umkmaksesoris.length,
            itemBuilder: (BuildContext context, int index) {
              final umkmaksesoris = UmkmAksesoris.umkmaksesoriss[index];
              return GestureDetector(
                onTap: () {
                  // Navigasi ke halaman detail dengan indeks yang sesuai
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>
                          DetailUmkmAksesoris(umkmaksesoriss: umkmaksesoris),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: _buildProductCard(umkmaksesoris.imageUrl,
                      umkmaksesoris.title, umkmaksesoris.description),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(String imageUrl, String title, String description) {
    return Container(
      width: 140.0,
      height: 350.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              width: double.infinity, // Isi seluruh lebar kartu
              height: 110.0, // Sesuaikan tinggi gambar sesuai kebutuhan
              fit: BoxFit.cover, // Mengisi kartu dengan gambar
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 0.0),
          ],
        ),
      ),
    );
  }
}
