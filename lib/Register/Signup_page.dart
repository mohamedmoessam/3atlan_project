import 'package:final_one/Api_Manager.dart';
import 'package:final_one/Register/Login_page.dart';
import 'package:flutter/material.dart';
import '../Theme.dart';
import 'Form_widget.dart';

class SignupScreen extends StatefulWidget {
  static const String RouteName="Sign";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}


class _SignupScreenState extends State<SignupScreen> {
final ApiManager apiManager=ApiManager();
  var NameController=TextEditingController();
  var PhoneController=TextEditingController();
  var EmailController=TextEditingController();
  var PasswordController=TextEditingController();
  var ConfirmController=TextEditingController();
  var CarModelController=TextEditingController();
  var CarYearController=TextEditingController();
  String errorMessage='';

Future<void> _register() async {
  final String name = NameController.text;
  final String phone = PhoneController.text;
  final String email = EmailController.text;
  final String pass = PasswordController.text;
  final String confirm = ConfirmController.text;
  final String carModel = CarModelController.text;
  final String carYear = CarYearController.text;


  // Call the Register function of ApiManager
  final bool success = await apiManager.register(name: name,
      phone: phone,
      email: email,
      pass: pass,
      confirm: confirm,
      carModel: carModel,
      carYear: carYear);

  if (success==true) {
    // If Sign Up successful, navigate to login page
   Navigator.of(context).pushNamed(LoginScreen.RouteName);

  } else {

    // If SignUp failed, display error message
    setState(() {
      errorMessage = 'Invalid email or password. Please try again.';
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:MyTheme.PrimaryLight,
      appBar: AppBar(
        backgroundColor: MyTheme.PrimaryLight,elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back),color: MyTheme.OrangeLight ,onPressed:(){
          Navigator.pop(context);
        }),
        title: Image.asset('assets/images/logo_light.png'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
        child: ListView(
          children:[ Column(
            children: [

              FormWidget(title: 'Name', controller: NameController,),
              SizedBox(height: 20,),
              FormWidget(title: 'Phone', controller: PhoneController,),
              SizedBox(height: 20,),
              FormWidget(title: 'Email', controller: EmailController,),
              SizedBox(height: 20,),
              FormWidget(title: 'Password', controller: PasswordController,),
              SizedBox(height: 20,),
              FormWidget(title: 'Confirm-Password', controller: ConfirmController,),
              SizedBox(height: 20,),
              FormWidget(title: 'Car Model', controller: CarModelController,),
              SizedBox(height: 20,),
              FormWidget(title: 'Car Year', controller: CarYearController,),
              SizedBox(height: 40,),
              ElevatedButton(onPressed: (){
                setState(() {

                });
                _register();

              }, child: Text('Sign-Up',style: Theme.of(context).textTheme.titleMedium,),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(horizontal: 35,vertical: 10)
                  )),
              SizedBox(height: 10,),

            ],
          ),
          ],
        ),
      ),
    );
  }
}
