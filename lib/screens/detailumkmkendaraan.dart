import 'package:apm/components/footer.dart';
import 'package:apm/model/umkmkendaraanmodel.dart';
import 'package:flutter/material.dart';

class DetailUmkmKendaraan extends StatefulWidget {
  final UmkmKendaraan umkmkendaraans;

  DetailUmkmKendaraan({required this.umkmkendaraans});

  @override
  State<DetailUmkmKendaraan> createState() => _DetailUmkmKendaraanState();
}

class _DetailUmkmKendaraanState extends State<DetailUmkmKendaraan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00923F),
        title: Text('Detail Umkm Kendaraan'),
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
            fontSize: 20, // Atur ukuran teks
          ),
        ).titleLarge,
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal:
                        17.0), // Tambahkan padding kiri dan kanan secara keseluruhan
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sisi kiri (1 foto)
                    Expanded(
                      flex: 3, // Memberikan flex yang lebih besar
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                          widget.umkmkendaraans.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Sisi kanan (3 foto dalam 1 kolom ke bawah)
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 7.0), // Tambahkan padding kiri
                            child: Container(
                              width: 78.0,
                              height: 77.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.network(
                                widget.umkmkendaraans.imageUrl2,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 7.0), // Tambahkan padding kiri
                            child: Container(
                              width: 78.0,
                              height: 77.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.network(
                                widget.umkmkendaraans.imageUrl3,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 7.0), // Tambahkan padding kiri
                            child: Container(
                              width: 78.0,
                              height: 77.0,
                              child: Image.network(
                                widget.umkmkendaraans.imageUrl4,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.umkmkendaraans.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        widget.umkmkendaraans.price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  )),
              Divider(
                color: Color(0xFFE2E2E2),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Detail Produk',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Kondisi: ', // Ini adalah label yang tidak dicetak tebal
                            style: TextStyle(
                                color: Colors.black // Tidak dicetak tebal
                                ),
                          ),
                          TextSpan(
                            text: widget.umkmkendaraans
                                .condition, // Ini adalah value yang dicetak tebal
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Dicetak tebal
                              fontSize:
                                  16.0, // Ukuran teks jika perlu disesuaikan
                            ),
                          ),
                          TextSpan(
                            text:
                                '\nMin. Pemesanan: ', // Ini adalah label yang tidak dicetak tebal
                            style: TextStyle(
                                color: Colors.black // Tidak dicetak tebal
                                ),
                          ),
                          TextSpan(
                            text: widget.umkmkendaraans
                                .minorder, // Ini adalah value yang dicetak tebal
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Dicetak tebal
                              fontSize:
                                  16.0, // Ukuran teks jika perlu disesuaikan
                            ),
                          ),
                          TextSpan(
                            text:
                                '\nLokasi: ', // Ini adalah label yang tidak dicetak tebal
                            style: TextStyle(
                                color: Colors.black // Tidak dicetak tebal
                                ),
                          ),
                          TextSpan(
                            text: widget.umkmkendaraans
                                .location, // Ini adalah value yang dicetak tebal
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Dicetak tebal
                              fontSize:
                                  16.0, // Ukuran teks jika perlu disesuaikan
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color(0xFFE2E2E2),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Deskripsi Produk',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(widget.umkmkendaraans.description),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Align(
              //     alignment: Alignment.centerRight,
              //     child: ElevatedButton(
              //       onPressed: () {},
              //       child: Text(
              //         'Beli',
              //         style: TextStyle(color: Colors.white),
              //       ),
              //       style: ElevatedButton.styleFrom(
              //         primary: Color(0xFF30318B),
              //         minimumSize: Size(50.0, 30.0),
              //       ),
              //     ),
              //   ),
              // ),
              footer()
            ]),
      ),
    );
  }
}
