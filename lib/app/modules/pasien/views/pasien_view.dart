// pasien_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_paris/app/data/models/pasien_model.dart';

import 'show_pasien_view.dart';
import 'package:getx_paris/app/modules/pasien/controllers/pasien_controller.dart';

class PasienView extends StatelessWidget {
  final PasienController controller = Get.put(PasienController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Pasien'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.toNamed('/tambah-pasien');
            },
          ),
        ],
      ),
      body: Obx(
        () => controller.pasienList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.pasienList.length,
                itemBuilder: (context, index) {
                  var pasien = controller.pasienList[index];
                  return ListTile(
                    title: Text(pasien.nama), // Menampilkan nama pasien
                    subtitle: Text(pasien.alamat), // Menampilkan alamat pasien
                    onTap: () {
                      // Pass the 'isEditable' flag to indicate whether it's for editing or viewing
                      pasien.isEditable =
                          false; // Set to false for 'Lihat Detail'
                      controller.showPasienDetails(pasien);
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Navigate to edit page
                            Get.toNamed('/edit-pasien', arguments: pasien);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            // Show details view
                            controller.showPasienDetails(pasien);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Show a confirmation dialog before deleting
                            showDeleteConfirmation(context, pasien);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }

  void showDeleteConfirmation(BuildContext context, Pasien pasien) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Pasien'),
          content: Text('Are you sure you want to delete ${pasien.nama}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Call the deletePasien method from the controller
                controller.deletePasien(pasien);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
