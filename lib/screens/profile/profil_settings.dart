import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/widgets/buttons/button.dart';
import 'package:living_app/widgets/inputs/basic_input.dart';
import 'package:living_app/widgets/inputs/date_picker.dart';
import 'package:living_app/widgets/layouts/action_bar_profile.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/minors/dropdown_custom.dart';
import 'package:living_app/widgets/texts/clickable_text.dart';
import 'package:living_app/widgets/texts/list_title.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _surNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _pickedGender;
  String? _pickedBirthDate;



  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Column(
        children: [
          ActionBarProfile(title: 'Úprava profilu',),
          Expanded(child: CustomScrollView(physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
                  child: CachedNetworkImage(
                    cacheKey: '_userDat]',
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
                  ),

                  ClickableText(text: 'Editovať fotografiu',
                      color: AppColors.secondary,
                      onPressed: () {}),
                  Container(
                    alignment: Alignment.centerLeft,
                    child:
                    const ListTitle(text: 'Povinné informácie'),
                  ),
                  BasicInput(
                    controller: _firstNameController,
                    placeholder: 'Davidko',
                    icon: const Icon(
                      Icons.person_rounded,
                      color: AppColors.secondary,
                    ),
                  ),
                  BasicInput(
                    controller: _surNameController,
                    placeholder: 'Hresko',
                    icon: const Icon(
                      Icons.person_rounded,
                      color: AppColors.secondary,
                    ),
                  ),
                  BasicInput(
                    textCapitalization: TextCapitalization.none,
                    controller: _emailController,
                    placeholder: 'david.hresko@gmail.com',
                    icon: const Icon(
                      Icons.email_rounded,
                      color: AppColors.secondary,
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                            ),
                            child: DatePicker(
                              icon: Icons.cake_rounded,
                              date: _pickedBirthDate,
                              onChange: (String? value) {
                                setState(() {
                                  _pickedBirthDate = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: DropdownCustom(
                              title: 'Pohlavie',
                              isExpanded: false,
                              titleIcon: Icons.emoji_people_rounded,
                              options: const ['Muž', 'Žena', 'Iné'],
                              value: _pickedGender,
                              onChanged: (String? value) {
                                setState(() {
                                  _pickedGender = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                alignment: Alignment.bottomCenter,
                child:
                Button(text: 'Uložiť',
                    color: AppColors.primary,
                    onPressed: () {}),

              ),
            ),
          ],

          ),
          ),

        ],
      ),
    );
  }
  @override
  void dispose() {
    _firstNameController.dispose();
    _surNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }



}
