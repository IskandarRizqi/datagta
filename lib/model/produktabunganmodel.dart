import 'package:equatable/equatable.dart';

class Tabungan extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final double nominalTabungan;
  final String description;

  const Tabungan({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.nominalTabungan,
    required this.description,
  });

  static List<Tabungan> tabungans = [
    Tabungan(
        id: '1',
        title: 'Tabungan Masal',
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694403272/image_1_2_g6n93q.png',
        nominalTabungan: 3.75,
        description:
            'Tabungan Masal adalah tabungan yang diperuntukan bagi masyarakat umum Tegal dan sekitarnya yang ingin mempersiapkan dan berinvestas menyimpan dananya di BPR Arthapuspa Mega secara tidak langsung membantu masyarakat UMKM dilingkungannya dalam hal permodalan\nKetentuan Tabungan Massal\n\nYang berhak menjadi penabung adalah semua lapisan masyarakat, Yayasan dan Lembaga (Bandan Hukum)\n\n• Setoran pertama sekurang kurangnya sebesar Rp 10.000,- dan setoran selanjutnya sekurang-kurangnya Rp.1.000, Penyetoran dan penarikan dapat dilakukan setiap saat pada waktu jam kerja selama kas buka. Perhitungan bunga dilakukan setiap akhir bulan dan bulan yang bersangkutan dan langsung dikreditkan ditambah\n\npada saldo penabung yang tercatat pada pembukuan bank Bunga dihitung atas dasar saldo terendah bulan yang bersangkutan\n\nBesarnya suku bunga ditetapkan oleh Bank Apabila terjadi perubahan suku bunga, maka perubahan tersebut segera\n\ndiberlakukan tanpa pemberitahuan terlebih dahulu kepada penabung Setiap pendapatan bunga akan dikenakan pajak sesuai ketentuan perpajakan yang belaku\n\nSisa tabungan setiap pengambilan minimal Rp 10.000 Rekening yang tidak aktif selama 6 (enam) bulan berturut-turut akan dikenakan biaya administrasi Rp. 1000 setiap\n\nbulan secara otomatis sampai tabungan tersebut ditutup oleh bank tanpa pemberitahuan terlebih dahulu\n\nBiaya penutupan rekening tabungan sebesar Rp 5000\n\nApabila tercatat perbedaan antara saido pada buku tabungan dan saldo yang tercatat pada pembukuan bank, maka\n\nsebagai patokan bank dipergunakan saldo yang tercatat pada pembukuan bank Segala penyalahgunaan dalam\n\nbentuk apapun termasuk akibat hilangnya buku tabungan menjadi tanggung jawab sepenuhnya penabung'),
    Tabungan(
        id: '2',
        title: 'Tabungan SimpPel',
        nominalTabungan: 2,
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694403270/image_2_1_qxuk1l.png',
        description: ''),
    Tabungan(
        id: '3',
        title: 'Tabungan TasPlus',
        nominalTabungan: 5,
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694403267/image_3_1_iqqnko.png',
        description: ''),
    Tabungan(
        id: '4',
        title: 'Tabunganku',
        nominalTabungan: 2,
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694403264/image_5_1_hawubp.png',
        description: ''),
    Tabungan(
        id: '5',
        title: 'Tabungan Hari Raya',
        nominalTabungan: 7,
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694403262/image_4_z8rzzg.png',
        description: ''),
    Tabungan(
        id: '6',
        title: 'Tabungan Anak Sekolah',
        nominalTabungan: 5.5,
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694403259/image_6_kyqx4m.png',
        description: ''),
    Tabungan(
        id: '7',
        title: 'Tabungan Masal',
        nominalTabungan: 1.25,
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694403256/image_8_d1iukv.png',
        description: ''),
    Tabungan(
        id: '8',
        title: 'Tabungan Arrah',
        nominalTabungan: 2.25,
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694403255/image_7_c1p0r5.png',
        description: ''),
  ];

  @override
  List<Object?> get props => [id, title, imageUrl];
}
