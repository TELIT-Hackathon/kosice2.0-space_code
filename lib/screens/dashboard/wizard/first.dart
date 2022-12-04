import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/button.dart';
import 'package:living_app/widgets/layouts/action_bar.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/minors/custom_divider.dart';
import 'package:living_app/widgets/minors/dropdown_custom.dart';
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
  String? _pickedNationality;
  String? _pickedGender;
  RangeLabels _currentRangeLabels = const RangeLabels("18", "80");
  RangeValues _currentRangeValues = const RangeValues(18, 80);

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Column(
        children: [
          const ActionBar(),
          const Header(text: '1. Typ bývania'),
          const SubHeader(text: 'Ako by si chcel bývať ?'),
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
                ),
                _isCheckedSecond
                    ? Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomDivider(),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              child: VarText(
                                text: 'Preferencie spolubývajúcich',
                                size: 18,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: VarText(
                                text: 'Vekový rozsah',
                              ),
                            ),
                            RangeSlider(
                              divisions: 62,
                              activeColor: AppColors.primary,
                              inactiveColor:
                                  AppColors.secondary.withOpacity(0.1),
                              min: 18,
                              max: 80,
                              labels: _currentRangeLabels,
                              onChanged: (values) {
                                setState(() {
                                  _currentRangeValues = values;
                                  _currentRangeLabels = RangeLabels(
                                      values.start.toInt().toString(),
                                      values.end.toInt().toString());
                                });
                              },
                              values: _currentRangeValues,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  VarText(
                                    text: '18',
                                  ),
                                  VarText(
                                    text: '80',
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: VarText(
                                text: 'Národnosť',
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: DropdownCustom(
                                  title: 'Nezáleží',
                                  options: const [
                                    'Slovenská',
                                    'Ukrajinská',
                                    'Maďarská',
                                    'Česká'
                                  ],
                                  value: _pickedNationality,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _pickedNationality = value;
                                    });
                                  },
                                  titleIcon: Icons.flag_rounded),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: VarText(
                                text: 'Pohlavie',
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: DropdownCustom(
                                title: 'Nezáleží',
                                options: const [
                                  'Muž',
                                  'Žena',
                                  'Nedefinované',
                                ],
                                value: _pickedGender,
                                onChanged: (String? value) {
                                  setState(() {
                                    _pickedGender = value;
                                  });
                                },
                                titleIcon: Icons.person_rounded,
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
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
