// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAAC78MTt9VmOv2y2SlUBGC13hcilZhlUc',
    appId: '1:298649704352:web:cd4a9f78ba1b774ddb76c5',
    messagingSenderId: '298649704352',
    projectId: 'coffee-monitor-4a02c',
    authDomain: 'coffee-monitor-4a02c.firebaseapp.com',
    storageBucket: 'coffee-monitor-4a02c.appspot.com',
    measurementId: 'G-ESEJT30C4W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCoGI50wRWn0JUH8GlyqpRBY24Z8AR-3vA',
    appId: '1:298649704352:android:8932911a6dd62eebdb76c5',
    messagingSenderId: '298649704352',
    projectId: 'coffee-monitor-4a02c',
    storageBucket: 'coffee-monitor-4a02c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJjZJ7WVwd8xc2M0u8pgZX6rOVrwL1-gg',
    appId: '1:298649704352:ios:2ed17abfbeccf636db76c5',
    messagingSenderId: '298649704352',
    projectId: 'coffee-monitor-4a02c',
    storageBucket: 'coffee-monitor-4a02c.appspot.com',
    iosBundleId: 'com.coffeemonitor.app.testProject',
  );
}