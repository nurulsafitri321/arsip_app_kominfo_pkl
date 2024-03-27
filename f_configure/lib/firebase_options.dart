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
    apiKey: 'AIzaSyAF-w0BqJDhISLrf03Jq4mZHPaLbF4OvzE',
    appId: '1:32327859139:web:933bbfd674e492c47f1b76',
    messagingSenderId: '32327859139',
    projectId: 'k-firebase-6fc54',
    authDomain: 'k-firebase-6fc54.firebaseapp.com',
    storageBucket: 'k-firebase-6fc54.appspot.com',
    measurementId: 'G-0S940PR2WG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7BPbFGFuUa-nQtZRng4WE4TCKrhj71ds',
    appId: '1:32327859139:android:cc74ac8902af80af7f1b76',
    messagingSenderId: '32327859139',
    projectId: 'k-firebase-6fc54',
    storageBucket: 'k-firebase-6fc54.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbZslp2GB6TLw4ZvVa9kK9KZwWNmWEags',
    appId: '1:32327859139:ios:049c0a2aebd6667a7f1b76',
    messagingSenderId: '32327859139',
    projectId: 'k-firebase-6fc54',
    storageBucket: 'k-firebase-6fc54.appspot.com',
    iosBundleId: 'com.example.fConfigure',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDbZslp2GB6TLw4ZvVa9kK9KZwWNmWEags',
    appId: '1:32327859139:ios:14270d7d733091397f1b76',
    messagingSenderId: '32327859139',
    projectId: 'k-firebase-6fc54',
    storageBucket: 'k-firebase-6fc54.appspot.com',
    iosBundleId: 'com.example.fConfigure.RunnerTests',
  );
}
