import 'package:apm/components/footer.dart';
import 'package:apm/model/produktabunganmodel.dart';
import 'package:apm/screens/pengajuan.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SimulasiTabungan extends StatefulWidget {
  const SimulasiTabungan({super.key});

  @override
  State<SimulasiTabungan> createState() => _SimulasiTabunganState();
}

class _SimulasiTabunganState extends State<SimulasiTabungan> {
  final GlobalKey<FormBuilderState> SimulasiTabungan =
      GlobalKey<FormBuilderState>();
  List dataTabungan = [];
  String produktabungan = '';
  String nominal = '';
  var hasilperhitungan;
  var saldotanpabunga;
  var bungaperbulan;

  @override
  void initState() {
    // _getDataTabungan();
    super.initState();
    hasilperhitungan;
    saldotanpabunga;
    bungaperbulan;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                CachedNetworkImage(
                  imageUrl:
                      'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694762238/Rectangle_344_wninro.png',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  width: 200, // Lebar gambar sesuaikan dengan kebutuhan Anda
                  height: 200, // Tinggi gambar sesuaikan dengan kebutuhan Anda
                  fit: BoxFit
                      .cover, // Sesuaikan dengan cara Anda ingin menampilkan gambar
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    FormBuilder(
                      key: SimulasiTabungan,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: DropdownSearch<Tabungan>(
                              clearButtonProps: const ClearButtonProps(
                                  icon: Icon(Icons.close)),
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  labelText: "Produk Tabungan",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ),
                              items: Tabungan.tabungans,
                              itemAsString: (item) => item.title,
                              validator: (Tabungan? val) {
                                if (val == null) {
                                  return 'Produk tabungan wajib di isi';
                                }
                                produktabungan =
                                    val.id; // Mengambil ID produk tabungan
                                return null;
                              },
                              onChanged: (Tabungan? value) {
                                if (value != null) {
                                  produktabungan = value.nominalTabungan
                                      .toString(); // Mengambil ID produk tabungan
                                }
                              },
                              selectedItem: Tabungan.tabungans
                                  .first, // Pilihan pertama akan ditampilkan awalnya
                            ),
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.all(10),
                          //   child: DropdownSearch(
                          //     clearButtonProps: const ClearButtonProps(
                          //         icon: Icon(Icons.close)),
                          //     dropdownDecoratorProps: DropDownDecoratorProps(
                          //       dropdownSearchDecoration: InputDecoration(
                          //         labelText: "Produk Tabungan",
                          //         border: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(25)),
                          //       ),
                          //     ),
                          //     items: dataTabungan,
                          //     itemAsString: (item) => item['nama'],
                          //     validator: (val) {
                          //       if (val == null || val.toString() == '') {
                          //         return 'Produk tabungan wajib di isi';
                          //       }
                          //       produktabungan = val['nominal'].toString();
                          //       // produktabungan =
                          //       //     '${val['id']}---${val['image']}---${val['minimal_setoran']}';
                          //       return null;
                          //     },
                          //     onChanged: (value) {
                          //       produktabungan = value['nominal'].toString();
                          //       // produktabungan =
                          //       //     '${value['id']}---${value['image']}---${value['minimal_setoran']}';
                          //     },
                          //   ),
                          // ),
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
                                labelText: "Setoran tabungan",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                              validator: (val) {
                                if (val == null || val.toString() == '') {
                                  return 'Setoran awal wajib di isi';
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                SimulasiTabungan.currentState!.reset();
                                setState(() {
                                  hasilperhitungan = null;
                                  saldotanpabunga = null;
                                  bungaperbulan = null;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFDC3545),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  minimumSize: Size(110, 40)),
                              child: Text(
                                'Reset',
                                style: TextStyle(color: Colors.white),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                if (SimulasiTabungan.currentState!.validate()) {
                                  hitungtabungan();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF00923F),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  minimumSize: Size(110, 40)),
                              child: Text(
                                'Hitung',
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    const Divider(
                      height: 50,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color: Color(0xFFDADADA),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Bunga + saldo tabungan',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            // 'Bunga + saldo tabungan',
                            hasilperhitungan == null
                                ? NumberFormat.currency(
                                        locale: 'ID',
                                        symbol: 'Rp. ',
                                        decimalDigits: 0)
                                    .format(double.parse('0'))
                                : NumberFormat.currency(
                                        locale: 'ID',
                                        symbol: 'Rp. ',
                                        decimalDigits: 0)
                                    .format(double.parse(
                                        hasilperhitungan.toString())),
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF00923F)),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 10,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color: Color(0xFFDADADA),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Saldo tanpa bunga',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            // 'Bunga + saldo tabungan',
                            saldotanpabunga == null
                                ? NumberFormat.currency(
                                        locale: 'ID',
                                        symbol: 'Rp. ',
                                        decimalDigits: 0)
                                    .format(double.parse('0'))
                                : NumberFormat.currency(
                                        locale: 'ID',
                                        symbol: 'Rp. ',
                                        decimalDigits: 0)
                                    .format(double.parse(
                                        saldotanpabunga.toString())),
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF00923F)),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 10,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color: Color(0xFFDADADA),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Bunga per tahun',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            // 'Bunga + saldo tabungan',
                            bungaperbulan == null
                                ? NumberFormat.currency(
                                        locale: 'ID',
                                        symbol: 'Rp. ',
                                        decimalDigits: 0)
                                    .format(double.parse('0'))
                                : NumberFormat.currency(
                                        locale: 'ID',
                                        symbol: 'Rp. ',
                                        decimalDigits: 0)
                                    .format(
                                        double.parse(bungaperbulan.toString())),
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF00923F)),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 15,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color: Color(0xFFDADADA),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Syarat dan ketentuan\n\n'
                      '1. Belum Termasuk Paiak Bunga dan Biaya Admin\n'
                      '2. Suku bunga dapat berubah sewaktu-waktu mengikuti ketentuan yang berlaku\n'
                      '3. Simulasi Tabungan Untuk Periode Satu Tahun\n'
                      '4. Simulasi in merupakan ilustrasi perhitungan dari system Artha Puspa Mega'),
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
                SizedBox(height: 50),
                footer()
              ],
            ),
          ),
        ),
      );
  // _getDataTabungan() async {
  //   var dat = await ApiHandler().getData('/produk-tabungan');
  //   if (dat.statusCode == 200 && dat.body != null) {
  //     var body = jsonDecode(dat.body);
  //     // var atdLgt = body['data'].length;
  //     // log(body['data'].toString());
  //     setState(() {
  //       _dataTabungan = body['data'];
  //     });
  //   }
  // }
  hitungtabungan() {
    var str = double.parse(nominal.replaceAll(RegExp('[^0-9]'), ''));
    var nominalProduk = double.parse(produktabungan);
    setState(() {
      bungaperbulan = ((str * 12) * (nominalProduk / 100));
      hasilperhitungan = (str * 12) + bungaperbulan;
      saldotanpabunga = (str * 12);
    });
  }
}
