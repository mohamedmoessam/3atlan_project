import 'package:final_one/Register/Login_page.dart';
import 'package:final_one/Register/verification_code.dart';
import 'package:flutter/material.dart';
import '../Api_Manager.dart';
import '../Theme.dart';

class ForgotPassScreen extends StatefulWidget {
  static const String RouteName = "Forgot";

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  var EmailController = TextEditingController();

  Future<void> _ConfirmEmail() async {
    final String email = EmailController.text.trim();

    final bool success = await apiManager.ConfirmEmail(email: email);

    if (success) {
      Navigator.pushNamed(context, VerificationScreen.RouteName);
    } else {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User not found')));
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
                    'Email Address',
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
                    controller: EmailController,
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
                      'Please write your email to receive a ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'confirmation code to set a new password.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _ConfirmEmail,
                child: Text(
                  'Confirm Email',
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
