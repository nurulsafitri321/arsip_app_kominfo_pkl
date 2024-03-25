import 'package:flutter/material.dart';

class SuratSkPage extends StatefulWidget {
  @override
  _SuratSkPageState createState() => _SuratSkPageState();
}

class _SuratSkPageState extends State<SuratSkPage> {
  DateTime _selectedDate = DateTime.now(); // Variabel untuk menyimpan tanggal yang dipilih
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();
  final TextEditingController _namaPenerimaController = TextEditingController();
  String _ttdSk = ''; // Variabel untuk menyimpan tanda tangan

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate)
      setState(() {
        _selectedDate = pickedDate;
      });
  }

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
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Tanggal',
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "${_selectedDate.toLocal()}".split(' ')[0],
                    ),
                    Icon(Icons.calendar_today),
                  ],
                ),
              ),
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
                  'tanggal': _selectedDate,
                  'alamat': _alamatController.text,
                  'keterangan': _keteranganController.text,
                  'namaPenerima': _namaPenerimaController.text,
                  'ttdSk': _ttdSk,
                };

                // Lakukan sesuatu dengan data surat SK, misalnya simpan ke server

                // Kosongkan nilai pada TextFormField setelah tombol "Simpan" ditekan
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
