import 'package:apm/components/footer.dart';
import 'package:apm/screens/hubungikami.dart';
import 'package:apm/screens/karir.dart';
import 'package:apm/screens/kebijakanprivasi.dart';
import 'package:apm/screens/profil.dart';
import 'package:apm/screens/tautanterkait.dart';
import 'package:flutter/material.dart';
import 'package:apm/components/headerakun.dart';

class Akun extends StatefulWidget {
  @override
  State<Akun> createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                SizedBox(height: 20.0),
                InkWell(
                  onTap: () {
                    // Tambahkan logika navigasi ke halaman terkait di sini
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        // Gantilah `YourPage()` dengan halaman yang ingin Anda buka
                        return tautanterkait();
                      },
                    ));
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(17.0),
                      child: Row(
                        children: [
                          Image.network(
                            'https://res.cloudinary.com/dvvbceigh/image/upload/v1695023724/WhatsApp_Image_2023-09-18_at_14.48.48_kestly.jpg',
                            width:
                                24, // Sesuaikan lebar gambar sesuai kebutuhan Anda
                            height:
                                24, // Sesuaikan tinggi gambar sesuai kebutuhan Anda
                          ),
                          Text(
                            '  Tautan Terkait',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
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
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        // Gantilah `YourPage()` dengan halaman yang ingin Anda buka
                        return Hubungi();
                      },
                    ));
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(17.0),
                      child: Row(
                        children: [
                          Image.network(
                            'https://res.cloudinary.com/dvvbceigh/image/upload/v1695087905/WhatsApp_Image_2023-09-18_at_14.48.48_1_l88xwc.jpg',
                            width:
                                24, // Sesuaikan lebar gambar sesuai kebutuhan Anda
                            height:
                                24, // Sesuaikan tinggi gambar sesuai kebutuhan Anda
                          ),
                          Text(
                            '  Hubungi Kami',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
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
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        // Gantilah `YourPage()` dengan halaman yang ingin Anda buka
                        return Kebijakan();
                      },
                    ));
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(17.0),
                      child: Row(
                        children: [
                          Image.network(
                            'https://res.cloudinary.com/dvvbceigh/image/upload/v1695087749/WhatsApp_Image_2023-09-18_at_14.48.48_2_t8pqvo.jpg',
                            width:
                                24, // Sesuaikan lebar gambar sesuai kebutuhan Anda
                            height:
                                24, // Sesuaikan tinggi gambar sesuai kebutuhan Anda
                          ),
                          Text(
                            '  Kebijakan Privasi',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 120.0),
                footer(),
              ],
            ),
          ),
        ),
      );
}
