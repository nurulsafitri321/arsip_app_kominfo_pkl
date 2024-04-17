class PegawaiData{
  String nama;
  String email;
  String jabatan;
  String unitkerja;
  String jeniscuti;
  String alasancuti;
  String lamacuti;
  String catatancuti;
  String alamatcuti;
  String pertimbangan;

  PegawaiData(this.nama, this.email, this.jabatan, this.unitkerja, this.jeniscuti, this.alasancuti, this.lamacuti, this.catatancuti, this.alamatcuti, this.pertimbangan);

  Map<String, dynamic> toJson(){
    return{
      "nama" : nama,
      "email" : email,
      "jabatan" : jabatan,
      "unit kerja" : unitkerja,
      "jenis cuti" : jeniscuti,
      "alasan cuti" : alasancuti,
      "lamacuti" : lamacuti,
      "catatan cuti" : catatancuti,
      "alamat cuti" : alamatcuti,
      "pertimbangan" : pertimbangan
    };
  }
}