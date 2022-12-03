import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/action_button.dart';
import 'package:living_app/widgets/layouts/action_bar.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class ErrorScreen extends StatelessWidget {
  final bool addActionbar;
  final VoidCallback? onPressed;

  const ErrorScreen({
    Key? key,
    this.addActionbar = true,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Column(
        children: [
          addActionbar ? const ActionBar() : Container(),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const VarText(
                    maxLines: 2,
                    color: AppColors.tertiary,
                    size: 18,
                    text: 'Ups, niečo sa nepodarilo 😥',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ActionButton(
                      onPressed: onPressed,
                      color: AppColors.primary,
                      text: 'Načítať znova',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
