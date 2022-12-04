import 'package:flutter/material.dart';
import 'package:living_app/models/user.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/utils/network/request_helper.dart';
import 'package:living_app/utils/network/services/web_service.dart';
import 'package:living_app/widgets/buttons/icon_button.dart';
import 'package:living_app/widgets/layouts/action_bar.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/minors/cached_image.dart';
import 'package:living_app/widgets/minors/custom_divider.dart';
import 'package:living_app/widgets/minors/error_layout.dart';
import 'package:living_app/widgets/texts/list_title.dart';
import 'package:living_app/widgets/texts/var_text.dart';

import '../../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with RouteAware {
  late List<Widget> _optionsList;
  late WebService _webService;
  String loggedUser = 'c459e3a9-3152-4953-a972-e4130a8323df';
  User? _userData;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _webService = WebService();
    updateScreen();
  }

  void updateScreen() {
    _webService.getUserDetail(loggedUser).then(
      (res) {
        setState(() {
          _isError = false;
          _userData = res;
          _optionsList = [
            const ListTitle(text: 'Všeobecné'),
            const Option(
              title: 'Nastavenia profilu',
              subTitle: 'Aktualizácie a úprava tvojho profilu',
              route: '/profileSettings',
            ),
            const Option(
              title: 'Nastavenia vyhľadávania',
              subTitle: 'Tvoje preferencie o bývaní na jednom miete',
              route: '/preferences',
            ),
            const Option(
              title: 'Zmena hesla',
              subTitle: 'Raz za čas neuškodí...',
              route: '/privacyProtectionFirst',
              addDivider: false,
            ),
            const ListTitle(text: 'Podpora'),
            const Option(
              title: 'FAQ',
              subTitle: 'Odpovede na najčastejšie otázky',
              route: '/faq',
            ),
            const Option(
              title: 'Kontakt',
              subTitle: 'Napíš nám',
              route: '/contact',
              addDivider: false,
            ),
            const ListTitle(text: 'Iné'),
            const Option(
              title: 'O nás',
              subTitle: 'Zisti viac o našom tíme',
              route: '/aboutUs',
            ),
            const Option(
              title: 'Podmienky používania',
              subTitle: 'Všetko čo potrebuješ vedieť',
              route: '/termsOfUse',
              addDivider: false,
            ),
          ];
        });
      },
    ).onError(
      (error, stackTrace) {
        setState(
          () {
            _isError = true;
          },
        );
        onError(context, error.toString(), false);
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return _isError
        ? ErrorScreen(
            addActionbar: false,
            onPressed: updateScreen,
          )
        : _userData != null
            ? Parent(
                child: Column(
                  children: [
                    ActionBar(
                      backArrow: false,
                      actionsRight: [
                        IconButtonCustom(
                          color: AppColors.black,
                          icon: const Icon(Icons.logout_rounded),
                          onPressed: () async {},
                        )
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: CachedImage(
                                      imageUrl: _userData?.photo,
                                      defaultRadius: 32,
                                      defaultFontSize: 21,
                                      defaultContent:
                                          '${_userData!.firstName[0]}${_userData!.lastName[0]}',
                                      width: 64,
                                      height: 64,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      VarText(
                                        text: '${_userData!.firstName}'
                                            ' ${_userData!.lastName}',
                                        color: AppColors.black,
                                        size: 24,
                                      ),
                                      VarText(
                                        color: AppColors.tertiary,
                                        size: 14,
                                        text: _userData!.email,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _optionsList,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: VarText(
                                  text: 'Verzia 1.0.0',
                                  color: AppColors.tertiary,
                                  size: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container();
  }

  @override
  void didPopNext() {
    updateScreen();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}

class Option extends StatelessWidget {
  final String title;
  final String subTitle;
  final String route;
  final bool addDivider;

  const Option({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.route,
    this.addDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.pushNamed(
          context,
          route,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VarText(
                          textAlign: TextAlign.left,
                          text: title,
                          color: AppColors.black,
                        ),
                        VarText(
                          textAlign: TextAlign.left,
                          color: AppColors.tertiary,
                          size: 12,
                          text: subTitle,
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: AppColors.secondary,
                  ),
                ],
              ),
            ),
            addDivider ? const CustomDivider() : Container(),
          ],
        ),
      ),
    );
  }
}
