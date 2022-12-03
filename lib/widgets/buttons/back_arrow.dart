import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';


class BackArrow extends StatelessWidget {
  final Color color;

  const BackArrow({
    Key? key,
    this.color = AppColors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      constraints: const BoxConstraints(),
      alignment: Alignment.centerLeft,
      icon: const Icon(Icons.arrow_back),
      splashRadius: 24,
      iconSize: 32,
      color: color,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
