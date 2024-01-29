import 'package:apm/components/footer.dart';
import 'package:flutter/material.dart';

class Hubungi extends StatefulWidget {
  Hubungi({super.key});

  final routeNames = '';
  @override
  State<Hubungi> createState() => _profilState();
}

class _profilState extends State<Hubungi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00923F),
        title: Text(
          'Hubungi Kami',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        // Tambahkan SingleChildScrollView di sini
        child: Padding(
          padding:
              EdgeInsets.all(16.0), // Atur padding di sini sesuai kebutuhan
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(
                      bottom: 5.0), // Menambahkan spasi di bawah teks
                  child: Text(
                    'Alamat',
                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold, // Mengatur teks menjadi tebal
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(
                      top: 3.0), // Menambahkan spasi di atas subjudul
                  child: Text(
                    'jl bukit limau semarang barat',
                    style: TextStyle(
                      color: Colors
                          .black, // Mengubah warna teks subtitle menjadi hitam
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(
                      bottom: 5.0), // Menambahkan spasi di bawah teks
                  child: Text(
                    'Telepon',
                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold, // Mengatur teks menjadi tebal
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(
                      top: 3.0), // Menambahkan spasi di atas subjudul
                  child: Text(
                    '+62 123 4567',
                    style: TextStyle(
                      color: Colors
                          .black, // Mengubah warna teks subtitle menjadi hitam
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(
                      bottom: 5.0), // Menambahkan spasi di bawah teks
                  child: Text(
                    'FAX',
                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold, // Mengatur teks menjadi tebal
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(
                      top: 3.0), // Menambahkan spasi di atas subjudul
                  child: Text(
                    ' 4567',
                    style: TextStyle(
                      color: Colors
                          .black, // Mengubah warna teks subtitle menjadi hitam
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(
                      bottom: 5.0), // Menambahkan spasi di bawah teks
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold, // Mengatur teks menjadi tebal
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(
                      top: 3.0), // Menambahkan spasi di atas subjudul
                  child: Text(
                    'rizqi.coastguard@gmail.com',
                    style: TextStyle(
                      color: Colors
                          .black, // Mengubah warna teks subtitle menjadi hitam
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(
                      bottom: 5.0), // Menambahkan spasi di bawah teks
                  child: Text(
                    'Jam Layanan Operasional',
                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold, // Mengatur teks menjadi tebal
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(
                      top: 3.0), // Menambahkan spasi di atas subjudul
                  child: Text(
                    'senin - jumat (06.00 - 15.00)',
                    style: TextStyle(
                      color: Colors
                          .black, // Mengubah warna teks subtitle menjadi hitam
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
}

void main() {
  runApp(MaterialApp(
    home: Hubungi(),
  ));
}
