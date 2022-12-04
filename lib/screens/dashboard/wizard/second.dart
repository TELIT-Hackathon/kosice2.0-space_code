import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/button.dart';
import 'package:living_app/widgets/layouts/action_bar.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/texts/header.dart';
import 'package:living_app/widgets/texts/sub_header.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class SecondWizard extends StatefulWidget {
  const SecondWizard({Key? key}) : super(key: key);

  @override
  State<SecondWizard> createState() => _SecondWizardState();
}

class _SecondWizardState extends State<SecondWizard> {
  bool _isCheckedFirst = false;
  bool _isCheckedSecond = false;
  bool _isCheckedThird = false;
  bool _isCheckedFourth = false;
  bool _isCheckedFifth = false;
  bool _isCheckedSixth = false;

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Column(
        children: [
          const ActionBar(),
          const Header(text: '2. Lokalita'),
          const SubHeader(text: 'Vyber si kde chceš bývať'),
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
                      text: 'Košice-Barca',
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
                      text: 'Košice-Juh',
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const VarText(
                      color: AppColors.secondary,
                      text: 'Košice-Sever',
                      size: 18,
                    ),
                    Checkbox(
                      value: _isCheckedThird,
                      activeColor: AppColors.primary,
                      onChanged: (bool? value) {
                        setState(() {
                          _isCheckedThird = value!;
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
                      text: 'Košice-Staré Mesto',
                      size: 18,
                    ),
                    Checkbox(
                      value: _isCheckedFourth,
                      activeColor: AppColors.primary,
                      onChanged: (bool? value) {
                        setState(() {
                          _isCheckedFourth = value!;
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
                      text: 'Košice-Ťahanovce',
                      size: 18,
                    ),
                    Checkbox(
                      value: _isCheckedFifth,
                      activeColor: AppColors.primary,
                      onChanged: (bool? value) {
                        setState(() {
                          _isCheckedFifth = value!;
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
                      text: 'Košice-Západ',
                      size: 18,
                    ),
                    Checkbox(
                      value: _isCheckedSixth,
                      activeColor: AppColors.primary,
                      onChanged: (bool? value) {
                        setState(() {
                          _isCheckedSixth = value!;
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
                    '/thirdWizard',
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
