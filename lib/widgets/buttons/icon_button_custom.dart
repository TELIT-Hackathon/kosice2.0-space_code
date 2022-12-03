import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';

class IconButtonCustom extends StatelessWidget {
  final Widget icon;
  final double size;
  final Color color;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;

  const IconButtonCustom({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.size = 32,
    this.color = AppColors.secondary,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 24,
      iconSize: size,
      padding: padding,
      constraints: const BoxConstraints(),
      icon: icon,
      color: color,
      onPressed: onPressed,
    );
  }
}
