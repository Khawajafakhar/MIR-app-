import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.boxFit = BoxFit.contain,
    this.onTap,
  });

  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit boxFit;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        imagePath,
        fit: boxFit,
        height: height,
        width: width,
      ),
    );
  }
}
