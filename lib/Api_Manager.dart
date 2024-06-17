import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Home/Model/Items.dart';



class ApiManager {

  Future<bool> register({required String name,
    required String phone,
    required String email,
    required String pass,
    required String confirm,
    required String carModel,
    required String carYear}) async {
    String url = ('https://threetlana.onrender.com/auth/signup');
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
    String url = ('https://threetlana.onrender.com/auth/signin');
    var data = jsonEncode({'email': email, 'password': pass});
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      body: data,
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final userData = responseData['user'];

      // Check for null values and assign default values if necessary
      String token = responseData['token'] ?? '';
      String name = userData['name'] ?? '';
      String email = userData['email'] ?? '';
      String carModel = userData['carModel'] ?? '';
      int carYear = userData['carYear'] ?? 0;
      String phone = userData['phone'] ?? '';

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', name);
      await prefs.setString('email', email);
      await prefs.setString('carModel', carModel);
      await prefs.setString('carYear', carYear.toString());
      await prefs.setString('phone', phone);
      await prefs.setString('token', token);

      print(userData);
      print(responseData);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  Future<Items> Product() async {
    String url = ('https://threetlana.onrender.com/shop');

    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=utf-8'},

    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print(responseData.runtimeType);
      return Items.fromJson(responseData) ;
    } else {
      print(response.body);
      return throw Exception('Failed to load products');

    }
  }
  Future<bool> AddToCart({
    required String id,
  }) async {
    String url = ('https://threetlana.onrender.com/cart/$id');

    // Retrieve the token from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      print("Token not found in SharedPreferences");
      return false;
    }

    var data = jsonEncode({
      "_id": id,
    });

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token', // Include the token as a Bearer token
      },
      body: data,
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      String message = responseData['message'];
      print(message);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }


  Future<Items> GetCart() async {
    String url = ('https://threetlana.onrender.com/cart');

    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=utf-8'},

    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print(responseData.runtimeType);
      return Items.fromJson(responseData) ;
    } else {
      print(response.body);
      return throw Exception('Failed to load products');

    }
  }


}


