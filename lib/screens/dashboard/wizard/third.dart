import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/button.dart';
import 'package:living_app/widgets/layouts/action_bar.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/texts/header.dart';
import 'package:living_app/widgets/texts/rich_text.dart';
import 'package:living_app/widgets/texts/sub_header.dart';

class ThirdWizard extends StatefulWidget {
  const ThirdWizard({Key? key}) : super(key: key);

  @override
  State<ThirdWizard> createState() => _ThirdWizardState();
}

class _ThirdWizardState extends State<ThirdWizard> {
  late TextEditingController _textEditingController;
  double value = 0;
  double _value = 0;
  int newvalue = 0;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Column(
        children: [
          const ActionBar(),
          const Header(text: '3. Cena'),
          const SubHeader(text: 'Vyber si za koľko chceš bývať'),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: RichTextCustom(
                alignment: Alignment.center,
                firstText: 'do ',
                secondText: '$newvalue €'),
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
                newvalue = _value.toInt();
              });
            },
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
                    '/fourthWizard',
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
