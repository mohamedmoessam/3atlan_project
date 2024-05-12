import 'package:final_one/Home/Acessories/Item_Accessories_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Theme.dart';

class CarTireScreen extends StatefulWidget {
  static  String RouteName="car";



  @override
  State<CarTireScreen> createState() => _ItemsState();
}

class _ItemsState extends State<CarTireScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> Items1= ['20','22','23','24','25'];
    return Scaffold(
        backgroundColor: MyTheme.PrimaryLight,
        appBar: AppBar(
          backgroundColor: MyTheme.PrimaryLight,elevation: 0,
          title: Image.asset('assets/images/logo_light.png',),
        ),
        body: ItemAccesoriesWidget(Items: Items1, currentoption: Items1[0], text1: 'Car Oil', text2: '450 £', ImagePath: 'assets/images/car_tire.png',)
    );
  }
}