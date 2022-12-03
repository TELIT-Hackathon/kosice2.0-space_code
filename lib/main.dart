import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_app/bottom_navigator.dart';
import 'package:living_app/screens/dashboard/dashboard.dart';
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
        '/people': (context) => const DashboardScreen(),
        '/profile': (context) => const DashboardScreen(),
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
