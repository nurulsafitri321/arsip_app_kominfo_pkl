import 'package:cuti_pegawai_app/firebase_options.dart';
import 'package:cuti_pegawai_app/screens/pegawai_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(PegawaiList());
}