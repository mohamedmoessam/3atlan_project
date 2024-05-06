import 'package:final_one/Api_Manager.dart';
import 'package:flutter/material.dart';
import '../Home/home_screen.dart';
import '../Theme.dart';
import 'Form_widget.dart';
import 'Signup_page.dart';

class LoginScreen extends StatefulWidget {
  static const String RouteName="login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var EmailController=TextEditingController();
  var PasswordController=TextEditingController();
  bool hidePassword=true;
  String errorMessage = '';

  Future<void> _login() async {
    final String email = EmailController.text;
    final String password = PasswordController.text;

    // Call the login function of ApiManager
    final bool success = await apiManager.login(email: email, pass: password);

    if (success) {
      // If login successful, navigate to home page
      Navigator.pushNamed(context,HomeScreen.RouteName);
    } else {

      // If login failed, display error message
      setState(() {
        errorMessage = 'Invalid email or password. Please try again.';
      });
    }
  }
  final ApiManager apiManager=ApiManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyTheme.PrimaryLight ,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 40,vertical: 80),
        child: Column(
          children: [
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo_light.png'),
                  ],
                )
            ),
            SizedBox(height: 50,),

            FormWidget(title: 'Email', controller:EmailController ,),
            SizedBox(height: 20,),
            Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Password',
              style: Theme.of(context).textTheme.titleLarge
          ),
          TextField(
            obscureText: hidePassword,
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
                ),
            ),
          ),
        ],
      ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){}, child: Text('Forgot Password ?'),style: TextButton.styleFrom(foregroundColor: MyTheme.BabyBlueLight),),
              ],
            ),
            ElevatedButton(onPressed: (){
              setState(() {

              });
             _login();

            }, child: Text('Login',style: Theme.of(context).textTheme.titleMedium,),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    backgroundColor: MyTheme.OrangeLight,
                    padding: EdgeInsets.symmetric(horizontal: 35,vertical: 10)
                )),
            SizedBox(height: 25,),
            Text('OR'),
            TextButton(onPressed: (){
              Navigator.of(context).pushNamed(SignupScreen.RouteName);
            }, child: Text('Sign-Up'),style: TextButton.styleFrom(foregroundColor: MyTheme.BabyBlueLight),),

          ],
        ),
      ),
    );
  }
}
