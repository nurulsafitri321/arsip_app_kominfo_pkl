
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuti_pegawai/firebase_service.dart';
import 'package:cuti_pegawai/user_data.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';


class UserList extends StatefulWidget{

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  FirebaseService firebaseService = new FirebaseService();

  TextEditingController nama = TextEditingController();

  TextEditingController jabatan = TextEditingController();

  TextEditingController email = TextEditingController();

  List<UserData> daftarUser = [
    UserData("nurul", 21, "nurul@gmail.com"),
    UserData("sonya", 22, "sonya@gmail.com"),
    UserData("cairani", 20, "cairani@gmail.com"),
  ];

  Color btnSimpanColorDefault = Colors.blue;
  Color btnSimpanColor = Colors.blue;
  Color btnUbahColor = Colors.blueGrey;
  String btnSimpanTextDefault = "Simpan";
  String btnSimpanText = "Simpan";
  String btnUbahText = "Ubah";

  bool isReadOnly = false;

  int selectedDaftarUserIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                  controller: jabatan,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "jabatan",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: (){
                        try{

                          if(nama.text.isEmpty || jabatan.text.isEmpty || email.text.isEmpty)
                            throw("Data tidak boleh kosong");

                          if(btnSimpanText == btnSimpanTextDefault){
                            // INI MENUNJUKAN SAVE
                            //kita akan panggil funsi nya disini
                            UserData userData = new UserData(nama.text, int.parse(jabatan.text), email.text);
                            firebaseService.tambah(userData);
                            //daftarUser.add(UserData(nama.text, int.parse(jabatan.text), email.text));
                          }else{
                            UserData userData = new UserData(nama.text, int.parse(jabatan.text), email.text);
                            // userData.nama = nama.text;
                            // userData.jabatan = int.parse(jabatan.text);
                            // userData.email = email.text;
                            firebaseService.ubah(userData);
                            //daftarUser[selectedDaftarUserIndex] = userData;

                            btnSimpanColor = btnSimpanColorDefault;
                            btnSimpanText = btnSimpanTextDefault;
                            setState(() {
                              btnSimpanColor;
                              btnSimpanText;
                            });
                          }

                          setState(() {
                            daftarUser;
                            isReadOnly = false;
                          });

                          nama.text = "";
                          jabatan.text = "";
                          email.text = "";
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

                      // child: Text(btnSimpanText),
                      // style: ElevatedButton.styleFrom(
                      //   backgroundColor: btnSimpanColor,
                      //   minimumSize: Size(100, 50),
                      // ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: (){
                        nama.text = "";
                        jabatan.text = "";
                        email.text = "";
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
                        UserData userData = new UserData(documentSnapshot['nama'], documentSnapshot['jabatan'], documentSnapshot['email']);
                        return Dismissible(
                          key: ValueKey(userData),
                          child: InkWell(
                            child: UserItem(userData),
                            onTap: () {
                              nama.text = userData.nama;
                              jabatan.text = userData.jabatan.toString();
                              email.text = userData.email;
                              btnSimpanColor = btnUbahColor;
                              btnSimpanText = btnUbahText;
                              isReadOnly = true;
                              setState(() {
                                btnSimpanColor;
                                btnSimpanText;
                                isReadOnly;
                              });
                              selectedDaftarUserIndex = index;
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
                            firebaseService.hapus(userData);
                            // daftarUser.removeAt(index);
                            //   setState(() {
                            //     daftarUser;
                            // });
                            // inspect(daftarUser);
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
                            }else{
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