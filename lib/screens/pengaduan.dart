import 'package:apm/components/footer.dart';
import 'package:apm/components/footernew.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Pengaduan extends StatefulWidget {
  const Pengaduan({super.key, required this.prevPage});
  final String prevPage;
  @override
  _PengaduanState createState() => _PengaduanState();
}

class _PengaduanState extends State<Pengaduan> {
  String searchText = ' ';
  String nama = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF00923F),
        title: Text(
          "Pengaduan Nasabah",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            CachedNetworkImage(
              imageUrl:
                  'https://res.cloudinary.com/dvwsffyzc/image/upload/v1695369281/service-removebg-preview_1_nvjekq.png',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: 500,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: FormBuilderTextField(
                name: 'nama',
                autovalidateMode: AutovalidateMode.always,
                keyboardType: TextInputType.text,
                initialValue: nama,
                decoration: InputDecoration(
                  labelText: "Nama Lengkap",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                validator: (val) {
                  if (val == null || val.toString() == '') {
                    return 'wajib di isi';
                  }
                  nama = val.toString();
                  return null;
                },
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: FormBuilderTextField(
                name: 'nama',
                autovalidateMode: AutovalidateMode.always,
                keyboardType: TextInputType.text,
                initialValue: nama,
                decoration: InputDecoration(
                  labelText: "Masukan Nomor KTP",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                validator: (val) {
                  if (val == null || val.toString() == '') {
                    return 'wajib di isi';
                  }
                  nama = val.toString();
                  return null;
                },
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: FormBuilderTextField(
                name: 'nama',
                autovalidateMode: AutovalidateMode.always,
                keyboardType: TextInputType.text,
                initialValue: nama,
                decoration: InputDecoration(
                  labelText: "Masukan Nomor Ponsel/WA",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                validator: (val) {
                  if (val == null || val.toString() == '') {
                    return 'wajib di isi';
                  }
                  nama = val.toString();
                  return null;
                },
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: FormBuilderTextField(
                name: 'nama',
                autovalidateMode: AutovalidateMode.always,
                keyboardType: TextInputType.text,
                initialValue: nama,
                decoration: InputDecoration(
                  labelText: "Masukan Email Anda",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                validator: (val) {
                  if (val == null || val.toString() == '') {
                    return 'wajib di isi';
                  }
                  nama = val.toString();
                  return null;
                },
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: FormBuilderTextField(
                name: 'alamat_usaha',
                autovalidateMode: AutovalidateMode.always,
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: "",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                ),
                validator: (val) {
                  if (val == null || val.toString() == '') {
                    return 'wajib di isi';
                  }
                  nama = val.toString();
                  return null;
                },
              ),
            ),
            SizedBox(height: 25),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Logika yang akan dijalankan saat tombol "Simpan" ditekan
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(310, 50)),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF00923F)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.0), // Sesuaikan radius sesuai kebutuhan Anda
                      ),
                    ),
                  ),
                  child: Text(
                    'Simpan',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            footer()
          ],
        ),
      ),
      bottomNavigationBar:
          FooterNewWidget(currentMenu: 'pgdn', prevMenu: widget.prevPage),
    );
  }
}
