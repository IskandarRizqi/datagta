import 'package:apm/model/produkdepositmodel.dart';
import 'package:apm/screens/detaildeposito.dart';
import 'package:flutter/material.dart';

class produkDeposito extends StatefulWidget {
  const produkDeposito({super.key});

  @override
  State<produkDeposito> createState() => _produkDepositoState();
}

class _produkDepositoState extends State<produkDeposito> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00923F), // Warna latar belakang AppBar
        title: Text('Deposit'), // Judul AppBar
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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: Deposit.deposits.length,
                itemBuilder: (ctx, index) {
                  final deposit = Deposit.deposits[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DetailDepositPage(deposits: deposit),
                        ),
                      );
                    },
                    child: _buildProductCard(deposit.imageUrl, deposit.title),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(String imageUrl, String title) {
    return Container(
      width: 160.0,
      height: 130.0, // Atur lebar kartu sesuai kebutuhan Anda
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20.0), // Atur radius sesuai kebutuhan Anda
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity, // Atur lebar gambar sesuai kebutuhan Anda
              height: 100, // Atur tinggi gambar sesuai kebutuhan Anda
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              title,
              maxLines: 1, // Batasi teks judul menjadi dua baris
              overflow: TextOverflow
                  .ellipsis, // Tampilkan titik-titik jika teks melebihi dua baris
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
