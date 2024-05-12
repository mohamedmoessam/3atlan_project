import 'package:final_one/Home/Acessories/Item_Accessories_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Theme.dart';

class OilScreen extends StatefulWidget {
  static  String RouteName="oil";



  @override
  State<OilScreen> createState() => _ItemsState();
}

class _ItemsState extends State<OilScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> Items1= ['Mobil 5W-30','Mobil 10W-40','Shell Helix 10W-40','Shell Helix 5W-30','Total 5W-30'];
    return Scaffold(
      backgroundColor: MyTheme.PrimaryLight,
      appBar: AppBar(
        backgroundColor: MyTheme.PrimaryLight,elevation: 0,
        title: Image.asset('assets/images/logo_light.png',),
      ),
      body: ItemAccesoriesWidget(Items: Items1, currentoption: Items1[0], text1: 'Car Oil', text2: '450 £', ImagePath: 'assets/images/oil.png',)
    );
  }
}