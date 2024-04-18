import 'package:flutter/material.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/clima_screen/clima_screen.dart';
import '../presentation/grafica_screen/grafica_screen.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/pergamino_screen/pergamino_screen.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String homeScreen = '/home_screen';

  static const String pergaminoScreen = '/pergamino_screen';

  static const String graficaScreen = '/grafica_screen';

  static const String climaScreen = '/clima_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    homeScreen: (context) => HomeScreen(),
    pergaminoScreen: (context) => PergaminoScreen(),
    graficaScreen: (context) => GraficaScreen(),
    climaScreen: (context) => ClimaScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => HomeScreen()
  };
}
