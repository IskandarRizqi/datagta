import 'package:apm/components/footer.dart';
import 'package:apm/model/produkdepositmodel.dart';
import 'package:apm/screens/pengajuan.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SimulasiDeposito extends StatefulWidget {
  const SimulasiDeposito({super.key});

  @override
  State<SimulasiDeposito> createState() => _SimulasiDepositoState();
}

class _SimulasiDepositoState extends State<SimulasiDeposito> {
  final GlobalKey<FormBuilderState> SimulasiDeposito =
      GlobalKey<FormBuilderState>();
  List dataDeposito = [];
  String produkdeposit = '';
  String tenor = '';
  String nominal = '';

  var hasilperhitungan;
  var saldotanpabunga;
  var bungaperbulan;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  child: FormBuilder(
                    key: SimulasiDeposito,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownSearch(
                            clearButtonProps:
                                const ClearButtonProps(icon: Icon(Icons.close)),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                labelText: "Produk Deposito",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            ),
                            items: Deposit.deposits,
                            itemAsString: (item) => item.title,
                            validator: (Deposit? val) {
                              if (val == null) {
                                return 'Produk deposito wajib di isi';
                              }
                              produkdeposit = val.id;
                              tenor = val.tenor.toString();
                              // produktabungan =
                              //     '${val['id']}---${val['image']}---${val['minimal_setoran']}';
                              return null;
                            },
                            onChanged: (Deposit? value) {
                              if (value != null) {
                                produkdeposit = value.nominalkredit.toString();
                                tenor = value.tenor
                                    .toString(); // Mengambil ID produk tabungan
                              }
                            },
                            selectedItem: Deposit.deposits.first,
                          ),
                        ),
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
                              labelText: "Setoran deposito",
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
                        SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    SimulasiDeposito.currentState!.reset();
                                    setState(() {
                                      hasilperhitungan = null;
                                      saldotanpabunga = null;
                                      bungaperbulan = null;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFDC3545),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      minimumSize: Size(110, 40)),
                                  child: Text(
                                    'Reset',
                                    style: TextStyle(color: Colors.white),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    if (SimulasiDeposito.currentState!
                                        .validate()) {
                                      hitungtabungan();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF00923F),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      minimumSize: Size(110, 40)),
                                  child: Text(
                                    'Hitung',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                                .format(
                                    double.parse(hasilperhitungan.toString())),
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
                                .format(
                                    double.parse(saldotanpabunga.toString())),
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
                                .format(double.parse(bungaperbulan.toString())),
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
  //   var dat = await ApiHandler().getData('/produk-deposito');
  //   if (dat.statusCode == 200 && dat.body != null) {
  //     var body = jsonDecode(dat.body);
  //     // var atdLgt = body['data'].length;
  //     // log(body['data'].toString());
  //     setState(() {
  //       _dataDeposito = body['data'];
  //     });
  //   }
  // }

  hitungtabungan() {
    var str = double.parse(nominal.replaceAll(RegExp('[^0-9]'), ''));
    setState(() {
      bungaperbulan = (str *
          double.parse(tenor) *
          (double.parse(produkdeposit) / 100) /
          12);
      hasilperhitungan = str + bungaperbulan;
      saldotanpabunga = str;
    });
  }
}
