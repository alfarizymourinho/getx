import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_paris/app/modules/pasien/controllers/pasien_controller.dart';

class TambahPasienView extends StatelessWidget {
  final PasienController controller = Get.put(PasienController());
  final RxString jeniskelamin = 'Laki-laki'.obs;
  final Rx<DateTime> tglLahir = Rx<DateTime>(DateTime.now());
  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController noTelpController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: tglLahir.value,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      tglLahir.value = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Pasien'),
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
                    Expanded(
                      child: TextFormField(
                        enabled: false,
                        controller: TextEditingController(
                          text: '${tglLahir.value}',
                        ),
                        decoration: InputDecoration(
                          labelText: 'Tanggal Lahir',
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                      ),
                    ),
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
                  controller.tambahPasien(
                    namaController.text,
                    jeniskelamin.value,
                    alamatController.text,
                    '${tglLahir.value}',
                    noTelpController.text,
                  );
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
        tglLahir.value ==  ||
        noTelpController.text.isEmpty) {
      Get.snackbar('Error', 'Semua field harus diisi');
      return false;
    }
    return true;
  }
}
