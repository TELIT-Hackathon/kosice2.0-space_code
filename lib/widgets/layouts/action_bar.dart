import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/back_arrow.dart';
import 'package:living_app/widgets/buttons/icon_button_custom.dart';


class ActionBar extends StatelessWidget {
  final bool backArrow;
  final Color backArrowColor;
  final List<IconButtonCustom>? actionsRight;

  const ActionBar({
    Key? key,
    this.backArrow = true,
    this.actionsRight,
    this.backArrowColor = AppColors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        mainAxisAlignment: decideLayout(),
        children: [
          if (backArrow)
            BackArrow(
              color: backArrowColor,
            ),
          if (actionsRight != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: actionsRight!
                  .map(
                    (action) => Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: action),
              )
                  .toList(),
            )
        ],
      ),
    );
  }

  MainAxisAlignment decideLayout() {
    if (backArrow && actionsRight != null) {
      return MainAxisAlignment.spaceBetween;
    } else if (!backArrow && actionsRight != null) {
      return MainAxisAlignment.end;
    } else if (backArrow && actionsRight == null) {
      return MainAxisAlignment.start;
    } else {
      throw ArgumentError('Invalid widget configuration.');
    }
  }
}
