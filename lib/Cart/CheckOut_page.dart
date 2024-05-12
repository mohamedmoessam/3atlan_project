import 'package:final_one/Theme.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  static const String RouteName='check';
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:MyTheme.PrimaryLight,
      appBar: AppBar(
        title: Text("Checkout"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black,      //black
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor:MyTheme.PrimaryLight,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Location",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold,
                    fontSize: 32)),
            Spacer(),
            TextField(
              decoration: InputDecoration(

                filled:true,fillColor:Colors.white,
                border:OutlineInputBorder(borderRadius:BorderRadius.circular(10),),

              ),),
            Spacer(),
            Text("Pay with",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold,
                    fontSize: 32)),
            Spacer(),

            Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyTheme.OrangeLight

                  ),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  // Image.asset('assets/images/Cash.png'),
                  height: MediaQuery.sizeOf(context).height*0.06,width: MediaQuery.sizeOf(context).width*0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    color: Colors.white, // MyTheme.WhiteLight
                  ),
                  child: Text("Cash"
                    ,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0, // Change text size as needed
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
                        color: Colors.black, fontWeight: FontWeight.bold,
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
                            color: Colors.black, fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Text("service fee",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Text("total amount",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Text("Delivery",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold,
                            fontSize: 20)),

                  ]
                  ,
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("8150 EG",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Text("50 EG",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Text("8200 EG",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Text("20 EG",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold,
                            fontSize: 20)),

                  ],
                ),

              ],
            ),
            Spacer(flex: 3,),
            Row(
              children: [

                ElevatedButton(onPressed: (){

                  //  Navigator.of(context).pushNamed(Profile.RouteName);

                }, child: Text('Place Order', style: TextStyle(

                    color: Colors.black, fontWeight: FontWeight.bold,

                    fontSize: 24)),

                    style: ElevatedButton.styleFrom(

                      fixedSize: Size(MediaQuery.sizeOf(context).width*double.infinity,40),

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),

                      backgroundColor: MyTheme.OrangeLight,     //MyTheme.OrangeLight

                      //  padding: EdgeInsets.symmetric(horizontal: 35,vertical: 10)

                    )),

                Spacer(),

                ElevatedButton(onPressed: (){



                  //  Navigator.of(context).pushNamed(Profile.RouteName);

                }, child: Text('Cancel', style: TextStyle(

                    color: Colors.black, fontWeight: FontWeight.bold,

                    fontSize: 24)),

                    style: ElevatedButton.styleFrom(

                      fixedSize: Size(MediaQuery.sizeOf(context).width*double.infinity,40)



                      ,

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),

                      backgroundColor: MyTheme.OrangeLight,     //MyTheme.OrangeLight

                      // padding: EdgeInsets.symmetric(horizontal: 30)

                    )),



              ],

            ),
            SizedBox(height: 10,)

          ],

        ),
      ),
    );
  }
}
