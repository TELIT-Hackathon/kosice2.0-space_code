import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:living_app/widgets/layouts/action_bar.dart';
import 'package:living_app/widgets/layouts/parent.dart';
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
  bool isChecked9 = false;
  bool isChecked10 = false;
  bool isChecked11 = false;
  bool isChecked12 = false;
  bool isChecked13 = false;
  bool isChecked14 = false;
  bool isChecked15 = false;
  bool isChecked16 = false;
  bool isChecked17 = false;

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
                        
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(16, 8, 0,8),
                          child: VarText(text: 'Preferencie', size: 21),
                        ),
                        Divider(
                          indent: 16,
                          endIndent: 16,
                          color: AppColors.secondary,
                        ),

                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.fromLTRB(16, 8, 0,0),
                        child: VarText(text: 'Cena do $_value €', size: 21),
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
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(16, 8, 0,8),
                          child: VarText(text: 'Typ bývania', size: 21),
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
                                        padding: const EdgeInsets.only(left: 16.0),
                                        child: VarText(text: 'Samostatne'),
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
                                        padding: const EdgeInsets.only(left: 16.0),
                                        child: VarText(text: 'Zdieľane'),
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

                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(16, 8, 0,8),
                          child: VarText(text: 'Lokalita', size: 21),
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
                                            padding: const EdgeInsets.only(left: 16.0),
                                            child: VarText(text: 'Košice-Barca'),
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
                                          padding: const EdgeInsets.only(left: 16.0),
                                          child: VarText(text: 'Košice-Juh'),
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
                                          padding: const EdgeInsets.only(left: 16.0),
                                          child: VarText(text: 'Košice-Sever'),
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0, top: 4),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 16.0),
                                          child: VarText(text: 'Košice-Staré Mesto'),
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
                                    padding: const EdgeInsets.only(left: 16.0, top: 4),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 16.0),
                                          child: VarText(text: 'Košice-Ťahanovce'),
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
                                          padding: const EdgeInsets.only(left: 16.0),
                                          child: VarText(text: 'Košice-Západ'),
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

                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.fromLTRB(16, 8, 0,8),
                                    child: VarText(text: 'Vzdelanie', size: 21,),
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
                                                  padding: const EdgeInsets.only(left: 16.0),
                                                  child: VarText(text: 'Materská škola'),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 8.0),
                                                  child: Checkbox(value: isChecked9,
                                                      activeColor: AppColors.primary,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked9 = value!;
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
                                                  padding: const EdgeInsets.only(left: 16.0),
                                                  child: VarText(text: 'Základná škola'),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 8.0),
                                                  child: Checkbox(value: isChecked10,
                                                      activeColor: AppColors.primary,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked10 = value!;
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
                                                  padding: const EdgeInsets.only(left: 16.0),
                                                  child: VarText(text: 'Stredná škola'),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 8.0),
                                                  child: Checkbox(value: isChecked11,
                                                      activeColor: AppColors.primary,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked11 = value!;
                                                        });}
                                                  ),
                                                ),
                                              ],
                                            ),
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
                                                  child: Checkbox(value: isChecked12,
                                                      activeColor: AppColors.primary,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked12 = value!;
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
                                                  padding: const EdgeInsets.only(left: 16.0),
                                                  child: VarText(text: 'Vlastná (nemotorová)'),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 8.0),
                                                  child: Checkbox(value: isChecked17,
                                                      activeColor: AppColors.primary,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked17 = value!;
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
                                                  padding: const EdgeInsets.only(left: 16.0),
                                                  child: VarText(text: 'Vlastná (motorová)'),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 8.0),
                                                  child: Checkbox(value: isChecked13,
                                                      activeColor: AppColors.primary,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked13 = value!;
                                                        });}
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
                                                  child: VarText(text: 'Divadlá'),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 8.0),
                                                  child: Checkbox(value: isChecked14,
                                                      activeColor: AppColors.primary,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked14 = value!;
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
                                                  padding: const EdgeInsets.only(left: 16.0),
                                                  child: VarText(text: 'Kiná'),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 8.0),
                                                  child: Checkbox(value: isChecked15,
                                                      activeColor: AppColors.primary,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked15 = value!;
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
                                                  padding: const EdgeInsets.only(left: 16.0),
                                                  child: VarText(text: 'Športové ihriská'),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 8.0),
                                                  child: Checkbox(value: isChecked16,
                                                      activeColor: AppColors.primary,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked16 = value!;
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
            Button(text: 'Uložiť', color: AppColors.primary, onPressed: () {} ),
          ],

        )
    );
  }
}
