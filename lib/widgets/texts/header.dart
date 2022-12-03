import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';

class Header extends StatelessWidget {
  final String text;
  final int maxLines;
  final Color color;
  final double verticalPadding;
  final double horizontalPadding;

  const Header({
    required this.text,
    Key? key,
    this.maxLines = 2,
    this.color = AppColors.black,
    this.verticalPadding = 8,
    this.horizontalPadding = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: Text(
        text,
        style: TextStyle(
            color: color,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            fontSize: 28),
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
      ),
    );
  }
}
