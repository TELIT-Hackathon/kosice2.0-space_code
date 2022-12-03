import 'package:flutter/material.dart';
import 'package:living_app/widgets/inputs/search_input.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/texts/header.dart';
import 'package:living_app/widgets/texts/sub_header.dart';

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
          const Header(text: 'Aktuálne ponuky'),
          const SubHeader(text: 'na základe tvojích preferencií'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchInput(
              controller: _searchController,
              placeholder: 'Začni vyhľadávať...',
              onChanged: (String) {},
              onClear: () {},
            ),
          ),
        ],
      ),
    );
  }
}
