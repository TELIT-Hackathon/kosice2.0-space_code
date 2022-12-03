import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';


class SearchInput extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final Function() onClear;
  final Function(String) onChanged;

  const SearchInput({
    Key? key,
    required this.controller,
    required this.placeholder,
    required this.onChanged,
    required this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 2,
            color: AppColors.white,
            child: TextFormField(
              onChanged: (value) => onChanged(value),
              style: const TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              controller: controller,
              maxLines: 1,
              textInputAction: TextInputAction.search,
              cursorColor: AppColors.primary,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: AppColors.secondary,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: controller.text.isNotEmpty
                      ? IconButton(
                    icon: const Icon(Icons.clear_rounded),
                    color: AppColors.secondary,
                    onPressed: () {
                      controller.clear();
                      onClear();
                    },
                  )
                      : null,
                  filled: true,
                  hintText: placeholder,
                  fillColor: AppColors.white),
            ),
          ),
        ),
      ],
    );
  }
}
