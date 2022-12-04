import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:living_app/main.dart';
import 'package:living_app/models/enums/building.dart';
import 'package:living_app/models/people.dart';
import 'package:living_app/screens/people/people_detail.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/utils/network/services/web_service.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/layouts/tabbed_header.dart';
import 'package:living_app/widgets/minors/cached_image.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  @override
  Widget build(BuildContext context) {
    return const Parent(
      child: TabbedHeader(
        title: 'Skupiny',
        tabTitles: [
          'Návrhované',
          'Uložené',
        ],
        actions: [],
        tabContents: [
          RecommendationsScreen(),
          SavedScreen(),
        ],
      ),
    );
  }
}

class RecommendationsScreen extends StatefulWidget {
  const RecommendationsScreen({Key? key}) : super(key: key);

  @override
  State<RecommendationsScreen> createState() => _RecommendationsScreenState();
}

class _RecommendationsScreenState extends State<RecommendationsScreen>
    with AutomaticKeepAliveClientMixin<RecommendationsScreen>, RouteAware {
  List<People> _peoples = [
    People(
        'fd',
        'KOSICE, KVP',
        [
          LocationUser('', 'David', 'Hresko', 'url'),
          LocationUser('', 'David', 'Hresko', 'url'),
          LocationUser('', 'David', 'Hresko', 'url')
        ],
        BuildingType.FLAT,
        420.00),
    People(
        'fd',
        'KOSICE, Tahanovce',
        [
          LocationUser('', 'David', 'Hresko', 'url'),
          LocationUser('', 'David', 'Kokot', 'url'),
          LocationUser('', 'David', 'Hresko', 'url')
        ],
        BuildingType.FLAT,
        420.00)
  ];
  late WebService _webService;

  @override
  void initState() {
    super.initState();
    _webService = WebService();

    // TODO natiahnut z API
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return _peoples.isNotEmpty
        ? Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  color: AppColors.primary,
                  backgroundColor: AppColors.white,
                  onRefresh: () async {},
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    itemCount: _peoples.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        key: ValueKey(index),
                        onTap: () => {
                          Navigator.pushNamed(
                            context,
                            '/peopleDetail',
                            arguments:
                                PeopleDetailArgs(_peoples[index].id, true),
                          ),
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: VarText(
                                                textAlign: TextAlign.center,
                                                text: _peoples[index].location,
                                                color: AppColors.black,
                                                size: 21,
                                              ),
                                            ),
                                            UserPhotos(
                                              users: _peoples[index].users,
                                            ),
                                            Container(
                                              color: AppColors.defaultColor
                                                  .withOpacity(0.4),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      Icons.house_rounded,
                                                      color:
                                                          AppColors.secondary,
                                                      size: 18,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(4, 0, 8, 0),
                                                      child: VarText(
                                                        color:
                                                            AppColors.secondary,
                                                        text: _peoples[index]
                                                            .type
                                                            .toString(),
                                                      ),
                                                    ),
                                                    const Icon(
                                                      Icons
                                                          .monetization_on_rounded,
                                                      color:
                                                          AppColors.secondary,
                                                      size: 18,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(4, 0, 8, 0),
                                                      child: VarText(
                                                        color:
                                                            AppColors.secondary,
                                                        text:
                                                            'do ${_peoples[index].price.toStringAsFixed(2)} €',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: AppColors
                                                          .defaultColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(20),
                                                        bottomRight:
                                                            Radius.circular(20),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {},
                                                          child: const Icon(
                                                            Icons.check_rounded,
                                                            size: 48,
                                                            color: AppColors
                                                                .primary,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 40,
                                                          child:
                                                              VerticalDivider(
                                                            color: AppColors
                                                                .secondary
                                                                .withOpacity(
                                                                    0.2),
                                                            thickness: 1,
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {},
                                                          child: const Icon(
                                                            Icons.close_rounded,
                                                            size: 48,
                                                            color: AppColors
                                                                .secondary,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )
        : RefreshIndicator(
            backgroundColor: AppColors.white,
            color: AppColors.primary,
            onRefresh: () async {
              setState(() {
                // TODO urobit API call
              });
            },
            child: const CustomScrollView(
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                SliverFillRemaining(
                  child: Center(
                    child: VarText(
                      text: "Zatiaľ nemáš žiadne návrhy.",
                      color: AppColors.tertiary,
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  @override
  void didPopNext() {
    // TODO urobit call na API
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen>
    with AutomaticKeepAliveClientMixin<SavedScreen>, RouteAware {
  List<People> _peoples = [
    People(
        'fd',
        'KOSICE, KVP',
        [
          LocationUser('', 'David', 'Hresko', 'url'),
          LocationUser('', 'David', 'Hresko', 'url'),
          LocationUser('', 'David', 'Hresko', 'url')
        ],
        BuildingType.FLAT,
        420.00),
    People(
        'fd',
        'KOSICE, Tahanovce',
        [
          LocationUser('', 'David', 'Hresko', 'url'),
          LocationUser('', 'David', 'Kokot', 'url'),
          LocationUser('', 'David', 'Hresko', 'url')
        ],
        BuildingType.FLAT,
        420.00)
  ];
  late WebService _webService;

  @override
  void initState() {
    super.initState();
    _webService = WebService();

    // TODO natiahnut z API
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return _peoples.isNotEmpty
        ? Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  color: AppColors.primary,
                  backgroundColor: AppColors.white,
                  onRefresh: () async {},
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    itemCount: _peoples.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        key: ValueKey(index),
                        onTap: () => {
                          Navigator.pushNamed(
                            context,
                            '/peopleDetail',
                            arguments: PeopleDetailArgs(
                              _peoples[index].id,
                              false,
                            ),
                          ),
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: VarText(
                                                textAlign: TextAlign.center,
                                                text: _peoples[index].location,
                                                color: AppColors.black,
                                                size: 21,
                                              ),
                                            ),
                                            UserPhotos(
                                              users: _peoples[index].users,
                                            ),
                                            Container(
                                              color: AppColors.defaultColor
                                                  .withOpacity(0.4),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      Icons.house_rounded,
                                                      color:
                                                          AppColors.secondary,
                                                      size: 18,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(4, 0, 8, 0),
                                                      child: VarText(
                                                        color:
                                                            AppColors.secondary,
                                                        text: _peoples[index]
                                                            .type
                                                            .toString(),
                                                      ),
                                                    ),
                                                    const Icon(
                                                      Icons
                                                          .monetization_on_rounded,
                                                      color:
                                                          AppColors.secondary,
                                                      size: 18,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(4, 0, 8, 0),
                                                      child: VarText(
                                                        color:
                                                            AppColors.secondary,
                                                        text:
                                                            'do ${_peoples[index].price.toStringAsFixed(2)} €',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: AppColors
                                                          .defaultColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(20),
                                                        bottomRight:
                                                            Radius.circular(20),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {},
                                                          child: const Icon(
                                                            Icons.check_rounded,
                                                            size: 48,
                                                            color: AppColors
                                                                .primary,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 40,
                                                          child:
                                                              VerticalDivider(
                                                            color: AppColors
                                                                .secondary
                                                                .withOpacity(
                                                                    0.2),
                                                            thickness: 1,
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {},
                                                          child: const Icon(
                                                            Icons.close_rounded,
                                                            size: 48,
                                                            color:
                                                                AppColors.red,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )
        : RefreshIndicator(
            backgroundColor: AppColors.white,
            color: AppColors.primary,
            onRefresh: () async {
              setState(() {
                // TODO urobit API call
              });
            },
            child: const CustomScrollView(
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                SliverFillRemaining(
                  child: Center(
                    child: VarText(
                      text: "Zatiaľ nemáš žiadne návrhy.",
                      color: AppColors.tertiary,
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  @override
  void didPopNext() {
    // TODO urobit call na API
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

class UserPhotos extends StatelessWidget {
  final List<LocationUser> users;

  const UserPhotos({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Stack(
              children: [
                ...users.mapIndexed(
                  (idx, u) => Padding(
                    padding: EdgeInsets.only(
                      left: (40 * idx.toDouble()),
                    ),
                    child: Stack(
                      children: [
                        CachedImage(
                          imageUrl: u.photo,
                          defaultContent:
                              '${u.firstName[0].toUpperCase()}${u.surName[0].toUpperCase()}',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
