import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuti_pegawai_app/controller/firebase_service.dart';
import 'package:cuti_pegawai_app/controller/firebase_service.dart';
import 'package:cuti_pegawai_app/controller/firebase_service.dart';
import 'package:cuti_pegawai_app/model/pegawai_data.dart';
import 'package:cuti_pegawai_app/screens/pegawai_item.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PegawaiList extends StatefulWidget {
  const PegawaiList({super.key});

  @override
  State<PegawaiList> createState() => _PegawaiListState();
}

class _PegawaiListState extends State<PegawaiList> {

  firebaseService FirebaseService = new firebaseService();

  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController jabatan = TextEditingController();
  TextEditingController unitkerja = TextEditingController();
  TextEditingController jeniscuti = TextEditingController();
  TextEditingController alasancuti = TextEditingController();
  TextEditingController lamacuti = TextEditingController();
  TextEditingController catatancuti = TextEditingController();
  TextEditingController alamatcuti = TextEditingController();
  TextEditingController pertimbangan = TextEditingController();

  List<PegawaiData> daftarPegawai = [
    PegawaiData("nurul", "nurul@gmail.com", "D3 MI", "uasoft", "cuti tahunan", "berlinur", "7 hari", "cuti karena alasan penting", "mekkah", "disetujui"),
    PegawaiData("rahmi", "rahmi@gmail.com", "D3 MI", "uasoft", "cuti tahunan", "berlinur", "7 hari", "cuti karena alasan penting", "mekkah", "disetujui"),    
  ];

  Color btnSimpanColorDefault = Colors.blue;
  Color btnSimpanColor = Colors.blue;
  Color btnUbahColor = Colors.blueGrey;
  String btnSimpanTextDefault = "Simpan";
  String btnSimpanText = "Simpan";
  String btnUbahText = "Ubah";

  bool isReadOnly = false;

  int selectedDaftarPegawaiDataIndex = 0;

