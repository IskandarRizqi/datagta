import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:apm/components/footer.dart';
import 'package:flutter/material.dart';

class PengajuanDeposito extends StatefulWidget {
  @override
  State<PengajuanDeposito> createState() => _PengajuanDepositoState();
}

class _PengajuanDepositoState extends State<PengajuanDeposito> {
  // TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool? isTermsAccepted = false;

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //       _dateController.text = "${picked.toLocal()}".split(' ')[0];
  //     });
  // }

  final GlobalKey<FormState> deposito = GlobalKey();

  List produk = [
    {"value": "Produk A", "select": "Produk A"},
    {"value": "Produk B", "select": "Produk B"},
    {"value": "Produk C", "select": "Produk C"},
    {"value": "Produk D", "select": "Produk D"},
    {"value": "Produk E", "select": "Produk E"},
  ];
  String nominal = "";
  String produkk = "";
  List jangkawaktu = [
    {"value": "1", "select": "1"},
    {"value": "2", "select": "2"},
    {"value": "3", "select": "3"},
    {"value": "4", "select": "4"},
    {"value": "5", "select": "5"},
  ];
  String jw = "";
  List jenis_identitas = [
    {"value": "1", "select": "1"},
    {"value": "2", "select": "2"},
    {"value": "3", "select": "3"},
    {"value": "4", "select": "4"},
    {"value": "5", "select": "5"},
  ];
  String ji = "";

  String namalengkap = "";
  String noktp = "";
  String npwp = "";
  String nohp = "";
  List status = [
    {"value": "Single", "select": "Single"},
    {"value": "Menikah", "select": "Menikah"},
    {"value": "Janda / Duda", "select": "Janda / Duda"},
  ];
  String stt = "";
  List pendidikan_terakhir = [
    {"value": "TK / Paud", "select": "TK / Paud"},
    {"value": "SD", "select": "SD"},
    {"value": "SMP", "select": "SMP"},
    {"value": "SMA / SMK", "select": "SMA / SMK"},
    {"value": "DIPLOMA", "select": "DIPLOMA"},
    {"value": "S1", "select": "S1"},
    {"value": "S2", "select": "S2"},
    {"value": "Lainnya", "select": "Lainnya"},
  ];
  String pdd = "";
  List agama = [
    {"value": "islam", "select": "Islam"},
    {"value": "protestan", "select": "Protestan"},
    {"value": "katolik", "select": "Katolik"},
    {"value": "hindu", "select": "Hindu"},
    {"value": "budha", "select": "Budha"},
  ];
  String agm = "";
  String alamat = '';
  List penghasilan_perbulan = [
    {"value": "< 1000000", "select": "< Rp. 1.000.000"},
    {"value": "1000000-2000000", "select": "1.000.000 - 2.000.000"},
    {"value": "2000000-5000000", "select": "2.000.000 - 5.000.000"},
    {"value": "5000000-10000000", "select": "5.000.000 - 10.000.000"},
    {"value": "> 10000000", "select": "> Rp. 10.000.000"},
  ];
  String pb = '';
  String transaksi_minimal_harian = '';
  List sumber_utama = [
    {"value": "gaji", "select": "Gaji"},
    {"value": "usaha/bisnis", "select": "Usaha / Bisnis"},
    {"value": "lainnya", "select": "Lainnya"},
  ];
  String sut = '';
  String sumber_utama_lainnya = '';
  String nominal_sumber_utama_lainnya = '';
  List tujuan_rekening = [
    {"value": "tabungan", "select": "Tabungan"},
    {"value": "tampungan bunga", "select": "Tampungan bunga"},
    {"value": "lainnya", "select": "Lainnya"}
  ];
  String tr = '';
  String tujuan_lainnya = '';
  String jumlah_setoran = '';
  List jenis_pekerjaan = [
    {"value": "PNS", "select": "PNS"},
    {"value": "Karyawan", "select": "Karyawan"},
    {"value": "Petani", "select": "Petani"},
    {"value": "Wiraswasta", "select": "Wiraswasta"},
    {"value": "Pedagang", "select": "Pedagang"},
  ];
  String jp = '';
  String nama_kantor = "";
  String jabatan = "";
  String lama_bekerja = "";
  List lamaush = [
    {"value": "1", "select": "< 1 Tahun"},
    {"value": "2", "select": "2 Tahun"},
    {"value": "3", "select": "3 Tahun"},
    {"value": "15", "select": "> 15 tahun"},
  ];
  String alamat_kantor = "";
  String kode_pos = "";
  String rt_rw = "";

