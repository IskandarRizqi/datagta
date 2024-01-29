import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:apm/components/footer.dart';
import 'package:flutter/material.dart';

class PengajuanKredit extends StatefulWidget {
  @override
  State<PengajuanKredit> createState() => _PengajuanKreditState();
}

class _PengajuanKreditState extends State<PengajuanKredit> {
  // TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TextEditingController _dateController = TextEditingController();

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

  final GlobalKey<FormState> kredit = GlobalKey();
  List _dataKredit = [];
  List _dataAgunan = [];

  List produk = [
    {"value": "Produk A", "select": "Produk A"},
    {"value": "Produk B", "select": "Produk B"},
    {"value": "Produk C", "select": "Produk C"},
    {"value": "Produk D", "select": "Produk D"},
    {"value": "Produk E", "select": "Produk E"},
  ];
  String produkkredit = "";
  double bunga = 0;
  String plafon_kredit = '';
  String tenor = '';
  double tenors = 0;
  String angsuran = "";
  String perhitungan_bunga = "";
  String produkk = "";
  String jenisagunan = "";

  String nama = "";
  String alias = "";
  List jenis_kelamin = [
    {"value": "Laki-laki", "select": "Laki-laki"},
    {"value": "Perempuan", "select": "Perempuan"},
  ];
  String jk = "";
  String tempat_lahir = "";
  String usia = "";
  List status_kenegaraan = [
    {"value": "A", "select": "A"},
    {"value": "B", "select": "B"},
  ];
  String sk = "";
  String tempat_tinggal_tetap = "";
  String lama_tinggal = "";
  List status_tempat = [
    {"value": "A", "select": "A"},
    {"value": "B", "select": "B"},
  ];
  String stt_tempat = "";
  List gelar = [
    {"value": "A", "select": "A"},
    {"value": "B", "select": "B"},
  ];
  String glr = "";
  String pekerjaan = "";
  String jenis_usaha = "";
  String sektor_usaha = "";
  String alamat_usaha = "";
  List tujuan_penggunaan = [
    {"value": "A", "select": "A"},
    {"value": "B", "select": "B"},
  ];
  String tp = "";
  List pembayaran_kembali = [
    {"value": "A", "select": "A"},
    {"value": "B", "select": "B"},
  ];
  String pk = "";
  String nama_suami = "";
  String tempatlahir_suami = "";
  String pekerjaan_suami = "";
  String alamat_suami = "";
  String penghasilan_bersih = "";
  String biaya_rumahtangga = "";
  String penghasilan_suami = "";
  String angsuran_pinjaman = "";
  String penghasilan_tambahan = "";
  String sisa_penghasilan = "";

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
                  'https://res.cloudinary.com/dvwsffyzc/image/upload/v1694576285/Rectangle_410_1_yfzayx.png',
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
                            clearButtonProps:
                                const ClearButtonProps(icon: Icon(Icons.close)),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                labelText: "Produk kredit",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            ),
                            items: _dataKredit,
                            itemAsString: (item) => item['nama'],
                            // selectedItem: widget.cutiData[0],
                            onChanged: (value) {
                              produkkredit = value['id'].toString();
                              bunga = double.parse(value['tenor'].toString());
                            },
                            autoValidateMode: AutovalidateMode.always,
                            validator: (val) {
                              if (val == null || val.toString() == '') {
                                return 'Produk kredit wajib di isi';
                              }

                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: FormBuilderTextField(
                            name: 'plafon',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(15),
                              // ThousandsFormatter(),
                              CurrencyTextInputFormatter(
                                  decimalDigits: 0,
                                  locale: 'id',
                                  symbol: 'Rp. ')
                            ],
                            initialValue: plafon_kredit,
                            decoration: InputDecoration(
                              labelText: "Plafon (Rp)",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            onChanged: (value) {
                              plafon_kredit = value.toString();
                              // calculate();
                            },
                            autovalidateMode: AutovalidateMode.always,
                            validator: (val) {
                              if (val == null || val.toString() == '') {
                                return 'Plafon wajib di isi';
                              }
                              plafon_kredit = val.toString();
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: FormBuilderTextField(
                            name: 'tenor',
                            autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.number,
                            initialValue: tenor,
                            decoration: InputDecoration(
                              labelText: "Tenor",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            validator: (val) {
                              if (val == null || val.toString() == '') {
                                return 'Tenor wajib di isi';
                              }
                              tenor = val.toString();
                              return null;
                            },
                            onChanged: (value) {
                              tenor = value.toString();
                              tenors = double.parse(value.toString());
                              // calculate();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: FormBuilderTextField(
                            name: 'angsuran',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(15),
                              // ThousandsFormatter(),
                              CurrencyTextInputFormatter(
                                  decimalDigits: 0,
                                  locale: 'id',
                                  symbol: 'Rp. ')
                            ],
                            initialValue: angsuran,
                            decoration: InputDecoration(
                              labelText: "Angsuran (Rp)",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            onChanged: (value) {
                              angsuran = value.toString();
                              // calculate();
                            },
                            autovalidateMode: AutovalidateMode.always,
                            validator: (val) {
                              if (val == null || val.toString() == '') {
                                return 'Angsuran wajib di isi';
                              }
                              angsuran = val.toString();
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: FormBuilderTextField(
                            name: 'perhitungan_bunga',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(15),
                              // ThousandsFormatter(),
                              CurrencyTextInputFormatter(
                                  decimalDigits: 0,
                                  locale: 'id',
                                  symbol: 'Rp. ')
                            ],
                            initialValue: perhitungan_bunga,
                            decoration: InputDecoration(
                              labelText: "Perhitungan Bunga",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            onChanged: (value) {
                              perhitungan_bunga = value.toString();
                              // calculate();
                            },
                            autovalidateMode: AutovalidateMode.always,
                            validator: (val) {
                              if (val == null || val.toString() == '') {
                                return 'Perhitungan bunga wajib di isi';
                              }
                              perhitungan_bunga = val.toString();
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownSearch(
                            clearButtonProps:
                                const ClearButtonProps(icon: Icon(Icons.close)),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                labelText: "Jenis agunan",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            ),
                            items: _dataAgunan,
                            itemAsString: (item) => item['agunan'],
                            // selectedItem: widget.cutiData[0],
                            onChanged: (value) {
                              jenisagunan = value['id'].toString();
                            },
                            autoValidateMode: AutovalidateMode.always,
                            validator: (val) {
                              if (val == null || val.toString() == '') {
                                return 'Jenis agunan wajib di isi';
                              }

                              return null;
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
                                child: FormBuilderTextField(
                                  name: 'nama',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: nama,
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
                                    nama = val.toString();
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'alias',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: alias,
                                  decoration: InputDecoration(
                                    labelText: "Alias",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Alias wajib di isi';
                                    }
                                    nama = val.toString();
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
                                      labelText: "Jenis Kelamin",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                  ),
                                  items: jenis_kelamin,
                                  itemAsString: (item) => item['select'],
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Jenis Kelamin wajib di isi';
                                    }
                                    jk = val['value'].toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    jk = value['value'].toString();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'tempat_lahir',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: tempat_lahir,
                                  decoration: InputDecoration(
                                    labelText: "Tempat Lahir",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Tempat lahir wajib di isi';
                                    }
                                    tempat_lahir = val.toString();
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'tanggal_lahir',
                                  autovalidateMode: AutovalidateMode.always,
                                  controller: TextEditingController(
                                      text: selectedDate
                                          .toLocal()
                                          .toString()
                                          .split(' ')[0]),
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: "Tanggal Lahir",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.calendar_today),
                                      onPressed: () async {
                                        final DateTime? picked =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: selectedDate,
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2101),
                                        );
                                        if (picked != null &&
                                            picked != selectedDate)
                                          setState(() {
                                            selectedDate = picked;
                                            _dateController.text =
                                                "${picked.toLocal()}"
                                                    .split(' ')[0];
                                          });
                                      },
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Tanggal lahir wajib di isi';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'usia',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.number,
                                  initialValue: usia,
                                  decoration: InputDecoration(
                                    labelText: "Usia",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Usia wajib di isi';
                                    }
                                    usia = val.toString();
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
                                child: DropdownSearch(
                                  autoValidateMode: AutovalidateMode.always,
                                  clearButtonProps: const ClearButtonProps(
                                      icon: Icon(Icons.close)),
                                  selectedItem: _selectedIzin(),
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "Status Kenegaraan",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                  ),
                                  items: status_kenegaraan,
                                  itemAsString: (item) => item['select'],
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Status kenegaraan wajib di isi';
                                    }
                                    sk = val['value'].toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    sk = value['value'].toString();
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
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'tempat_tinggal_tetap',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: tempat_tinggal_tetap,
                                  decoration: InputDecoration(
                                    labelText: "Tempat Tinggal Tetap",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Tempat tinggal tetap wajib di isi';
                                    }
                                    tempat_tinggal_tetap = val.toString();
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
                                child: FormBuilderTextField(
                                  name: 'lama_tinggal',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.number,
                                  initialValue: lama_tinggal,
                                  decoration: InputDecoration(
                                    labelText: "Lama Tinggal",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Lama tinggal wajib di isi';
                                    }
                                    lama_tinggal = val.toString();
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
                                      labelText: "Status Tempat",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                  ),
                                  items: status_tempat,
                                  itemAsString: (item) => item['select'],
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Status tempat wajib di isi';
                                    }
                                    stt_tempat = val['value'].toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    stt_tempat = value['value'].toString();
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
                                      labelText: "Gelar",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                  ),
                                  items: gelar,
                                  itemAsString: (item) => item['select'],
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Gelar wajib di isi';
                                    }
                                    glr = val['value'].toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    glr = value['value'].toString();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'pekerjaan',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: pekerjaan,
                                  decoration: InputDecoration(
                                    labelText: "Pekerjaan",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Pekerjaan wajib di isi';
                                    }
                                    pekerjaan = val.toString();
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
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'jenis_usaha',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: jenis_usaha,
                                  decoration: InputDecoration(
                                    labelText: "Jenis Usaha",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Jenis usaha wajib di isi';
                                    }
                                    jenis_usaha = val.toString();
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'sektor_usaha',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: sektor_usaha,
                                  decoration: InputDecoration(
                                    labelText: "Sektor Usaha",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Sektor Usaha wajib di isi';
                                    }
                                    sektor_usaha = val.toString();
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: FormBuilderTextField(
                                  name: 'alamat_usaha',
                                  autovalidateMode: AutovalidateMode.always,
                                  maxLines: 4,
                                  keyboardType: TextInputType.multiline,
                                  initialValue: alamat_usaha,
                                  decoration: InputDecoration(
                                    labelText: "Alamat Usaha",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Alamat usaha wajib di isi';
                                    }
                                    alamat_usaha = val.toString();
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
                                      labelText: "Tujuan Penggunaan",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                  ),
                                  items: tujuan_penggunaan,
                                  itemAsString: (item) => item['select'],
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Tujuan penggunaan wajib di isi';
                                    }
                                    tp = val['value'].toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    tp = value['value'].toString();
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
                                      labelText:
                                          "Pembayaran Kembali/Pelunasan Secara",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                  ),
                                  items: pembayaran_kembali,
                                  itemAsString: (item) => item['select'],
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Pelunasan wajib di isi';
                                    }
                                    pk = val['value'].toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    pk = value['value'].toString();
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
                            'Data Suami/Istri',
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
                                child: FormBuilderTextField(
                                  name: 'nama',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: nama_suami,
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
                                    nama_suami = val.toString();
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'tempat_lahir',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: tempatlahir_suami,
                                  decoration: InputDecoration(
                                    labelText: "Tempat Lahir",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Tempat lahir wajib di isi';
                                    }
                                    tempatlahir_suami = val.toString();
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'tanggal_lahir',
                                  autovalidateMode: AutovalidateMode.always,
                                  controller: TextEditingController(
                                      text: selectedDate
                                          .toLocal()
                                          .toString()
                                          .split(' ')[0]),
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: "Tanggal Lahir",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.calendar_today),
                                      onPressed: () async {
                                        final DateTime? picked =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: selectedDate,
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2101),
                                        );
                                        if (picked != null &&
                                            picked != selectedDate)
                                          setState(() {
                                            selectedDate = picked;
                                            _dateController.text =
                                                "${picked.toLocal()}"
                                                    .split(' ')[0];
                                          });
                                      },
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Tanggal lahir wajib di isi';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'pekerjaan_suami',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: pekerjaan_suami,
                                  decoration: InputDecoration(
                                    labelText: "Pekerjaan Suami/Istri",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Pekerjaan Suami/Istri wajib di isi';
                                    }
                                    pekerjaan_suami = val.toString();
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'tanggal_lahir',
                                  autovalidateMode: AutovalidateMode.always,
                                  controller: TextEditingController(
                                      text: selectedDate
                                          .toLocal()
                                          .toString()
                                          .split(' ')[0]),
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    labelText: "Mulai Usaha",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.calendar_today),
                                      onPressed: () async {
                                        final DateTime? picked =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: selectedDate,
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2101),
                                        );
                                        if (picked != null &&
                                            picked != selectedDate)
                                          setState(() {
                                            selectedDate = picked;
                                            _dateController.text =
                                                "${picked.toLocal()}"
                                                    .split(' ')[0];
                                          });
                                      },
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Mulai usaha wajib di isi';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'jenis_usaha',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: jenis_usaha,
                                  decoration: InputDecoration(
                                    labelText: "Jenis Usaha",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Jenis usaha wajib di isi';
                                    }
                                    jenis_usaha = val.toString();
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
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'sektor_usaha',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.text,
                                  initialValue: sektor_usaha,
                                  decoration: InputDecoration(
                                    labelText: "Sektor Usaha",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Sektor usaha wajib di isi';
                                    }
                                    sektor_usaha = val.toString();
                                    return null;
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
                                  name: 'no_hp',
                                  autovalidateMode: AutovalidateMode.always,
                                  keyboardType: TextInputType.number,
                                  initialValue: nohp,
                                  decoration: InputDecoration(
                                    labelText: "Nomor Handphone",
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
                                padding: const EdgeInsets.all(15),
                                child: FormBuilderTextField(
                                  name: 'alamat',
                                  autovalidateMode: AutovalidateMode.always,
                                  maxLines: 4,
                                  keyboardType: TextInputType.multiline,
                                  initialValue: alamat_suami,
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
                                    alamat_suami = val.toString();
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
                            'Data Penghasilan',
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
                                child: FormBuilderTextField(
                                  name: 'penghasilan_bersih',
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
                                  initialValue: penghasilan_bersih,
                                  decoration: InputDecoration(
                                    labelText: "Penghasilan Bersih",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Penghasilan bersih wajib di isi';
                                    }
                                    penghasilan_bersih = val.toString();
                                    return null;
                                    // return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'biaya_rt',
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
                                  initialValue: biaya_rumahtangga,
                                  decoration: InputDecoration(
                                    labelText: "Biaya Rumah Tangga",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Biaya rumah tangga wajib di isi';
                                    }
                                    biaya_rumahtangga = val.toString();
                                    return null;
                                    // return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'penghasilan_suami',
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
                                  initialValue: penghasilan_suami,
                                  decoration: InputDecoration(
                                    labelText: "Penghasilan Suami/Istri",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Penghasilan suami wajib di isi';
                                    }
                                    penghasilan_suami = val.toString();
                                    return null;
                                    // return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'angsuran_pinjaman',
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
                                  initialValue: angsuran_pinjaman,
                                  decoration: InputDecoration(
                                    labelText: "Angsuran Pinjaman Bulan/Tahun",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Angsuran pinjaman wajib di isi';
                                    }
                                    angsuran_pinjaman = val.toString();
                                    return null;
                                    // return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'penghasilan_tambahan',
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
                                  initialValue: penghasilan_tambahan,
                                  decoration: InputDecoration(
                                    labelText:
                                        "Penghasilan Tambahan (Jika ada)",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    penghasilan_tambahan = val.toString();
                                    return null;
                                  },
                                  onChanged: (value) {
                                    penghasilan_tambahan = value.toString();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: 'angsuran_pinjaman',
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
                                  initialValue: sisa_penghasilan,
                                  decoration: InputDecoration(
                                    labelText: "Sisa Penghasilan",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.toString() == '') {
                                      return 'Sisa penghasilan wajib di isi';
                                    }
                                    sisa_penghasilan = val.toString();
                                    return null;
                                    // return null;
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


                                // CheckboxListTile(
                                //   title: Text(
                                //     'Syarat & Ketentuan Berlaku',
                                //     style: TextStyle(fontSize: 12.0),
                                //   ),
                                //   value: isTermsAccepted,
                                //   onChanged: (value) {
                                //     setState(() {
                                //       isTermsAccepted = value;
                                //     });
                                //   },
                                //   controlAffinity: ListTileControlAffinity
                                //       .leading,
                                // ),
                              