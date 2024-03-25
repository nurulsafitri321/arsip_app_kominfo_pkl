import 'package:flutter/material.dart';

class SuratMasukPage extends StatefulWidget {
  @override
  _SuratMasukPageState createState() => _SuratMasukPageState();
}

class _SuratMasukPageState extends State<SuratMasukPage> {
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _nomorSuratController = TextEditingController();
  final TextEditingController _tanggalSuratController = TextEditingController();
  final TextEditingController _sifatSuratController = TextEditingController();
  final TextEditingController _isiRingkasanController = TextEditingController();
  final TextEditingController _dariController = TextEditingController();
  final TextEditingController _kepadaController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  List<Map<String, dynamic>> _suratMasukList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surat Masuk'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _tanggalController,
              decoration: InputDecoration(labelText: 'Tanggal Penerimaan Surat'),
            ),
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
              controller: _isiRingkasanController,
              decoration: InputDecoration(labelText: 'Isi Ringkasan'),
              maxLines: 3,
            ),
            TextFormField(
              controller: _dariController,
              decoration: InputDecoration(labelText: 'Dari'),
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
                // Menyimpan data surat masuk ke dalam list
                final suratMasuk = {
                  'tanggal': _tanggalController.text,
                  'nomorSurat': _nomorSuratController.text,
                  'tanggalSurat': _tanggalSuratController.text,
                  'sifatSurat': _sifatSuratController.text,
                  'isiRingkasan': _isiRingkasanController.text,
                  'dari': _dariController.text,
                  'kepada': _kepadaController.text,
                  'keterangan': _keteranganController.text,
                };
                _suratMasukList.add(suratMasuk);

                // Kosongkan nilai pada TextFormField setelah tombol "Simpan" ditekan
                _tanggalController.clear();
                _nomorSuratController.clear();
                _tanggalSuratController.clear();
                _sifatSuratController.clear();
                _isiRingkasanController.clear();
                _dariController.clear();
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
