import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key,required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon);
  }
}