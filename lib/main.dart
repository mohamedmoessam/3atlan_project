import 'package:final_one/Cart/CheckOut_page.dart';
import 'package:final_one/Home/Acessories/Item_Accessories_Widget.dart';
import 'package:final_one/Home/Services/Services_page.dart';
import 'package:flutter/material.dart';
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






      },
      initialRoute: LoginScreen.RouteName,
    );
  }
}



