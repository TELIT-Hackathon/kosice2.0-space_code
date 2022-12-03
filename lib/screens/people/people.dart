import 'package:flutter/material.dart';
import 'package:living_app/widgets/layouts/parent.dart';
import 'package:living_app/widgets/layouts/tabbed_header.dart';

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
        title: 'Ľudia',
        tabTitles: [
          'Návrhy',
          'Obľúbené',
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

class _RecommendationsScreenState extends State<RecommendationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
