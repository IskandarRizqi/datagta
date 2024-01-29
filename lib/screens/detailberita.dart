import 'package:flutter/material.dart';
import 'package:apm/components/image_container_detail.dart';

import '../model/beritamodel.dart';
import '../components/custom_tag.dart';

class DetailBerita extends StatefulWidget {
  const DetailBerita({Key? key}) : super(key: key);

  static const routeName = '/article';

  @override
  State<DetailBerita> createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {
  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;
    return ImageContainerDetail(
        width: double.infinity,
        imageUrl: article.imageUrl,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
          body: ListView(
            children: [
              _NewsHeadline(
                article: article,
              ),
              _NewsBody(article: article),
            ],
          ),
        ));
  }
}

class _NewsBody extends StatelessWidget {
  const _NewsBody({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(article.body,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(height: 1.5)),
          // const SizedBox(height: 20),
          // GridView.builder(
          //     shrinkWrap: true,
          //     itemCount: 2,
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       childAspectRatio: 1.25,
          //     ),
          //     itemBuilder: (context, index) {
          //       return ImageContainer(
          //         width: MediaQuery.of(context).size.width * 0.42,
          //         imageUrl: article.imageUrl,
          //         margin: const EdgeInsets.only(right: 5.0, bottom: 5.0),
          //       );
          //     })
        ],
      ),
    );
  }
}

class _NewsHeadline extends StatelessWidget {
  const _NewsHeadline({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          CustomTag(backgroundColor: Colors.blue.withAlpha(150), children: [
            Text(
              article.category,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            )
          ]),
          const SizedBox(height: 10),
          Text(
            article.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold, color: Colors.white, height: 1.25),
          ),
          const SizedBox(height: 10),
          CustomTag(backgroundColor: Colors.grey.shade200, children: [
            const Icon(Icons.schedule, color: Colors.grey),
            const SizedBox(width: 10),
            Text(
              '${article.createdAt}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ]),
          // const SizedBox(height: 10),
          // Text(
          //   article.subtitle,
          //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          //       fontWeight: FontWeight.bold, color: Colors.white, height: 1.25),
          // ),
        ],
      ),
    );
  }
}
