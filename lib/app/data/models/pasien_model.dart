class Pasien {
  int id;
  String name;
  String jeniskelamin;
  String alamat;
  String tglLahir;
  String noTelp;
  bool isEditable;

  Pasien({
    required this.id,
    required this.name,
    required this.jeniskelamin,
    required this.alamat,
    required this.tglLahir,
    required this.noTelp,
    this.isEditable = false,
  });

  factory Pasien.fromJson(Map<String, dynamic> json) {
    return Pasien(
      id: json['id'],
      name: json['name'],
      jeniskelamin: json['jeniskelamin'],
      alamat: json['alamat'],
      tglLahir: json['tglLahir'],
      noTelp: json['noTelp'],
    );
  }
}