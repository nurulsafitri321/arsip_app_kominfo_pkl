//import 'dart:js_interop_unsafe';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:surat_app/model/surat_model.dart';

class SuratService {
  final suratCollection = FirebaseFirestore.instance.collection('suratApp');

  //create
  void addNewSurat(SuratModel model) {
    suratCollection.add(model.toMap());
  }

  //update
  void updateTask(String? docID, bool? valueUpdate) {
    suratCollection.doc(docID).update({
      'isSelesai': valueUpdate,
    });
  }

  //delete
  void deleteSurat(String? docID) {
    suratCollection.doc(docID).delete();
  }
}
