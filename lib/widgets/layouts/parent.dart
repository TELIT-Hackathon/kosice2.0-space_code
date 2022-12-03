import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';

class Parent extends StatelessWidget {
  final Color background;
  final Widget child;

  const Parent({
    Key? key,
    required this.child,
    this.background = AppColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(child: child),
    );
  }
}
