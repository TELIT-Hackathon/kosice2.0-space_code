import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class Loading {
  static showLoading(BuildContext context,
      [String message = '', barrierColor = AppColors.tertiary]) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: barrierColor,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 64,
              width: 64,
              child: CircularProgressIndicator(
                strokeWidth: 6,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: VarText(
                text: message,
                size: 18,
              ),
            ),
          ],
        );
      },
    );
  }
}
