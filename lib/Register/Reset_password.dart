import 'package:final_one/Register/Login_page.dart';
import 'package:flutter/material.dart';
import '../Api_Manager.dart';
import '../Theme.dart';

class ResetPassScreen extends StatefulWidget {
  static const String RouteName = "reset";

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  bool hidePassword=true;
  String errorMessage = '';
  var PasswordController = TextEditingController();
  var ConfirmPasswordController = TextEditingController();

  Future<void> _ResetPass() async {
    final String Password = PasswordController.text.trim();
    final String ConfirmPassword = PasswordController.text.trim();


    final bool success = await apiManager.ResetPass(password: Password, confirmPassword: ConfirmPassword);

    if (success) {
      Navigator.pushNamed(context, LoginScreen.RouteName);

    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error')));
    }
  }

  final ApiManager apiManager = ApiManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyTheme.PrimaryLight,
      appBar: AppBar(
        backgroundColor: MyTheme.PrimaryLight,
        elevation: 0,
        title: Text(
          "Forgot Password",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: MyTheme.OrangeLight,
          onPressed: () {
            Navigator.popAndPushNamed(context, LoginScreen.RouteName);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.33,
              child: Center(
                child: Image.asset(
                  'assets/images/forgot.png',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  TextFormField(
                    obscureText: hidePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 3) {
                        return 'Password must be at least 3 characters';
                      }
                      return null; // Return null if the input is valid
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: PasswordController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                          });
                          hidePassword=!hidePassword;
                        },color: MyTheme.BlackLight.withOpacity(0.4),icon: Icon(
                            hidePassword
                                ?Icons.visibility_off
                                :Icons.visibility),),
                        filled: true,
                        fillColor: MyTheme.DarkGreyLight,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                        )
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Confirm Password',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  TextFormField(
                    obscureText: hidePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 3) {
                        return 'Password must be at least 3 characters';
                      }
                      return null; // Return null if the input is valid
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: ConfirmPasswordController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                          });
                          hidePassword=!hidePassword;
                        },color: MyTheme.BlackLight.withOpacity(0.4),icon: Icon(
                            hidePassword
                                ?Icons.visibility_off
                                :Icons.visibility),),
                        filled: true,
                        fillColor: MyTheme.DarkGreyLight,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                        )
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Please write your  new password',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _ResetPass,
                child: Text(
                  'Reset Password',
                  style: TextStyle(color: MyTheme.OrangeLight, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyTheme.DarkBlueLight,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                  ),
                  padding: EdgeInsets.all(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
