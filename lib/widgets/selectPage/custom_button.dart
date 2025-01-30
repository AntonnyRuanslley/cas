import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final double height;
  final double width;
  final IconData? icon;
  const CustomButton({
    Key? key,
    required this.label,
    required this.height,
    required this.width,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppTheme.secondyColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon),
              if (icon != null) SizedBox(width: 10),
              Text(
                label,
                style: AppTheme.subtitle1(context).copyWith(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
