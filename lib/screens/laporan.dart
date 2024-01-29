import 'package:flutter/material.dart';
import 'package:apm/screens/laporanpublikasi.dart';
import 'package:apm/screens/laporanlain.dart';

class Laporan extends StatefulWidget {
  const Laporan({super.key, required this.prevPage});
  final String prevPage;
  @override
  State<Laporan> createState() => _LaporanState();
}

class _LaporanState extends State<Laporan> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF00923F),
          title: Text(
            'Laporan',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: false,
          bottom: TabBar(
            controller: controller,
            tabs: [
              Tab(
                text: 'Publikasi',
              ),
              Tab(
                text: 'Lain-lain',
              ),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.white,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            LaporanPublikasi(),
            LaporanLain(),
          ],
        ),
      );
}
