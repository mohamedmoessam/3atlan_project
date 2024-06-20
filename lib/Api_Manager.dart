import 'dart:convert';
import 'package:final_one/Home/Services/Electro-mechanical/electromechanical.dart';
import 'package:final_one/Home/Services/Mechanical/Mechanical.dart';
import 'package:final_one/Home/Services/Nitrogen/nitrogen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Home/Model/Items.dart';
import 'Home/Services/Air/Air.dart';
import 'Home/Services/Car-wash/Wash.dart';
import 'Home/Services/Electrical/Electrical.dart';
import 'Home/Services/Fuel/Fuel.dart';
import 'Home/Services/car-rescue/Rescue.dart';



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

      String token = responseData['token'] ?? '';
      String userid = userData['id'] ?? '';
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
      await prefs.setString('id', userid);

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

  Future<bool> ConfirmEmail({required String email}) async {
    String url = ('https://threetlana.onrender.com/auth/forget-password');
    var data = jsonEncode({'email': email});
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      body: data,
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print(responseData);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  Future<bool> VerificationCode({required String verification}) async {
    String url = 'https://threetlana.onrender.com/auth/verification';
    var data = jsonEncode({'verification': verification});
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      body: data,
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      String userId = responseData['userId'] ?? '';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', userId);
      print(responseData);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  Future<bool> ResetPass({required String password, required String confirmPassword}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    String url = 'https://threetlana.onrender.com/auth/reset-password/$userId';
    var data = jsonEncode({'password': password, 'confirmPassword': confirmPassword});
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      body: data,
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print(responseData);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  Future<Mechanical> MechanicalService() async {
    String url = ('https://threetlana.onrender.com/service/mechanical');

    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=utf-8'},

    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return Mechanical.fromJson(responseData) ;
    } else {
      print(response.body);
      return throw Exception('Failed to load Service');

    }
  }

  Future<Nitrogen> NitrogenService() async {
    String url = ('https://threetlana.onrender.com/service/nitrogen');

    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=utf-8'},

    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return Nitrogen.fromJson(responseData) ;
    } else {
      print(response.body);
      return throw Exception('Failed to load Service');

    }
  }

  Future<Rescue> CarRescueService() async {
    String url = ('https://threetlana.onrender.com/service/car-rescue');

    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=utf-8'},

    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return Rescue.fromJson(responseData) ;
    } else {
      print(response.body);
      return throw Exception('Failed to load Service');

    }
  }

  Future<Electrical> ElectricalService() async {
    String url = ('https://threetlana.onrender.com/service/electrical');

    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=utf-8'},

    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return Electrical.fromJson(responseData) ;
    } else {
      print(response.body);
      return throw Exception('Failed to load Service');

    }
  }

  Future<Wash> CarWashService() async {
    String url = ('https://threetlana.onrender.com/service/wash');

    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=utf-8'},

    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return Wash.fromJson(responseData) ;
    } else {
      print(response.body);
      return throw Exception('Failed to load Service');

    }
  }

  Future<Air> AirService() async {
    String url = ('https://threetlana.onrender.com/service/air');

    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=utf-8'},

    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return Air.fromJson(responseData) ;
    } else {
      print(response.body);
      return throw Exception('Failed to load Service');

    }
  }


  Future<Fuel> FuelService() async {
    String url = ('https://threetlana.onrender.com/service/fuel');

    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=utf-8'},

    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return Fuel.fromJson(responseData) ;
    } else {
      print(response.body);
      return throw Exception('Failed to load Service');

    }
  }


  Future<Electromechanical> ElectroMechanicalService() async {
    String url = ('https://threetlana.onrender.com/service/electro-mechanical');

    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=utf-8'},

    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return Electromechanical.fromJson(responseData) ;
    } else {
      print(response.body);
      return throw Exception('Failed to load Service');

    }
  }

  Future<bool> bookService({required String userId, required String serviceId}) async {
    String url = 'https://threetlana.onrender.com/service/book-service';
    var data = jsonEncode({'userId': userId, 'serviceId': serviceId});
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        body: data,
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(responseData);
        return true;
      } else {
        print('Error: ${response.statusCode}');
        print('Response: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      return false;
    }
  }


}






