import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/button.dart';
import 'package:living_app/widgets/layouts/collapsible_action_bar.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/texts/clickable_text.dart';
import 'package:living_app/widgets/texts/sub_header.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class AccomodationDetail extends StatefulWidget {
  const AccomodationDetail({Key? key}) : super(key: key);

  @override
  State<AccomodationDetail> createState() => _AccomodationDetailState();
}

class _AccomodationDetailState extends State<AccomodationDetail> {
  @override
  Widget build(BuildContext context) {
    return Parent(
      child: CollapsibleActionBar(
        title: 'Nazov bytu',
        background: CachedNetworkImage(
          cacheKey: '516456',
          imageUrl: 'https://images.unsplash.com/photo-1570129477492-45c003edd2be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
          imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: VarText(
                        text: 'Byt sa nachandza na peknom mieste sicko tam je, aj zit sa da, skola obchod karcma robota, vsade ma clovek blizko fest.',
                        maxLines: 10,
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                ClickableText(
                    text: 'Zobraziť na mape',
                    size: 21,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/accomodationDetail',
                      );

                    } ),
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
          ],
        ),


      ),
    );
  }
}
