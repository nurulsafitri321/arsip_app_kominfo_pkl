import 'package:flutter/material.dart';

class SuratTugasPage extends StatefulWidget {
  @override
  _SuratTugasPageState createState() => _SuratTugasPageState();
}

class _SuratTugasPageState extends State<SuratTugasPage> {
  final TextEditingController _noSPTController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _tujuanController = TextEditingController();
  final TextEditingController _isiRingkasanController = TextEditingController();
  final TextEditingController _kepadaController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  List<Map<String, dynamic>> _suratTugasList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surat Tugas'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _noSPTController,
              decoration: InputDecoration(labelText: 'Nomor SPT'),
            ),
            TextFormField(
              controller: _tanggalController,
              decoration: InputDecoration(labelText: 'Tanggal'),
            ),
            TextFormField(
              controller: _tujuanController,
              decoration: InputDecoration(labelText: 'Tujuan'),
            ),
            TextFormField(
              controller: _isiRingkasanController,
              decoration: InputDecoration(labelText: 'Isi Ringkasan'),
            ),
            TextFormField(
              controller: _kepadaController,
              decoration: InputDecoration(labelText: 'Kepada'),
            ),
            TextFormField(
              controller: _keteranganController,
              decoration: InputDecoration(labelText: 'Keterangan'),
            ),
            SizedBox(height: 20), // Tambahkan jarak antara form dan tombol
            ElevatedButton(
              onPressed: () {
                // Menyimpan data surat tugas ke dalam list
                final suratTugas = {
                  'noSPT': _noSPTController.text,
                  'tanggal': _tanggalController.text,
                  'tujuan': _tujuanController.text,
                  'isiRingkasan': _isiRingkasanController.text,
                  'kepada': _kepadaController.text,
                  'keterangan': _keteranganController.text,
                };
                _suratTugasList.add(suratTugas);

                // Kosongkan nilai pada TextFormField setelah tombol "Simpan" ditekan
                _noSPTController.clear();
                _tanggalController.clear();
                _tujuanController.clear();
                _isiRingkasanController.clear();
                _kepadaController.clear();
                _keteranganController.clear();
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
