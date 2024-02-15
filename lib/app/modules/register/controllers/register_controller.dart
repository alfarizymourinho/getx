import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:getx_paris/app/providers/api.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();

  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  void onNameChanged(String value) {
    name.value = value;
  }

  void onEmailChanged(String value) {
    email.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }

  Future<void> register() async {
    try {
      var response = await _performRegistration();
      var responseBody = json.decode(response.body);

      if (response.statusCode == 200 && responseBody['token'] != null) {
        _saveUserData(responseBody);
        Get.offAllNamed('/bottom-menu');
      } else {
        Get.snackbar(
            'Error', 'Registration failed. ${responseBody['message']}');
      }
    } catch (e) {
      print('Error during registration: $e');
      Get.snackbar('Error', 'An error occurred during registration.');
    }
  }

  Future<http.Response> _performRegistration() async {
    var apiUrl = '/register';
    var requestBody = {
      'name': name.value,
      'email': email.value,
      'password': password.value,
      'role': 'member'
    };

    var response = await http.post(
      Uri.parse(Api.baseUrl + apiUrl),
      body: requestBody,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );

    return response;
  }

  void _saveUserData(Map<String, dynamic> responseBody) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('token', responseBody['token']);
    localStorage.setString('user', json.encode(responseBody['data']));
  }
}
