import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';


class ListTitle extends StatelessWidget {
  final String text;
  final double size;
  final TextAlign alignment;
  final double horizontalPadding;

  const ListTitle({
    Key? key,
    required this.text,
    this.alignment = TextAlign.center,
    this.horizontalPadding = 16,
    this.size = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: horizontalPadding,
      ),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        textAlign: alignment,
        style: TextStyle(
          color: AppColors.secondary,
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          fontSize: size,
        ),
      ),
    );
  }
}
