// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import 'package:shared_preferences/shared_preferences.dart';

// class Api {
//   static final String baseUrl = 'http://192.168.48.53:8080/api/v1';

//   static final String loginEndpoint = '$baseUrl/login';
//   static final String registerEndpoint = '$baseUrl/register';
//   static final String userEndpoint = '$baseUrl/user';

//   static Future<Map<String, String>> getHeaders() async {
//     SharedPreferences localStorage = await SharedPreferences.getInstance();
//     String? token = localStorage.getString('token');

//     if (token != null) {
//       return {'Authorization': 'Bearer $token'};
//     } else {
//       return {};
//     }
//   }

//   auth(data, apiUrl) async {
//     var fullUrl = baseUrl + apiUrl;
//     return await http.post(Uri.parse(fullUrl),
//         body: jsonEncode(data), headers: await getHeaders());
//   }

//   _getToken() async {
//     SharedPreferences localStorage = await SharedPreferences.getInstance();
//     String? token = jsonDecode(localStorage.getString('token') ?? '')['token'];
//   }

//   getUserData(apiUrl) async {
//     var fullUrl = baseUrl + apiUrl;
//     await _getToken();
//     return await http.get(
//       Uri.parse(fullUrl),
//       headers: await getHeaders(),
//     );
//   }
// }

import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static final String baseUrl = 'http://192.168.107.52:8080/api/v1';

  static Future<Map<String, String>> getHeaders() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');

    if (token != null) {
      return {'Authorization': 'Bearer $token'};
    } else {
      return {};
    }
  }
}