
import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:living_app/widgets/layouts/action_bar.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/texts/sub_header.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class ProfilePreferences extends StatefulWidget {
  const ProfilePreferences({Key? key}) : super(key: key);

  @override
  State<ProfilePreferences> createState() => _ProfilePreferencesState();
}

class _ProfilePreferencesState extends State<ProfilePreferences> {
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;
  bool isChecked8 = false;

  double value = 0;
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Parent(
        child: Column(
          children: [
            const ActionBar(),
            Expanded(
              child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [ SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Padding(padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                              child: CachedNetworkImage(
                                cacheKey: '_userData!.ph',
                                imageUrl: 'https://a.pinatafarm.com/312x296/ae7f8ccd22/sad-thumbs-up-cat.jpg/m/522x0',
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
                            )
                        ),
                        Container(alignment: Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                            child: VarText(text: 'Ahoj, volám sa ', size: 18, color: AppColors.secondary,)),
                        Container(alignment: Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                            child: VarText(text: 'Janko Hrasko', size: 24, color: AppColors.primary,)),
                        Padding(
                          padding:  EdgeInsets.only(top: 4),
                          child: Divider(
                            indent: 16,
                            endIndent: 16,
                            color: AppColors.secondary,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 4),
                          child: Row(
                            children: [
                              //DatePicker(date: '01.01.1997', icon: Icons.date_range_outlined, onChange: onChange () {} ),
                              Icon(Icons.person_outline,
                                color: AppColors.secondary,
                                size: 18,),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: VarText(text: 'Vek: 28'),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SubHeader(text: 'Preferencie'),
                        ),
                        Divider(
                          indent: 16,
                          endIndent: 16,
                          color: AppColors.secondary,
                        ),

                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SubHeader(text: 'Cena do $_value €'),
                      ),
                      Slider.adaptive(
                        activeColor: AppColors.primary,
                        inactiveColor: AppColors.secondary.withOpacity(0.1),
                        min: 0,
                        max: 1000,
                        value: _value,
                        onChanged: (value) {
                        setState(() {
                        _value = double.parse((value).toStringAsFixed(2));
                        });
                        },),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SubHeader(text: 'Typ'),
                        ),
                        Row(
                          children: [
                            Expanded(child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0, top: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: VarText(text: 'Dom'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Checkbox(value: isChecked1,
                                            activeColor: AppColors.primary,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked1 = value!;
                                              });}
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0, top: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: VarText(text: 'Byt'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Checkbox(value: isChecked2,
                                            activeColor: AppColors.primary,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked2 = value!;
                                              });}
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],

                            ),),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SubHeader(text: 'Stav'),
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0, top: 4),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: VarText(text: 'Kompletná rekonštrukcia'),
                                          ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: Checkbox(value: isChecked3,
                                              activeColor: AppColors.primary,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  isChecked3 = value!;
                                                });}
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0, top: 4),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: VarText(text: 'Novostavba'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: Checkbox(value: isChecked4,
                                              activeColor: AppColors.primary,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  isChecked4 = value!;
                                                });}
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0, top: 4),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: VarText(text: 'Čiastočná rekonštrukcia'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: Checkbox(value: isChecked5,
                                              activeColor: AppColors.primary,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  isChecked5 = value!;
                                                });}
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),Padding(
                                    padding: const EdgeInsets.only(left: 16.0, top: 4),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: VarText(text: 'Pôvodný stav'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: Checkbox(value: isChecked6,
                                              activeColor: AppColors.primary,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  isChecked6 = value!;
                                                });}
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: SubHeader(text: 'Sociálne zariadenia'),
                                  ),

                                  Row(
                                    children: [
                                      Expanded(child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 16.0, top: 4),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: VarText(text: 'Nemocnica'),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 8.0),
                                                  child: Checkbox(value: isChecked7,
                                                      activeColor: AppColors.primary,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked7 = value!;
                                                        });}
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(left: 16.0, top: 4),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: VarText(text: 'Pošta'),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 8.0),
                                                  child: Checkbox(value: isChecked8,
                                                      activeColor: AppColors.primary,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked8 = value!;
                                                        });}
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],

                                      ),),
                                    ],
                                  ),

                                ],
                              ),
                            ),


                          ],
                        ),

                      ],
                    ),
                  ),
                  ]
              ),
            ),
            Button(text: 'Nadviazať kontakt', color: AppColors.primary, onPressed: () {} ),
          ],

        )
    );
  }
}
