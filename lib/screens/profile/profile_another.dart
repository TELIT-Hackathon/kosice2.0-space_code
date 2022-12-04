import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:living_app/widgets/layouts/action_bar.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/texts/rich_text.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class ProfileAnother extends StatefulWidget {
  const ProfileAnother({Key? key}) : super(key: key);

  @override
  State<ProfileAnother> createState() => _ProfileAnotherState();
}

class _ProfileAnotherState extends State<ProfileAnother> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Parent(
        child: Column(
      children: [
        const ActionBar(),
        Expanded(
          child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                            child: CachedNetworkImage(
                              cacheKey: '_userData!.ph',
                              imageUrl:
                                  'https://a.pinatafarm.com/312x296/ae7f8ccd22/sad-thumbs-up-cat.jpg/m/522x0',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 128,
                                height: 128,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          )),
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                          child: VarText(
                            text: 'Ahoj, volám sa ',
                            size: 18,
                            color: AppColors.secondary,
                          )),
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                          child: VarText(
                            text: 'Janko Hrasko',
                            size: 24,
                            color: AppColors.primary,
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Divider(
                          indent: 16,
                          endIndent: 16,
                          color: AppColors.secondary,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                        child: VarText(text: 'Preferencie', size: 21),
                      ),
                      Divider(
                        indent: 16,
                        endIndent: 16,
                        color: AppColors.secondary,
                      ),
                      RichTextCustom(
                        firstText: 'Cena do ',
                        secondText: '150 €',
                        size: 21,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                        child: VarText(text: 'Typ bývania', size: 21),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16.0, top: 4),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: VarText(text: 'Zdieľane'),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Icon(
                                          Icons.check,
                                          color: AppColors.secondary,
                                          size: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 8, 0, 8),
                                  child: VarText(text: 'Lokalita', size: 21),
                                ),
                                Row(children: [
                                  Expanded(
                                    child: Column(children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, top: 4),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0),
                                              child:
                                                  VarText(text: 'Košice-Barca'),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Icon(
                                                Icons.check,
                                                color: AppColors.secondary,
                                                size: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, top: 4),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0),
                                              child:
                                                  VarText(text: 'Košice-Juh'),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Icon(
                                                Icons.check,
                                                color: AppColors.secondary,
                                                size: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 8, 0, 8),
                                        child: VarText(
                                          text: 'Vzdelanie',
                                          size: 21,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16.0, top: 4),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 16.0),
                                                        child: VarText(
                                                            text:
                                                                'Základná škola'),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 8.0),
                                                        child: Icon(
                                                          Icons.check,
                                                          color: AppColors
                                                              .secondary,
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ]),
                                  )
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.fromLTRB(16, 8, 0,8),
                        child: VarText(text: 'Doprava', size: 21),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: VarText(text: 'MHD'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.check,
                                color: AppColors.secondary,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),


                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.fromLTRB(16, 8, 0,0),
                        child: VarText(text: 'Voľný čas', size: 21),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: VarText(text: 'Športové ihriská'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.check,
                                color: AppColors.secondary,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
        Button(
            text: 'Nadviazať kontakt',
            color: AppColors.primary,
            onPressed: () {}),
      ],
    ));
  }
}
