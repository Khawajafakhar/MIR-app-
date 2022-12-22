import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../../../../constants/colors.dart';
import '../../../widgets/buttons/text_button_widget.dart';
import '../../../widgets/text_widget.dart';
import '../../../../constants/app_constants.dart';
import '../../../../view_models/auth_viewmodel.dart';
import '../../../widgets/loading_widget.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});
  late BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    bool isLoading = context.select<AuthViewModel, bool>(
        (authViewModel) => authViewModel.getLoading);
    ctx = context;
    return isLoading
        ? const Scaffold(
            body: Center(child: LoadingWidget()),
          )
        : Drawer(
            backgroundColor: AppColors.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButtonwidget(
                      onPressed: onLogout,
                      textWidget: const TextWidget(
                        text: AppConstants.textLogout,
                      ),
                      isIcon: true,
                      icon: Icons.logout_outlined,
                    ),
                  )
                ],
              ),
            ),
          );
  }

  void onLogout() {
    ctx.read<AuthViewModel>().logout(ctx);
  }
}
