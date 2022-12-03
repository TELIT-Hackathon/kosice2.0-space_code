import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(color: AppColors.tertiary);
  }
}
