import 'package:final_one/Profile/profile_Widget.dart';
import 'package:final_one/Register/Login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:switcher_button/switcher_button.dart';
import '../../Theme.dart';
import '../Api_Manager.dart';

class Profiletab extends StatefulWidget {
  @override
  State<Profiletab> createState() => _ProfiletabState();
}

class _ProfiletabState extends State<Profiletab> {
  var NameController = TextEditingController();
  var PhoneController = TextEditingController();
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var CarModelController = TextEditingController();
  var CarYearController = TextEditingController();
  final ApiManager apiManager = ApiManager();
  String _username = '';
  String _phone = '';
  String _email = '';
  String _carmodel = '';
  String _caryear = '';

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('name')!;
      _phone = prefs.getString('phone')!;
      _email = prefs.getString('email')!;
      _carmodel = prefs.getString('carModel')!;
      _caryear = prefs.getString('carYear')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.PrimaryLight,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 1,
                margin: EdgeInsets.only(top: 70),
                color: MyTheme.BabyBlueLight,
              ),
              Column(
                  children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: MyTheme.WhiteLight,
                  child: Icon(
                    Icons.person,
                    color: MyTheme.BlackLight,
                    size: 100,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Theme",
                            style: TextStyle(
                                color: MyTheme.BlackLight,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SwitcherButton(
                            value: true,
                            onChange: (value) {
                              print(value);
                            },
                          ),
                        ],
                      ),
                      RoundedContainer(
                        title: 'Name',
                        text: _username,
                      ),
                      RoundedContainer(
                        title: 'Phone',
                        text: _phone,
                      ),
                      RoundedContainer(
                        title: 'Email',
                        text: _email,
                      ),
                      RoundedContainer(
                        title: 'Car Model',
                        text: _carmodel,
                      ),
                      RoundedContainer(
                        title: 'Car Year',
                        text: _caryear,
                      ),
                      Divider(
                        color: MyTheme.OrangeLight,
                        height: 40,
                        thickness: 1,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Change Password',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                    color: MyTheme.BlackLight),
                              ),
                              Icon(
                                Icons.lock,
                                color: MyTheme.OrangeLight,
                                size: 35,
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            backgroundColor: MyTheme.WhiteLight,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(LoginScreen.RouteName);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Logout',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 24,
                                  color: MyTheme.BlackLight,
                                ),
                              ),
                              Icon(
                                Icons.logout_rounded,
                                color: MyTheme.BlackLight,
                                size: 35,
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            backgroundColor: MyTheme.OrangeLight,
                          )),
                    ],
                  ),
                ),
              ])
            ],
          ),
        ],
      ),
    );
  }
}
