import 'package:final_one/Register/Login_page.dart';
import 'package:final_one/Register/Reset_password.dart';
import 'package:flutter/material.dart';
import '../Api_Manager.dart';
import '../Theme.dart';

class VerificationScreen extends StatefulWidget {
  static const String RouteName = "verify";

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  var VerificationController = TextEditingController();

  Future<void> _VerificationCode() async {
    final String verification = VerificationController.text.trim();


    final bool success = await apiManager.VerificationCode(verification: verification);

    if (success) {
      Navigator.pushNamed(context, ResetPassScreen.RouteName);

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
                    'Verification Code',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Regular expression for email validation
                      String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

                      // Create a RegExp object
                      RegExp regExp = RegExp(emailRegex);

                      // Check if the email matches the regular expression
                      if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    controller: VerificationController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: MyTheme.DarkGreyLight,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
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
                      '00:20 resend confirmation code',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _VerificationCode,
                child: Text(
                  'Confirm Code',
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
