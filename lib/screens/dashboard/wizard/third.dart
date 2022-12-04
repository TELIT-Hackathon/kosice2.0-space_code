import 'package:flutter/material.dart';
import 'package:living_app/models/preferences.dart';
import 'package:living_app/screens/dashboard/wizard/fourth.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/button.dart';
import 'package:living_app/widgets/layouts/action_bar.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/texts/header.dart';
import 'package:living_app/widgets/texts/rich_text.dart';
import 'package:living_app/widgets/texts/sub_header.dart';

class ThirdWizardArgs {
  final List<String> locality;
  final RoommatePreferences? roommatePreferences;

  ThirdWizardArgs(
    this.locality,
    this.roommatePreferences,
  );
}

class ThirdWizard extends StatefulWidget {
  const ThirdWizard({Key? key}) : super(key: key);

  @override
  State<ThirdWizard> createState() => _ThirdWizardState();
}

class _ThirdWizardState extends State<ThirdWizard> {
  double _value = 0;
  int newValue = 0;
  late ThirdWizardArgs _args;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _args = ModalRoute.of(context)!.settings.arguments as ThirdWizardArgs;

    return Parent(
      child: Column(
        children: [
          const ActionBar(),
          const Header(text: '3. Cena'),
          const SubHeader(text: 'Za koľko by si chcel bývať ?'),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: RichTextCustom(
                alignment: Alignment.center,
                firstText: 'mesačne do ',
                secondText: '$newValue €'),
          ),
          Slider.adaptive(
            activeColor: AppColors.primary,
            inactiveColor: AppColors.secondary.withOpacity(0.1),
            min: 0,
            max: 1000,
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
                newValue = _value.toInt();
              });
            },
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Button(
                color: AppColors.primary,
                text: 'Ďalší krok',
                onPressed: newValue > 0
                    ? () {
                        Navigator.pushNamed(
                          context,
                          '/fourthWizard',
                          arguments: FourthWizardArgs(
                            _args.locality,
                            _args.roommatePreferences,
                            newValue,
                          ),
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
