import 'package:apm/screens/simulasi_deposito.dart';
import 'package:apm/screens/simulasi_kredit.dart';
import 'package:apm/screens/simulasi_tabungan.dart';
import 'package:flutter/material.dart';

class Simulasi extends StatefulWidget {
  const Simulasi({Key? key}) : super(key: key);

  @override
  State<Simulasi> createState() => _SimulasiState();
}

class _SimulasiState extends State<Simulasi>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF00923F),
          title: Text(
            'Simulasi',
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
                text: 'Tabungan',
              ),
              Tab(
                text: 'Deposito',
              ),
            ],
            labelColor: Colors
                .white, // Mengubah warna teks tab yang aktif menjadi putih
            unselectedLabelColor: Colors
                .white, // Mengubah warna teks tab yang tidak aktif menjadi putih
            indicatorColor:
                Colors.white, // Mengubah warna indikator tab menjadi putih
          ),
          iconTheme: IconThemeData(
            color: Colors.white, // Mengubah warna ikon menjadi putih
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            SimulasiKredit(),
            SimulasiTabungan(),
            SimulasiDeposito(),
          ],
        ),
      );
}
