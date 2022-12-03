import 'package:flutter/material.dart';
import 'package:living_app/widgets/layouts/parent.dart';

class PeopleDetailArgs {
  final String peopleId;

  PeopleDetailArgs(this.peopleId);
}

class PeopleDetailScreen extends StatefulWidget {
  const PeopleDetailScreen({Key? key}) : super(key: key);

  @override
  State<PeopleDetailScreen> createState() => _PeopleDetailScreenState();
}

class _PeopleDetailScreenState extends State<PeopleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Parent(
        child: Column(
      children: [],
    ));
  }
}
