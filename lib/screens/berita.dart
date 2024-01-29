import 'package:flutter/material.dart';
import 'package:apm/screens/detailberita.dart';

import '../model/beritamodel.dart';
import '../components/image_container.dart';
import '../components/custom_tag.dart';

class BeritaScreen extends StatefulWidget {
  const BeritaScreen({Key? key}) : super(key: key);

  static const routeName = '/news';

  @override
  State<BeritaScreen> createState() => _BeritaScreenState();
}

class _BeritaScreenState extends State<BeritaScreen> {
  @override
  Widget build(BuildContext context) {
    // Article article = Article.articles[0];
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Color.fromARGB(255, 29, 107, 32),
      //   title: Text(
      //     "Berita",
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: Color(0xFF00923F),
        title: Text('Blog/Berita'),
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
      // actions: [
      //   IconButton(
      //       onPressed: () {},
      //       icon: Icon(
      //         Icons.notifications_outlined,
      //         color: Colors.black,
      //       ))
      // ],
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [_Populer(articles: Article.articles)],
      ),
    );
  }
}

class _Populer extends StatelessWidget {
  const _Populer({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final List<Article> articles;

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
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = Article.articles[index];
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (_) => ArticleScreen(articles: article),
                        //   ),
                        // );
                        Navigator.pushNamed(context, DetailBerita.routeName,
                            arguments: articles[index]);
                      },
                      child: Row(
                        children: [
                          ImageContainer(
                            width: 100,
                            height: 70,
                            margin: const EdgeInsets.all(10.0),
                            borderRadius: 20,
                            imageUrl: articles[index].imageUrl,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  articles[index].title,
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.schedule,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '${articles[index].createdAt}',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    const SizedBox(width: 20),
                                  ],
                                ),
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

// class _NewsOfTheDay extends StatelessWidget {
//   const _NewsOfTheDay({
//     Key? key,
//     required this.article,
//   }) : super(key: key);

//   final Article article;

//   @override
//   Widget build(BuildContext context) {
//     return ImageContainer(
//       height: MediaQuery.of(context).size.height * 0.40,
//       width: double.infinity,
//       padding: const EdgeInsets.all(20.0),
//       imageUrl: article.imageUrl,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomTag(backgroundColor: Colors.grey.withAlpha(150), children: [
//             Text(
//               'News of the day',
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyMedium!
//                   .copyWith(color: Colors.white),
//             )
//           ]),
//           const SizedBox(height: 10),
//           Text(
//             article.title,
//             style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                 fontWeight: FontWeight.bold, height: 1.25, color: Colors.white),
//           ),
//           // TextButton(
//           //     onPressed: () {},
//           //     style: TextButton.styleFrom(padding: EdgeInsets.zero),
//           //     child: Row(
//           //       children: [
//           //         Text(
//           //           'Learn More',
//           //           style: Theme.of(context)
//           //               .textTheme
//           //               .bodyLarge!
//           //               .copyWith(color: Colors.white),
//           //         ),
//           //         const SizedBox(
//           //           width: 10,
//           //         ),
//           //         const Icon(
//           //           Icons.arrow_right_alt,
//           //           color: Colors.white,
//           //         )
//           //       ],
//           //     ))
//         ],
//       ),
//     );
//   }
// }
