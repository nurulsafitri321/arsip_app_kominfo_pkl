import 'package:flutter/material.dart';

class SuratKeluarPage extends StatefulWidget {
  @override
  _SuratKeluarPageState createState() => _SuratKeluarPageState();
}

class _SuratKeluarPageState extends State<SuratKeluarPage> {
  final TextEditingController _nomorSuratController = TextEditingController();
  final TextEditingController _tanggalSuratController = TextEditingController();
  final TextEditingController _sifatSuratController = TextEditingController();
  final TextEditingController _dalamRangkaController = TextEditingController();
  final TextEditingController _alamatTujuanController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  List<Map<String, dynamic>> _suratKeluarList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surat Keluar'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _nomorSuratController,
              decoration: InputDecoration(labelText: 'Nomor Surat'),
            ),
            TextFormField(
              controller: _tanggalSuratController,
              decoration: InputDecoration(labelText: 'Tanggal Surat'),
            ),
            TextFormField(
              controller: _sifatSuratController,
              decoration: InputDecoration(labelText: 'Sifat Surat'),
            ),
            TextFormField(
              controller: _dalamRangkaController,
              decoration: InputDecoration(labelText: 'Dalam Rangka'),
            ),
            TextFormField(
              controller: _alamatTujuanController,
              decoration: InputDecoration(labelText: 'Alamat Tujuan'),
            ),
            TextFormField(
              controller: _keteranganController,
              decoration: InputDecoration(labelText: 'Keterangan'),
            ),
            SizedBox(height: 20), // Tambahkan jarak antara form dan tombol
            ElevatedButton(
              onPressed: () {
                // Menyimpan data surat keluar ke dalam list
                final suratKeluar = {
                  'nomorSurat': _nomorSuratController.text,
                  'tanggalSurat': _tanggalSuratController.text,
                  'sifatSurat': _sifatSuratController.text,
                  'dalamRangka': _dalamRangkaController.text,
                  'alamatTujuan': _alamatTujuanController.text,
                  'keterangan': _keteranganController.text,
                };
                _suratKeluarList.add(suratKeluar);

                // Kosongkan nilai pada TextFormField setelah tombol "Simpan" ditekan
                _nomorSuratController.clear();
                _tanggalSuratController.clear();
                _sifatSuratController.clear();
                _dalamRangkaController.clear();
                _alamatTujuanController.clear();
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