  String telepon = "";
  String faksimili = "";
  var alamatsuratmenyurat;

  String kelurahan = "";
  String kecamatan = "";
  String kabupaten = "";
  String provinsi = "";

  List alamat_surat = [
    {"value": "identitas", "select": "Alamat Identitas"},
    {"value": "tempat_kerja", "select": "Alamat Tempat Kerja"},
  ];

  String almt_surat = '';
  XFile? fotoktp;

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Image.network(
                  'https://res.cloudinary.com/dvwsffyzc/image/upload/v1694677338/Rectangle_410_2_hq9aqf.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
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
                                labelText: "Produk",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            ),
                            items: produk,
                            itemAsString: (item) => item['select'],
                            validator: (val) {
                              if (val == null || val.toString() == '') {
                                return 'Produk wajib di isi';
                              }
                              produkk = val['value'].toString();
                              return null;
                            },
                            onChanged: (value) {
                              produkk = value['value'].toString();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: FormBuilderTextField(
                            name: 'nominal',
                            autovalidateMode: AutovalidateMode.always,
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
                              labelText: "Nominal (Rp)",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            validator: (val) {
                              if (val == null || val.toString() == '') {
                                return 'Nominal wajib di isi';
                              }
                              nominal = val.toString();
                              return null;
                            },
                            onChanged: (value) {
                              nominal = value.toString();
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
                                labelText: "Jangka Waktu (bulan)",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            ),
                            items: jangkawaktu,
                            itemAsString: (item) => item['select'],
                            validator: (val) {
                              if (val == null || val.toString() == '') {
                                return 'Jangka waktu wajib di isi';
                              }
                              jw = val['value'].toString();
                              return null;
                            },
                            onChanged: (value) {
                              jw = value['value'].toString();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ExpansionTile(
                    title: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Color(0xFF00923F),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Data Pribadi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    children: [
                      ListTile(
                        title: Container(
                          // width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 126, 126, 126)
                                          .withOpacity(0.5),
                                  blurRadius: 1,
                                ),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: DropdownSearch(
                                  autoValidateMode: AutovalidateMode.always,
                                  clearButtonProps: const ClearButtonProps(
                                      icon: Icon(Icons.close)),
                                  selectedItem: _selectedIzin(),
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "Jenis Identitas",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                  ),
                                  items: jenis_identitas,
                                  itemAsString: (item) => item['select'],
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Jenis Identitas wajib di isi';
                                    }
                                    ji = val['value'].toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    ji = value['value'].toString();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'no_ktp',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.number,
                                  initialValue: noktp,
                                  decoration: InputDecoration(
                                    labelText: "Nomor KTP",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Nomor KTP wajib di isi';
                                    } else {
                                      if (val.toString().length > 16) {
                                        return 'Maximal 16 digit';
                                      }
                                    }
                                    noktp = val.toString();
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'nama',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: namalengkap,
                                  decoration: InputDecoration(
                                    labelText: "Nama Lengkap",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Nama lengkap wajib di isi';
                                    }
                                    namalengkap = val.toString();
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'no_hp',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.number,
                                  initialValue: nohp,
                                  decoration: InputDecoration(
                                    labelText: "Nomor Handphone/WA",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Nomor handphone wajib di isi';
                                    }
                                    nohp = val.toString();
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: DropdownSearch(
                                  autoValidateMode: AutovalidateMode.always,
                                  clearButtonProps: const ClearButtonProps(
                                      icon: Icon(Icons.close)),
                                  selectedItem: _selectedIzin(),
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "Status",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                  ),
                                  items: status,
                                  itemAsString: (item) => item['select'],
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Status wajib di isi';
                                    }
                                    stt = val['value'].toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    stt = value['value'].toString();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: DropdownSearch(
                                  autoValidateMode: AutovalidateMode.always,
                                  clearButtonProps: const ClearButtonProps(
                                      icon: Icon(Icons.close)),
                                  selectedItem: _selectedIzin(),
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "Pendidikan Terakhir",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                  ),
                                  items: pendidikan_terakhir,
                                  itemAsString: (item) => item['select'],
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Pendidikan terakhir wajib di isi';
                                    }
                                    pdd = val['value'].toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    pdd = value['value'].toString();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: DropdownSearch(
                                  autoValidateMode: AutovalidateMode.always,
                                  clearButtonProps: const ClearButtonProps(
                                      icon: Icon(Icons.close)),
                                  selectedItem: _selectedIzin(),
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "Agama",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                  ),
                                  items: agama,
                                  itemAsString: (item) => item['select'],
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Agama wajib di isi';
                                    }
                                    agm = val['value'].toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    agm = value['value'].toString();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'alamat',
                                  autovalidateMode: AutovalidateMode.always,
                                  maxLines: 4,
                                  keyboardType: TextInputType.multiline,
                                  initialValue: alamat,
                                  decoration: InputDecoration(
                                    labelText: "Alamat",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Alamat wajib di isi';
                                    }
                                    alamat = val.toString();
                                    return null;
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ExpansionTile(
                    title: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Color(0xFF00923F),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Data Keuangan',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    children: [
                      ListTile(
                        title: Container(
                          // width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 126, 126, 126)
                                          .withOpacity(0.5),
                                  blurRadius: 1,
                                ),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: DropdownSearch(
                                  autoValidateMode: AutovalidateMode.always,
                                  clearButtonProps: const ClearButtonProps(
                                      icon: Icon(Icons.close)),
                                  selectedItem: _selectedIzin(),
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "Penghasilan Perbulan",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                  ),
                                  items: penghasilan_perbulan,
                                  itemAsString: (item) => item['select'],
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Pengahasilan perbulan wajib di isi';
                                    }
                                    pb = val['value'].toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    pb = value['value'].toString();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'transaksi_harian',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(15),
                                    // ThousandsFormatter(),
                                    CurrencyTextInputFormatter(
                                        decimalDigits: 0,
                                        locale: 'id',
                                        symbol: 'Rp. ')
                                  ],
                                  initialValue: transaksi_minimal_harian,
                                  decoration: InputDecoration(
                                    labelText: "Transaksi Minimal Harian",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Transaksi minimal harian wajib di isi';
                                    }
                                    transaksi_minimal_harian = val.toString();
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: DropdownSearch(
                                  autoValidateMode: AutovalidateMode.always,
                                  clearButtonProps: const ClearButtonProps(
                                      icon: Icon(Icons.close)),
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "Sumber Utama",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                  ),
                                  items: sumber_utama,
                                  itemAsString: (item) => item['select'],
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Sumber utama wajib di isi';
                                    }
                                    sut = val['value'].toString();
                                    // sumber_utama = val['value'];
                                    return null;
                                  },
                                  onChanged: (value) {
                                    sut = value['value'].toString();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'sumber_utama_lainnya',

                                  // enabled: actv,
                                  keyboardType: TextInputType.text,
                                  initialValue: sumber_utama_lainnya,
                                  decoration: InputDecoration(
                                    labelText: "Sumber Utama Lainnya",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    sumber_utama_lainnya = val.toString();
                                    return null;
                                    // return null;
                                  },
                                  onChanged: (value) {
                                    sumber_utama_lainnya = value.toString();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'nmls',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(15),
                                    // ThousandsFormatter(),
                                    CurrencyTextInputFormatter(
                                        decimalDigits: 0,
                                        locale: 'id',
                                        symbol: 'Rp. ')
                                  ],
                                  initialValue: nominal_sumber_utama_lainnya,
                                  decoration: InputDecoration(
                                    labelText: "Nominal Sumber Utama Lainnya",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    nominal_sumber_utama_lainnya =
                                        val.toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    nominal_sumber_utama_lainnya =
                                        value.toString();
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ExpansionTile(
                    title: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Color(0xFF00923F),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Data Rekening',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    children: [
                      ListTile(
                        title: Container(
                          // width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 126, 126, 126)
                                          .withOpacity(0.5),
                                  blurRadius: 1,
                                ),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: DropdownSearch(
                                  clearButtonProps: const ClearButtonProps(
                                      icon: Icon(Icons.close)),
                                  selectedItem: _selectedIzin(),
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "Tujuan Buka Rekening",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                  ),
                                  autoValidateMode: AutovalidateMode.always,
                                  items: tujuan_rekening,
                                  itemAsString: (item) => item['select'],
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Tujuan buka rekening wajib di isi';
                                    }
                                    tr = val.toString();
                                    return null;
                                    // return null;
                                  },
                                  onChanged: (value) {
                                    tr = value['value'].toString();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'tujuan_rekening_lainnya',
                                  keyboardType: TextInputType.text,
                                  initialValue: tujuan_lainnya,
                                  decoration: InputDecoration(
                                    labelText: "Tujuan Buka Rekening Lainnya",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    tujuan_lainnya = val.toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    tujuan_lainnya = value.toString();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'jumlah_setoran',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(15),
                                    // ThousandsFormatter(),
                                    CurrencyTextInputFormatter(
                                        decimalDigits: 0,
                                        locale: 'id',
                                        symbol: 'Rp. ')
                                  ],
                                  initialValue: jumlah_setoran,
                                  decoration: InputDecoration(
                                    labelText: "Jumlah Setoran",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Jumlah setoran wajib di isi';
                                    }
                                    jumlah_setoran = val.toString();
                                    return null;
                                    // return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, bottom: 5, right: 20),
                                child: Text('Foto KTP',
                                    style: TextStyle(
                                      fontSize: 16,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, bottom: 5, right: 20),
                                child: FormBuilderImagePicker(
                                  name: 'fotousha',
                                  autovalidateMode: AutovalidateMode.always,
                                  showDecoration: true,
                                  maxImages: 1,
                                  previewAutoSizeWidth: true,
                                  imageQuality: 5,
                                  onChanged: (val) async {
                                    if (val != null) {
                                      if (val.length > 0 && val[0] != null) {
                                        fotoktp = XFile(val[0].path!);
                                      }
                                    }
                                  },
                                  validator: (value) {
                                    if (value != null || value != '') {
                                      // if (val.length > 0 && val[0] != null) {
                                      //   fotoktp = XFile(val[0].path!);
                                      // }
                                      return 'Foto KTP wajib di isi';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ExpansionTile(
                    title: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Color(0xFF00923F),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Data Pekerjaan',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    children: [
                      ListTile(
                        title: Container(
                          // width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 126, 126, 126)
                                          .withOpacity(0.5),
                                  blurRadius: 1,
                                ),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: DropdownSearch(
                                  autoValidateMode: AutovalidateMode.always,
                                  clearButtonProps: const ClearButtonProps(
                                      icon: Icon(Icons.close)),
                                  selectedItem: _selectedIzin(),
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "Jenis Pekerjaan",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                  ),
                                  items: jenis_pekerjaan,
                                  itemAsString: (item) => item['select'],
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Jenis pekerjaan wajib di isi';
                                    }
                                    jp = val['value'].toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    jp = value['value'].toString();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'nama_kantor',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: nama_kantor,
                                  decoration: InputDecoration(
                                    labelText: "Nama Kantor",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Nama kantor wajib di isi';
                                    }
                                    nama_kantor = val.toString();
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'jabatan',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: jabatan,
                                  decoration: InputDecoration(
                                    labelText: "Jabatan",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Jabatan wajib di isi';
                                    }
                                    jabatan = val.toString();
                                    return null;
                                    // return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'lama_bekerja',
                                  keyboardType: TextInputType.number,
                                  initialValue: lama_bekerja,
                                  autovalidateMode: AutovalidateMode.always,
                                  decoration: InputDecoration(
                                    labelText: "Lama Bekerja",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    // lama_bekerja = val.toString();
                                    // return null;
                                    if (val == null || val.toString() == '') {
                                      return 'Lama bekerja wajib di isi';
                                    }
                                    jabatan = val.toString();
                                    return null;
                                    // return null;
                                  },
                                  onChanged: (value) {
                                    lama_bekerja = value.toString();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'npwp',
                                  keyboardType: TextInputType.text,
                                  initialValue: npwp,
                                  decoration: InputDecoration(
                                    labelText: "NPWP Nasabah",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    npwp = val.toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    npwp = value.toString();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'alamat_kantor',
                                  maxLines: 4,
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.multiline,
                                  initialValue: alamat_kantor,
                                  decoration: InputDecoration(
                                    labelText: "Alamat Kantor",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Alamat wajib di isi';
                                    }
                                    alamat_kantor = val.toString();
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'kode_pos',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.number,
                                  initialValue: kode_pos,
                                  decoration: InputDecoration(
                                    labelText: "Kode Pos",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Kode pos wajib di isi';
                                    }
                                    kode_pos = val.toString();
                                    return null;
                                  },
                                ), // Tambahkan jarak vertikal antara form
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'rtrw',
                                  keyboardType: TextInputType.text,
                                  initialValue: rt_rw,
                                  decoration: InputDecoration(
                                    labelText: "RT/RW",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'RT/RW wajib di isi';
                                    }
                                    rt_rw = val.toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    rt_rw = value.toString();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'kel',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: kelurahan,
                                  decoration: InputDecoration(
                                    labelText: "Kelurahan/Desa",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Kelurahan/Desa wajib di isi';
                                    }
                                    kelurahan = val.toString();
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'kec',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: kecamatan,
                                  decoration: InputDecoration(
                                    labelText: "Kecamatan",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Kecamatan wajib di isi';
                                    }
                                    kecamatan = val.toString();
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'kab',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: kabupaten,
                                  decoration: InputDecoration(
                                    labelText: "Kota/kabupaten",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Kota/kabupaten wajib di isi';
                                    }
                                    kabupaten = val.toString();
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'prov',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: provinsi,
                                  decoration: InputDecoration(
                                    labelText: "Provinsi",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Provinsi wajib di isi';
                                    }
                                    provinsi = val.toString();
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'tlps',
                                  keyboardType: TextInputType.number,
                                  initialValue: telepon,
                                  decoration: InputDecoration(
                                    labelText: "Telepon",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    telepon = val.toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    telepon = value.toString();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'faksdd',
                                  keyboardType: TextInputType.number,
                                  initialValue: faksimili,
                                  decoration: InputDecoration(
                                    labelText: "Faksimili",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    faksimili = val.toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    faksimili = value.toString();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: DropdownSearch(
                                  autoValidateMode: AutovalidateMode.always,
                                  clearButtonProps: const ClearButtonProps(
                                      icon: Icon(Icons.close)),
                                  selectedItem: _selectedIzin(),
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "Alamat Surat menyurat",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                  ),
                                  items: alamat_surat,
                                  itemAsString: (item) => item['select'],
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Alamat surat menyurat wajib di isi';
                                    }
                                    almt_surat = val['value'].toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    almt_surat = value['value'].toString();
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
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
                          'SIMPAN',
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
                footer(),
              ],
            ),
          ),
        ),
      ));

  _selectedIzin() {}

  // _submitLeave() async {
  //   var datapribadi = {
  //     'produk': pdd,

  //   };
  // }
}
