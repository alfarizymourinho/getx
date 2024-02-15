// detail_pasien_view.dart
import 'package:flutter/material.dart';
import 'package:getx_paris/app/data/models/pasien_model.dart';

class DetailPasienView extends StatelessWidget {
  final Pasien pasien;

  DetailPasienView({required this.pasien});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pasien'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: ${pasien.name}'),
            Text('Jenis Kelamin: ${pasien.jeniskelamin}'),
            Text('Alamat: ${pasien.alamat}'),
            Text('Tanggal Lahir: ${pasien.tglLahir}'),
            Text('No. Telp: ${pasien.noTelp}'),
          ],
        ),
      ),
    );
  }
}