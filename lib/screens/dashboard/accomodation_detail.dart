import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/button.dart';
import 'package:living_app/widgets/layouts/action_bar_accDetail.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/texts/header.dart';
import 'package:living_app/widgets/texts/sub_header.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class AccomodationDetail extends StatefulWidget {
  const AccomodationDetail({Key? key}) : super(key: key);
  final int topPaddingText = 8 ;

  @override
  State<AccomodationDetail> createState() => _AccomodationDetailState();
}

class _AccomodationDetailState extends State<AccomodationDetail> {
  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Column(
        children: [

          ActionBarAccDetail(
            flatUrl:
                'https://a.pinatafarm.com/312x296/ae7f8ccd22/sad-thumbs-up-cat.jpg/m/522x0',
          ),
          SingleChildScrollView(
            child: Expanded(
              child: Column(
                children: [
                  Header(
                    text: 'Nazov bytu',
                    color: AppColors.secondary,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 4),
                    child: Row(
                      children: [
                        Icon(Icons.person_outline_rounded,
                          color: AppColors.secondary,
                          size: 18,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: VarText(
                            text: 'Majiteľ ubytovania: Stefan Michlik',
                            color: AppColors.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                      color: AppColors.secondary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 4),
                    child: Row(
                      children: [
                        Icon(Icons.house_outlined,
                          color: AppColors.secondary,
                          size: 18,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: VarText(
                            text: 'Adresa: Klimkovicova 22, 04001 Kosice',
                            color: AppColors.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 4),
                    child: Row(
                      children: [
                        Icon(Icons.bed_outlined,
                          color: AppColors.secondary,
                          size: 18,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: VarText(
                            text: 'Počet izieb: 3',
                            color: AppColors.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 4),
                    child: Row(
                      children: [
                        Icon(Icons.square_foot_outlined,
                          color: AppColors.secondary,
                          size: 18,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: VarText(
                            text: 'Rozloha: 69 m2',
                            color: AppColors.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                      color: AppColors.secondary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 4),
                    child: Row(
                      children: [
                        Icon(Icons.emoji_people_outlined,
                          color: AppColors.secondary, 
                          size: 18,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: VarText(text: 'Počet spolubývajúcich: 6'),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 4),
                    child: Row(
                      children: [
                        Icon(Icons.attach_money_outlined,
                          color: AppColors.secondary,
                          size: 18,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: VarText(text: 'Cena na osobu: 69 € / mesiac'),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 4),
                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                      color: AppColors.secondary,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only( top: 4),
                    child: SubHeader(text: 'Popis'),
                  ),
                ],
              ),
            ),
          ),
          
          Button(
            text: 'Kontaktovať prenajímateľa', 
            color: AppColors.primary, 
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/accomodationDetail',
                );
               },
          ),
        ],
      ),
    );
  }
}
