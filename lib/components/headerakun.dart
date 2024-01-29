import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://res.cloudinary.com/dvvbceigh/image/upload/v1695969601/Rectangle_kvlqya.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 55.0,
            child: Text(
              'Akun',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Column(
              children: [
                Container(
                  width: 100, // Sesuaikan dengan ukuran yang Anda inginkan
                  height: 100,
                  child: CircleAvatar(
                    radius: 30, // Sesuaikan dengan ukuran yang Anda inginkan
                    backgroundColor:
                        Colors.transparent, // Hapus latar belakang avatar
                    backgroundImage: NetworkImage(
                        'https://res.cloudinary.com/dvvbceigh/image/upload/v1695005693/Group_1543_qyh5ws.png'), // Ganti dengan URL gambar profil Anda
                  ),
                ),
                Text(
                  'Iskandar Rizqi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23.0,
                  ),
                ),
                Text(
                  'rizqi.coastguard@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Contoh Header'),
//         ),
//         body: Column(
//           children: [
//             Header(),
//             Text(
//               'Selamat datang di aplikasi Flutter!',
//               style: TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MyApp());
// }
