import 'package:final_one/Profile/profile_Widget.dart';
import 'package:flutter/material.dart';
import 'package:switcher_button/switcher_button.dart';
import '../../Theme.dart';

class Profiletab extends StatelessWidget {

  var NameController=TextEditingController();
  var PhoneController=TextEditingController();
  var EmailController=TextEditingController();
  var PasswordController=TextEditingController();
  var CarModelController=TextEditingController();
  var CarYearController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.PrimaryLight,
      appBar: AppBar(
        backgroundColor: MyTheme.PrimaryLight,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: MyTheme.OrangeLight,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 1,
                margin: EdgeInsets.only(top: 70),
                color: MyTheme.BabyBlueLight,
              ),
              Container(
                  child: Column(children: [
                    Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: MyTheme.WhiteLight,
                          child: Icon(
                            Icons.person,
                            color: MyTheme.BlackLight,
                            size: 100,
                          ),
                        )),
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
                            text: NameController.text,
                          ),
                          RoundedContainer(
                            title: 'Phone',
                            text: PhoneController.text,
                          ),
                          RoundedContainer(
                            title: 'Email',
                            text: EmailController.text,
                          ),
                          RoundedContainer(
                            title: 'Car Model',
                            text: CarModelController.text,
                          ),
                          RoundedContainer(
                            title: 'Car Year',
                            text: CarYearController.text,
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
                              onPressed: () {},
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
                  ]))
            ],
          ),
        ],
      ),

    );
  }
}

