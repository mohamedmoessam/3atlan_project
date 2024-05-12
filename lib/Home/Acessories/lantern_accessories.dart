import 'package:final_one/Home/Acessories/Item_Accessories_Widget.dart';
import 'package:flutter/material.dart';
import '../../Theme.dart';

class lanternScreen extends StatefulWidget {
  static  String RouteName="lantern";



  @override
  State<lanternScreen> createState() => _ItemsState();
}

class _ItemsState extends State<lanternScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> Items1= ['LED Lights Bulbs','Zenon Lights Bulbs','HID Light Bulbs','Fog Light Bulbs','Brake Light Bulbs'];
    return Scaffold(
      backgroundColor: MyTheme.PrimaryLight,
      appBar: AppBar(
        backgroundColor: MyTheme.PrimaryLight,elevation: 0,
        title: Image.asset('assets/images/logo_light.png',),
      ),
      body: ItemAccesoriesWidget(Items: Items1, currentoption: Items1[0], text1: 'Car Lantern', text2: '450 £', ImagePath: 'assets/images/lantern.png',)
    );
  }
}