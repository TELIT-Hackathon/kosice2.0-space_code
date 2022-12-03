import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';

class BasicInput extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final Icon icon;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;

  const BasicInput({
    Key? key,
    required this.controller,
    required this.placeholder,
    required this.icon,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.sentences,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 2,
            color: AppColors.white,
            child: TextFormField(
              style: const TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              controller: controller,
              textCapitalization: textCapitalization,
              textInputAction: textInputAction,
              maxLines: 1,
              cursorColor: AppColors.primary,
              decoration: InputDecoration(
                prefixIcon: icon,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                hintText: placeholder,
                fillColor: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
