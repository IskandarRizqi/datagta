import 'package:apm/screens/detaillelang.dart';
import 'package:flutter/material.dart';
import '../model/lelangmodel.dart';

class produkKredit extends StatefulWidget {
  const produkKredit({super.key});

  @override
  State<produkKredit> createState() => _produkKreditState();
}

class _produkKreditState extends State<produkKredit> {
  String? _selectedCategory;
  List<String> _categories = ['terlama', 'sedang', 'terbaru'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00923F),
        title: Text('Hasil Cari'),
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
            fontSize: 20,
          ),
        ).titleLarge,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Row(
                children: [
                  Text('Urutkan: '),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
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
                            width: 500.0,
                            child: Text(category),
                          ),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: '',
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Menentukan jumlah kolom di sini
              ),
              itemCount: lelang.lelangs.length,
              itemBuilder: (ctx, index) {
                final kredit = lelang.lelangs[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => detaillelang(kredits: kredit),
                      ),
                    );
                  },
                  child: _buildProductCard(kredit.imageUrl, kredit.title,
                      kredit.harga, kredit.lokasi),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
      String imageUrl, String title, String harga, String lokasi) {
    return Container(
      height: 500.0,
      child: Card(
        elevation: 20.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 70.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 10.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                harga,
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 0.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                lokasi,
                style: TextStyle(
                  fontSize: 8.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
