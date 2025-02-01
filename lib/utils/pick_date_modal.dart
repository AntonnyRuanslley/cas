import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

import '../themes/app_theme.dart';
import 'package:flowcash/widgets/custom/button_base.dart';

Future<dynamic> pickDateModal({
  required BuildContext context,
  required DateTime oldDate,
  required Function(DateTime) selectedDate,
}) async {
  DateTime newDate = oldDate;

  return await Get.bottomSheet(
    backgroundColor: AppTheme.backgroundColor,
    Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EasyDateTimeLine(
            locale: "pt_BR",
            activeColor: AppTheme.primaryColor,
            initialDate: oldDate,
            onDateChange: (selectedDate) {
              newDate = selectedDate;
            },
          ),
          SizedBox(height: 20),
          ButtonBase(
            label: "Confirmar",
            onPressed: () {
              selectedDate(newDate);
              Get.back();
            },
          ),
        ],
      ),
    ),
  );
}
