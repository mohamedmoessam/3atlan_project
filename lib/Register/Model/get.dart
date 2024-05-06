import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:final_one/Register/Model/Sign_up.dart';
import 'package:http/http.dart' as http;

class Get {
  Future<SignUp?> register(
      {required String name, required String phone, required String email, required String carmodel, required String caryear}) async {
   Uri url= Uri.parse('http://localhost:8000/signin');
    try{
      final response = await http.get(url);
      var bodyString = response.body;
      var json= jsonDecode(bodyString);
      return SignUp.fromJson(json);

    }catch(e){
      throw e;
    }


  }
}