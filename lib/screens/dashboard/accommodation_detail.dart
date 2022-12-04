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
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';


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
  // late int culture = (cult/5*100).round();
  // late int school = (scho/5*100).round();
  // late int buses = (bus/5*100).round();
  // late int hospital = (hosp/5*100).round();


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
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.fromLTRB(16, 8, 16, 0),
                                          child:
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.person_outline,
                                                    color: AppColors.secondary,
                                                    size: 18,
                                                  ),
                                                   Padding(
                                                     padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                                     child: const VarText(
                                                        text: 'Majiteľ: Štefan Michlík',
                                                        color: AppColors.secondary,
                                                      ),
                                                   ),
                                                ],
                                              ),
                                             ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 16.0,),
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
                                      ],
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                      Row(
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
                                                  'Počet izieb: ',
                                              color: AppColors.secondary,
                                            ),
                                          ),
                                        ],
                                      ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0, right: 16),
                                          child: VarText(
                                            text:
                                            ' ${_rent!.numberOfRooms}',
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
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
                                                  'Rozloha: ',
                                              color: AppColors.secondary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 16),
                                        child: VarText(
                                          text:
                                          '${_rent!.squaredMeters} m2',
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
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
                                                    'Počet spolubývajúcich: '),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 16),
                                        child: VarText(
                                            text:
                                            '${_rent!.numberOfOccupants}'),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16.0, top: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
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
                                                    'Cena na osobu: '),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 16),
                                        child: VarText(
                                            text:
                                            '${_rent!.pricePerPerson.toInt()} € / mesiac'),
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

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0, bottom: 8),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.movie_creation_outlined,
                                            color: AppColors.secondary,
                                            size: 18,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: VarText(
                                                text:
                                                'Index kultúrneho vyžitia: '),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16.0),
                                      child: VarText(text: '80 %'),
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0, bottom: 8),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.menu_book_outlined,
                                            color: AppColors.secondary,
                                            size: 18,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: VarText(
                                                text:
                                                'Dostupnosť vzdelania: '),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16.0),
                                      child: VarText(text: '75 %'),
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0, bottom: 8),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.bike_scooter_outlined,
                                            color: AppColors.secondary,
                                            size: 18,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: VarText(
                                                text:
                                                'Dostupnosť nízkoemisnej dopravy: '),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16.0),
                                      child: VarText(text: '65 %'),
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0, bottom: 8),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.local_hospital_outlined,
                                            color: AppColors.secondary,
                                            size: 18,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: VarText(
                                                text:
                                                'Dostupnosť zdravotnej starostlivosti: '),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16.0),
                                      child: VarText(text: '65 %'),
                                    ),
                                  ],
                                ),


                                Theme(
                                  data: theme,
                                  child: ExpansionTile(
                                    initiallyExpanded: false,
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
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  height: 400,
                                  width: MediaQuery.of(context).size.width,

                                  child:
                                  FlutterLocationPicker(
                                    showSelectLocationButton: false,
                                      showLocationController: false,
                                      showZoomController: false,
                                      initPosition: LatLong(_rent!.longitude, _rent!.latitude),
                                      initZoom: 16,
                                      minZoomLevel: 5,
                                      maxZoomLevel: 16,
                                      trackMyPosition: false,
                                      searchBarBackgroundColor: Colors.white,
                                      mapLanguage: 'ar',
                                      onError: (e) => print(e),
                                      onPicked: (pickedData) {
                                        print(pickedData.latLong.latitude);
                                        print(pickedData.latLong.longitude);
                                        print(pickedData.address);
                                        print(pickedData.addressData['country']);
                                      }),
                                ),
                                



                              ],
                            ),
                          ),
                        ),
                      ),

                    ],

                  ),
                ),

              )
            : Container();
  }
}
