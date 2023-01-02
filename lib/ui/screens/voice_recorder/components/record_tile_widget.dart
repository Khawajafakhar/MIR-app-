import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../widgets/text_widget.dart';
import '../../../../constants/dimens.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/app_constants.dart';

class RecordTileWidget extends StatelessWidget {
  const RecordTileWidget({
    super.key,
    this.dateTime,
    this.discription,
  });

  final DateTime? dateTime;
  final String? discription;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextWidget(
        text: DateFormat(AppConstants.formatDataTime).format(dateTime!),
        fontSize: Dimens.textSmall,
        color: AppColors.colorWhite.withOpacity(0.6),
      ),
      subtitle: TextWidget(
        text: discription ?? '',
        fontSize: Dimens.textSmall,
      ),
    );
  }
}
