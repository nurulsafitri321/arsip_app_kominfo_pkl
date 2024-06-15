import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:surat_app/firebase_options.dart';
import 'package:surat_app/splashScreen/splash_screen.dart';
//import 'package:surat_app/view/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );  
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Arsip Surat App",
        theme: ThemeData(),
        home: OnboardScreen(),
      ),
    )
  );
}

