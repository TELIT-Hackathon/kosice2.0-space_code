
import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/button.dart';
import 'package:living_app/widgets/inputs/date_picker.dart';
import 'package:living_app/widgets/texts/header.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:living_app/widgets/layouts/action_bar.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/minors/cached_image.dart';
import 'package:living_app/widgets/texts/header.dart';
import 'package:living_app/widgets/texts/rich_text.dart';
import 'package:living_app/widgets/texts/sub_header.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
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
                        Container(
                          alignment: Alignment.centerLeft,

                          child: RichTextCustom(
                            firstText: 'Ahoj, volám sa ',
                            secondText: 'Janko Hrasko',
                            firstSize: 18,
                            secondSize: 24,
                            maxLines: 3,
                          ),
                        ),
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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0, top: 4),
                                    child: Row(
                                      children: [
                                        Checkbox(value: isChecked,
                                           activeColor: AppColors.primary,
                                           onChanged: (bool? value) {
                                          setState(() {
                                          isChecked = value!;
                                          });}
                                        ),
                                           Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: VarText(text: 'Dom'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0, top: 4),
                                    child: Row(
                                      children: [
                                        Checkbox(value: isChecked,
                                            activeColor: AppColors.primary,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });}
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: VarText(text: 'Samostatna izba'),
                                        ),
                                      ],
                                    ),
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
