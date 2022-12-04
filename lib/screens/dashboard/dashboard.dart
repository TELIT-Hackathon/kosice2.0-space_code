import 'package:flutter/material.dart';
import 'package:living_app/main.dart';
import 'package:living_app/models/rent.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/utils/network/request_helper.dart';
import 'package:living_app/utils/network/services/web_service.dart';
import 'package:living_app/widgets/inputs/search_input.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/minors/custom_home_card.dart';
import 'package:living_app/widgets/texts/header.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with RouteAware {
  late TextEditingController _searchController;
  late WebService _webService;
  List<Rent> _rents = [];

  void _updateScreen(bool isInit) {
    if (isInit) onLoading(context);
    _webService.getRents().then(
      (res) {
        if (isInit) Navigator.pop(context);
        setState(
          () {
            _rents = res;
          },
        );
      },
    ).onError(
      (error, stackTrace) {
        onError(context, error.toString(), isInit);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _webService = WebService();
    _searchController = TextEditingController();
    _updateScreen(true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: SearchInput(
              controller: _searchController,
              placeholder: 'Začni vyhľadávať...',
              onChanged: (String) {},
              onClear: () {},
            ),
          ),
          const Header(text: 'Ponuky pre teba'),
          _rents.isNotEmpty
              ? Expanded(
                  child: RefreshIndicator(
                    backgroundColor: AppColors.white,
                    color: AppColors.primary,
                    onRefresh: () async {
                      _updateScreen(false);
                    },
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      itemCount: _rents.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => {
                            Navigator.pushNamed(
                              context,
                              '/accomodationDetail',
                            ),
                          },
                          child: CustomCard(
                            name: '${_rents[index].name?.substring(0, 18)}',
                            address:
                                '${_rents[index].street} ${_rents[index].houseNumber}, ${_rents[index].city}',
                            price:
                                _rents[index].pricePerPerson.toInt().toString(),
                            flatUrl: '${_rents[index].photo}',
                          ),
                        );
                      },
                    ),
                  ),
                )
              : Expanded(
                  child: RefreshIndicator(
                    backgroundColor: AppColors.white,
                    color: AppColors.primary,
                    onRefresh: () async {
                      _updateScreen(false);
                    },
                    child: const CustomScrollView(
                      physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      slivers: [
                        SliverFillRemaining(
                          child: Center(
                            child: VarText(
                              color: AppColors.tertiary,
                              text: 'Nenašli sme pre teba žiadne ponuky :( ',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  @override
  void didPopNext() {
    // TODO doplnit api
  }

  @override
  void dispose() {
    _searchController.dispose();
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
