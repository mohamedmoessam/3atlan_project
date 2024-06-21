import 'package:final_one/Cart/CheckOut_page.dart';
import 'package:final_one/Cart/Model/CartItems.dart';
import 'package:final_one/Theme.dart';
import 'package:flutter/material.dart';
import '../Api_Manager.dart';
import 'cart_widget.dart';

class CartTab extends StatefulWidget {
  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final ApiManager apiManager = ApiManager();
  late Future<CartItems> _cartFuture;

  @override
  void initState() {
    super.initState();
    _cartFuture = apiManager.GetCart(); // Initialize the cart future
  }

  void _refreshCart() {
    setState(() {
      _cartFuture = apiManager.GetCart(); // Refresh the cart items
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.PrimaryLight,
      appBar: AppBar(
        backgroundColor: MyTheme.PrimaryLight,
        elevation: 0,
        title: const Text("My Cart"),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 2,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(50.0)),
                color: MyTheme.BabyBlueLight,
              ),
            ),
            FutureBuilder<CartItems>(
              future: _cartFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.cart == null || snapshot.data!.cart!.isEmpty) {
                  return const Center(child: Text('No items in cart'));
                } else {
                  return Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 50.0),
                          child: ListView.builder(
                            itemCount: snapshot.data!.cart!.length,
                            itemBuilder: (context, index) {
                              final cartItem = snapshot.data!.cart![index];
                              return CartWidg(
                                productId: cartItem.product?.id ?? '', // Use a default value or check for null
                                Name: cartItem.product?.name ?? 'Unknown', // Use a default value or check for null
                                Type: cartItem.type ?? 'Unknown', // Use a default value or check for null
                                Price: cartItem.product?.price?.toString() ?? '0.0', // Use a default value or check for null
                                image: cartItem.image ?? '', // Use a default value or check for null
                                onDelete: _refreshCart, // Add this line
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23.0),
                            color: MyTheme.WhiteLight,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Subtotal",
                                      style: TextStyle(
                                        color: MyTheme.OrangeLight,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          snapshot.data!.totalPrice?.toString() ?? '0.0', // Use a default value or check for null
                                          style: TextStyle(
                                            color: MyTheme.BlackLight,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                          ),
                                        ),
                                        Icon(
                                          Icons.currency_pound,
                                          size: 25,
                                          color: MyTheme.BlackLight,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(CheckoutPage.RouteName);
                                  },
                                  child: Text(
                                    'Check Out',
                                    style: TextStyle(
                                      color: MyTheme.OrangeLight,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(130.0, 30.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    backgroundColor: MyTheme.PrimaryLight,
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
