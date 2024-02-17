// pasien_controller.dart
import 'dart:convert';
import 'package:getx_paris/app/modules/pasien/views/show_pasien_view.dart';
import 'package:getx_paris/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:getx_paris/app/data/models/pasien_model.dart';
import 'package:getx_paris/app/providers/api.dart';
import 'package:http/http.dart' as http;

class PasienController extends GetxController {
  var pasienList = <Pasien>[].obs;

  get isLoading => null;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var apiUrl = '${Api.baseUrl}/pasien';
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body)['data'];
        pasienList
            .assignAll(jsonResponse.map((model) => Pasien.fromJson(model)));
      } else {
        throw Exception('Failed to load pasien');
      }
    } catch (e) {
      print('Error during fetching pasien: $e');
    }
  }

  Future<void> tambahPasien(
    String name,
    String jeniskelamin,
    String alamat,
    String tglLahir,
    String noTelp,
  ) async {
    try {
      if (name.isEmpty ||
          jeniskelamin.isEmpty ||
          alamat.isEmpty ||
          tglLahir.isEmpty ||
          noTelp.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}/pasien/';
      var headers = await Api.getHeaders();

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'name': name,
          'jeniskelamin': jeniskelamin,
          'alamat': alamat,
          'tglLahir': tglLahir,
          'noTelp': noTelp,
        },
      );

      if (response.statusCode == 201) {
        Get.snackbar('Sukses', 'Pasien berhasil ditambahkan');
        fetchData();
        Get.offAndToNamed(Routes.BOTTOM_MENU); // Redirect ke halaman pasien
      } else {
        throw Exception('Failed to add pasien');
      }
    } catch (e) {
      print('Error during tambah pasien: $e');
      if (e is http.Response) {
        print('Response Body: ${e.body}');
      }
    }
  }

  Future<void> editPasien(
    Pasien pasien,
    String name,
    String jeniskelamin,
    String alamat,
    String tglLahir,
    String noTelp,
  ) async {
    try {
      if (name.isEmpty ||
          jeniskelamin.isEmpty ||
          alamat.isEmpty ||
          tglLahir.isEmpty ||
          noTelp.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}/pasien/${pasien.id}';
      var headers = await Api.getHeaders();

      var response = await http.put(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'name': name,
          'jeniskelamin': jeniskelamin,
          'alamat': alamat,
          'tglLahir': tglLahir,
          'noTelp': noTelp,
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'Pasien berhasil diubah');
        fetchData(); // Refresh the pasienList
        Get.offAndToNamed(Routes.PASIEN);
      } else {
        throw Exception('Failed to edit pasien');
      }
    } catch (e) {
      print('Error during edit pasien: $e');
    }
  }

  void showPasienDetails(Pasien pasien) {
    Get.to(() => DetailPasienView(pasien: pasien));
  }

  Future<void> deletePasien(Pasien pasien) async {
    try {
      var apiUrl = '${Api.baseUrl}/pasien/${pasien.id}';
      var headers = await Api.getHeaders();

      var response = await http.delete(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'Pasien berhasil dihapus');
        fetchData();
        // Optionally, you can navigate to a different page after deletion
      } else {
        throw Exception('Failed to delete pasien');
      }
    } catch (e) {
      print('Error during delete pasien: $e');
    }
  }
}