import 'package:equatable/equatable.dart';

class Karir extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String text;
  final String alamat;
  final List<String> tag;
  final String imageUrl;
  final String createdAt;

  Karir({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.text,
    required this.tag,
    required this.alamat,
    required this.imageUrl,
    required this.createdAt,
  });

  static List<Karir> karir = [
    Karir(
      id: '1',
      title: 'Internal Auditor',
      subtitle: 'PT DJARUM',
      text: 'PT jarum',
      tag: ['Minimal D3', 'Accounting', 'Full TIme'],
      alamat: 'Kota Kudus , jawa tengah Indonesia',
      imageUrl:
          'https://res.cloudinary.com/dk55ik2ah/image/upload/v1695363085/Office_taitwi.png',
      createdAt: '2023-09-01',
    ),
    Karir(
      id: '2',
      title: 'Internal Auditor',
      subtitle: 'PT DJARUM',
      text: 'PT jarum',
      tag: ['Minimal D3', 'Accounting', 'Full TIme'],
      alamat: 'Kota Kudus , jawa tengah Indonesia',
      imageUrl:
          'https://res.cloudinary.com/dvwsffyzc/image/upload/v1683041890/samples/people/jazz.jpg',
      createdAt: '2023-09-01',
    ),
    Karir(
      id: '3',
      title: 'Internal Auditor',
      subtitle: 'PT DJARUM',
      text: 'PT jarum',
      tag: ['Minimal D3', 'Accounting', 'Full TIme'],
      alamat: 'Kota Kudus , jawa tengah Indonesia',
      imageUrl:
          'https://res.cloudinary.com/dvwsffyzc/image/upload/v1683041890/samples/people/jazz.jpg',
      createdAt: '2023-09-01',
    ),
    Karir(
      id: '4',
      title: 'Internal Auditor',
      subtitle: 'PT DJARUM',
      text: 'PT jarum',
      tag: ['Minimal D3', 'Accounting', 'Full TIme'],
      alamat: 'Kota Kudus , jawa tengah Indonesia',
      imageUrl:
          'https://res.cloudinary.com/dvwsffyzc/image/upload/v1683041890/samples/people/jazz.jpg',
      createdAt: '2023-09-01',
    ),
  ];

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        text,
        tag,
        alamat,
        imageUrl,
        createdAt,
      ];
}
