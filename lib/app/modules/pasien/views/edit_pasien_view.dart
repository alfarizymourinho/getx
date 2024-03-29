// edit_pasien_view.dart
import 'package:getx_paris/app/data/models/pasien_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_paris/app/modules/pasien/controllers/pasien_controller.dart';

class EditPasienView extends StatelessWidget {
  final Pasien pasien;
  final PasienController controller = Get.find<PasienController>();
  final TextEditingController namaController = TextEditingController();
  final RxString jeniskelamin = 'Laki-laki'.obs;
  final TextEditingController alamatController = TextEditingController();
  final RxString tglLahir = ''.obs;
  final TextEditingController noTelpController = TextEditingController();

  EditPasienView({required this.pasien}) {
    namaController.text = pasien.nama;
    jeniskelamin.value = pasien.jenisKelamin;
    alamatController.text = pasien.alamat;
    tglLahir.value = pasien.tglLahir;
    noTelpController.text = pasien.noTelp;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      tglLahir.value = "${picked.year}-${picked.month}-${picked.day}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Pasien'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            Obx(
              () => DropdownButtonFormField<String>(
                value: jeniskelamin.value,
                items: ['Laki-laki', 'Perempuan']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (newValue) {
                  jeniskelamin.value = newValue!;
                },
                decoration: InputDecoration(labelText: 'Jenis Kelamin'),
              ),
            ),
            TextFormField(
              controller: alamatController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            InkWell(
              onTap: () => _selectDate(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Tanggal Lahir',
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Obx(() => Text(tglLahir.value)),
                    Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            TextFormField(
              controller: noTelpController,
              decoration: InputDecoration(labelText: 'No. Telp'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_validateInput()) {
                  // Always call the editPasien method without any conditional checks
                  controller.editPasien(
                    pasien,
                    namaController.text,
                    jeniskelamin.value,
                    alamatController.text,
                    tglLahir.value,
                    noTelpController.text,
                  );
                  // Directly go back to PasienView after saving
                  Get.toNamed("/pasien");
                }
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateInput() {
    if (namaController.text.isEmpty ||
        jeniskelamin.value.isEmpty ||
        alamatController.text.isEmpty ||
        tglLahir.value.isEmpty ||
        noTelpController.text.isEmpty) {
      Get.snackbar('Error', 'Semua field harus diisi');
      return false;
    }
    return true;
  }
}
