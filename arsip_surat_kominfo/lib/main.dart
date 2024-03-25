import 'package:arsip_surat_kominfo/pages/surat_keluar_page.dart';
import 'package:arsip_surat_kominfo/pages/surat_masuk_page.dart';
import 'package:arsip_surat_kominfo/pages/surat_sk_page.dart';
import 'package:arsip_surat_kominfo/pages/surat_tugas_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(ArsipSuratApp());
}

class ArsipSuratApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arsip Surat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArsipSuratHomePage(),
    );
  }
}

class ArsipSuratHomePage extends StatefulWidget {
  @override
  _ArsipSuratHomePageState createState() => _ArsipSuratHomePageState();
}

class _ArsipSuratHomePageState extends State<ArsipSuratHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arsip Surat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SuratMasukPage(),
                  ),
                );
              },
              child: Text('Surat Masuk'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SuratKeluarPage(),
                  ),
                );
              },
              child: Text('Surat Keluar'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SuratTugasPage(),
                  ),
                );
              },
              child: Text('Surat Tugas'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SuratSkPage(),
                  ),
                );
              },
              child: Text('Surat SK Tahunan'),
            ),
          ],
        ),
      ),
    );
  }
}
