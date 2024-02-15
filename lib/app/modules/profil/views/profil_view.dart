// profil_view.dart
import 'package:getx_paris/app/modules/profil/controllers/profil_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilView extends StatelessWidget {
  final ProfilController profilController = Get.put(ProfilController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => profilController.logout(),
          ),
        ],
      ),
      body: Obx(
        () => profilController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   'ID: ${profilController.user['id']}',
                    //   style: TextStyle(fontSize: 18),
                    // ),
                    SizedBox(height: 8),
                    Text(
                      'Nama: ${profilController.user['data']['name']}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Email: ${profilController.user['data']['email']}',
                      style: TextStyle(fontSize: 18),
                    ),
                    // SizedBox(height: 8),
                    // Text(
                    //   'Role: ${profilController.user['role']}',
                    //   style: TextStyle(fontSize: 18),
                    // ),
                    // SizedBox(height: 8),
                    // Text(
                    //   'Dibuat pada: ${profilController.user['created_at']}',
                    //   style: TextStyle(fontSize: 18),
                    // ),
                    // SizedBox(height: 8),
                    // Text(
                    //   'Diperbarui pada: ${profilController.user['updated_at']}',
                    //   style: TextStyle(fontSize: 18),
                    // ),
                  ],
                ),
              ),
      ),
    );
  }
}