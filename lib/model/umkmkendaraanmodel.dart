import 'package:equatable/equatable.dart';

class UmkmKendaraan extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final String imageUrl2;
  final String imageUrl3;
  final String imageUrl4;
  final String description;
  final String price;
  final String condition;
  final String minorder;
  final String location;

  const UmkmKendaraan({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.imageUrl2,
    required this.imageUrl3,
    required this.imageUrl4,
    required this.description,
    required this.price,
    required this.condition,
    required this.minorder,
    required this.location,
  });

  static List<UmkmKendaraan> umkmkendaraans = [
    UmkmKendaraan(
        id: '1',
        title: 'Motor shogun',
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694140948/Rectangle_125_5_vdwwj4.png',
        imageUrl2:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694140948/Rectangle_125_5_vdwwj4.png',
        imageUrl3:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694140948/Rectangle_125_5_vdwwj4.png',
        imageUrl4:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694140948/Rectangle_125_5_vdwwj4.png',
        description: 'Rp. 460.000/bulan',
        price: 'Rp.20.000',
        condition: 'new',
        minorder: '1 buah',
        location: 'surabaya'),
    UmkmKendaraan(
        id: '2',
        title: 'Jagung',
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694140948/Rectangle_125_5_vdwwj4.png',
        imageUrl2:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694140948/Rectangle_125_5_vdwwj4.png',
        imageUrl3:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694140948/Rectangle_125_5_vdwwj4.png',
        imageUrl4:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694140948/Rectangle_125_5_vdwwj4.png',
        description: 'Rp. 460.000/bulan',
        price: 'Rp.20.000',
        condition: 'new',
        minorder: '1 buah',
        location: 'surabaya'),
    UmkmKendaraan(
        id: '3',
        title: 'Jagung',
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694140948/Rectangle_125_5_vdwwj4.png',
        imageUrl2:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694140948/Rectangle_125_5_vdwwj4.png',
        imageUrl3:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694140948/Rectangle_125_5_vdwwj4.png',
        imageUrl4:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694140948/Rectangle_125_5_vdwwj4.png',
        description: 'Rp. 460.000/bulan',
        price: 'Rp.20.000',
        condition: 'new',
        minorder: '1 buah',
        location: 'surabaya'),
    UmkmKendaraan(
        id: '4',
        title: 'Jagung',
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694140948/Rectangle_125_5_vdwwj4.png',
        imageUrl2:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694140948/Rectangle_125_5_vdwwj4.png',
        imageUrl3:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694140948/Rectangle_125_5_vdwwj4.png',
        imageUrl4:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694140948/Rectangle_125_5_vdwwj4.png',
        description: 'Rp. 460.000/bulan',
        price: 'Rp.20.000',
        condition: 'new',
        minorder: '1 buah',
        location: 'surabaya'),
  ];

  @override
  List<Object?> get props => [id, title, imageUrl];
}
