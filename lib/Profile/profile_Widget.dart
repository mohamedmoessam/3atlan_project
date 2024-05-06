import 'package:flutter/material.dart';
import '../../Theme.dart';


class RoundedContainer extends StatelessWidget {
  final String text;
  String title;

  RoundedContainer({ required this.text,required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title,style: Theme.of(context).textTheme.titleLarge,),
        Container(
          height: MediaQuery.sizeOf(context).height*0.05,width: MediaQuery.sizeOf(context).width*0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0), // Adjust the radius as needed
            color: MyTheme.WhiteLight, // Change color as needed
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Text(
              textAlign: TextAlign.center,
              text,
              style: TextStyle(
                color: Colors.black, // Change text color as needed
                fontSize: 20.0, // Change text size as needed
              ),
            ),
          ),
        ),
      ],
    );
  }
}