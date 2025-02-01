import 'package:flowcash/utils/pick_date_modal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../themes/app_theme.dart';
import '../../utils/screen_size.dart';

class SelectDate extends StatelessWidget {
  final DateTime selectDate;
  final Function(DateTime)onPressed;

  const SelectDate({
    Key? key,
    required this.onPressed,
    required this.selectDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeScreen = ScreenSizes.getScreenWidthSize(context);

    return InkWell(
      onTap: () => pickDateModal(
        context: context,
        oldDate: selectDate,
        selectedDate: onPressed,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.date_range_outlined,
            color: AppTheme.secondyColor,
            size: sizeScreen * 0.082,
          ),
          Container(
            width: sizeScreen * 0.45,
            child: Text(
              'Data selecionada: ${DateFormat('dd/MM/y', "pt_BR").format(selectDate)}',
              style: AppTheme.title1(context).copyWith(
                fontSize: 17,
                color: AppTheme.secondyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
