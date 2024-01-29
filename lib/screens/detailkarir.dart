import 'package:apm/components/footer.dart';
import 'package:apm/components/image_container.dart';
import 'package:apm/model/karirmodel.dart';
import 'package:flutter/material.dart';

class DetailKarir extends StatefulWidget {
  const DetailKarir({super.key});
  static const routeName = 'karir';

  @override
  State<DetailKarir> createState() => _DetailKarirState();
}

class _DetailKarirState extends State<DetailKarir> {
  int daysDifference = 0;
  Karir? karir;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Periksa apakah karir sudah diinisialisasi sebelum menghitung perbedaan hari
    if (karir == null) {
      karir = ModalRoute.of(context)!.settings.arguments as Karir;
      calculateDaysDifference();
    }
  }

  void calculateDaysDifference() {
    if (karir != null) {
      final createdAt = DateTime.parse(karir!.createdAt);
      final currentDate = DateTime.now();
      final difference = currentDate.difference(createdAt);
      setState(() {
        daysDifference = difference.inDays;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (karir == null) {
      karir = ModalRoute.of(context)!.settings.arguments as Karir;
      calculateDaysDifference();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00923F),
        title: Text('Detail Karir'),
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
            if (karir != null) // Tambahkan periksaan null di sini
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.network(
                          karir!.imageUrl), // Periksa null di sini
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          karir!.title, // Periksa null di sini
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          karir!.subtitle, // Periksa null di sini
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(),
                        ),
                        SizedBox(height: 5),
                        Text(
                          karir!.alamat, // Periksa null di sini
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w100,
                                  color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '$daysDifference hari lalu',
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w100,
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            // SizedBox(height: 10),
            InkWell(
              onTap: () {
                // Tambahkan logika navigasi ke halaman terkait di sini
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(17.0),
                  child: Row(
                    children: [
                      Image.network(
                        'https://res.cloudinary.com/dvvbceigh/image/upload/v1696298763/1_o2dyuc.png',
                        width:
                            24, // Sesuaikan lebar gambar sesuai kebutuhan Anda
                        height:
                            24, // Sesuaikan tinggi gambar sesuai kebutuhan Anda
                      ),
                      Text(
                        'Rp 4.000.000 - 5.000.000/bulan',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0,
            ),

            InkWell(
              onTap: () {
                // Tambahkan logika navigasi ke halaman terkait di sini
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(17.0),
                  child: Row(
                    children: [
                      Image.network(
                        'https://res.cloudinary.com/dvvbceigh/image/upload/v1696298763/2_wdsxgw.png',
                        width:
                            24, // Sesuaikan lebar gambar sesuai kebutuhan Anda
                        height:
                            24, // Sesuaikan tinggi gambar sesuai kebutuhan Anda
                      ),
                      Text(
                        'Full-Time',
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // Tambahkan logika navigasi ke halaman terkait di sini
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(17.0),
                  child: Row(
                    children: [
                      Image.network(
                        'https://res.cloudinary.com/dvvbceigh/image/upload/v1696298763/3_k7hult.png',
                        width:
                            24, // Sesuaikan lebar gambar sesuai kebutuhan Anda
                        height:
                            24, // Sesuaikan tinggi gambar sesuai kebutuhan Anda
                      ),
                      Text(
                        'Akutansi & Keuangan',
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: () {
                // Tambahkan logika navigasi ke halaman terkait di sini
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(17.0),
                  child: Row(
                    children: [
                      Image.network(
                        'https://res.cloudinary.com/dvvbceigh/image/upload/v1696298763/4_yeblni.png',
                        width:
                            24, // Sesuaikan lebar gambar sesuai kebutuhan Anda
                        height:
                            24, // Sesuaikan tinggi gambar sesuai kebutuhan Anda
                      ),
                      Text(
                        'Minimal GPA of 3.00',
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: () {
                // Tambahkan logika navigasi ke halaman terkait di sini
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(17.0),
                  child: Row(
                    children: [
                      Image.network(
                        'https://res.cloudinary.com/dvvbceigh/image/upload/v1696298763/5_vtobmc.png',
                        width:
                            24, // Sesuaikan lebar gambar sesuai kebutuhan Anda
                        height:
                            24, // Sesuaikan tinggi gambar sesuai kebutuhan Anda
                      ),
                      Text(
                        'Minimal D3',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi Pekerjaan',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Some essential duties of our Internal Auditor include drafting audit report, control accuracy of financial records, briefing audit findings to management, and preparing recommendation for corrective actions. This position is based in Kudus, Jakarta and Surabaya Office.',
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Lamar Pekerjaan',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00923F),
                minimumSize: Size(300, 40),
              ),
            ),
            SizedBox(height: 20),
            footer()
          ],
        ),
      ),
    );
  }
}
