import 'package:flutter/material.dart';
import 'package:living_app/models/preferences.dart';
import 'package:living_app/screens/dashboard/wizard/third.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/button.dart';
import 'package:living_app/widgets/layouts/action_bar.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/texts/header.dart';
import 'package:living_app/widgets/texts/sub_header.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class SecondWizardArgs {
  final RoommatePreferences? roommatePreferences;

  SecondWizardArgs(
    this.roommatePreferences,
  );
}

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
  late SecondWizardArgs _args;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _args = ModalRoute.of(context)!.settings.arguments as SecondWizardArgs;
    return Parent(
      child: Column(
        children: [
          const ActionBar(),
          const Header(text: '2. Lokalita'),
          const SubHeader(text: 'Kde by si chcel bývať ?'),
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
                onPressed: _isCheckedFirst ||
                        _isCheckedSecond ||
                        _isCheckedThird ||
                        _isCheckedFourth ||
                        _isCheckedFifth ||
                        _isCheckedSixth
                    ? () {
                        Navigator.pushNamed(
                          context,
                          '/thirdWizard',
                          arguments: ThirdWizardArgs([
                            if (_isCheckedFirst) 'Košice-Barca',
                            if (_isCheckedSecond) 'Košice-Juh',
                            if (_isCheckedThird) 'Košice-Sever',
                            if (_isCheckedFourth) 'Košice-Staré Mesto',
                            if (_isCheckedFifth) 'Košice-Ťahanovce',
                            if (_isCheckedSixth) 'Košice-Západ',
                          ], _args.roommatePreferences),
                        );
                      }
                    : null,
              ),
            ),
          )
        ],
      ),
    );
  }
}
