import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onPressed;
  final bool isPayme;

  const ActionButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.primary,
    this.isPayme = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      child: !isPayme
          ? ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
        onPressed: onPressed,
      )
          : ElevatedButton.icon(
        icon: const Image(
          fit: BoxFit.contain,
          width: 30,
          image: AssetImage('assets/payme_logo.png'),
        ),
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        label: Text(
          text,
          style: const TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
