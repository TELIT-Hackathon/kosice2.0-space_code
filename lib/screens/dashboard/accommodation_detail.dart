import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:living_app/models/rent.dart';
import 'package:living_app/utils/colors.dart';
import 'package:living_app/utils/network/request_helper.dart';
import 'package:living_app/utils/network/services/web_service.dart';
import 'package:living_app/widgets/buttons/action_button.dart';
import 'package:living_app/widgets/layouts/collapsible_action_bar.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/minors/error_layout.dart';
import 'package:living_app/widgets/texts/var_text.dart';

class AccommodationDetailArgs {
  final String flatId;

  AccommodationDetailArgs(
    this.flatId,
  );
}

class AccommodationDetail extends StatefulWidget {
  const AccommodationDetail({Key? key}) : super(key: key);

  @override
  State<AccommodationDetail> createState() => _AccommodationDetailState();
}

class _AccommodationDetailState extends State<AccommodationDetail> {
  late WebService _webService;
  late AccommodationDetailArgs _args;
  Rent? _rent;
  bool _isError = false;

  void _updateScreen(bool isInit) {
    if (isInit) onLoading(context);
    _webService.getRentById(_args.flatId).then(
      (res) {
        if (isInit) Navigator.pop(context);
        setState(
          () {
            _rent = res;
            _isError = false;
          },
        );
      },
    ).onError(
      (error, stackTrace) {
        setState(
          () {
            _isError = true;
          },
        );
        onError(context, error.toString(), isInit);
      },
    );
  }

  void _updateError() {
    onLoading(context);
    _webService.getRentById(_args.flatId).then(
      (res) {
        Navigator.pop(context);
        setState(
          () {
            _rent = res;
            _isError = false;
          },
        );
      },
    ).onError(
      (error, stackTrace) {
        setState(
          () {
            _isError = true;
          },
        );
        Navigator.of(context).pop();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _webService = WebService();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        _args = ModalRoute.of(context)!.settings.arguments
            as AccommodationDetailArgs;
        _updateScreen(true);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);

    return _isError
        ? ErrorScreen(
            onPressed: _updateError,
          )
        : _rent != null
            ? Parent(
                child: CollapsibleActionBar(
                  title: _rent!.rentType!,
                  background: CachedNetworkImage(
                    cacheKey: _rent!.photo!.split('?')[0],
                    imageUrl: _rent!.photo!,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          backgroundColor: AppColors.white,
                          color: AppColors.primary,
                          onRefresh: () async {
                            _updateScreen(false);
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: VarText(
                                        text: 'Majiteľ: Štefan Michlík',
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                    ActionButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context,
                                            '/profileAnother',);
                                      },
                                      color: AppColors.primary,
                                      text: 'Kontaktovať',
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 4),
                                child: Divider(
                                  indent: 20,
                                  endIndent: 20,
                                  color: AppColors.secondary,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16.0, top: 4),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.house_outlined,
                                      color: AppColors.secondary,
                                      size: 18,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: VarText(
                                        text:
                                            '${_rent!.street} ${_rent!.houseNumber}, ${_rent!.city}',
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16.0, top: 4),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.bed_outlined,
                                      color: AppColors.secondary,
                                      size: 18,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: VarText(
                                        text:
                                            'Počet izieb: ${_rent!.numberOfRooms}',
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16.0, top: 4),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.square_foot_outlined,
                                      color: AppColors.secondary,
                                      size: 18,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: VarText(
                                        text:
                                            'Rozloha: ${_rent!.squaredMeters} m2',
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 4),
                                child: Divider(
                                  indent: 20,
                                  endIndent: 20,
                                  color: AppColors.secondary,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16.0, top: 4),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.emoji_people_outlined,
                                      color: AppColors.secondary,
                                      size: 18,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: VarText(
                                          text:
                                              'Počet spolubývajúcich: ${_rent!.numberOfOccupants}'),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16.0, top: 4),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.attach_money_outlined,
                                      color: AppColors.secondary,
                                      size: 18,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: VarText(
                                          text:
                                              'Cena na osobu: ${_rent!.pricePerPerson.toInt()} € / mesiac'),
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 4),
                                child: Divider(
                                  indent: 20,
                                  endIndent: 20,
                                  color: AppColors.secondary,
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
                                    text: 'Detailný popis',
                                    size: 18,
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16),
                                      child: VarText(
                                        text: '${_rent!.description}',
                                        maxLines: 10,
                                        textAlign: TextAlign.left,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Column(
                      //   children: [
                      //     ClickableText(
                      //         text: 'Zobraziť na mape',
                      //         size: 21,
                      //         onPressed: () {
                      //           Navigator.pushNamed(
                      //             context,
                      //             '/accomodationDetail',
                      //           );
                      //         }),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              )
            : Container();
  }
}
