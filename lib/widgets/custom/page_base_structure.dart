import 'package:flowcash/themes/app_theme.dart';
import 'package:flutter/material.dart';

class PageBaseStructure extends StatelessWidget {
  final String title;
  final Widget child;
  final bool showBackButton;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final Function()? backButtonOnTap;
  final EdgeInsetsGeometry? padding;

  const PageBaseStructure({
    Key? key,
    required this.title,
    required this.child,
    this.showBackButton = true,
    this.actions,
    this.backButtonOnTap,
    this.floatingActionButton,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppTheme.primaryColor,
          title: Center(
            child: Text(
              title,
              style: AppTheme.title2(context).copyWith(
                color: AppTheme.secondyColor,
              ),
            ),
          ),
          iconTheme: IconThemeData(color: AppTheme.backgroundColor),
          actions: actions,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: child,
        ),
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
