
import 'package:cuti_pegawai_app/model/pegawai_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gravatar/flutter_gravatar.dart';


// ignore: must_be_immutable
class PegawaiItem extends StatefulWidget{

  PegawaiData pegawaiData ;
  PegawaiItem(this.pegawaiData);

  @override
  State<PegawaiItem> createState() => _PegawaiItemState();
}

class _PegawaiItemState extends State<PegawaiItem> {

  Gravatar? gravatar ;

  @override
  void initState() {
    /// default values to use in displaying
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    gravatar = Gravatar(widget.pegawaiData.email);
    return  Container(
      padding: const EdgeInsets.all(5),
      child: Row(  
          children: [
            CircleAvatar(
              // backgroundColor: Colors.lightBlue,
              // child: Text(
              //   userData.nama[0].toUpperCase(), 
              //   style: TextStyle(color: Colors.white)
              // ),
              backgroundImage: NetworkImage(gravatar!.imageUrl()),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.pegawaiData.nama, style: const TextStyle(fontWeight: FontWeight.bold),),
                  Text("Jabatan : " + widget.pegawaiData.jabatan.toString() + " " + "Email : " + widget.pegawaiData.email),
                ],
              ),
            )
          ],
        ),
    );
  }
}