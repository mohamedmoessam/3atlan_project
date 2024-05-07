import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;


class ApiManager {
  String Ip = '192.168.1.5';

  Future<bool> register({required String name,
    required String phone,
    required String email,
    required String pass,
    required String confirm,
    required String carModel,
    required String carYear}) async {
    String url = ('http://$Ip:8000/signup');
    var data = jsonEncode({
      'name': name,
      'phone': phone,
      'email': email,
      'password': pass,
      'confirmPassword': confirm,
      'carModel': carModel,
      'carYear': carYear
    });
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: data,
    );

    if (response.statusCode == 201) {
      print(response.body);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }


  Future<bool> login({required String email, required String pass}) async {
    String url = ('http://$Ip:8000/signin');
    var data = jsonEncode({'email': email, 'password': pass});
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: data,
    );

    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }
}


