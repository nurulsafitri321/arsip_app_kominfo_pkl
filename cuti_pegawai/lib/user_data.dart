class UserData {
  String nama;
  String email;
  String jabatan;
  String unitKerja;
  String jenisCuti;
  String alasanCuti;
  String lamaCuti;
  String catatanCuti;
  String alamatCuti;
  String pertimbangan;

  UserData(
      this.nama,
      this.email,
      this.jabatan,
      this.unitKerja,
      this.jenisCuti,
      this.alasanCuti,
      this.lamaCuti,
      this.catatanCuti,
      this.alamatCuti,
      this.pertimbangan, );

  Map<String, dynamic> toJson() {
    return {
      "nama": this.nama,
      "email": this.email,
      "jabatan": this.jabatan,
      "unitKerja": this.unitKerja,
      "jenisCuti": this.jenisCuti,
      "alasanCuti": this.alasanCuti,
      "lamaCuti": this.lamaCuti,
      "catatanCuti": this.catatanCuti,
      "alamatCuti": this.alamatCuti,
      "pertimbangan": this.pertimbangan,
    };
  }
}
