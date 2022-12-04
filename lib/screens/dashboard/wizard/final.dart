import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/button.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class FinalWizard extends StatefulWidget {
  const FinalWizard({Key? key}) : super(key: key);

  @override
  FinalWizardState createState() {
    return FinalWizardState();
  }
}

class FinalWizardState extends State<FinalWizard> {
  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '🎉',
                  style: TextStyle(fontSize: 48),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: VarText(
                    size: 28,
                    maxLines: 2,
                    text: 'Tvoje preferencie boli úspešne zmenené !',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: VarText(
                    size: 18,
                    maxLines: 2,
                    color: AppColors.secondary,
                    text: 'Prezri si aktualizovanú ponuku bývania.',
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            alignment: Alignment.bottomCenter,
            child: Button(
              text: 'Zobraziť ponuku',
              color: AppColors.primary,
              onPressed: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName('/home'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
