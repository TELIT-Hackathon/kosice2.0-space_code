import 'package:flutter/material.dart';
import 'package:living_app/models/enums/building.dart';
import 'package:living_app/models/people.dart';
import 'package:living_app/screens/people/people.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/utils/network/services/web_service.dart';
import 'package:living_app/widgets/buttons/icon_button_custom.dart';
import 'package:living_app/widgets/layouts/collapsible_action_bar.dart';
import 'package:living_app/widgets/layouts/error_layout.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/minors/custom_divider.dart';
import 'package:living_app/widgets/minors/custom_home_card.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class PeopleDetailArgs {
  final String peopleId;
  final bool isRecommended;

  PeopleDetailArgs(
    this.peopleId,
    this.isRecommended,
  );
}

class PeopleDetailScreen extends StatefulWidget {
  const PeopleDetailScreen({Key? key}) : super(key: key);

  @override
  State<PeopleDetailScreen> createState() => _PeopleDetailScreenState();
}

class _PeopleDetailScreenState extends State<PeopleDetailScreen> {
  late WebService _webService;
  late PeopleDetailArgs _args;
  bool _isError = false;

  People _people = People(
      'fd',
      'KOSICE, KVP',
      [
        LocationUser('', 'David', 'Hresko', 'url'),
        LocationUser('', 'David', 'Hresko', 'url'),
        LocationUser('', 'David', 'Hresko', 'url')
      ],
      BuildingType.FLAT,
      420.00);

  @override
  void initState() {
    super.initState();
    _webService = WebService();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        _args = ModalRoute.of(context)!.settings.arguments as PeopleDetailArgs;
      },
    );

    // TODO natiahnut z API
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);

    return _isError
        ? ErrorScreen(
            onPressed: () {},
          )
        : Parent(
            child: CollapsibleActionBar(
              title: 'Kosice, KVP',
              actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: IconButtonCustom(
                    color: AppColors.secondary,
                    icon: const Icon(Icons.message_rounded),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: IconButtonCustom(
                    color: AppColors.secondary,
                    icon: const Icon(Icons.settings_rounded),
                    onPressed: () {},
                  ),
                )
              ],
              body: RefreshIndicator(
                backgroundColor: AppColors.white,
                color: AppColors.primary,
                onRefresh: () async {},
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UserPhotos(
                            users: _people.users,
                          ),
                          _args.isRecommended
                              ? const ActionContainer()
                              : Container(),
                          Theme(
                            data: theme,
                            child: ExpansionTile(
                              initiallyExpanded: true,
                              collapsedIconColor: AppColors.secondary,
                              iconColor: AppColors.secondary,
                              title: const VarText(
                                textAlign: TextAlign.start,
                                text: 'Základné preferencie',
                                size: 18,
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: const [
                                                      Icon(
                                                        Icons.house_outlined,
                                                        color:
                                                            AppColors.secondary,
                                                        size: 18,
                                                      ),
                                                      VarText(
                                                        color:
                                                            AppColors.secondary,
                                                        text:
                                                            'Typ ubytovania: ',
                                                      ),
                                                    ],
                                                  ),
                                                  const VarText(
                                                    color: AppColors.secondary,
                                                    text: 'Byt/Dom',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: const [
                                                    Icon(
                                                      Icons.bed_outlined,
                                                      color:
                                                          AppColors.secondary,
                                                      size: 18,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 4.0),
                                                      child: VarText(
                                                        color:
                                                            AppColors.secondary,
                                                        text: 'Počet izieb:',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const VarText(
                                                  color: AppColors.secondary,
                                                  text: '3',
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: const [
                                                      Icon(
                                                        Icons
                                                            .attach_money_rounded,
                                                        color:
                                                            AppColors.secondary,
                                                        size: 18,
                                                      ),
                                                      VarText(
                                                        color:
                                                            AppColors.secondary,
                                                        text: 'Cena na osobu: ',
                                                      ),
                                                    ],
                                                  ),
                                                  VarText(
                                                    color: AppColors.secondary,
                                                    text:
                                                        'do ${_people.price.toStringAsFixed(2)} €',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const CustomDivider(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Theme(
                            data: theme,
                            child: ExpansionTile(
                              initiallyExpanded: true,
                              collapsedIconColor: AppColors.secondary,
                              iconColor: AppColors.secondary,
                              title: const VarText(
                                textAlign: TextAlign.start,
                                text: 'Občianské vybavenie',
                                size: 18,
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: const [
                                                      Icon(
                                                        Icons.house_outlined,
                                                        color:
                                                            AppColors.secondary,
                                                        size: 18,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 4.0),
                                                        child: VarText(
                                                          color: AppColors
                                                              .secondary,
                                                          text: 'Vzdelanie',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const VarText(
                                                    color: AppColors.secondary,
                                                    text: 'Základná škola',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: const [
                                                    Icon(
                                                      Icons
                                                          .local_hospital_outlined,
                                                      color:
                                                          AppColors.secondary,
                                                      size: 18,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 4.0),
                                                      child: VarText(
                                                        color:
                                                            AppColors.secondary,
                                                        text: 'Nemocnica',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const VarText(
                                                  color: AppColors.secondary,
                                                  text: 'Nezáleží',
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: const [
                                                      Icon(
                                                        Icons
                                                            .theater_comedy_outlined,
                                                        color:
                                                            AppColors.secondary,
                                                        size: 18,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 4.0),
                                                        child: VarText(
                                                          color: AppColors
                                                              .secondary,
                                                          text: 'Kultúra',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const VarText(
                                                    color: AppColors.secondary,
                                                    text: 'Áno',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const CustomDivider(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16),
                            child: VarText(
                              text: 'Navrhované ponuky',
                              size: 18,
                            ),
                          ),
                          CustomCard(
                            name: 'Kfdshkjfhdskjf',
                            price: '420.00',
                            flatUrl:
                                'https://psgroup.in/blog/wp-content/uploads/2021/03/pexels-curtis-adams-5178052-1024x683.jpg',
                            address: 'Hronska 205/11',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}

class ActionContainer extends StatelessWidget {
  const ActionContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.defaultColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: const [
                        Icon(
                          Icons.check_rounded,
                          size: 48,
                          color: AppColors.primary,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: VarText(
                            color: AppColors.secondary,
                            text: 'Pridať sa',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: VerticalDivider(
                      color: AppColors.secondary.withOpacity(0.2),
                      thickness: 1,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: const [
                        Icon(
                          Icons.close_rounded,
                          size: 48,
                          color: AppColors.secondary,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: VarText(
                            color: AppColors.secondary,
                            text: 'Odmietnuť',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
