import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuti_pegawai_app/model/pegawai_data.dart';

class firebaseService{
  static final COLLECTION_REF ='use';

  final firestore = FirebaseFirestore.instance;
  late final CollectionReference pegawaiRef;

  firebaseService(){
    pegawaiRef = firestore.collection(COLLECTION_REF);
  }

  Stream<QuerySnapshot<Object?>> ambilData(){
    return pegawaiRef.snapshots();
  }

  void tambah(PegawaiData pegawaiData){
    DocumentReference documentReference = pegawaiRef.doc(pegawaiData.nama);
    documentReference.set(pegawaiData.toJson());
  }

  void hapus(PegawaiData pegawaiData){
    DocumentReference documentReference = pegawaiRef.doc(pegawaiData.nama);
    documentReference.delete();
  }

  // ignore: unused_element
  void ubah(PegawaiData pegawaiData){
    DocumentReference documentReference = pegawaiRef.doc(pegawaiData.nama);
    documentReference.update(pegawaiData.toJson());
  }
}