import 'package:apm/screens/detailkarir.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'screens/dashboard.dart';
import 'screens/profil.dart';
import 'screens/detailberita.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APM',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: "Poppins",
      ),
      home: Dashboard(
        prevPage: '',
      ),
      routes: {
        profil.routeNames: (context) => profil(),
        DetailBerita.routeName: (context) => DetailBerita(),
        DetailKarir.routeName: (context) => DetailKarir()
      },
      builder: (context, child) {
        return EasyLoading.init()(context, child);
      },
    );
  }
}
