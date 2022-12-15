import 'package:flutter/material.dart';

import '../../widgets/appbar_widget.dart';
import '../../../constants/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(txt: AppStrings.textHome),
        body: Column(
          children: [],
        ));
  }
}
