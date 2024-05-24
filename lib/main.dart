import 'dart:async';

import 'package:coffee_monitor/services/firebase_service.dart';
import 'package:coffee_monitor/services/sensor_data_service.dart';
import 'package:coffee_monitor/services/model_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/app_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

FirestoreService firestoreService = FirestoreService.instance;
SensorDataService sensorDataService = SensorDataService();
TFLiteService tfliteService = TFLiteService.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ThemeHelper().changeTheme('primary');

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await firestoreService.loadData();
  await tfliteService.loadModel();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'coffee_monitor',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.appNavigationScreen,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
