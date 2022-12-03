import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';

class VarText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final int maxLines;
  final TextAlign textAlign;
  final TextDecoration textDecoration;

  const VarText({
    Key? key,
    required this.text,
    this.color = AppColors.secondary,
    this.size = 16,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.textDecoration = TextDecoration.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          decoration: textDecoration,
          color: color,
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          fontSize: size),
    );
  }
}
