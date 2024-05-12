import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class ApiManager {

  Future<bool> register({required String name,
    required String phone,
    required String email,
    required String pass,
    required String confirm,
    required String carModel,
    required String carYear}) async {
    String url = ('https://threetlana.onrender.com/signup');
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
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      body: data,
    );

    if (response.statusCode == 201) {
      final responseData = json.decode(response.body);
      String message=responseData['message'];
      print(message);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  Future<bool> login({required String email, required String pass}) async {
    String url = ('https://threetlana.onrender.com/signin');
    var data = jsonEncode({'email': email, 'password': pass});
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      body: data,
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final UserData= responseData['user'];
      String name=UserData['name'];
      String email=UserData['email'];
      String carModel=UserData['carModel'];
      int carYear=UserData['carYear'];
      String phone=UserData['phone'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', name);
      await prefs.setString('email', email);
      await prefs.setString('carModel', carModel);
      await prefs.setString('carYear', carYear.toString());
      await prefs.setString('phone', phone);
      // final token =  responseData['token'];
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setString('token', token);
      print(UserData);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }
//   Future<Map<String, dynamic>> GetData() async {
//     // SharedPreferences prefs = await SharedPreferences.getInstance();
//     // final token= prefs.getString('token');
//     // final String url = ('http://$Ip:8000/profile/$token');
//     final String url = ('https://threetlana.onrender.com/profile');
//     final response = await http.get(
//       Uri.parse(url),
//     );
//
//     if (response.statusCode == 200) {
//       final responseData = json.decode(response.body);
//       final Userdata =  json.decode(responseData['user']);
//       String name = Userdata['name'];
//       String email = Userdata['email'];
//       String carModel = Userdata['carModel'];
//       int carYear = Userdata['carYear'];
//       String phone = Userdata['phone'];
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString('name', name);
//       await prefs.setString('email', email);
//       await prefs.setString('carModel', carModel);
//       await prefs.setString('carYear', carYear.toString());
//       await prefs.setString('phone', phone);
//
//       // Parse user data from response body
//       print(Userdata);
//       return Userdata;
//
//     } else {
//
//       throw Exception('Failed to fetch user data');
//     }
//   }
}


