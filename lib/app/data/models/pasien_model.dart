// pasien_model.dart
class Pasien {
  int id;
  String nama;
  String jenisKelamin;
  String alamat;
  String tglLahir;
  String noTelp;
  bool isEditable; // Add this property

  Pasien({
    required this.id,
    required this.nama,
    required this.jenisKelamin,
    required this.alamat,
    required this.tglLahir,
    required this.noTelp,
    this.isEditable = false, // Set default value to false
  });

  factory Pasien.fromJson(Map<String, dynamic> json) {
    return Pasien(
      id: json['id'],
      nama: json['name'],
      jenisKelamin: json['jeniskelamin'],
      alamat: json['alamat'],
      tglLahir: json['tglLahir'],
      noTelp: json['noTelp'],
    );
  }

  get jeniskelamin => null;
}