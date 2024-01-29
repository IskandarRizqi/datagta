// import 'package:apm/screens/berita.dart';
import 'package:flutter/material.dart';

import '../model/kantormodel.dart';
import '../components/image_container.dart';

class KantorScreen extends StatefulWidget {
  const KantorScreen({Key? key}) : super(key: key);

  static const routeName = '';

  @override
  State<KantorScreen> createState() => _KantorScreenState();
}

class _KantorScreenState extends State<KantorScreen> {
  @override
  Widget build(BuildContext context) {
    Kantor kantor = Kantor.kantor[0];
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Color.fromARGB(255, 29, 107, 32),
      //   title: Text(
      //     "Jaringan Kantor",
      //     style: TextStyle(color: Colors.white),
      //   ),),
      appBar: AppBar(
        backgroundColor: Color(0xFF00923F),
        title: Text('Jaringan Kantor'),
        iconTheme: IconThemeData(color: Colors.white),
        toolbarTextStyle: TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ).bodyMedium,
        titleTextStyle: TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ).titleLarge,
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [_jaringankantor(kantor: Kantor.kantor)],
      ),
    );
  }
}

class _jaringankantor extends StatefulWidget {
  const _jaringankantor({
    Key? key,
    required this.kantor,
  }) : super(key: key);

  final List<Kantor> kantor;

  @override
  State<_jaringankantor> createState() => _jaringankantorState();
}

class _jaringankantorState extends State<_jaringankantor> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       'Berita Terpopuler',
          //       style: Theme.of(context)
          //           .textTheme
          //           .headlineSmall!
          //           .copyWith(fontWeight: FontWeight.bold),
          //     ),
          //   ],
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: widget.kantor.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context, BeritaScreen.routeName,
                        //     arguments: widget.kantor[index]);
                      },
                      child: Row(
                        children: [
                          ImageContainer(
                              width: 50,
                              height: 70,
                              margin: const EdgeInsets.all(10.0),
                              borderRadius: 5,
                              imageUrl:
                                  "https://res.cloudinary.com/dvwsffyzc/image/upload/v1695176505/Office_kufdzo.png"),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.kantor[index].title,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  widget.kantor[index].alamat,
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize:
                                            12, // Ubah ukuran font sesuai keinginan Anda
                                      ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
