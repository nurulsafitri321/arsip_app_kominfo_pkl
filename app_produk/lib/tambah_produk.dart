import 'package:app_produk/halaman_produk.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TambahProduk extends StatefulWidget {
  const TambahProduk({super.key});

  @override
  State<TambahProduk> createState() => _TambahProdukState();
}

class _TambahProdukState extends State<TambahProduk> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nama_produk = TextEditingController();
  TextEditingController harga_produk = TextEditingController();

  Future _simpan ()async{
    final respon = 
        await http.post(Uri.parse('http://192.168.136.167/api_produk/create.php'),
        body : {
          'nama_produk' : nama_produk.text,
          'harga_produk' : harga_produk.text,
        });
        if(respon.statusCode == 200){
          return true;
        }
        return false;
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk'),
        backgroundColor: Colors.green,
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: nama_produk,
                decoration: InputDecoration(
                  hintText: 'Nama Produk',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                ),
                validator: (value) {
                  if(value!.isEmpty) {
                    return "Nama Produk tidak boleh kosong !";
                  }
                  return null;
                },
              ), 
                const SizedBox(height: 10),
                TextFormField(
                controller: harga_produk,
                decoration: InputDecoration(
                  hintText: 'Harga Produk',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                ),
                validator: (value) {
                  if(value!.isEmpty) {
                    return "Harga Produk tidak boleh kosong !";
                  }
                  return null;
                },), 
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                  ),
                  
                  onPressed: (){
                  if(formKey.currentState!.validate()){
                    _simpan().then((value) {
                        if(value){
                          final snackBar = SnackBar(
                            content: const Text('Data Berhasil disimpan'),
                          );
                          ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar);
                        }else{
                          final snackBar = SnackBar(
                            content: const Text('Data gagal disimpan'),
                          );
                          ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar);
                        }
                    });
                    Navigator.pushAndRemoveUntil(context, 
                      MaterialPageRoute(
                        builder: ((context)=>const HalamanProduk())), 
                      (route) => false);
                  }
                }, child: const Text('Simpan')) 
            ],),
      ),),
    );
  }
}