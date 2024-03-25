import 'package:arsip_app/main.dart';
import 'package:flutter/material.dart';

class DaftarSuratPage extends StatelessWidget {
  final String title;
  final List<ArsipSurat> suratList;

  DaftarSuratPage({
    required this.title,
    required this.suratList,
  });

  void _hapusSurat(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hapus Surat'),
          content: Text('Anda yakin ingin menghapus surat ini?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Hapus surat dari daftar
                suratList.removeAt(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Surat berhasil dihapus'),
                  ),
                );
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

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
            onTap: () {
              // Menggunakan Navigator.push untuk memanggil halaman edit
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditSuratPage(surat: suratList[index]),
                ),
              ).then((updatedSurat) {
                if (updatedSurat != null) {
                  setState(() {
                    // Perbarui data surat jika ada perubahan dari halaman edit
                    suratList[index] = updatedSurat;
                  });
                }
              });
            },
            onLongPress: () {
              _hapusSurat(context, index);
            },
          );
        },
      ),
    );
  }
  
  void setState(Null Function() param0) {}
}

class EditSuratPage extends StatefulWidget {
  final ArsipSurat surat;

  EditSuratPage({required this.surat});

  @override
  _EditSuratPageState createState() => _EditSuratPageState();
}

class _EditSuratPageState extends State<EditSuratPage> {
  late TextEditingController judulController;
  late TextEditingController pengirimController;

  @override
  void initState() {
    super.initState();
    judulController = TextEditingController(text: widget.surat.judul);
    pengirimController = TextEditingController(text: widget.surat.pengirim);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Surat'),
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
                // Simpan perubahan dan kirim kembali surat yang diperbarui ke halaman sebelumnya
                ArsipSurat updatedSurat = ArsipSurat(
                  judul: judulController.text,
                  pengirim: pengirimController.text,
                  tanggal: widget.surat.tanggal,
                );
                Navigator.pop(context, updatedSurat);
              },
              child: Text('Simpan Perubahan'),
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
