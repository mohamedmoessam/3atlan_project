import 'package:flutter/material.dart';
import '../../Theme.dart';
import '../Cart/Shop_tab.dart';
import '../Profile/Profile_tab.dart';
import 'Home_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String RouteName='home';


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int SelectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.PrimaryLight,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: MyTheme.DarkBlueLight
        ),
        child: BottomNavigationBar(
          currentIndex: SelectedIndex,
          onTap: (index){
            SelectedIndex=index;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,) ,label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,size: 30),label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person,size: 30),label: 'profile')
          ],
        ),
      ),
      body: tabs[SelectedIndex],
    );
  }

  List<Widget> tabs=[Hometab(),Shoptab(),Profiletab()];
}
