import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';

class LaporanPublikasi extends StatefulWidget {
  @override
  State<LaporanPublikasi> createState() => _LaporanPublikasiState();
}

class _LaporanPublikasiState extends State<LaporanPublikasi> {
  final GlobalKey<FormState> publikasi = GlobalKey();

  List rentangwaktu = [
    {"value": "Tahunan", "select": "Tahunan"},
    {"value": "Semester", "select": "Semester"},
    {"value": "Triwulan", "select": "Triwulan"},
    {"value": "Bulanan", "select": "Bulanan"},
  ];
  String rentangwaktuu = "";
  String tahun = "";
  List thn = [
    {"value": "2018", "select": "2018"},
    {"value": "2019", "select": "2019"},
    {"value": "2020", "select": "2020"},
    {"value": "2021", "select": "2021"},
    {"value": "2022", "select": "2022"},
    {"value": "2023", "select": "2023"},
    {"value": "2024", "select": "2024"},
    {"value": "2025", "select": "2025"},
    {"value": "2026", "select": "2026"},
    {"value": "2027", "select": "2027"},
    {"value": "2028", "select": "2028"},
    {"value": "2029", "select": "2029"},
    {"value": "2030", "select": "2030"},
  ];
  String bulan = "";
  List bln = [
    {"value": "Januari", "select": "Januari"},
    {"value": "Februari", "select": "Februari"},
    {"value": "Maret", "select": "Maret"},
    {"value": "April", "select": "April"},
    {"value": "Mei", "select": "Mei"},
    {"value": "Juni", "select": "Juni"},
    {"value": "Juli", "select": "Juli"},
    {"value": "Agustus", "select": "Agustus"},
    {"value": "September", "select": "September"},
    {"value": "Oktober", "select": "Oktober"},
    {"value": "November", "select": "November"},
    {"value": "Desember", "select": "Desember"},
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Container(
                  // width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 126, 126, 126)
                              .withOpacity(0.5),
                          blurRadius: 1,
                        ),
                      ],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: FormBuilder(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownSearch(
                            autoValidateMode: AutovalidateMode.always,
                            clearButtonProps:
                                const ClearButtonProps(icon: Icon(Icons.close)),
                            selectedItem: _selectedIzin(),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                labelText: "Rentang Waktu",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            ),
                            items: rentangwaktu,
                            itemAsString: (item) => item['select'],
                            validator: (val) {
                              if (val == null || val.toString() == '') {
                                return 'Rentang waktu wajib di isi';
                              }
                              rentangwaktuu = val['value'].toString();
                              return null;
                            },
                            onChanged: (value) {
                              rentangwaktuu = value['value'].toString();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownSearch(
                            autoValidateMode: AutovalidateMode.always,
                            clearButtonProps:
                                const ClearButtonProps(icon: Icon(Icons.close)),
                            selectedItem: _selectedIzin(),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                labelText: "Tahun",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            ),
                            items: thn,
                            itemAsString: (item) => item['select'],
                            validator: (val) {
                              if (val == null || val.toString() == '') {
                                return 'Tahun wajib di isi';
                              }
                              tahun = val['value'].toString();
                              return null;
                            },
                            onChanged: (value) {
                              tahun = value['value'].toString();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownSearch(
                            autoValidateMode: AutovalidateMode.always,
                            clearButtonProps:
                                const ClearButtonProps(icon: Icon(Icons.close)),
                            selectedItem: _selectedIzin(),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                labelText: "Bulan",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            ),
                            items: bln,
                            itemAsString: (item) => item['select'],
                            validator: (val) {
                              if (val == null || val.toString() == '') {
                                return 'Bulan wajib di isi';
                              }
                              bulan = val['value'].toString();
                              return null;
                            },
                            onChanged: (value) {
                              bulan = value['value'].toString();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (() {
                          // if (_deposito.currentState!.validate()) {
                          //   _submitLeave();
                          // }
                        }),
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                          backgroundColor: Color(0xFF00923F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          minimumSize: const Size(370, 40),
                        ),
                        child: const Text(
                          'CARI',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: const Text(
                        'SILAHKAN CARI DATA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ));

  _selectedIzin() {}
}
