import 'package:cuti_pegawai/firebase_options.dart';
import 'package:cuti_pegawai/user_list.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(UserList());
}
