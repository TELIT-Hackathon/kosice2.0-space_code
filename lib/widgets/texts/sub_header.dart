import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';

class SubHeader extends StatelessWidget {
  final String text;
  final int maxLines;

  const SubHeader({required this.text, Key? key, this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Text(
        text,
        style: const TextStyle(
            color: AppColors.secondary,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            fontSize: 18),
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
      ),
    );
  }
}
