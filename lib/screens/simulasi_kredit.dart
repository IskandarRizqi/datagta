import 'dart:math';

import 'package:apm/components/footer.dart';
import 'package:apm/screens/pengajuan.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SimulasiKredit extends StatefulWidget {
  @override
  State<SimulasiKredit> createState() => _SimulasiKreditState();
}

class _SimulasiKreditState extends State<SimulasiKredit> {
  final GlobalKey<FormBuilderState> SimulasiKredit =
      GlobalKey<FormBuilderState>();
  var nominal = '';
  var tenor = '';
  var bunga = '';
  var perhitunganbunga = [
    {"value": "1", "select": "Flat"},
    {"value": "2", "select": "Anuitas"},
    {"value": "3", "select": "Efektif"},
  ];
  String slcbunga = '';
  List tabelangsuran = [];
  var _countangsuranflat = 0;

  @override
  void initState() {
    super.initState();
    tabelangsuran;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Container(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Jarak antara teks dan gambar
            CachedNetworkImage(
              imageUrl:
                  'https://res.cloudinary.com/dvwsffyzc/image/upload/v1694576285/Rectangle_410_1_yfzayx.png',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: 200, // Lebar gambar sesuaikan dengan kebutuhan Anda
              height: 200, // Tinggi gambar sesuaikan dengan kebutuhan Anda
              fit: BoxFit
                  .cover, // Sesuaikan dengan cara Anda ingin menampilkan gambar
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FormBuilder(
                  key: SimulasiKredit,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: FormBuilderTextField(
                            name: 'nominal_setoran',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(15),
                              // ThousandsFormatter(),
                              CurrencyTextInputFormatter(
                                  decimalDigits: 0,
                                  locale: 'id',
                                  symbol: 'Rp. ')
                            ],
                            initialValue: nominal,
                            decoration: InputDecoration(
                              labelText: "Nominal pinjaman",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            validator: (val) {
                              if (val == null || val.toString() == '') {
                                return 'nominal pinjaman wajib di isi';
                              }
                              nominal = val.toString();
                              // nominal = val.toString();
                              return null;
                              // return null;
                            },
                            onChanged: (value) {
                              nominal = value.toString();
                              // nominal = value.toString();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: FormBuilderTextField(
                            name: 'tenor',
                            keyboardType: TextInputType.number,
                            initialValue: tenor,
                            decoration: InputDecoration(
                              labelText: "Jangka waktu",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            validator: (val) {
                              if (val == null || val.toString() == '') {
                                return 'Jangka waktu wajib di isi';
                              }
                              tenor = val.toString();
                              return null;
                            },
                            onChanged: (value) {
                              tenor = value.toString();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: FormBuilderTextField(
                            name: 'bgn',
                            keyboardType: TextInputType.number,
                            initialValue: tenor,
                            decoration: InputDecoration(
                              labelText: "Bunga",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            validator: (val) {
                              if (val == null || val.toString() == '') {
                                return 'Bunga wajib di isi';
                              }
                              bunga = val.toString();
                              return null;
                            },
                            onChanged: (value) {
                              bunga = value.toString();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownSearch(
                            // autoValidateMode: AutovalidateMode.always,
                            clearButtonProps:
                                const ClearButtonProps(icon: Icon(Icons.close)),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                labelText: "Perhitungan bunga",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ),
                            items: perhitunganbunga,
                            itemAsString: (item) => item['select']!,
                            validator: (val) {
                              if (val == null || val.toString().isEmpty) {
                                return 'Perhitungan bunga wajib di isi';
                              }
                              slcbunga = (val as Map)['value'].toString();
                              return null;
                            },
                            onChanged: (value) {
                              slcbunga = (value as Map)['value'].toString();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  onPressed: (() {
                                    setState(() {
                                      tabelangsuran
                                          .clear(); // Mengosongkan tabel saat tombol reset ditekan
                                    });
                                  }),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFFFC107),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      minimumSize: Size(110, 40)),
                                  child: Text('Reset')),
                              ElevatedButton(
                                  onPressed: (() {
                                    if (SimulasiKredit.currentState!
                                        .validate()) {
                                      hitungkredit();
                                    }
                                  }),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF00923F),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      minimumSize: Size(110, 40)),
                                  child: Text(
                                    'Hitung',
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Color(0xFFE2E2E2),
                        ),
                        DataTable(
                          columnSpacing: 8,
                          horizontalMargin: 1,
                          headingRowHeight: 18,
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text(
                                'Tenor',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF5A5A5A)),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Pokok',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF5A5A5A)),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Bunga',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF5A5A5A)),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Total angsuran',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF5A5A5A)),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Bakidebet',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF5A5A5A)),
                              ),
                            ),
                          ],
                          rows: List<DataRow>.generate(
                            tabelangsuran.length < 0 ? 0 : tabelangsuran.length,
                            (int index) => DataRow(
                              cells: [
                                DataCell(Text(
                                  tabelangsuran[index]['tenor'].toString(),
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF5A5A5A)),
                                )),
                                DataCell(Text(
                                  tabelangsuran[index]['angsuranpokok'] != 0
                                      ? NumberFormat.currency(
                                              locale: 'ID',
                                              symbol: 'Rp. ',
                                              decimalDigits: 0)
                                          .format(double.parse(
                                              tabelangsuran[index]
                                                      ['angsuranpokok']
                                                  .toString()))
                                      : NumberFormat.currency(
                                              locale: 'ID',
                                              symbol: 'Rp. ',
                                              decimalDigits: 0)
                                          .format('0'),
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF5A5A5A)),
                                )),
                                DataCell(Text(
                                  tabelangsuran[index]['angsuranbunga'] != 0
                                      ? NumberFormat.currency(
                                              locale: 'ID',
                                              symbol: 'Rp. ',
                                              decimalDigits: 0)
                                          .format(double.parse(
                                              tabelangsuran[index]
                                                      ['angsuranbunga']
                                                  .toString()))
                                      : NumberFormat.currency(
                                              locale: 'ID',
                                              symbol: 'Rp. ',
                                              decimalDigits: 0)
                                          .format('0'),
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF5A5A5A)),
                                )),
                                DataCell(Text(
                                  tabelangsuran[index]['totalangsuran'] != 0
                                      ? NumberFormat.currency(
                                              locale: 'ID',
                                              symbol: 'Rp. ',
                                              decimalDigits: 0)
                                          .format(double.parse(
                                              tabelangsuran[index]
                                                      ['totalangsuran']
                                                  .toString()))
                                      : NumberFormat.currency(
                                              locale: 'ID',
                                              symbol: 'Rp. ',
                                              decimalDigits: 0)
                                          .format('0'),
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF5A5A5A)),
                                )),
                                DataCell(Text(
                                  NumberFormat.currency(
                                          locale: 'ID',
                                          symbol: 'Rp. ',
                                          decimalDigits: 0)
                                      .format(double.parse(tabelangsuran[index]
                                              ['bakidebet']
                                          .toString())),
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF5A5A5A)),
                                )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ])),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => Pengajuan(
                      prevPage: '',
                    ));
              },
              child: Text(
                'Ajukan',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00923F),
                minimumSize: Size(300, 40),
              ),
            ),
            footer(),
            Divider(
              color: Color(0xFFE2E2E2),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        )),
      ));
  hitungkredit() {
    tabelangsuran.clear();
    if (slcbunga == '1') {
      var str = double.parse(nominal.replaceAll(RegExp('[^0-9]'), ''));
      var plafons = double.parse(nominal.replaceAll(RegExp('[^0-9]'), ''));
      double bakidebet = 0;
      bakidebet = (plafons / double.parse(tenor));
      double totalpokok = 0;
      double totalbunga = 0;
      double totalags = 0;
      tabelangsuran.add({
        'tenor': '-',
        'angsuranpokok': '0',
        'angsuranbunga': '0',
        'totalangsuran': '0',
        'bakidebet': str
      });

      for (var i = 0; i < double.parse(tenor); i++) {
        setState(() {
          plafons -= bakidebet;
          double angsuranpokok = (str / double.parse(tenor));
          double agsbunga = str * (double.parse(bunga) / 12) / 100;

          double totalangsuran = angsuranpokok + agsbunga;
          tabelangsuran.add({
            'tenor': i + 1,
            'angsuranpokok': angsuranpokok,
            'angsuranbunga': agsbunga.round(),
            'totalangsuran': totalangsuran,
            'bakidebet': plafons
          });
          totalpokok += angsuranpokok;
          totalbunga += agsbunga;
          totalags += totalangsuran;
        });
      }
      tabelangsuran.add({
        'tenor': 'Total',
        'angsuranpokok': totalpokok,
        'angsuranbunga': totalbunga,
        'totalangsuran': totalags,
        'bakidebet': '0'
      });
    }
    if (slcbunga == '2') {
      var no = 1;
      var str = double.parse(nominal.replaceAll(RegExp('[^0-9]'), ''));
      var plafon = double.parse(nominal.replaceAll(RegExp('[^0-9]'), ''));
      double bgn = (double.parse(bunga) / 100) / 12;
      double tnr = double.parse(tenor);
      tabelangsuran.add({
        'tenor': '0',
        'angsuranpokok': '0',
        'angsuranbunga': '0',
        'totalangsuran': '0',
        'bakidebet': plafon
      });
      for (var i = double.parse(tenor); i > 0; i--) {
        setState(() {
          // double angsuran1 =
          //     (str * ((bgn / 12) / 100)) / (1 - 1 / (1 + ((bgn / 12) / 100)));

          // double angsuran1 = (1 - 1 / (1 + bgn));
          // double angsuran1 = pow(100000, tnr).toDouble();
          // double angsuran1 = (str * (double.parse(bunga) / 100)) /
          //     (1 - 1 / (1 + ((double.parse(bunga) * 12) / 100)));
          // double ang = (str * ((double.parse(bunga) / 12) / 100)) /
          //     (1 - 1 / (1 + ((double.parse(bunga) / 12) / 100)));
          // double angsuran1 = str *
          //     double.parse(bunga) *
          //     ((1 + double.parse(bunga)) * tnr) /
          //     (1 + double.parse(bunga) * tnr - 1);
          // double angsuran1 = (str * (double.parse(bunga) / 100 / 12)) /
          //     (1 - 1 / (1 + (double.parse(bunga) / 12 / 100)));
          // double angsuran1 =
          //     pow((1 + (double.parse(bunga) / 12 / 100)), tnr).toDouble();
          double angsuran1 = (str * (double.parse(bunga) / 100 / 12)) /
              (1 -
                  1 /
                      pow((1 + (double.parse(bunga) / 12 / 100)), tnr)
                          .toDouble());
          double angbunga = (plafon * (double.parse(bunga) / 100 / 12));
          double bakidebet = plafon - angsuran1 + angbunga;
          plafon -= (angsuran1 - angbunga);
          if (bakidebet < 0) {
            bakidebet = 0;
          }
          tabelangsuran.add({
            'tenor': no,
            'angsuranpokok': angsuran1 - angbunga,
            'angsuranbunga': angbunga,
            'totalangsuran': angsuran1,
            'bakidebet': bakidebet
          });
          no++;
          // log(angsuran1.toString());
          // log(bunga1.toString());
        });
      }
    }
    if (slcbunga == '3') {
      var no = 1;
      var str = double.parse(nominal.replaceAll(RegExp('[^0-9]'), ''));
      var plafon = double.parse(nominal.replaceAll(RegExp('[^0-9]'), ''));
      var plafons = double.parse(nominal.replaceAll(RegExp('[^0-9]'), ''));
      double bgn = (double.parse(bunga) / 100) / 12;
      double tnr = double.parse(tenor);
      tabelangsuran.add({
        'tenor': '0',
        'angsuranpokok': '0',
        'angsuranbunga': '0',
        'totalangsuran': '0',
        'bakidebet': plafon
      });
      for (var i = double.parse(tenor); i > 0; i--) {
        setState(() {
          double angsuran1 = str / tnr;
          double angbunga = plafon * bgn;
          double bakidebet = plafons - angsuran1;
          plafons -= (angsuran1 + angbunga);
          plafon -= angsuran1;
          if (plafon < 0) {
            plafon = 0;
          }
          if (bakidebet < 0) {
            bakidebet = 0;
          }
          tabelangsuran.add({
            'tenor': no,
            'angsuranpokok': angsuran1,
            'angsuranbunga': angbunga,
            'totalangsuran': angsuran1 + angbunga,
            'bakidebet': bakidebet
          });
          no++;
          // log(angsuran1.toString());
          // log(bunga1.toString());
        });
      }
    }
  }

  void resetForm() {
    setState(() {
      tabelangsuran.clear(); // Mengosongkan tabel saat tombol reset ditekan
      // Reset variabel lain sesuai kebutuhan
      nominal = '';
      tenor = '';
      bunga = '';
      slcbunga = '';
    });
  }
}

// class MySliderDataTable extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100.0,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 1,
//         itemBuilder: (BuildContext context, int index) {
//           return SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: DataTable(
//               columns: [
//                 DataColumn(label: Text('Tenor')),
//                 DataColumn(label: Text('Angsuran Pokok')),
//                 DataColumn(label: Text('Angsuran Bunga')),
//                 DataColumn(label: Text('Total Angsuran')),
//                 DataColumn(label: Text('Baki Debet')),
//                 // Add more columns as needed
//               ],
//               rows: [
//                 DataRow(cells: [
//                   DataCell(Text('Data 1')),
//                   DataCell(Text('Data 2')),
//                   DataCell(Text('Data 3')),
//                   DataCell(Text('Data 4')),
//                   DataCell(Text('Data 5')),
//                   // Add more cells as needed
//                 ]),
//                 // Add more rows as needed
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
