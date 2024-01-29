import 'package:apm/screens/akun.dart';
import 'package:apm/screens/hasilcarilelang.dart';
import 'package:apm/screens/karir.dart';
import 'package:apm/screens/laporan.dart';
import 'package:apm/screens/lelang.dart';
import 'package:apm/screens/profil.dart';
import 'package:apm/screens/berita.dart';
import 'package:apm/screens/simulasi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apm/screens/pengajuan.dart';
import 'package:apm/screens/jaringankantor.dart';
import 'dart:ui';

class CircleCardWidget extends StatelessWidget {
  final String imageUrl;
  final Function onPressed;
// Tambahkan properti child

  CircleCardWidget({
    required this.imageUrl,
    required this.onPressed,
    // Tambahkan child
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xFF00923F),
      radius: 45,
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              width: 30,
              height: 30,
              color: Colors.white,
            ),
            SizedBox(height: 4),
            // Tampilkan child di bawah lingkaran
          ],
        ),
      ),
    );
  }
}

class MenuComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        height: 180,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => const profil());
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://res.cloudinary.com/dvvbceigh/image/upload/v1697513154/Profile_zyimfb.png',
                            width: 70,
                            height: 70,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(
                              strokeWidth: 5,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => Akun());
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://res.cloudinary.com/dvvbceigh/image/upload/v1697513517/Akun_ejksoh.png',
                            width: 70,
                            height: 70,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(
                              strokeWidth: 5,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => MyHomePage());
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://res.cloudinary.com/dvvbceigh/image/upload/v1697513517/lelang_llu4wo.png',
                            width: 70,
                            height: 70,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(
                              strokeWidth: 5,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => Laporan(
                                  prevPage: '',
                                ));
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://res.cloudinary.com/dvvbceigh/image/upload/v1697513517/Laporan_eay4gu.png',
                            width: 70,
                            height: 70,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(
                              strokeWidth: 5,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10), // Tambahkan jarak antara dua baris
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Tambahkan 4 gambar lainnya di sini dengan teks yang sesuai
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => const Simulasi());
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://res.cloudinary.com/dvvbceigh/image/upload/v1697513517/Simulasi_jiofb8.png',
                            width: 70,
                            height: 70,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(
                              strokeWidth: 5,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => karirpage());
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://res.cloudinary.com/dvvbceigh/image/upload/v1697513517/Karir_amvbtp.png',
                            width: 70,
                            height: 70,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(
                              strokeWidth: 5,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => const KantorScreen());
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://res.cloudinary.com/dvvbceigh/image/upload/v1697513517/Jaringan_Kantor_yr4jsm.png',
                            width: 70,
                            height: 70,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(
                              strokeWidth: 5,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => const BeritaScreen());
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://res.cloudinary.com/dvvbceigh/image/upload/v1697513822/blog_gkqiy2.png',
                            width: 70,
                            height: 70,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(
                              strokeWidth: 5,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
