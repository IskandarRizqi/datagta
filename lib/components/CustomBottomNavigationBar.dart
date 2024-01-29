import 'package:apm/screens/dashboard.dart';
import 'package:apm/screens/pengaduan.dart';
import 'package:apm/screens/pengajuan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF30318B),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            )),
        height: 90,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[700],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(35),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(() => const Dashboard(prevPage: 'home'));
                        },
                        icon: Icon(
                          Icons.home_rounded,
                          size: 33,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Home',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(() => const Pengajuan(prevPage: 'home'));
                      },
                      icon: Icon(
                        Icons.ads_click_rounded,
                        size: 33,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Pengajuan',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(() => const Pengajuan(prevPage: 'home'));
                      },
                      icon: Icon(
                        Icons.face_rounded,
                        size: 33,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Pengaduan\n'
                      'Nasabah',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
