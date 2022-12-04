import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/button.dart';
import 'package:living_app/widgets/inputs/date_picker.dart';
import 'package:living_app/widgets/layouts/action_bar.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/texts/header.dart';
import 'package:living_app/widgets/texts/sub_header.dart';

class ThirdWizard extends StatefulWidget {
  const ThirdWizard({Key? key}) : super(key: key);

  @override
  State<ThirdWizard> createState() => _ThirdWizardState();
}

class _ThirdWizardState extends State<ThirdWizard> {
  late TextEditingController _textEditingController;

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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BasicInput(
                controller: _textEditingController,
                placeholder: 'Maximálna suma',
                icon: const Icon(
                  Icons.attach_money_outlined,
                  color: AppColors.secondary,
                ),
              )
            ],
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
