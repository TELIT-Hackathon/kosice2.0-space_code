import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color color;
  final double verticalPadding;
  final VoidCallback? onPressed;

  const Button(
      {Key? key,
        required this.text,
        required this.color,
        required this.onPressed,
        this.verticalPadding = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color,
            minimumSize: const Size.fromHeight(56),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 21),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
