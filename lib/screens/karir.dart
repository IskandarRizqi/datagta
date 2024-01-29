import 'package:apm/screens/detailkarir.dart';
import 'package:flutter/material.dart';

import '../model/karirmodel.dart';
import '../widgets/image_container.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/custom_tag.dart';

class karirpage extends StatelessWidget {
  static const routeName = '/karir';

  @override
  Widget build(BuildContext context) {
    Karir karir = Karir.karir[0];
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF00923F),
        title: Text(
          "karir",
          style: TextStyle(color: Colors.white),
        ),
      ),
      // bottomNavigationBar: BottomNavBar(index: 0),
      // extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [_Populer(karir: Karir.karir)],
      ),
    );
  }
}

class _Populer extends StatelessWidget {
  _Populer({
    Key? key,
    required this.karir,
  }) : super(key: key);

  final List<Karir> karir;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: karir.length,
                itemBuilder: (context, index) {
                  final karirItem = karir[index];
                  final createdAt = DateTime.parse(karirItem.createdAt);
                  final currentDate = DateTime.now();
                  final difference = currentDate.difference(createdAt);
                  final daysDifference = difference.inDays;
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, DetailKarir.routeName,
                            arguments: karir[index]);
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: FittedBox(
                              fit: BoxFit
                                  .cover, // Sesuaikan ini dengan kebutuhan Anda
                              child: Image.network(karir[index].imageUrl),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  karir[index].title,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  karir[index].subtitle,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  karir[index].alamat,
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w100,
                                          color: Colors.grey),
                                ),
                                Wrap(
                                  children: karirItem.tag.map((tag) {
                                    return Container(
                                      margin: EdgeInsets.only(right: 5),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF7D7D7D),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        tag,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '$daysDifference hari lalu',
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w100,
                                          color: Colors.grey,
                                          fontSize: 10),
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Divider(
            height: 1, // Atur tinggi Divider sesuai kebutuhan
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

class _NewsOfTheDay extends StatelessWidget {
  _NewsOfTheDay({
    Key? key,
    required this.karir,
  }) : super(key: key);

  final Karir karir;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      height: MediaQuery.of(context).size.height * 0.40,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      imageUrl: karir.imageUrl,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTag(backgroundColor: Colors.grey.withAlpha(150), children: [
            Text(
              'News of the day',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            )
          ]),
          SizedBox(height: 10),
          Text(
            karir.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold, height: 1.25, color: Colors.white),
          ),
          // TextButton(
          //     onPressed: () {},
          //     style: TextButton.styleFrom(padding: EdgeInsets.zero),
          //     child: Row(
          //       children: [
          //         Text(
          //           'Learn More',
          //           style: Theme.of(context)
          //               .textTheme
          //               .bodyLarge!
          //               .copyWith(color: Colors.white),
          //         ),
          //         const SizedBox(
          //           width: 10,
          //         ),
          //         const Icon(
          //           Icons.arrow_right_alt,
          //           color: Colors.white,
          //         )
          //       ],
          //     ))
        ],
      ),
    );
  }
}
