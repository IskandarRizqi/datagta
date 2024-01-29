import 'package:equatable/equatable.dart';

class lelang extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final String harga;
  final String description;
  final String lokasi;

  lelang({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.harga,
    required this.description,
    required this.lokasi,
  });

  static List<lelang> lelangs = [
    lelang(
        id: '1',
        title: '12 bidang tanah dengan total luas 68117 m2',
        imageUrl:
            'https://res.cloudinary.com/dvvbceigh/image/upload/v1695363413/Rectangle_125_d6eu7u.png',
        harga: 'Rp 12.000.000',
        description: 'Tabungan Masal adalah tabungan',
        lokasi: 'Kota Tanggerang'),
    lelang(
        id: '2',
        title: ' 12 bidang tanah dengan total luas 68117 m2',
        harga: 'Rp 12.000.000',
        imageUrl:
            'https://res.cloudinary.com/dvvbceigh/image/upload/v1695363377/Rectangle_125_5_emmrld.png',
        description: '',
        lokasi: 'Kota Tanggerang'),
    lelang(
        id: '3',
        title: '12 bidang tanah dengan total luas 68117 m2',
        harga: 'Rp 12.000.000',
        imageUrl:
            'https://res.cloudinary.com/dvvbceigh/image/upload/v1695363338/Rectangle_125_5_fgabvv.png',
        description: '',
        lokasi: 'Kota Tanggerang'),
    lelang(
        id: '4',
        title: '12 bidang tanah dengan total luas 68117 m2',
        harga: 'Rp 12.000.000',
        imageUrl:
            'https://res.cloudinary.com/dvvbceigh/image/upload/v1695363312/Rectangle_125_3_bey3jn.png',
        description: '',
        lokasi: 'Kota Tanggerang'),
    lelang(
        id: '5',
        title: '12 bidang tanah dengan total luas 68117 m2',
        harga: 'Rp 12.000.000',
        imageUrl:
            'https://res.cloudinary.com/dvvbceigh/image/upload/v1695363296/Rectangle_125_2_nkme7u.png',
        description: '',
        lokasi: 'Kota Tanggerang'),
    lelang(
        id: '6',
        title: '12 bidang tanah dengan total luas 68117 m2',
        harga: 'Rp 12.000.000',
        imageUrl:
            'https://res.cloudinary.com/dvvbceigh/image/upload/v1695363283/Rectangle_125_1_ffd2bu.png',
        description: '',
        lokasi: 'Kota Tanggerang'),
  ];

  @override
  List<Object?> get props => [id, title, imageUrl];
}
