import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/minors/loading.dart';
import 'package:living_app/widgets/minors/snackbar.dart';

void onError(BuildContext context, String message, [bool showLoader = true]) {
  if (showLoader) {
    Navigator.pop(context);
  }
  WidgetsBinding.instance.addPostFrameCallback(
    (_) => CustomSnackBar.show(context, message),
  );
}

void onLoading(BuildContext context,
    [String message = '',
    bool showLoader = true,
    barrierColor = AppColors.tertiary]) {
  if (showLoader) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Loading.showLoading(context, message, barrierColor),
    );
  }
}
