import 'package:apm/components/footernew.dart';
import 'package:flutter/material.dart';
import 'package:apm/screens/pengajuan_kredit.dart';
import 'package:apm/screens/pengajuan_deposito.dart';
import 'package:apm/screens/pengajuan_tabungan.dart';

class Pengajuan extends StatefulWidget {
  const Pengajuan({super.key, required this.prevPage});
  final String prevPage;
  @override
  State<Pengajuan> createState() => _PengajuanState();
}

class _PengajuanState extends State<Pengajuan>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = TabController(length: 3, vsync: this);
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
            'Pengajuan',
            style: TextStyle(
              color: Colors.white, // Mengubah warna teks title menjadi putih
            ),
          ),
          centerTitle: false,
          bottom: TabBar(
            controller: controller,
            tabs: [
              Tab(
                text: 'Kredit',
              ),
              Tab(
                text: 'Deposito',
              ),
              Tab(
                text: 'Tabungan',
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
            PengajuanKredit(),
            PengajuanDeposito(),
            PengajuanTabungan(),
          ],
        ),
        bottomNavigationBar:
            FooterNewWidget(currentMenu: 'pgjn', prevMenu: widget.prevPage),
      );
}
