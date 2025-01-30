import 'package:flutter/material.dart';

import '../../utils/screen_size.dart';
import '../../themes/app_theme.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;
  const CustomTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          iconColor: AppTheme.primaryColor,
          title: Text(
            title,
            style: AppTheme.subtitle2(context).copyWith(
              color: AppTheme.primaryColor,
            ),
          ),
          onTap: onTap,
        ),
        SizedBox(
          width: ScreenSizes.getScreenWidthSize(context) * 0.5,
          child: Divider(
            height: 1.5,
            thickness: 1.5,
          ),
        ),
      ],
    );
  }
}
