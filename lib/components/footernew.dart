import 'package:apm/screens/dashboard.dart';
import 'package:apm/screens/pengaduan.dart';
import 'package:apm/screens/pengajuan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FooterNewWidget extends StatefulWidget {
  const FooterNewWidget({
    required this.currentMenu,
    required this.prevMenu,
    super.key,
  });
  final String currentMenu;
  final String prevMenu;

  @override
  State<FooterNewWidget> createState() => _FooterNewWidgetState();
}

class _FooterNewWidgetState extends State<FooterNewWidget> {
  @override
  Widget build(BuildContext context) {
    Color act = Colors.white;
    Color psv = Colors.white;
    Color boxbgactv = const Color(0xFF00923F);
    Color boxbgpsv = const Color(0xFF00923F);

    Color clrHome = psv;
    Color clrPgjn = psv;
    Color clrNadu = psv;
    Color clrHomebox = boxbgpsv;
    Color clrPgjnbox = boxbgpsv;
    Color clrNadubox = boxbgpsv;

    switch (widget.currentMenu) {
      case 'home':
        clrHome = act;
        clrHomebox = boxbgactv;
        break;
      case 'pgjn':
        clrPgjn = act;
        clrPgjnbox = boxbgactv;
        break;
      case 'pgdn':
        clrNadu = act;
        clrNadubox = boxbgactv;
        break;
      default:
    }
    return BottomAppBar(
      clipBehavior: Clip.none,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF00923F),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        height: 65,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      // color: Colors.blue[700],
                      color: clrHomebox,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(() => Dashboard(prevPage: widget.currentMenu));
                        },
                        icon: Icon(
                          Icons.home_rounded,
                          size: 30,
                          color: clrHome,
                        ),
                      ),
                      Text(
                        'Home',
                        style: TextStyle(color: clrHome, fontSize: 8),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.blue[700],
                    color: clrPgjnbox,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Mengatur teks ke tengah secara vertikal
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(() =>
                                  Pengajuan(prevPage: widget.currentMenu));
                            },
                            icon: Icon(
                              Icons.ads_click_rounded,
                              size: 30,
                              color: clrPgjn,
                            ),
                          ),
                          Text(
                            'Pengajuan',
                            style: TextStyle(color: clrPgjn, fontSize: 8),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      // color: Colors.blue[700],
                      color: clrNadubox,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(() => Pengaduan(prevPage: widget.currentMenu));
                        },
                        icon: Icon(
                          Icons.spatial_tracking,
                          size: 30,
                          color: clrNadu,
                        ),
                      ),
                      Text(
                        'Pengaduan nasabah',
                        style: TextStyle(color: clrNadu, fontSize: 8),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
