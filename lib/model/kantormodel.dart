import 'package:equatable/equatable.dart';

class Kantor extends Equatable {
  final String id;
  final String title;
  final String alamat;
  final String createdAt;

  const Kantor(
      {required this.id,
      required this.title,
      required this.alamat,
      required this.createdAt});

  static List<Kantor> kantor = [
    Kantor(
      id: '1',
      title:
          'Kantor Pusat',
      alamat:
          'Jl. Soekarno Hatta, RT.7/RW.7, Tlogosari Kulon, Kec. Pedurungan, Kota Semarang, Jawa Tengah 50196',
      createdAt: '1 September 2023'
    ),
    Kantor(
      id: '2',
      title:
          'Kantor Cabang Candiroto',
      alamat:
          'Tlogosari Kulon, Kec. Pedurungan, Kota Semarang, Jawa Tengah 50196',
      createdAt: '1 September 2023',
    ),
    Kantor(
      id: '3',
      title:
          'Kantor Cabang Jumo',
      alamat:
          'Jl. Tlogosari Raya II Ruko Tlogosari No.46, Tlogosari Kulon, Kec. Pedurungan, Kota Semarang, Jawa Tengah 50196',
      createdAt: '1 September 2023',
    ),
    Kantor(
      id: '4',
      title: 'Kantor Cabang Cangkiran',
      alamat:
          '2F87+85J, Jl. Udan Riris III, Tlogosari Kulon, Kec. Pedurungan, Kota Semarang, Jawa Tengah 50196',
      createdAt:'1 September 2023',
    ),
    Kantor(
      id: '5',
      title:
          'Kantor Cabang Semarang',
      alamat:
          'Jl. Soekarno Hatta No.282, Kalicari, Kec. Pedurungan, Kota Semarang, Jawa Tengah 50198',
      createdAt: '1 September 2023',
    ),
    Kantor(
      id: '6',
      title:
          'Kantor Cabang Ngaliyan',
      alamat:
          'Gumaya Tower Hotel, Jl. Gajahmada No.59-61, Kembangsari, Kota Semarang, Jawa Tengah 50134',
      createdAt: '1 September 2023',
    ),
    Kantor(
      id: '7',
      title:
          'Kantor Tawangmangu',
      alamat:
          'Jl. Pemuda No.118, Sekayu, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50132',
      createdAt: '1 September 2023',
    ),
  ];

  @override
  List<Object?> get props => [
        id,
        title,
        alamat,
        createdAt,
      ];
}
