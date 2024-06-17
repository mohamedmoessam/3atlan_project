import 'package:final_one/Cart/CheckOut_page.dart';
import 'package:final_one/Theme.dart';
import 'package:flutter/material.dart';
import 'cart_widget.dart';

class CartTab extends StatefulWidget {

  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.PrimaryLight,
      appBar: AppBar(
        backgroundColor:MyTheme.PrimaryLight,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text("My Cart"),
        titleTextStyle: const TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold,),
        centerTitle: true,
        actions: [
          Icon(Icons.delete,size: 27,color: MyTheme.OrangeLight,)
        ],
      ),
      body: SafeArea(
        child: ListView(
            children:[ Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height*2,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top:Radius.circular(50.0)), // Adjust the radius as needed
                    color: MyTheme.BabyBlueLight, // Change color as needed
                  ),
                ),
                Column(
                  children: [
                    CartWidg(image:'https://threetlana.onrender.com/images/45d82ffa-4a1d-481b-9ade-3c91f948724f-Phone_holder.png', Name: 'Car Tire',Type: 'Mobil 5W-30',Price:'2400',),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height*0.15,
                        width:MediaQuery.sizeOf(context).width*1 ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23.0), // Adjust the radius as needed
                          color: MyTheme.WhiteLight, // Change color as needed
                        ),
                        child:Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30),
                          child: Row(
                              children: [
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Subtotal",style: TextStyle(color: MyTheme.OrangeLight,fontWeight: FontWeight.bold,fontSize: 25),),
                                      Row(
                                          children: [
                                            Text("8000", style:  TextStyle(color: MyTheme.BlackLight,fontWeight: FontWeight.bold,fontSize: 25)),
                                            Icon(Icons.currency_pound, size: 25, color: MyTheme.BlackLight,),
                                          ]),
                                    ]),
                                const Spacer(),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(CheckoutPage.RouteName);
                                    },
                                    child: Text('Check Out', style: TextStyle(color: MyTheme.OrangeLight,fontWeight: FontWeight.bold,fontSize: 20),),
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(130.0, 30.0),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                        backgroundColor: MyTheme.PrimaryLight,
                                        padding: const EdgeInsets.symmetric(horizontal: 10,))),

                              ]),
                        ),
                      ),
                    )
                  ],
                ),
                //


              ],),


            ] ),
      ),

    );
  }
}