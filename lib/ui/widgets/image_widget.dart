import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.boxFit=BoxFit.contain
  });

  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: boxFit,
      height: height,
      width: width,
    );
  }
}
