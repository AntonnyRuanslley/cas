import 'package:flowcash/controllers/transactionController/transaction_controller.dart';
import 'package:flowcash/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuggestionsBox extends GetView<TransactionController> {
  final Function(String) onChanged;
  const SuggestionsBox({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    final transactionController = Get.find<TransactionController>();

    return Obx(() {
      return Container(
        constraints: BoxConstraints(maxHeight: 90),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: transactionController.suggestionsTitles.map((suggestion) {
              return InkWell(
                onTap: () {
                  onChanged(suggestion);
                  transactionController.cleanSuggestionsTitles();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 8, right: 5, left: 5),
                  width: double.maxFinite,
                  child: Text(
                    suggestion,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.subtitle1(context)
                        .copyWith(color: AppTheme.backgroundColor),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
