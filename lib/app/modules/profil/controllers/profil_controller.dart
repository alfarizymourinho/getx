import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilController extends GetxController {
  var isLoading = true.obs;
  var user = {}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var userData = localStorage.getString('user');
      if (userData != null) {
        user.value = json.decode(userData);
      } else {
        throw Exception('User data not found in SharedPreferences');
      }
    } catch (e) {
      print('Error during fetching user details: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('token');
      localStorage.remove('user');
      Get.offAllNamed('/login');
    } catch (e) {
      print('Error during logout: $e');
    }
  }
}
