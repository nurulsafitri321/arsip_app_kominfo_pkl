// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return macos;
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
    apiKey: 'AIzaSyCd2Y33HXFxEUAOvuGdpu18hKoyRh7Z_t4',
    appId: '1:493303279887:web:2eadbfdff520635108ce7a',
    messagingSenderId: '493303279887',
    projectId: 'db-monitormentoring',
    authDomain: 'db-monitormentoring.firebaseapp.com',
    storageBucket: 'db-monitormentoring.appspot.com',
    measurementId: 'G-XD3RZQC1SE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGxhkRL72tyEfMNCC-sJFiASGDY_d3tQ8',
    appId: '1:493303279887:android:07c9cf28555d52c808ce7a',
    messagingSenderId: '493303279887',
    projectId: 'db-monitormentoring',
    storageBucket: 'db-monitormentoring.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCaDZMScukCYH9QbKi3Afx0RA8BHr_WDwo',
    appId: '1:493303279887:ios:ce5d9d1847714d5608ce7a',
    messagingSenderId: '493303279887',
    projectId: 'db-monitormentoring',
    storageBucket: 'db-monitormentoring.appspot.com',
    iosBundleId: 'com.example.monitorMentoring',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCaDZMScukCYH9QbKi3Afx0RA8BHr_WDwo',
    appId: '1:493303279887:ios:255ac4fea76a72dd08ce7a',
    messagingSenderId: '493303279887',
    projectId: 'db-monitormentoring',
    storageBucket: 'db-monitormentoring.appspot.com',
    iosBundleId: 'com.example.monitorMentoring.RunnerTests',
  );
}