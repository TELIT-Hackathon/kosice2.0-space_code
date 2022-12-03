import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';

class CustomSnackBar {
  static show(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(
          text,
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
          style: const TextStyle(
              color: AppColors.white,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: AppColors.secondary,
      ),
    );
  }
}
