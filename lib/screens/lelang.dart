import 'package:apm/screens/hasilcarilelang.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchText = ' ';

  String? _selectedCategory; // Variabel _selectedCategory

  // Daftar pilihan kategori
  List<String> _categories = ['terlama', 'sedang', 'Terbaru'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF00923F),
        title: Text(
          "Lelang",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            // Spasi atas teks
            SizedBox(height: 25.0),
            // Teks di atas form
            Align(
              alignment: Alignment.centerLeft, // Penempatan horizontal kiri
              child: Text(
                '      Pencarian', // Ubah teks sesuai kebutuhan
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 30),

            // Form input pencarian

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33.0),
              child: DropdownButtonFormField<String>(
                value: _selectedCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
                items: _categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: SizedBox(
                      width: 100, // Mengatur lebar dropdown
                      child: Text(category),
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: '', // Label untuk dropdown
                  contentPadding: EdgeInsets.all(10), // Padding konten

                  border: OutlineInputBorder(
                    // Gaya border

                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40), // Spasi antara dropdown dan tombol

            // Tombol pencarian
            ElevatedButton(
              onPressed: () {
                // Aksi yang akan diambil saat tombol pencarian ditekan
                // Misalnya, tampilkan hasil pencarian atau lakukan tindakan lain
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => produkKredit()));
              },
              child: Text(
                'Cari',
                style: TextStyle(
                  color: Colors.white, // Mengatur warna teks menjadi putih
                ),
              ),

              style: ElevatedButton.styleFrom(
                fixedSize: Size(300, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Atur sudut melengkung sesuai kebutuhan
                ), //
                backgroundColor: Color(0xFF00923F),
              ), //
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
