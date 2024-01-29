import 'package:equatable/equatable.dart';

class Kredit extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final String description;

  const Kredit({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  static List<Kredit> kredits = [
    Kredit(
      id: '1',
      title: 'Kredit Musiman',
      imageUrl:
          'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694402244/image_1_qufilb.png',
      description: 'Deposito merupakan salah satu produk penyimpanan uang di bank dengan sistem penyetoran dan juga penarikannya yang hanya bisa dilakukan pada waktu tertentu. Waktu pengambilannya variatif bisa Anda pilih dari 1, 3, 6, 12, atau bisa juga 24 bulan.\n\nSalah satu keuntungan utamanya adalah deposito merupakan sarana investasi yang dijamin Lembaga dengan menggunakan deposito, nilai pokok dari uang yang diinvestasikan juga dapat terjaga.Penjamin Simpanan (LPS) dengan beberapa syarat dan ketentuan yang harus dipenuhi. Selain itu-Deposito Berjangka BPR Arthapuspa Mega jangka waktu bisa sampai dengan 36 bulan dengan bunga 6,25% per tahun.'
    ),
    Kredit(
      id: '2',
      title: 'Kredit Talangan',
      imageUrl:
          'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694402244/image_2_fj3cfo.png',
          description: ''
    ),
    Kredit(
      id: '3',
      title: 'Kredit Profesi Umum',
      imageUrl:
          'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694402425/image_3_s6yvqk.png',
          description: ''
    ),
    Kredit(
      id: '4',
      title: 'Kredit Angsuran',
      imageUrl:
          'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694402424/image_5_hag59k.png',
          description: ''
    ),
  ];

  @override
  List<Object?> get props => [id, title, imageUrl];
}
