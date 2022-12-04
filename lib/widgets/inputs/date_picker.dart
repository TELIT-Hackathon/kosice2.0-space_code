import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/texts/var_text.dart';


class DatePicker extends StatelessWidget {
  final String? date;
  final IconData icon;
  final ValueChanged<String?> onChange;

  const DatePicker({
    Key? key,
    required this.date,
    required this.icon,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColors.white,
        minimumSize: const Size.fromHeight(56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.secondary,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: VarText(
              color: date != null ? AppColors.black : AppColors.tertiary,
              text: date ?? '25.5.1997',
            ),
          ),
        ],
      ),
      onPressed: () => onPressedPicker(context, onChange),
    );
  }

  onPressedPicker(BuildContext context, ValueChanged<String?> onChange) => {
    showDatePicker(
      helpText: '',
      locale: const Locale("sk"),
      confirmText: 'Potvrdiť',
      cancelText: 'Zrušiť',
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              surface: AppColors.primary,
              onSurface: AppColors.secondary,
            ),
            dialogBackgroundColor: AppColors.white,
          ),
          child: child!,
        );
      },
    ).then(
          (value) {
        if (value != null) {
          onChange(
            DateFormat("dd.MM.yyyy").format(value),
          );
        }
      },
    ),
  };
}
