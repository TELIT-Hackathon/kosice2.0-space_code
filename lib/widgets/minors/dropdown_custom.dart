import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/texts/var_text.dart';


class DropdownCustom extends StatelessWidget {
  final String title;
  final IconData titleIcon;
  final List<String> options;
  final String? value;
  final ValueChanged<String?>? onChanged;
  final bool isExpanded;

  const DropdownCustom({
    Key? key,
    required this.title,
    required this.options,
    required this.onChanged,
    this.value,
    required this.titleIcon,
    this.isExpanded = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: AppColors.white,
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: DropdownButton<String>(
          isExpanded: isExpanded,
          borderRadius: BorderRadius.circular(20),
          hint: Row(
            children: [
              Icon(
                titleIcon,
                color: AppColors.secondary,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: VarText(
                  text: title,
                  color: AppColors.tertiary,
                ),
              ),
            ],
          ),
          value: value,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
          ),
          underline: Container(
            height: 0,
            color: AppColors.white,
          ),
          onChanged: onChanged,
          items: options.map(
                (value) {
              return DropdownMenuItem(
                value: value,
                child: VarText(
                  color: AppColors.black,
                  text: value,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
