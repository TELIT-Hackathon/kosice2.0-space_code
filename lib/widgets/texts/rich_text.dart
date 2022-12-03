import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';

class RichTextCustom extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Color firstColor;
  final Color secondColor;
  final int maxLines;
  final double size;
  final double verticalPadding;
  final double horizontalPadding;
  final Alignment alignment;
  final TextDecoration decoration;

  const RichTextCustom(
      {Key? key,
        required this.firstText,
        required this.secondText,
        this.maxLines = 2,
        this.size = 28,
        this.firstColor = AppColors.black,
        this.secondColor = AppColors.primary,
        this.verticalPadding = 8,
        this.horizontalPadding = 16,
        this.alignment = Alignment.centerLeft,
        this.decoration = TextDecoration.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: RichText(
        textScaleFactor: MediaQuery.of(context).textScaleFactor,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        text: TextSpan(
          text: firstText,
          style: TextStyle(
            decoration: decoration,
            color: firstColor,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            fontSize: size,
          ),
          children: [
            TextSpan(
              text: secondText,
              style: TextStyle(
                decoration: decoration,
                color: secondColor,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: size*0.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
