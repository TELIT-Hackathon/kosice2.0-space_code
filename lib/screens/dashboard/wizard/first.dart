import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/button.dart';
import 'package:living_app/widgets/layouts/action_bar.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/texts/header.dart';
import 'package:living_app/widgets/texts/sub_header.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class FirstWizard extends StatefulWidget {
  const FirstWizard({Key? key}) : super(key: key);

  @override
  State<FirstWizard> createState() => _FirstWizardState();
}

class _FirstWizardState extends State<FirstWizard> {
  bool _isCheckedFirst = false;
  bool _isCheckedSecond = false;

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Column(
        children: [
          const ActionBar(),
          const Header(text: '1. Typ bývania'),
          const SubHeader(text: 'Vyber si ako chceš bývať'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const VarText(
                      color: AppColors.secondary,
                      text: 'Samostatne',
                      size: 18,
                    ),
                    Checkbox(
                      value: _isCheckedFirst,
                      activeColor: AppColors.primary,
                      onChanged: (bool? value) {
                        setState(() {
                          _isCheckedFirst = value!;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const VarText(
                      color: AppColors.secondary,
                      text: 'Zdieľane',
                      size: 18,
                    ),
                    Checkbox(
                      value: _isCheckedSecond,
                      activeColor: AppColors.primary,
                      onChanged: (bool? value) {
                        setState(() {
                          _isCheckedSecond = value!;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Button(
                color: AppColors.primary,
                text: 'Ďalší krok',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/secondWizard',
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
