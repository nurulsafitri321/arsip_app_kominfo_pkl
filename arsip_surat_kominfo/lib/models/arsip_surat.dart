// lib/models/arsip_surat.dart

import 'package:flutter/material.dart';

class ArsipSurat {
  final String judul;
  final String pengirim;
  final DateTime tanggal;
  final String nomorSurat;
  final String sifatSurat;
  final String isiRingkasan;
  final String dari;
  final String kepada;
  final String keterangan;

  ArsipSurat({
    required this.judul,
    required this.pengirim,
    required this.tanggal,
    required this.nomorSurat,
    required this.sifatSurat,
    required this.isiRingkasan,
    required this.dari,
    required this.kepada,
    required this.keterangan,
  });
}
