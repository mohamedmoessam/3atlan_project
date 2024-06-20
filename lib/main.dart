import 'package:final_one/Cart/CheckOut_page.dart';
import 'package:final_one/Home/Services/Air/Air-service.dart';
import 'package:final_one/Home/Services/Car-wash/Car-wash.dart';
import 'package:final_one/Home/Services/Electrical/Electrical-service.dart';
import 'package:final_one/Home/Services/Electro-mechanical/ELectro-mechanical_service.dart';
import 'package:final_one/Home/Services/Fuel/fuel-service.dart';
import 'package:final_one/Home/Services/Services_page.dart';
import 'package:final_one/Home/Services/Mechanical/Mechanical_service.dart';
import 'package:final_one/Register/Reset_password.dart';
import 'package:final_one/Register/verification_code.dart';
import 'package:flutter/material.dart';
import 'Home/Services/Nitrogen/Nitrogen_service.dart';
import 'Home/home_screen.dart';
import 'Register/Forgot_Password.dart';
import 'Register/Login_page.dart';
import 'Register/Signup_page.dart';
import 'Theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: MyTheme.LightMode,
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.RouteName: (context)=>LoginScreen(),
        SignupScreen.RouteName: (context)=>SignupScreen(),
        HomeScreen.RouteName: (context)=>HomeScreen(),
        ServiceScreen.RouteName: (context)=>ServiceScreen(),
        CheckoutPage.RouteName: (context)=>CheckoutPage(),
        ForgotPassScreen.RouteName: (context)=>ForgotPassScreen(),
        VerificationScreen.RouteName:(context)=>VerificationScreen(),
        ResetPassScreen.RouteName:(context)=>ResetPassScreen(),
        MechanicalService.RouteName:(context)=>MechanicalService(),
        NitrogenService.RouteName:(context)=>NitrogenService(),
        ElectricalService.RouteName:(context)=>ElectricalService(),
        CarWashService.RouteName:(context)=>CarWashService(),
        AirService.RouteName:(context)=>AirService(),
        FuelService.RouteName:(context)=>FuelService(),
        ElectroMechanicalService.RouteName:(context)=>ElectroMechanicalService(),






      },
      initialRoute: LoginScreen.RouteName,
    );
  }
}



