import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String body;
  final String category;
  final String imageUrl;
  final String createdAt;

  const Article(
      {required this.id,
      required this.title,
      required this.body,
      required this.category,
      required this.imageUrl,
      required this.createdAt});

  static List<Article> articles = [
    Article(
      id: '1',
      title:
          'Lorem ipsum dolor sit amet, consectetur elit',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas blandit sit amet magna ac lobortis. Curabitur molestie a turpis vel interdum. Donec laoreet nisi et ante volutpat, sit amet tincidunt eros pretium. Nunc commodo bibendum blandit. Sed placerat sem tellus, at consectetur neque facilisis quis. Nam sed felis ultricies, dictum augue eu, finibus elit. Maecenas in lobortis velit. Aliquam faucibus elit in ipsum pulvinar, id rhoncus leo interdum. Maecenas luctus pellentesque urna, vitae molestie eros congue at. Ut a turpis ut lectus eleifend feugiat. Etiam id magna vehicula, aliquam lectus at, feugiat lorem. Morbi eget egestas lacus, nec efficitur quam.',
      category: 'BPR',
      imageUrl:
          'https://res.cloudinary.com/dvwsffyzc/image/upload/v1683041890/samples/people/jazz.jpg',
      createdAt: '1 September 2023'
    ),
    Article(
      id: '2',
      title:
          'Vestibulum posuere facilisis dui vel feugiat.',
      body:
          'Vestibulum posuere facilisis dui vel feugiat. Duis pellentesque justo in sagittis facilisis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aenean sed cursus arcu. Pellentesque euismod, massa et auctor ornare, nibh ipsum pellentesque sem, ut maximus sapien odio eget eros. Suspendisse quis turpis tortor. Mauris ornare ligula orci, eu porta magna rhoncus vel. Nulla facilisi. Donec id quam sollicitudin, elementum purus ultrices, hendrerit felis. Fusce tristique metus eu arcu vulputate ultricies.',
      category: 'Industri',
      imageUrl:
          'https://res.cloudinary.com/dvwsffyzc/image/upload/v1683041894/samples/imagecon-group.jpg',
      createdAt: '1 September 2023',
    ),
    Article(
      id: '3',
      title:
          'Nullam eu congue justo. Pellentesque habitant',
      body:
          'Nullam eu congue justo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi egestas tempor justo id congue. Quisque ornare, turpis quis maximus interdum, justo dolor posuere nibh, id porta eros nisi pretium risus. Vivamus elementum enim pulvinar hendrerit placerat. Vestibulum suscipit arcu ligula. Cras in nibh ipsum. Quisque condimentum sem ac sagittis aliquet. In vulputate finibus lacus eget aliquet. Nullam nec dui rutrum, facilisis ligula at, accumsan orci. Nunc et elit ut ex iaculis tempus. Cras urna ligula, consectetur vel consectetur at, porttitor eget massa. Ut risus elit, finibus vel mi consectetur, tincidunt bibendum lacus. Mauris ut congue orci, sit amet porta urna. Etiam porta suscipit ante sed posuere. Donec luctus at odio vel iaculis.',
      category: 'BPR',
      imageUrl:
          'https://res.cloudinary.com/dvwsffyzc/image/upload/v1683041891/samples/landscapes/architecture-signs.jpg',
      createdAt: '1 September 2023',
    ),
    Article(
      id: '4',
      title: 'Aliquam sagittis posuere pretium. In hac habitasse platea dictumst.',
      body:
          'Aliquam sagittis posuere pretium. In hac habitasse platea dictumst. Mauris et turpis eget nisl iaculis tempor nec in augue. Phasellus iaculis, ipsum ac viverra pretium, leo turpis cursus metus, a convallis ipsum ligula vitae augue. Donec tristique finibus nulla, id porta nibh. Proin varius aliquam feugiat. Integer justo massa, varius aliquet convallis sit amet, lobortis ut mauris. Pellentesque ullamcorper, magna eget lobortis sollicitudin, erat justo lobortis erat, quis interdum arcu est sed augue. Suspendisse vitae ultricies massa. Aliquam efficitur, velit id vulputate cursus, turpis mi iaculis velit, at dictum mi leo sit amet massa.',
      category: 'Bank Umum',
      imageUrl:
          'https://res.cloudinary.com/dvwsffyzc/image/upload/v1683041905/cld-sample.jpg',
      createdAt:'1 September 2023',
    ),
    Article(
      id: '5',
      title:
          'Donec hendrerit lacinia est at semper. Sed ut dictum enim',
      body:
          'Donec hendrerit lacinia est at semper. Sed ut dictum enim. Phasellus eros ipsum, pulvinar ac sagittis nec, auctor nec odio. Aliquam consectetur risus ipsum, sit amet auctor nibh interdum et. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sit amet maximus arcu. Fusce vehicula tortor eros. Nam massa massa, dapibus ac tempor quis, molestie et turpis.',
      category: 'BPR',
      imageUrl:
          'https://res.cloudinary.com/dvwsffyzc/image/upload/v1683041896/samples/landscapes/nature-mountains.jpg',
      createdAt: '1 September 2023',
    ),
  ];

  @override
  List<Object?> get props => [
        id,
        title,
        body,
        category,
        imageUrl,
        createdAt,
      ];
}
