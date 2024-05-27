import 'package:coffee_monitor/views/login_screen/login_screen.dart';
import 'package:coffee_monitor/views/test_database_screen/test_database_screen.dart';
import 'package:coffee_monitor/services/firebase_service.dart';
import 'package:flutter/material.dart';
import '../views/app_navigation_screen/app_navigation_screen.dart';
import '../views/clima_screen/clima_screen.dart';
import '../views/grafica_screen/grafica_screen.dart';
import '../views/home_screen/home_screen.dart';
import '../views/pergamino_screen/pergamino_screen.dart';

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String homeScreen = '/home_screen';

  static const String pergaminoScreen = '/pergamino_screen';

  static const String graficaScreen = '/grafica_screen';

  static const String climaScreen = '/clima_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String testDatabaseScreen = '/test_database_screen';

  static const String loginScreen = '/login_screen';

  static Map<String, WidgetBuilder> routes = {
    homeScreen: (context) => HomeScreen(),
    pergaminoScreen: (context) =>
        PergaminoScreen(FirestoreService.instance.finca.pergaminoList[0]),
    graficaScreen: (context) =>
        GraficaScreen(FirestoreService.instance.finca.pergaminoList[0]),
    climaScreen: (context) => ClimaScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => HomeScreen(),
    testDatabaseScreen: (context) =>
        TestDatabaseScreen(fincaId: FirestoreService.instance.fincaID),
    loginScreen: (context) => LoginScreen(),
  };
}
