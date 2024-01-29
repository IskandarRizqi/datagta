import 'package:equatable/equatable.dart';

class UmkmAksesoris extends Equatable {
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

  const UmkmAksesoris({
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

  static List<UmkmAksesoris> umkmaksesoriss = [
    UmkmAksesoris(
        id: '1',
        title: 'Tas Rotan',
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694589311/Rectangle_125_6_hibso9.png',
        imageUrl2:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694589311/Rectangle_125_6_hibso9.png',
        imageUrl3:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694589311/Rectangle_125_6_hibso9.png',
        imageUrl4:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694589311/Rectangle_125_6_hibso9.png',
        description: 'Tas buatan tangan',
        price: 'Rp.20.000',
        condition: 'new',
        minorder: '1 buah',
        location: 'surabaya'),
    UmkmAksesoris(
        id: '2',
        title: 'Tas Rotan',
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694589311/Rectangle_125_6_hibso9.png',
        imageUrl2:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694589311/Rectangle_125_6_hibso9.png',
        imageUrl3:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694589311/Rectangle_125_6_hibso9.png',
        imageUrl4:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694589311/Rectangle_125_6_hibso9.png',
        description: 'Tas buatan tangan',
        price: 'Rp.20.000',
        condition: 'new',
        minorder: '1 buah',
        location: 'surabaya'),
    UmkmAksesoris(
        id: '3',
        title: 'Tas Rotan',
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694589311/Rectangle_125_6_hibso9.png',
        imageUrl2:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694589311/Rectangle_125_6_hibso9.png',
        imageUrl3:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694589311/Rectangle_125_6_hibso9.png',
        imageUrl4:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694589311/Rectangle_125_6_hibso9.png',
        description: 'Tas buatan tangan',
        price: 'Rp.20.000',
        condition: 'new',
        minorder: '1 buah',
        location: 'surabaya'),
    UmkmAksesoris(
        id: '4',
        title: 'Tas Rotan',
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694589311/Rectangle_125_6_hibso9.png',
        imageUrl2:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694589311/Rectangle_125_6_hibso9.png',
        imageUrl3:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694589311/Rectangle_125_6_hibso9.png',
        imageUrl4:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694589311/Rectangle_125_6_hibso9.png',
        description: 'Tas buatan tangan',
        price: 'Rp.20.000',
        condition: 'new',
        minorder: '1 buah',
        location: 'surabaya'),
  ];

  @override
  List<Object?> get props => [id, title, imageUrl];
}
