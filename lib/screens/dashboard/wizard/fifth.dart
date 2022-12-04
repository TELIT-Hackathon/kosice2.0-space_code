import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/button.dart';
import 'package:living_app/widgets/layouts/action_bar.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/texts/header.dart';
import 'package:living_app/widgets/texts/sub_header.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class FifthWizard extends StatefulWidget {
  const FifthWizard({Key? key}) : super(key: key);

  @override
  State<FifthWizard> createState() => _FifthWizardState();
}

class _FifthWizardState extends State<FifthWizard> {
  bool _isCheckedFirst = false;
  bool _isCheckedSecond = false;
  bool _isCheckedThird = false;
  bool _isCheckedFourth = false;
  bool _isCheckedFifth = false;
  bool _isCheckedSixth = false;
  bool _isCheckedSeventh = false;
  bool _isCheckedEighth = false;
  bool _isCheckedNinth = false;

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Column(
        children: [
          const ActionBar(),
          const Header(text: '5. Spolubývajúci'),
          const SubHeader(
            text: 'Čo by nemalo chýbať v okolí ?',
            maxLines: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.menu_book_outlined,
                          color: AppColors.secondary,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.0),
                          child: VarText(
                            color: AppColors.secondary,
                            text: 'Vzdelanie',
                            size: 21,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const VarText(
                        color: AppColors.secondary,
                        text: 'Materská škola',
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
                        text: 'Stredná škola',
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
                        text: 'Umelecká škola',
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
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.directions_bus_rounded,
                          color: AppColors.secondary,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.0),
                          child: VarText(
                            color: AppColors.secondary,
                            text: 'Doprava',
                            size: 21,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const VarText(
                        color: AppColors.secondary,
                        text: 'MHD',
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
                        text: 'Vlastná (nemotorová)',
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
                        text: 'Vlastná (motorová)',
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.sports_football_rounded,
                          color: AppColors.secondary,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: VarText(
                            color: AppColors.secondary,
                            text: 'Voľný čas',
                            size: 21,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const VarText(
                        color: AppColors.secondary,
                        text: 'Divadlá',
                        size: 18,
                      ),
                      Checkbox(
                        value: _isCheckedSeventh,
                        activeColor: AppColors.primary,
                        onChanged: (bool? value) {
                          setState(() {
                            _isCheckedSeventh = value!;
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
                        text: 'Kiná',
                        size: 18,
                      ),
                      Checkbox(
                        value: _isCheckedEighth,
                        activeColor: AppColors.primary,
                        onChanged: (bool? value) {
                          setState(() {
                            _isCheckedEighth = value!;
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
                        text: 'Športové ihriská',
                        size: 18,
                      ),
                      Checkbox(
                        value: _isCheckedNinth,
                        activeColor: AppColors.primary,
                        onChanged: (bool? value) {
                          setState(() {
                            _isCheckedNinth = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
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
