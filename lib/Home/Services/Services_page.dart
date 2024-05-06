import 'package:final_one/Home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Theme.dart';


class ServiceScreen extends StatelessWidget{
  static const String RouteName = 'service_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:MyTheme.PrimaryLight,
      appBar: AppBar(
        backgroundColor: MyTheme.PrimaryLight,elevation: 0,
        title: Text("service",style:Theme.of(context).textTheme.titleLarge,),
        centerTitle: true,
        leading: IconButton(icon:Icon(Icons.arrow_back),color: MyTheme.OrangeLight,onPressed: (){
          Navigator.popAndPushNamed(context, HomeScreen.RouteName);
        },),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("Maintain Services",style: Theme.of(context).textTheme.titleLarge),


                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      CircleAvatar(radius:30,backgroundColor:MyTheme.OrangeLight,),
                      SizedBox(width: 10,),
                      CircleAvatar(radius:30,backgroundColor:MyTheme.OrangeLight,),
                      SizedBox(width: 10,),
                      CircleAvatar(radius:30,backgroundColor:MyTheme.OrangeLight,),
                    ],
                  ),
                ),
                //SizedBox(height: 20,width: 25,),
                Text("Tires Services",style: Theme.of(context).textTheme.titleLarge),

                Row(
                  children: [

                    Container(
                      height: 110,width:MediaQuery.sizeOf(context).width*0.42,
                      decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color: MyTheme.OrangeLight,),

                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Text('N'),
                                SizedBox(width: 10,),
                                Image.asset('assets/images/Air.png'),

                              ],
                            ),
                            Text("fill tires with ",style:Theme.of(context).textTheme.bodySmall),
                            Text("Nitrogen ",style:Theme.of(context).textTheme.bodySmall),


                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 110,width:MediaQuery.sizeOf(context).width*0.42,
                      decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color: MyTheme.OrangeLight,),

                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Image.asset('assets/images/air1.png'),
                                SizedBox(width: 10,),
                                Image.asset('assets/images/Air.png'),

                              ],
                            ),
                            Text("fill tires with ",style:Theme.of(context).textTheme.bodySmall),
                            Text("Air ",style:Theme.of(context).textTheme.bodySmall),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Text("Car Rescue",style: Theme.of(context).textTheme.titleLarge),
                Container(
                  height: 105,width:MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color: MyTheme.OrangeLight,),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Get your car lifted ",style: Theme.of(context).textTheme.bodySmall,),
                            Text("where ever you are.",style: Theme.of(context).textTheme.bodySmall)
                          ],
                        ),
                        Spacer(),
                        Image.asset('assets/images/Truck.png'),
                      ],
                    ),
                  ),



                ),
                Text("Fuel service",style: Theme.of(context).textTheme.titleLarge),
                Row(
                  children: [
                    CircleAvatar(radius:30,backgroundColor:MyTheme.OrangeLight,),
                    SizedBox(width: 10,),
                    CircleAvatar(radius:30,backgroundColor:MyTheme.OrangeLight,),
                    SizedBox(width: 10,),
                    CircleAvatar(radius:30,backgroundColor:MyTheme.OrangeLight,),
                  ],
                ),
                Text("car wash",style: Theme.of(context).textTheme.titleLarge),
                Container(
                  height: 105,width:MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color: MyTheme.OrangeLight,),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Book you car wash",style:Theme.of(context).textTheme.bodySmall),
                            Text("and don’t wait for a",style:Theme.of(context).textTheme.bodySmall),
                            Text("turn",style:Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                        Spacer(),
                        Image.asset('assets/images/car_wash.png'),
                      ],
                    ),
                  ),



                ),


              ],

            ),

          ],
        ),
      ),

    );
  }
}