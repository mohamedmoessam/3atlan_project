import 'package:final_one/Home/home_screen.dart';
import 'package:final_one/Theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutPage extends StatefulWidget {
  static const String RouteName = 'check';

  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  TextEditingController _locationController = TextEditingController();
  bool _canPlaceOrder = false;

  Future<double> _getTotalPrice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('totalPrice') ?? 0.0;
  }

  void _showConfirmationMessage(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Confirmed!'),
      backgroundColor: MyTheme.GreenLight,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyTheme.PrimaryLight,
      appBar: AppBar(
        title: Text("Checkout"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
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
      body: FutureBuilder<double>(
        future: _getTotalPrice(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final totalPrice = snapshot.data ?? 0.0;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Location",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 32)),
                  Spacer(),
                  TextField(
                    controller: _locationController,
                    onChanged: (value) {
                      setState(() {
                        _canPlaceOrder = value.trim().isNotEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Spacer(),
                  Text("Pay with",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 32)),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: MyTheme.OrangeLight,
                        ),
                      ),
                      Spacer(),
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Text(
                          "Cash",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text("Payment summary",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 32)),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("subtotal",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text("service fee",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text("Delivery",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text("Total Amount",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("$totalPrice EG",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text("50 EG",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text("20 EG",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text("${totalPrice + 50 + 20} EG",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ],
                      ),
                    ],
                  ),
                  Spacer(flex: 3),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _canPlaceOrder
                            ? () {
                          _showConfirmationMessage(context);
                          Navigator.of(context)
                              .pushNamed(HomeScreen.RouteName);
                        }
                            : null,
                        child: Text(
                          'Place Order',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              MediaQuery.of(context).size.width *
                                  double.infinity,
                              40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          backgroundColor: _canPlaceOrder
                              ? MyTheme.OrangeLight
                              : Colors.grey, // Adjust button color based on validation
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(HomeScreen.RouteName);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              MediaQuery.of(context).size.width *
                                  double.infinity,
                              40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          backgroundColor: MyTheme.OrangeLight,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
