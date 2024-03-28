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
    apiKey: 'AIzaSyArLLB7Abr-DPPxXDSTAN1XUPFN8SQNslE',
    appId: '1:203355584591:web:bc1403e1137b05c7d2123a',
    messagingSenderId: '203355584591',
    projectId: 'db-arsip',
    authDomain: 'db-arsip.firebaseapp.com',
    storageBucket: 'db-arsip.appspot.com',
    measurementId: 'G-60LXCS9KVS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBoRbJkjw5_GAqXEpYq4Nk63VLePJr_xwc',
    appId: '1:203355584591:android:c1cde6b253fa2a3bd2123a',
    messagingSenderId: '203355584591',
    projectId: 'db-arsip',
    storageBucket: 'db-arsip.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqcWclBFZCOcDsBMsw7qL76J1gmWoUzlM',
    appId: '1:203355584591:ios:f9e21092f992ca2fd2123a',
    messagingSenderId: '203355584591',
    projectId: 'db-arsip',
    storageBucket: 'db-arsip.appspot.com',
    iosBundleId: 'com.example.arsipSuratKominfo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBqcWclBFZCOcDsBMsw7qL76J1gmWoUzlM',
    appId: '1:203355584591:ios:4c74e985e120774ed2123a',
    messagingSenderId: '203355584591',
    projectId: 'db-arsip',
    storageBucket: 'db-arsip.appspot.com',
    iosBundleId: 'com.example.arsipSuratKominfo.RunnerTests',
  );
}