  @override
  Widget build(BuildContext context) {
    var firebaseService;
    return  MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: nama,
                  readOnly: isReadOnly,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Nama",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              
              Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: jabatan,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Jabatan",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: unitkerja,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "unitkerja",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: jeniscuti,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "jeniscuti",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: alasancuti,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "alasancuti",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: lamacuti,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "lamacuti",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: catatancuti,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "catatancuti",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: alamatcuti,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "alamatcuti",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: pertimbangan,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "pertimbangan",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Container(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: (){
          try{

            if(nama.text.isEmpty || email.text.isEmpty || jabatan.text.isEmpty || unitkerja.text.isEmpty || jeniscuti.text.isEmpty || alasancuti.text.isEmpty || lamacuti.text.isEmpty || catatancuti.text.isEmpty || alamatcuti.text.isEmpty || pertimbangan.text.isEmpty)
              throw("Data tidak boleh kosong");

            if(btnSimpanText == btnSimpanTextDefault){
              // INI MENUNJUKAN SAVE
              //kita akan panggil funsi nya disini
              PegawaiData pegawaiData = new PegawaiData(nama.text, email.text, jabatan.text, unitkerja.text, jeniscuti.text, alasancuti.text, lamacuti.text, catatancuti.text, alamatcuti.text, pertimbangan.text);
              firebaseService.tambah(pegawaiData);
            }else{
              PegawaiData pegawaiData = new PegawaiData(nama.text, email.text, jabatan.text, unitkerja.text, jeniscuti.text, alasancuti.text, lamacuti.text, catatancuti.text, alamatcuti.text, pertimbangan.text);
              firebaseService.ubah(pegawaiData);

              btnSimpanColor = btnSimpanColorDefault;
              btnSimpanText = btnSimpanTextDefault;
              setState(() {
                btnSimpanColor;
                btnSimpanText;
              });
            }

            setState(() {
              daftarPegawai;
              isReadOnly = false;
            });

            nama.text = "";
            email.text = "";
            jabatan.text = "";
            unitkerja.text = "";
            jeniscuti.text = "";
            alasancuti.text = "";
            lamacuti.text = "";
            catatancuti.text = "";
            alamatcuti.text = "";
            pertimbangan.text = "";
          }catch(e){
            Fluttertoast.showToast(
              msg: '$e'
            );
          }
        }, 
        child: Text(
          btnSimpanText,
          style: TextStyle(color: Colors.white), // Mengatur warna teks menjadi putih
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: btnSimpanColor,
          minimumSize: Size(100, 50),
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: (){
          nama.text = "";
          email.text = "";
          jabatan.text = "";
          unitkerja.text = "";
          jeniscuti.text = "";
          alasancuti.text = "";
          lamacuti.text = "";
          catatancuti.text = "";
          alamatcuti.text = "";
          pertimbangan.text = "";
          btnSimpanColor = btnSimpanColorDefault;
          btnSimpanText = btnSimpanTextDefault;
          isReadOnly = false;
          setState(() {
            btnSimpanColor;
            btnSimpanText;
            false;
          });
        }, 
        child: Text(
          "Clear",
          style: TextStyle(color: Colors.white), // Mengatur warna teks menjadi putih
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          minimumSize: Size(100, 50),
        ),
      ),
    ),
  ],
),

              Divider(
  height: 20,
  thickness: 3,
),
Expanded(
  child: StreamBuilder<QuerySnapshot>(
    stream: firebaseService.ambilData(),
    builder: (context, snapshot) {
      return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index){
          DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
          PegawaiData pegawaiData = PegawaiData(
            documentSnapshot['nama'],
            documentSnapshot['email'],
            documentSnapshot['jabatan'],
            documentSnapshot['unitKerja'],
            documentSnapshot['jenisCuti'],
            documentSnapshot['alasanCuti'],
            documentSnapshot['lamaCuti'],
            documentSnapshot['catatanCuti'],
            documentSnapshot['alamatCuti'],
            documentSnapshot['pertimbangan'],
          );
          return Dismissible(
            key: ValueKey(pegawaiData),
            child: InkWell(
              child: PegawaiItem(pegawaiData),
              onTap: () {
                nama.text = pegawaiData.nama;
                email.text = pegawaiData.email;
                jabatan.text = pegawaiData.jabatan;
                unitkerja.text = pegawaiData.unitkerja;
                jeniscuti.text = pegawaiData.jeniscuti;
                alasancuti.text = pegawaiData.alasancuti;
                lamacuti.text = pegawaiData.lamacuti;
                catatancuti.text = pegawaiData.catatancuti;
                alamatcuti.text = pegawaiData.alamatcuti;
                pertimbangan.text = pegawaiData.pertimbangan;
                btnSimpanColor = btnUbahColor;
                btnSimpanText = btnUbahText;
                isReadOnly = true;
                setState(() {
                  btnSimpanColor;
                  btnSimpanText;
                  isReadOnly;
                });
                selectedDaftarPegawaiDataIndex = index;
              },
            ),
            background: Container(
              padding: EdgeInsets.only(left:25),
              color: Colors.red,
              child: Align(
                alignment: Alignment.centerLeft,
                child:Icon(Icons.delete, color: Colors.white,)),
            ),
            secondaryBackground: Container(
              color: Colors.white,
            ),
            dismissThresholds: {
              DismissDirection.startToEnd: 0.2
            },
            onDismissed: (direction) {
              firebaseService.hapus(PegawaiData);
            },
            confirmDismiss:(direction) async {
              if(direction == DismissDirection.startToEnd){
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirm"),
                      content: const Text("Are you sure you wish to delete this item?"),
                      actions: [
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text("DELETE")
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("CANCEL"),
                        ),
                      ],
                    );
                  },
                );
              } else {
                return false;
              }
            },
          );
        } , 
        separatorBuilder:(context, index) => Divider(), 
        itemCount: snapshot.data!.docs.length
      );
    }
  ),
),

            ],
          ),
        ),
    
      )
    );
  }
}