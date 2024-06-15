import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:surat_app/model/surat_model.dart';
import 'package:surat_app/service/surat_service.dart';

final serviceProvider = StateProvider<SuratService>((ref) {
  return SuratService() ;
});

final fetchDataProvider = StreamProvider<List<SuratModel>>((ref) async* {
  final getData = FirebaseFirestore.instance
  .collection('suratApp')
  .snapshots()
  .map((event) => event.docs
      .map((snapshot) => SuratModel.fromSnapshot(snapshot))
      .toList());
  yield* getData;
});