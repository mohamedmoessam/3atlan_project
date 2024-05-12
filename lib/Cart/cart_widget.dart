import 'package:final_one/Theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartWidg extends StatefulWidget {
  Widget image;
  String Name;
  String Type;
  int Price;

  CartWidg({required this.image,required this.Name,required this.Type,required this.Price,});

  @override
  State<CartWidg> createState() => _CartWidgState();
}

class _CartWidgState extends State<CartWidg> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:20 ,horizontal: 20),
      child: Container(
        height: MediaQuery.sizeOf(context).height*0.17,
        width:MediaQuery.sizeOf(context).width*1 ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.0), // Adjust the radius as needed
          color: MyTheme.WhiteLight, // Change color as needed
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
              children: [
                Container(
                    width:MediaQuery.sizeOf(context).width*0.25,
                    height:MediaQuery.sizeOf(context).height ,
                    child: widget.image),
                Spacer(),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.Name,style: TextStyle(color: MyTheme.OrangeLight,fontWeight: FontWeight.bold,fontSize: 20),),
                      Text(widget.Type,style: TextStyle(color: MyTheme.BlackLight,fontWeight: FontWeight.bold,fontSize: 20),),
                      Row(
                          children: [
                            Text(widget.Price.toString(), style: Theme.of(context).textTheme.titleSmall,),
                            Icon(Icons.currency_pound, size: 15, color: MyTheme.BlackLight,),
                          ]),
                    ]),
                Spacer(),
                Column(
                  children: [
                    FloatingActionButton.small(
                      onPressed: _decrementCounter,
                      backgroundColor: MyTheme.PrimaryLight,
                      child: Icon(Icons.remove,color: MyTheme.OrangeLight,),
                    ),
                    Text(
                      '$_counter',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: MyTheme.BlackLight,
                      ),
                    ),
                    FloatingActionButton.small(
                      onPressed: _incrementCounter,
                      backgroundColor: MyTheme.PrimaryLight,
                      child: Icon(Icons.add,color: MyTheme.OrangeLight),
                    ),
                  ],)
              ]),
        ),),
    );
  }
}