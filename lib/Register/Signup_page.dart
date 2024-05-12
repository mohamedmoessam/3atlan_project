import 'package:final_one/Api_Manager.dart';
import 'package:final_one/Register/Login_page.dart';
import 'package:flutter/material.dart';
import '../Theme.dart';


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
  bool hidePassword=true;

final GlobalKey<FormState> _FormKey=GlobalKey<FormState>();


Future<void> _register() async {
  final String name = NameController.text.trim();
  final String phone = PhoneController.text.trim();
  final String email = EmailController.text.trim();
  final String pass = PasswordController.text.trim();
  final String confirm = ConfirmController.text.trim();
  final String carModel = CarModelController.text.trim();
  final String carYear = CarYearController.text.trim();



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
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        child: ListView(
          children:[ Column(
            children: [

              Form(
        key: _FormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name',
                  style: Theme.of(context).textTheme.titleLarge
              ),
              TextFormField(
                validator: (name) {
                  if(name!.isEmpty){
                   return 'Please Enter your Name';
                  }else if(name!.length<3) {
                    return 'Name Should be at least 3 Characters';
                  }
                  return null;

                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: NameController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: MyTheme.DarkGreyLight,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),
              SizedBox(height: 15,),
              Text('Phone',
                  style: Theme.of(context).textTheme.titleLarge
              ),
              TextFormField(
                validator: (phone)=> phone!.isEmpty
                    ?'Please enter your Number'
                    :null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: PhoneController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: MyTheme.DarkGreyLight,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),
              SizedBox(height: 15,),
              Text('Email',
                  style: Theme.of(context).textTheme.titleLarge
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Regular expression for email validation
                  String emailRegex =
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

                  // Create a RegExp object
                  RegExp regExp = new RegExp(emailRegex);

                  // Check if the email matches the regular expression
                  if (!regExp.hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },

                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: EmailController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: MyTheme.DarkGreyLight,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),
              SizedBox(height: 15,),
              Text('Password',
                  style: Theme.of(context).textTheme.titleLarge
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
              SizedBox(height: 15,),
              Text('Confirm-Passsword',
                  style: Theme.of(context).textTheme.titleLarge
              ),
              TextFormField(
                obscureText: hidePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Confirm password';
                  } else if (value.length < 3) {
                    return 'Password must be at least 3 characters';
                  }
                  return null; // Return null if the input is valid
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: ConfirmController,
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
              SizedBox(height: 15,),
              Text('Car Model',
                  style: Theme.of(context).textTheme.titleLarge
              ),
              TextFormField(
                validator: (value)=> value!.isEmpty
                    ?'Enter Your Car Model'
                    :null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: CarModelController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: MyTheme.DarkGreyLight,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
              ),
              SizedBox(height: 15,),
              Text('Car Year',
                  style: Theme.of(context).textTheme.titleLarge
              ),
              TextFormField(
                validator: (value)=> value!.isEmpty
                    ?'Enter your Car Year'
                    :null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: CarYearController,
                decoration: InputDecoration(
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
              SizedBox(height: 30,),


              ElevatedButton(onPressed: (){
                setState(() {

                });
                _register();
                if (_FormKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
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
