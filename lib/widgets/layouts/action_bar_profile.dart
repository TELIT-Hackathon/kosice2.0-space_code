import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/back_arrow.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class ActionBarProfile extends StatelessWidget {
  final String title;

  const ActionBarProfile({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: AppColors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: BackArrow(
              color: AppColors.white,
            ),
          ),
          Expanded(
            child: VarText(
              text: title,
              size: 18,
              color: AppColors.white,
            ),
          ),
          const SizedBox(
            width: 52,
          ),
        ],
      ),
    );
  }
}
