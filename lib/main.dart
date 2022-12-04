import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_app/bottom_navigator.dart';
import 'package:living_app/screens/dashboard/accommodation_detail.dart';
import 'package:living_app/screens/dashboard/dashboard.dart';
import 'package:living_app/screens/dashboard/wizard/first.dart';
import 'package:living_app/screens/dashboard/wizard/fourth.dart';
import 'package:living_app/screens/dashboard/wizard/second.dart';
import 'package:living_app/screens/dashboard/wizard/third.dart';
import 'package:living_app/screens/people/people.dart';
import 'package:living_app/screens/people/people_detail.dart';
import 'package:living_app/screens/profile/profile.dart';
import 'package:living_app/screens/profile/profile_preferences.dart';
import 'package:living_app/utils/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  var initialRoute = "/home";

  runApp(LivingApp(
    initialRoute: initialRoute,
  ));
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class LivingApp extends StatefulWidget {
  final String initialRoute;

  const LivingApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  State<LivingApp> createState() => _LivingAppState();
}

class _LivingAppState extends State<LivingApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: AppColors.tertiary.withOpacity(0.4),
          selectionHandleColor: AppColors.primary,
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: AppColors.primary),
      ),
      title: 'Living App',
      debugShowCheckedModeBanner: false,
      initialRoute: widget.initialRoute,
      navigatorObservers: [routeObserver],
      routes: {
        '/home': (context) => const BottomNavigator(),
        '/dashboard': (context) => const DashboardScreen(),
        '/accommodationDetail': (context) => const AccommodationDetail(),
        '/firstWizard': (context) => const FirstWizard(),
        '/secondWizard': (context) => const SecondWizard(),
        '/thirdWizard': (context) => const ThirdWizard(),
        '/fourthWizard': (context) => const FourthWizard(),
        '/people': (context) => const PeopleScreen(),
        '/peopleDetail': (context) => const PeopleDetailScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/profilePreferences': (context) => const ProfilePreferences(),
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
