import 'package:flutter/material.dart';

class SuratSkPage extends StatefulWidget {
  @override
  _SuratSkPageState createState() => _SuratSkPageState();
}

class _SuratSkPageState extends State<SuratSkPage> {
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();
  final TextEditingController _namaPenerimaController = TextEditingController();

  String _ttdSk = ''; // Variabel untuk menyimpan tanda tangan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surat SK Tahunan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _tanggalController,
              decoration: InputDecoration(labelText: 'Tanggal'),
            ),
            TextFormField(
              controller: _alamatController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            TextFormField(
              controller: _keteranganController,
              decoration: InputDecoration(labelText: 'Keterangan Isi'),
            ),
            TextFormField(
              controller: _namaPenerimaController,
              decoration: InputDecoration(labelText: 'Nama Orang Penerima SK'),
            ),
            // GForm untuk tanda tangan (misalnya dapat menggunakan SignaturePad)
            // UploadField untuk tanda tangan dalam bentuk file
            SizedBox(height: 20), // Tambahkan jarak antara form dan tombol
            ElevatedButton(
              onPressed: () {
                // Menyimpan data surat SK ke dalam variabel atau mengirim ke server
                final suratSK = {
                  'tanggal': _tanggalController.text,
                  'alamat': _alamatController.text,
                  'keterangan': _keteranganController.text,
                  'namaPenerima': _namaPenerimaController.text,
                  'ttdSk': _ttdSk,
                };

                // Lakukan sesuatu dengan data surat SK, misalnya simpan ke server

                // Kosongkan nilai pada TextFormField setelah tombol "Simpan" ditekan
                _tanggalController.clear();
                _alamatController.clear();
                _keteranganController.clear();
                _namaPenerimaController.clear();
                _ttdSk = ''; // Kosongkan tanda tangan
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
