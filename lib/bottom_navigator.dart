import 'package:flutter/material.dart';
import 'package:living_app/screens/dashboard/dashboard.dart';
import 'package:living_app/screens/people/people.dart';
import 'package:living_app/screens/profile/profile.dart';
import 'package:living_app/utils/colors.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  late int _selectedIndex;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _screens = <Widget>[
      const DashboardScreen(),
      const PeopleScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Material(
          elevation: 2,
          color: AppColors.primary,
          shape: const StadiumBorder(),
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            unselectedItemColor: Colors.white70,
            selectedIconTheme:
                const IconThemeData(color: AppColors.white, size: 32),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 24,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Domov',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_rounded),
                label: 'Ľudia',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: 'Profil',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      {
        _selectedIndex = index;
      }
    });
  }
}
