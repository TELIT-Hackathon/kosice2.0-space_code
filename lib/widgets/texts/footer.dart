import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: const Text(
          'Developed with 🧡 by SpaceCode s.r.o.',
          style: TextStyle(
              color: AppColors.tertiary,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ));
  }
}
