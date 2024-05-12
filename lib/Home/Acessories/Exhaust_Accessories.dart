import 'package:final_one/Home/Acessories/Item_Accessories_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Theme.dart';

class ExhaustScreen extends StatefulWidget {
  static  String RouteName="Exhaust";



  @override
  State<ExhaustScreen> createState() => _ItemsState();
}

class _ItemsState extends State<ExhaustScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> Items1= ['Single Exit Exhaust','Dual Exit Exhaust','Opposite Dual Exhaust','Dual Side Exhaust','High Performance Exhaust'];
    return Scaffold(
      backgroundColor: MyTheme.PrimaryLight,
      appBar: AppBar(
        backgroundColor: MyTheme.PrimaryLight,elevation: 0,
        title: Image.asset('assets/images/logo_light.png',),
      ),
      body: ItemAccesoriesWidget(Items: Items1, currentoption: Items1[0], text1: 'Exhaust', text2: '450 £', ImagePath: 'assets/images/exhaust.png',)
    );
  }
}