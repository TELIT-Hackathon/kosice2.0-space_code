import 'package:flutter/material.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/minors/custom_home_card.dart';
import 'package:living_app/widgets/inputs/search_input.dart';
import 'package:living_app/widgets/texts/header.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
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

          GestureDetector(
              child: CustomCard(
                  name: 'trojizbovy byts',
                  address: 'hronska 69',
                  price: 200.0,
                  flatUrl: 'https://images.unsplash.com/photo-1570129477492-45c003edd2be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
            behavior: HitTestBehavior.translucent,
            onTap: () => {
              Navigator.pushNamed(
                context,
                '/accomodationDetail',
                                ),
            },
          )
        ],
      ),
    );
  }
}
