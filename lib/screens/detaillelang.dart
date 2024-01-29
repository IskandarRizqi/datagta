import 'package:apm/components/footer.dart';
import 'package:apm/model/lelangmodel.dart';
import 'package:flutter/material.dart';

class detaillelang extends StatefulWidget {
  final lelang kredits;

  detaillelang({required this.kredits});

  @override
  State<detaillelang> createState() => _DetailLelangPageState();
}

class _DetailLelangPageState extends State<detaillelang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00923F), // Warna latar belakang AppBar
        title: Text(''), // Judul AppBar
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
          SizedBox(height: 25.0),
          // Teks di atas form
          Align(
            alignment: Alignment.centerLeft, // Penempatan horizontal kiri
            child: Text(
              '    Detail', // Ubah teks sesuai kebutuhan
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 20),

          FractionallySizedBox(
            widthFactor: 0.83,
            child: Image.network(
              height: 200,
              widget.kredits.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Mengatur teks berada di sebelah kiri (atas)
                  children: [
                    Text(
                      widget.kredits.title,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      widget.kredits.harga,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0), // Atur padding sesuai kebutuhan
            child: Text(
              'Deskripsi',
              style: TextStyle(
                fontSize: 15.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              textAlign:
                  TextAlign.left, // Mengatur penempatan horizontal teks ke kiri
            ),
          ),

          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika untuk tombol di sini
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      minimumSize: Size(300.0,
                          40.0), // Atur latar belakang tombol menjadi transparan
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Mengisi ruang antara teks
                      children: [
                        Text(
                          'Cara penawaran',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        SizedBox(width: 37.0),
                        Text(
                          'Closed Bidding',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left:
                        26.0), // Atur padding kiri untuk menggeser teks ke kiri
                child: Text(
                  '     Jaminan',
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              SizedBox(width: 70.0), // Untuk memberikan jarak antara dua teks
              Padding(
                padding: EdgeInsets.only(
                    right:
                        13.0), // Atur padding kanan untuk menggeser teks ke kanan
                child: Text(
                  '   Rp. 14.087.800.000',
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika untuk tombol di sini
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      minimumSize: Size(300.0,
                          40.0), // Atur latar belakang tombol menjadi transparan
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Mengisi ruang antara teks
                      children: [
                        Text(
                          'Batas Akhir\n '
                          'Jaminan',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        SizedBox(width: 65.0),
                        Text(
                          '4 September 2023',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left:
                        26.0), // Atur padding kiri untuk menggeser teks ke kiri
                child: Text(
                  '     Batas Akhir\n'
                  '     Penawaran',
                  style: TextStyle(fontSize: 13.0),
                ),
              ),
              SizedBox(width: 55.0), // Untuk memberikan jarak antara dua teks
              Padding(
                padding: EdgeInsets.only(
                    right:
                        16.0), // Atur padding kanan untuk menggeser teks ke kanan
                child: Text(
                  '5 september 2023',
                  style: TextStyle(fontSize: 13.0),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika untuk tombol di sini
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      minimumSize: Size(300.0,
                          40.0), // Atur latar belakang tombol menjadi transparan
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Mengisi ruang antara teks
                      children: [
                        Text(
                          'Penyelenggara',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        SizedBox(width: 37.0),
                        Text(
                          'KPKNI Tanggerang',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left:
                        26.0), // Atur padding kiri untuk menggeser teks ke kiri
                child: Text(
                  '     Kode Lot Lelang',
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              SizedBox(width: 35.0), // Untuk memberikan jarak antara dua teks
              Padding(
                padding: EdgeInsets.only(
                    right:
                        0.0), // Atur padding kanan untuk menggeser teks ke kanan
                child: Text(
                  'RYQZYN',
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
            ],
          ),

          SizedBox(height: 50.0),

          ElevatedButton(
            onPressed: () {
              // Tambahkan logika untuk menyimpan di sini
              // Misalnya, Anda bisa memanggil metode atau fungsi yang menangani penyimpanan data.
              // Contoh:
              // saveData();

              // Setelah operasi penyimpanan selesai, Anda dapat memberi umpan balik ke pengguna.
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(''),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Color(0xFF00923F), // Atur warna latar belakang menjadi biru
              minimumSize:
                  Size(300, 45), // Atur lebar dan tinggi minimum tombol
            ),
            child: Text(
              'Ikut Lelang', // Ubah teks tombol sesuai kebutuhan Anda
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ), // Ubah ukuran teks sesuai kebutuhan Anda
            ),
          ),

          SizedBox(height: 50.0),
          footer()
        ]),
      ),
    );
  }
}
