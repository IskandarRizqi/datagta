import 'package:apm/components/footer.dart';
import 'package:apm/components/footernew.dart';
import 'package:apm/components/header.dart';
import 'package:apm/components/menu.dart';
import 'package:apm/model/umkmkendaraanmodel.dart';
import 'package:apm/model/umkmsembakomodel.dart';
import 'package:apm/screens/detailumkmkendaraan.dart';
import 'package:apm/screens/detailumkmsembako.dart';
import 'package:apm/screens/produkdeposito.dart';
import 'package:apm/screens/produkkredit.dart';
import 'package:apm/screens/produktabungan.dart';
import 'package:apm/screens/umkm.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// Ganti dengan path yang sesuai

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.prevPage});
  final String prevPage;

  static const routeName = '/dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final int maxItemsToShow = 3;
  // int _selectedIndex = 0;
  // Move this variable here

  void _onItemTapped(int index) {}

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   // title: const Text('Home'),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 350,
                child: Stack(children: [
                  Positioned(child: header()),
                  Positioned(
                    top: 150,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: screenWidth * 0.7,
                      child: MenuComponent(),
                    ),
                  ),
                ])),
            CarouselSlider.builder(
              itemCount: [
                'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694068825/Frame_4_mbfomx.png',
                'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694075354/Rectangle_156_knbzic.png',
                'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694075381/Rectangle_157_gbil7o.png',
              ].length,
              itemBuilder: (context, index, id) {
                final imageUrl = [
                  'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694068825/Frame_4_mbfomx.png',
                  'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694075354/Rectangle_156_knbzic.png',
                  'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694075381/Rectangle_157_gbil7o.png',
                ][index];

                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    );
                  },
                );
              },
              options: CarouselOptions(
                enableInfiniteScroll: false,
                enlargeCenterPage: false,
                viewportFraction: 1,
              ),
            ),

            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 320,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: (MediaQuery.of(context).size.width) / 2,
                    child: ImageCard(),
                  ),
                  Positioned(
                    top: 15,
                    left: (MediaQuery.of(context).size.width) / 4,
                    right: 0,
                    child: ImageSlider(),
                  ),
                ],
              ),
            ),
            // sekilas(),
            titleproduct(),
            cardproduk(),
            produkumkm(),
            // umkmWidget(),
            SizedBox(height: 16.0),
            // Jarak antara dua baris

            footer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Ganti nomor telepon dengan nomor yang ingin Anda tuju di WhatsApp
          String phoneNumber = '087749943992';

          // Buat URL untuk membuka WhatsApp
          String url = 'https://wa.me/$phoneNumber';

          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Tidak bisa membuka WhatsApp.';
          }
        },
        backgroundColor: Colors.green.shade800,
        child: Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
      ),
      bottomNavigationBar:
          FooterNewWidget(currentMenu: 'home', prevMenu: widget.prevPage),
    );
  }

  Widget _buildCircularCard(String imageUrl) {
    return SingleChildScrollView(
      child: Container(
        width: 50.0, // Sesuaikan dengan ukuran yang Anda inginkan
        height: 50.0, // Sesuaikan dengan ukuran yang Anda inginkan
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF00923F), // Warna latar belakang biru
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                imageUrl,
                width:
                    20.0, // Sesuaikan dengan ukuran gambar yang Anda inginkan
                height:
                    20.0, // Sesuaikan dengan ukuran gambar yang Anda inginkan
              ),
              SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildslider(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: const SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text('Filled Card')),
        ),
      ),
    );
  }

  titleproduct() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0, // Atur padding bagian atas
                  right: 20.0, // Atur padding bagian kanan
                  bottom: 0.0, // Atur padding bagian bawah
                  left: 20.0, // Atur padding bagian kiri
                ),
                child: Text(
                  'Produk',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  cardproduk() {
    return Card(
      margin: EdgeInsets.all(16.0),
      color: Color(0xFFFFFFFF),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, // Mengatur jarak antara gambar
          children: [
            _buildImage(
                'https://res.cloudinary.com/dvvbceigh/image/upload/v1697515889/Rectangle_505_dl6qsx.png',
                'Tabungan',
                1),
            _buildImage(
                'https://res.cloudinary.com/dvvbceigh/image/upload/v1697515889/Rectangle_504_wickfj.png',
                'Kredit',
                2),
            _buildImage(
                'https://res.cloudinary.com/dvvbceigh/image/upload/v1697515889/Rectangle_506_dyjf2f.png',
                'Deposito',
                3),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String imageUrl, String productName, int id) {
    return InkWell(
      onTap: () {
        // Tambahkan logika navigasi sesuai dengan id atau produk yang sesuai
        if (id == 1) {
          // Navigasi ke halaman Tabungan
          Get.to(() => const produkTabungan());
        } else if (id == 2) {
          // Navigasi ke halaman Kredit
          Get.to(() => const produkKredit());
        } else if (id == 3) {
          // Navigasi ke halaman Deposito
          Get.to(() => const produkDeposito());
        }
      },
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            width: 90.0,
            height: 90.0,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(height: 8.0),
          Text(
            productName, // Nama produk sesuai dengan parameter
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget produkumkm() {
    return Container(
      color: Color(0xFFFFFFFF),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0, // Atur padding bagian atas
                  right: 10.0, // Atur padding bagian kanan
                  bottom: 0.0, // Atur padding bagian bawah
                  left: 16.0, // Atur padding bagian kiri
                ),
                child: Text(
                  'Produk UMKM Unggulan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
              // Memberi jarak antara teks dan tautan
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, // Atur padding bagian atas
                    right: 0.0, // Atur padding bagian kanan
                    bottom: 0.0, // Atur padding bagian bawah
                    left: 0.0 // Atur padding bagian kiri
                    ),
                child: InkWell(
                  onTap: () {
                    Get.to(() => umkmPage());
                  },
                  child: Text(
                    'Selengkapnya >',
                    style: TextStyle(
                      color: Color(0xFF2F318B),
                      fontSize: 12,
                      // Ubah warna tautan sesuai kebutuhan Anda
                    ),
                  ),
                ),
              ),
            ],
          ),
          umkmWidget(), // Menambahkan widget _buildSliderSembako dan _buildSliderKendaraan
        ],
      ),
    );
  }

  umkmWidget() {
    return Container(
      child: Column(
        children: [
          _buildSliderSembako(
              "Sembako", UmkmSembako.umkmsembakos.take(3).toList()),
          _buildSliderKendaraan(
              "Kendaraan", UmkmKendaraan.umkmkendaraans.take(3).toList()),
        ],
      ),
    );
  }

  Widget _buildSliderSembako(String title, List<UmkmSembako> umkmsembakos) {
    return Column(
      children: [
        Container(
          height: 200.0, // Tetapkan tinggi maksimal di sini
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(), // Ini akan mencegah scroll
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Jumlah kolom yang diinginkan
              childAspectRatio: 0.7, // Ratio aspek item grid
            ),
            itemCount: umkmsembakos.length > maxItemsToShow
                ? maxItemsToShow
                : umkmsembakos.length,
            itemBuilder: (BuildContext context, int index) {
              final umkmsembako = UmkmSembako.umkmsembakos[index];
              return GestureDetector(
                onTap: () {
                  // Navigasi ke halaman detail dengan indeks yang sesuai
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>
                          DetailUmkmSembako(umkmsembakos: umkmsembako),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: _buildProductCard(
                    umkmsembako.imageUrl,
                    umkmsembako.title,
                    umkmsembako.description,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSliderKendaraan(
      String title, List<UmkmKendaraan> umkmkendaraans) {
    return Column(
      children: [
        Container(
          height: 200.0, // Tetapkan tinggi maksimal di sini
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(), // Ini akan mencegah scroll
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Jumlah kolom yang diinginkan
              childAspectRatio: 0.7, // Ratio aspek item grid
            ),
            itemCount: umkmkendaraans.length > maxItemsToShow
                ? maxItemsToShow
                : umkmkendaraans.length,
            itemBuilder: (BuildContext context, int index) {
              final umkmkendaraan = UmkmKendaraan.umkmkendaraans[index];
              return GestureDetector(
                onTap: () {
                  // Navigasi ke halaman detail dengan indeks yang sesuai
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>
                          DetailUmkmKendaraan(umkmkendaraans: umkmkendaraan),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: _buildProductCard(umkmkendaraan.imageUrl,
                      umkmkendaraan.title, umkmkendaraan.description),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(String imageUrl, String title, String description) {
    return Container(
      width: 140.0,
      height: 300.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              width: double.infinity, // Isi seluruh lebar kartu
              height: 70.0, // Sesuaikan tinggi gambar sesuai kebutuhan
              fit: BoxFit.cover, // Mengisi kartu dengan gambar
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 0.0),
          ],
        ),
      ),
    );
  }

  sekilas() {
    return Container(
      width: double.infinity,
      height: 900.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://res.cloudinary.com/dk55ik2ah/image/upload/v1695109484/katherine-gu-2CotQSBTcjI-unsplash_ybzqwa.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Sekilas Tentang\n',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                    text: 'PT. BPR Artha Puspa Mega\n\n',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 21.0,
                        color: Colors.white)),
                TextSpan(
                    text:
                        'Bank APM (PT. BPR Arthapuspa Mega) adalah sebuah lembaga jasa keuangan yang bergerak di bidang Bank Perkreditan Rakyat. Berdiri tahun 1994 dengan Kantor Pusat yang beralamat di Jl. Raya Selatan No. 21 Adiwerna - Tegal 52194 (0283) 443237 dan 3 kantor kas yang beralamat di Jl. Raya Tuwel No.7 Bojong - Tegal Telp. 08156670555 - Jl. Garuda No. 143 Bumiharja - Tegal Telp. 02854439404 - Jl. Raya Selapura No. 9 Dukuhwaru - Tegal Telp, (0283) 4513411\n\n\n',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        color: Colors.white)),
                TextSpan(
                  text: 'Visi & Misi\n',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                    text: 'Visi\n',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 21.0,
                        color: Colors.white)),
                TextSpan(
                    text:
                        'Menjadi Bank yang sehat, terdepan dan membanggakan, melayani Masyarakat Umum dan UMKM di Tegal dan sekitarnya\n',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        color: Colors.white)),
                TextSpan(
                    text: 'Misi\n',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 21.0,
                        color: Colors.white)),
                TextSpan(
                    text:
                        '1. Memberikan solusi yang tepat masa keuangan bagi Masyarakat Umum dan modal kerja bagi UMKM.\n'
                        '2. Memberikan pelayanan yang terbaik kepada Nasabah.\n'
                        '3. Menjadi tempat yang aman dan menarik untuk berinvestasi.\n'
                        '4. Menciptakan nilai tambah bagi Pemegang Saham\n'
                        '5. Menjadi tempat bagi karyawan untuk pengembangan karis dan peningkatan kesejahteraan.\n',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        color: Colors.white))
              ]),
            ),
          )
        ],
      ),
    );
  }
}

class FilledCardExample extends StatelessWidget {
  const FilledCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: const SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text('Filled Card')),
        ),
      ),
    );
  }
}

class ImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String imageUrl1 =
        'https://res.cloudinary.com/dvwsffyzc/image/upload/v1695264072/Frame_5_ygww8i.png';
    String imageUrl2 =
        'https://res.cloudinary.com/dvwsffyzc/image/upload/v1695264072/Frame_5_ygww8i.png';
    String imageUrl3 =
        'https://res.cloudinary.com/dvwsffyzc/image/upload/v1695264072/Frame_5_ygww8i.png';

    return Container(
      margin: EdgeInsets.all(10),
      child: CarouselSlider(
        items: [
          Image.network(imageUrl1),
          Image.network(imageUrl2),
          Image.network(imageUrl3),
        ],
        options: CarouselOptions(
          height: 300,
          viewportFraction: 1.0,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            Image.network(
              'https://res.cloudinary.com/dvvbceigh/image/upload/v1696477490/Frame_3_ykcqrm.png',
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 15,
              left: 15,
              child: Text(
                'Buka \nProduk \nDigital',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
