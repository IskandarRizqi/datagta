import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class footer extends StatelessWidget {
  const footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          color: Color.fromARGB(255, 234, 247, 236),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Ratakan ke kiri
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://res.cloudinary.com/dvvbceigh/image/upload/v1695972149/1684726113_LOGO-02_1_x9uuny.png',
                      width: 130.0,
                      height: 50.0,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Produk ',
                          ),
                          TextSpan(
                            text: 'Simpanan yang AMAN, \n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00923F),
                            ),
                          ),
                          TextSpan(
                            text: 'dengan BUNGA TINGGI \n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00923F),
                            ),
                          ),
                          TextSpan(
                            text: 'layaknya produk investasi\n\n',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0), // Jarak antara teks dan tombol
                    ElevatedButton(
                      onPressed: () {
                        // Fungsi yang akan dijalankan saat tombol ditekan
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(
                            0xFF00923F), // Mengubah warna latar belakang tombol
                        foregroundColor:
                            Colors.white, // Mengubah warna teks tombol
                        textStyle: TextStyle(
                            fontSize: 15.0), // Mengubah ukuran teks tombol
                        minimumSize: Size(40.0, 30.0),
                      ),
                      child: Text('Selengkapnya'),
                    ),
                  ],
                ),
              ),
              CachedNetworkImage(
                imageUrl:
                    'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694070643/gelis_1_n6hqlk.png', // Gantilah URL dengan URL gambar online yang sesuai
                width: 130.0,
                height: 150.0,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: '© Copyright ',
              ),
              TextSpan(
                text: 'Puspa Mega Artha',
                style: TextStyle(
                  color: Color(0xFF00923F), // Warna biru pada teks ini
                ),
              ),
              TextSpan(
                text: ' . All Rights Reserved',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
