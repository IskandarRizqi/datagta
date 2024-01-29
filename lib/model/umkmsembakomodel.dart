import 'package:equatable/equatable.dart';

class UmkmSembako extends Equatable {
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

  const UmkmSembako({
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

  static List<UmkmSembako> umkmsembakos = [
    UmkmSembako(
        id: '1',
        title: 'Jagung',
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694137573/Rectangle_125_2_b44uel.png',
        imageUrl2:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694673441/Rectangle_447_wf6udq.png',
        imageUrl3:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694673441/Rectangle_445_qf7oy3.png',
        imageUrl4:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694673441/Rectangle_444_jvfbvi.png',
        description: 'Sembako, Telur ayam kampung asli dari peternakan sendiri',
        price: 'Rp.20.000',
        condition: 'new',
        minorder: '1 Kilogram',
        location: 'surabaya'),
    UmkmSembako(
        id: '2',
        title: 'pisang',
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694137573/Rectangle_125_2_b44uel.png',
        imageUrl2:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694673441/Rectangle_447_wf6udq.png',
        imageUrl3:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694673441/Rectangle_445_qf7oy3.png',
        imageUrl4:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694673441/Rectangle_444_jvfbvi.png',
        description: 'Sembako, Telur ayam kampung asli dari peternakan sendiri',
        price: 'Rp.20.000',
        condition: 'new',
        minorder: '1 Kilogram',
        location: 'surabaya'),
    UmkmSembako(
        id: '3',
        title: 'Beras',
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694137573/Rectangle_125_2_b44uel.png',
        imageUrl2:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694673441/Rectangle_447_wf6udq.png',
        imageUrl3:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694673441/Rectangle_445_qf7oy3.png',
        imageUrl4:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694673441/Rectangle_444_jvfbvi.png',
        description: 'Sembako, Telur ayam kampung asli dari peternakan sendiri',
        price: 'Rp.20.000',
        condition: 'new',
        minorder: '1 Kilogram',
        location: 'surabaya'),
    UmkmSembako(
        id: '4',
        title: 'Ubi',
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694137573/Rectangle_125_2_b44uel.png',
        imageUrl2:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694673441/Rectangle_447_wf6udq.png',
        imageUrl3:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694673441/Rectangle_445_qf7oy3.png',
        imageUrl4:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694673441/Rectangle_444_jvfbvi.png',
        description: 'Sembako, Telur ayam kampung asli dari peternakan sendiri',
        price: 'Rp.20.000',
        condition: 'new',
        minorder: '1 Kilogram',
        location: 'surabaya'),
    UmkmSembako(
        id: '5',
        title: 'Ubi',
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694137573/Rectangle_125_2_b44uel.png',
        imageUrl2:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694673441/Rectangle_447_wf6udq.png',
        imageUrl3:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694673441/Rectangle_445_qf7oy3.png',
        imageUrl4:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694673441/Rectangle_444_jvfbvi.png',
        description: 'Sembako, Telur ayam kampung asli dari peternakan sendiri',
        price: 'Rp.20.000',
        condition: 'new',
        minorder: '1 Kilogram',
        location: 'surabaya'),
  ];

  @override
  List<Object?> get props => [id, title, imageUrl, description];
}
