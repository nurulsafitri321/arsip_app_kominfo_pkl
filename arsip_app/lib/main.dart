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

class ArsipSurat {
  final String judul;
  final String pengirim;
  final DateTime tanggal;

  ArsipSurat({
    required this.judul,
    required this.pengirim,
    required this.tanggal,
  });
}

class ArsipSuratHomePage extends StatefulWidget {
  @override
  _ArsipSuratHomePageState createState() => _ArsipSuratHomePageState();
}

class _ArsipSuratHomePageState extends State<ArsipSuratHomePage> {
  List<ArsipSurat> suratMasukList = [];
  List<ArsipSurat> suratKeluarList = [];

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
                    builder: (context) => DaftarSuratPage(
                      title: 'Surat Masuk',
                      suratList: suratMasukList,
                    ),
                  ),
                );
              },
              child: Text('Surat Masuk'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DaftarSuratPage(
                      title: 'Surat Keluar',
                      suratList: suratKeluarList,
                    ),
                  ),
                );
              },
              child: Text('Surat Keluar'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TambahSuratPage(),
            ),
          );
          if (result != null) {
            setState(() {
              if (result['jenis'] == 'Masuk') {
                suratMasukList.add(result['surat']);
              } else if (result['jenis'] == 'Keluar') {
                suratKeluarList.add(result['surat']);
              }
            });
          }
        },
        tooltip: 'Tambah Surat',
        child: Icon(Icons.add),
      ),
    );
  }
}

class DaftarSuratPage extends StatelessWidget {
  final String title;
  final List<ArsipSurat> suratList;

  DaftarSuratPage({
    required this.title,
    required this.suratList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: suratList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suratList[index].judul),
            subtitle: Text(suratList[index].pengirim),
            trailing: Text(
              '${suratList[index].tanggal.day}/${suratList[index].tanggal.month}/${suratList[index].tanggal.year}',
            ),
          );
        },
      ),
    );
  }
}

class TambahSuratPage extends StatefulWidget {
  @override
  _TambahSuratPageState createState() => _TambahSuratPageState();
}

class _TambahSuratPageState extends State<TambahSuratPage> {
  late TextEditingController judulController;
  late TextEditingController pengirimController;

  @override
  void initState() {
    super.initState();
    judulController = TextEditingController();
    pengirimController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Surat'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: judulController,
              decoration: InputDecoration(labelText: 'Judul'),
            ),
            TextField(
              controller: pengirimController,
              decoration: InputDecoration(labelText: 'Pengirim'),
            ),
            ElevatedButton(
              onPressed: () {
                DateTime now = DateTime.now();
                ArsipSurat surat = ArsipSurat(
                  judul: judulController.text,
                  pengirim: pengirimController.text,
                  tanggal: now,
                );
                Navigator.pop(
                  context,
                  {'jenis': 'Masuk', 'surat': surat},
                );
              },
              child: Text('Simpan Surat Masuk'),
            ),
            ElevatedButton(
              onPressed: () {
                DateTime now = DateTime.now();
                ArsipSurat surat = ArsipSurat(
                  judul: judulController.text,
                  pengirim: pengirimController.text,
                  tanggal: now,
                );
                Navigator.pop(
                  context,
                  {'jenis': 'Keluar', 'surat': surat},
                );
              },
              child: Text('Simpan Surat Keluar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    judulController.dispose();
    pengirimController.dispose();
    super.dispose();
  }
}
