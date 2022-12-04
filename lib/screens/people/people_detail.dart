import 'package:flutter/material.dart';
import 'package:living_app/models/people.dart';
import 'package:living_app/models/rent.dart';
import 'package:living_app/screens/dashboard/accommodation_detail.dart';
import 'package:living_app/screens/people/people.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/utils/network/request_helper.dart';
import 'package:living_app/utils/network/services/web_service.dart';
import 'package:living_app/widgets/buttons/icon_button_custom.dart';
import 'package:living_app/widgets/layouts/collapsible_action_bar.dart';
import 'package:living_app/widgets/layouts/error_layout.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/minors/custom_divider.dart';
import 'package:living_app/widgets/minors/custom_home_card.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class PeopleDetailArgs {
  final bool isRecommended;

  PeopleDetailArgs(
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
  String loggedUser = '594694fd-0e1c-4ece-802f-ea4614681172';
  List<String> _freeTime = [];
  List<String> _transport = [];
  List<String> _education = [];

  People? _people;
  List<Rent> _rents = [];

  void _updateScreen(bool isInit) {
    if (isInit) onLoading(context);
    _webService.getPeople(loggedUser).then(
      (res) {
        if (isInit) Navigator.pop(context);
        setState(
          () {
            _people = res;
            _getMarosData();
            if (_people!.rentPreferences.education!.kindergarten)
              _education.add('Materská škola');
            if (_people!.rentPreferences.education!.primarySchool)
              _education.add('Základná škola');
            if (_people!.rentPreferences.education!.highSchool)
              _education.add('Stredná škola');

            if (_people!.rentPreferences.transportation!.publicTransport)
              _transport.add('MHD');
            if (_people!.rentPreferences.transportation!.nonMotor)
              _transport.add('Nemotor.');
            if (_people!.rentPreferences.transportation!.motor)
              _transport.add('Motor.');

            if (_people!.rentPreferences.freeTime!.cinema)
              _freeTime.add('Kino');
            if (_people!.rentPreferences.freeTime!.theater)
              _freeTime.add('Divadlo');
            if (_people!.rentPreferences.freeTime!.sport)
              _freeTime.add('Šport');
          },
        );
      },
    ).onError(
      (error, stackTrace) {
        onError(context, error.toString(), isInit);
      },
    );
  }

  void _getMarosData() {
    _webService.getRentMaros(_people!.rentPreferences).then(
      (res) {
        setState(
          () {
            _rents = res;
          },
        );
      },
    ).onError(
      (error, stackTrace) {
        onError(context, error.toString(), false);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _webService = WebService();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        _args = ModalRoute.of(context)!.settings.arguments as PeopleDetailArgs;
        _updateScreen(true);
      },
    );

    // TODO natiahnut z API rents
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);

    return _isError
        ? ErrorScreen(
            onPressed: () {
              _updateScreen(true);
            },
          )
        : _people != null
            ? Parent(
                child: CollapsibleActionBar(
                  title: _people!.rentPreferences.cityParts!.join(", "),
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
                                users: _people!.users,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: const [
                                                          Icon(
                                                            Icons
                                                                .house_outlined,
                                                            color: AppColors
                                                                .secondary,
                                                            size: 18,
                                                          ),
                                                          VarText(
                                                            color: AppColors
                                                                .secondary,
                                                            text:
                                                                'Typ ubytovania: ',
                                                          ),
                                                        ],
                                                      ),
                                                      const VarText(
                                                        color:
                                                            AppColors.secondary,
                                                        text: 'Byt, Dom',
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
                                                          color: AppColors
                                                              .secondary,
                                                          size: 18,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 4.0),
                                                          child: VarText(
                                                            color: AppColors
                                                                .secondary,
                                                            text:
                                                                'Počet izieb:',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    VarText(
                                                      color:
                                                          AppColors.secondary,
                                                      text:
                                                          '${_people!.users.length - 1}',
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
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
                                                            color: AppColors
                                                                .secondary,
                                                            size: 18,
                                                          ),
                                                          VarText(
                                                            color: AppColors
                                                                .secondary,
                                                            text:
                                                                'Cena na osobu: ',
                                                          ),
                                                        ],
                                                      ),
                                                      VarText(
                                                        color:
                                                            AppColors.secondary,
                                                        text:
                                                            'do ${_people!.rentPreferences.maxPrice!.toInt()} € /mesiac',
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: const [
                                                          Icon(
                                                            Icons
                                                                .house_outlined,
                                                            color: AppColors
                                                                .secondary,
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
                                                      VarText(
                                                        color:
                                                            AppColors.secondary,
                                                        text: _education
                                                            .join(", "),
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
                                                          color: AppColors
                                                              .secondary,
                                                          size: 18,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 4.0),
                                                          child: VarText(
                                                            color: AppColors
                                                                .secondary,
                                                            text: 'Doprava',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    VarText(
                                                      color:
                                                          AppColors.secondary,
                                                      text:
                                                          _transport.join(", "),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
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
                                                            color: AppColors
                                                                .secondary,
                                                            size: 18,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 4.0),
                                                            child: VarText(
                                                              color: AppColors
                                                                  .secondary,
                                                              text: 'Voľný čas',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      VarText(
                                                        color:
                                                            AppColors.secondary,
                                                        text: _freeTime
                                                            .join(", "),
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
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: const VarText(
                                        text: 'Navrhované ponuky',
                                        size: 18,
                                      ),
                                    ),
                                    ..._rents.map((rent) {
                                      return GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () => {
                                          Navigator.pushNamed(
                                            context,
                                            '/accommodationDetail',
                                            arguments: AccommodationDetailArgs(
                                                rent.id),
                                          ),
                                        },
                                        child: CustomCard(
                                          name: '${rent.rentType}',
                                          address:
                                              '${rent.street} ${rent.houseNumber}, ${rent.city}',
                                          state: '${rent.rentState}',
                                          price: rent.pricePerPerson
                                              .toInt()
                                              .toString(),
                                          flatUrl: '${rent.photo}',
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Container();
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
