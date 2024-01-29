import 'package:apm/components/footer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class profil extends StatefulWidget {
  const profil({super.key});

  static const routeNames = '/profil';
  @override
  State<profil> createState() => _profilState();
}

class _profilState extends State<profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF00923F), // Warna latar belakang AppBar
          title: Text('Profil'), // Judul AppBar
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
        body: SingleChildScrollView(
            child: Container(
          color: Colors.white,
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            ExpansionTile(
              title: Text("Tentang Kami",
                  style: TextStyle(fontWeight: FontWeight.bold)), //header title
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Text(
                      "Bank APM (PT. BPR Arthapuspa Mega) adalah sebuah lembaga jasa keuangan yang bergerak di bidang Bank Perkreditan Rakyat. Berdiri tahun 1994 dengan Kantor Pusat yang beralamat di Jl. Raya Selatan No. 21 Adiwerna - Tegal 52194 (0283) 443237 dan 3 kantor kas yang beralamat di Jl. Raya Tuwel No.7 Bojong - Tegal Telp. 08156670555 - Jl. Garuda No. 143 Bumiharja - Tegal Telp. 02854439404 - Jl. Raya Selapura No. 9 Dukuhwaru - Tegal Telp, (0283) 4513411",
                      style: TextStyle(fontSize: 10, color: Colors.black)),
                )
              ],
              maintainState: false,
            ),
            ExpansionTile(
              title: Text("Struktur Organisasi",
                  style:
                      TextStyle(fontWeight: FontWeight.bold)), // Header title
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694234384/Rectangle_198_ebv7bd.png', // Gantilah URL dengan URL gambar yang sesuai
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    width: double.infinity,
                    height: 200, // Sesuaikan ukuran gambar sesuai kebutuhan
                    fit: BoxFit.cover, // Sesuaikan tampilan gambar
                  ),
                )
              ],
              maintainState: false,
            ),
            ExpansionTile(
              title: Text("Sejarah Organisasi",
                  style:
                      TextStyle(fontWeight: FontWeight.bold)), // Header title
              children: [
                Container(
                  color:
                      Colors.white, // Atur warna latar belakang menjadi putih
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694234868/Rectangle_199_wxd2uf.png',
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        width: 100,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10), // Jarak antara gambar dan teks
                      Expanded(
                        child: Text(
                          "PT. Bank Perkreditan Rakyat ARTHAPUSPA MEGA adalah sebuah profit centre yang bergerak dibidang jasa perbankan dengan kegiatan menghimpun dana masyarakat dalam bentuk tabungan & deposito berjangka dan menyalurkan kembali dalam bentuk kredit.\n Mulai beroperasi tanggal 15 Juli 1994 berdasarkan Surat Ijin Usaha dari Menteri Keuangan RI Nomor Kep-158/KM.07/1994 tanggal 22 Juni 1994.\n ",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 10.0), // Atur margin sesuai kebutuhan
                  child: Text(
                    'Operasional bank di-manage oleh pengelola (pengurus) yang memiliki pengalaman puluhan tahun dibidang usaha bank perkreditan rakyat dan didukung oleh staf yang rata-rata memiliki basic dan pengalaman kerja di bank perkreditan rakyat.',
                    style: TextStyle(fontSize: 10),
                  ),
                )
              ],
              maintainState: false,
            ),
            ExpansionTile(
              title: Text("Susunan Pengurus",
                  style:
                      TextStyle(fontWeight: FontWeight.bold)), // Header title
              children: [
                SizedBox(
                  height: 300, // Atur tinggi maksimum untuk ExpansionTile
                  child: ListView(
                    // Gunakan ListView untuk mengatur tinggi dinamis sesuai konten
                    children: [
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(20),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DIREKTUR UTAMA',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CachedNetworkImage(
                              imageUrl:
                                  'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694236053/dirut_1_v3qx8x.png',
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Data Pribadi\n',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: 'Nama: Drs.H.Dadi Sumarsana,SH.MM.\n'
                                        'Alamat: Jl. Raya Selatan No. 21 Tb Luwung, Adiwerna, Kab. Tegal\n'
                                        'No Hp: -\n'
                                        'Email: dadisumarsana7@gmail.com',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Pendidikan Formal\n',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: '- S1 Adne UT\n'
                                        '- S1 Hukum Perdata UPS\n'
                                        '- S2 MM Unisbank\n\n',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'Pendidikan Khusus\n',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: '- ToT Perlindungan Konsumen\n'
                                        '- ToT APU PPT\n'
                                        '- ToT Management Kepemimpinan\n'
                                        '- ToT Management Tata Kelola\n'
                                        '- Pemegang Sertifikat komptensi Direksi\n'
                                        '- Pemegang Sertifikat kompetensi Pembicara dari Markplus\n\n',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'Jabatan Pekerjaan\n',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        '- Dirut BPR Arthapuspa Mega th 2006 sd sekarang\n'
                                        '- Direktur BPR Arthapuspa Mega th 1998 sd 2006\n\n',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'Kegiatan Profesi\n',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        '- Ketua Perbarindo DPD Jateng th. 2014 sd sekarang\n'
                                        '- Ketua Perbarindo DPK Tegal th. 2010 sd 2014\n'
                                        '- Wakil Ketua DPD Perbarindo Jateng th. 2007 sd 2010\n'
                                        '- Ketua Pembiana Yayasan Perbarindo Sejahtera (Yandara)\n'
                                        '- Wakil Ketua Bidang Organisasi & Kelembagaan Kadin Kab. Tegal\n\n',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'Pengalaman Lain\n',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text:
                                        '- Trainer Sertifikasi Profesi Direksi\n'
                                        '- Trainer Sertifikasi Profesi Komisaris\n'
                                        '- Trainer Sertifikasi Kompetensi PE\n'
                                        '- Trainer Motivasi & Pengembangan Diri\n'
                                        '- Narasumber dan Trainer di bidang Ekonomi, Perbankan dan kepemimpinan\n'
                                        '- Narasumber Seminar dan event lainnya',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'DIREKTUR ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            CachedNetworkImage(
                              imageUrl:
                                  'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694238420/direktur_1_kwfmrz.png',
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                                text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Data Pribadi\n',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      'Mu"minatus Solihah,S.Pd, CRBD, wanita kelahiran Kabupaten Tegal 07 Oktober 1983, bekerja di Bank APM sejak tahun 2001 sebagai kasir dan di tahun 2010 diangkat sebagai kasie keuangan dan pelayanan sampai dengan tahun 2022. Saat ini menjabat sebagai Direktur yang membawahi fungsi kepatuhan.',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black),
                                ),
                              ],
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'DEWAN KOMISARIS TERDIRI DARI: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('KOMISARIS UTAMA ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            CachedNetworkImage(
                              imageUrl:
                                  'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694396015/komut_1_qwsakn.png',
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                                text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Mastika, SE,',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      ' lahir di Denpasar, tanggal 4 juli 1963. Tahun 1987 lulus Sarjana Ekonomi Perusahaan dari Universitas Widya Gama – Malang. Tahun 1988 - 1989 bekerja di PT. Rejeki Cipta Makmur sebagai Account Executive. Tahun 1990 – 1993 bekerja di PT. BPR Pondok Gede sebagai Kepala Bagian Kredit da Marketing. Tahun 1994 – 2006 bekerja di PT. BPR Arthapuspa Mega sebagai Direktur Utama dan tahun 2006 sampai 2021 sebagai Direktur dan sejak 2021 sampai sekarang sebagai Komisaris Utama sekaligus Pemegang Saham PT. BPR Arthapuspa Mega.',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black),
                                ),
                              ],
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            Text('KOMISARIS UTAMA ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Image.network(
                                'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694396296/anggota_1_hf2jzj.png'),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                                text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Data Pribadi\n',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: ' Nama: Drs. Cipto Budi Prayitno\n'
                                      ' Alamat: Jl. Raya Selatan No. 21 Tb Luwung Adierna, Kab. Tegal\n'
                                      ' No HP: -\n'
                                      ' Email: -\n\n',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'Pendidikan Formal\n',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      '- Perguruan Tinggi (S1) fisip. Untag Semarang\n\n',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'Pendidikan Khusus\n',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      '- Pelatihan sertifikasi profesional direktur BPR wilayah Jateng\n'
                                      '- Pelatihan budaya kerja dan prestasi kerja\n'
                                      '- Workshop Service Excellent\n'
                                      '- Program anti pencucian uang dan pencegahan pendanaan terorisma bagi BPR\n'
                                      '- Pengawasan,pengendalian,dan audit investigasi terhadap fraud\n'
                                      '- Pelatihan teknik pemasaran yang efektif untuk BPR\n'
                                      '- Pelatihan two days training Excellent Colleetion & Settlement Credit Management be Profitable\n\n',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'Jabatan Pekerjaan\n',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      '- Kepala bagian pemasaran Bank Pasar Brebes 1995-1999\n'
                                      '- Direktur utama BPR Puspa Kencana 2005-2013\n'
                                      '- Ka.Su bag dana BPR Puspa Kencana 2018-2019\n'
                                      '- Kepala bagian umum BPR. Bank Brebes 2019-2020\n\n',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              maintainState: false,
            ),
            ExpansionTile(
              title: Text(
                "Visi & Misi",
                style: TextStyle(fontWeight: FontWeight.bold),
              ), //header title
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'VISI\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                'Menjadi Bank yang sehat, terdepan dan membanggakan, melayani Masyarakat Umum dan UMKM di Tegal dan sekitarnya\n\n',
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                          TextSpan(
                            text: 'MISI\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                '1. Memberikan solusi yang tepat masa keuangan bagi Masyarakat Umum dan modal kerja bagi UMKM.\n'
                                '2. Memberikan pelayanan yang terbaik kepada Nasabah\n'
                                '3. Menjadi tempat yang aman dan menarik untuk berinvestasi.\n'
                                '4. Menciptakan nilai tambah bagi Pemegang Saham\n'
                                '5. Menjadi tempat bagi karyawan untuk pengembangan karis dan peningkatan kesejahteraan.\n\n',
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                          TextSpan(
                            text: 'TUJUAN\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                '1. Dikelola oleh pribadi-pribadi yang sehat, dengan cara yaang sehat dan konsisten dengan tujuan menjadi Bank yang sehat.\n'
                                '2. Terdepan dalam pelayanan.\n'
                                '3. Menjadi Bank yang membanggakan bagi Stakeholder.\n'
                                '4. Menjadi Bank pilihan Masyarakat Umum dan UMKM di Tegal dan sekitarnya\n\n',
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                          TextSpan(
                            text: 'MOTO\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                'Seluruh Insan Bank Arthapuspa Mega memegang teguh dan berkomitmen selalu melayani lebih baik\n\n',
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        ],
                      )),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: footer(),
            ),
          ]),
        )));
  }
}
