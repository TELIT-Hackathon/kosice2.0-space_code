import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';


class ClickableText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final Function onPressed;
  final bool underline;
  final TextAlign textAlign;
  final double verticalPadding;

  const ClickableText({
    Key? key,
    required this.text,
    required this.onPressed,
    this.size = 14,
    this.color = AppColors.primary,
    this.underline = false,
    this.textAlign = TextAlign.center,
    this.verticalPadding = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
        ),
        child: Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            decoration: underline ? TextDecoration.underline : null,
            color: color,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            fontSize: size,
          ),
        ),
      ),
    );
  }
}
