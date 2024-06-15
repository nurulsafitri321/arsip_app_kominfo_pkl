// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';
// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class SuratModel {
  String? docID;
  final String titleSurat;
  final String description;
  final String category;
  final String dateSurat;
  final String timeSurat;
  // final bool isSelesai;

  SuratModel({
    this.docID,
    required this.titleSurat,
    required this.description,
    required this.category,
    required this.dateSurat,
    required this.timeSurat,
    // required this.isSelesai,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docID': docID,
      'titleSurat': titleSurat,
      'description': description,
      'category': category,
      'dateSurat': dateSurat,
      'timeSurat': timeSurat,
      // 'isSelesai': isSelesai,
    };
  }

  factory SuratModel.fromMap(Map<String, dynamic> map) {
    return SuratModel(
      docID: map['docID'] != null ? map['docID'] as String : null,
      titleSurat: map['titleSurat'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      dateSurat: map['dateSurat'] as String,
      timeSurat: map['timeSurat'] as String,
      // isSelesai: map['isSelesai'] as bool,
    );
  }

  factory SuratModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return SuratModel(
      docID: doc.id,
      titleSurat: doc['titleSurat'],
      description: doc['description'],
      category: doc['category'],
      dateSurat: doc['dateSurat'],
      timeSurat: doc['timeSurat'],
      // isSelesai: doc['iSelesai'] ?? false,
    );
  }
}
