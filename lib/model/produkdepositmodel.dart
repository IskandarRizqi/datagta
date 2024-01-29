import 'package:equatable/equatable.dart';

class Deposit extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final double nominalkredit;
  final double tenor;
  final String description;

  const Deposit({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.tenor,
    required this.nominalkredit,
    required this.description,
  });

  static List<Deposit> deposits = [
    Deposit(
        id: '1',
        title: 'Deposit Berjangka',
        nominalkredit: 1,
        tenor: 1,
        imageUrl:
            'https://res.cloudinary.com/dk55ik2ah/image/upload/v1694402776/image_1_1_u7ohvn.png',
        description:
            'Deposito merupakan salah satu produk penyimpanan uang di bank dengan sistem penyetoran dan juga penarikannya yang hanya bisa dilakukan pada waktu tertentu. Waktu pengambilannya variatif bisa Anda pilih dari 1, 3, 6, 12, atau bisa juga 24 bulan.\n\nSalah satu keuntungan utamanya adalah deposito merupakan sarana investasi yang dijamin Lembaga dengan menggunakan deposito, nilai pokok dari uang yang diinvestasikan juga dapat terjaga.Penjamin Simpanan (LPS) dengan beberapa syarat dan ketentuan yang harus dipenuhi. Selain itu-Deposito Berjangka BPR Arthapuspa Mega jangka waktu bisa sampai dengan 36 bulan dengan bunga 6,25% per tahun.'),
  ];

  @override
  List<Object?> get props => [id, title, imageUrl];
}
