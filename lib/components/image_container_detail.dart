import 'package:flutter/material.dart';

class ImageContainerDetail extends StatelessWidget {
  const ImageContainerDetail({
    Key? key,
    this.height = 150,
    this.borderRadius = 20,
    required this.width,
    required this.imageUrl,
    this.padding,
    this.margin,
    this.child,
  }) : super(key: key);

  final double width;
  final double height;
  final String imageUrl;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image:
        DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover,),
      ),
      child: child,
    );
  }
}
