import 'package:flutter/material.dart';

import '../../Theme.dart';


class ItemAccesoriesWidget extends StatefulWidget {
  List<String> Items=[];
  String currentoption;
  String text1;
  String text2;
  String ImagePath;

  ItemAccesoriesWidget({required this.Items,
    required this.currentoption,
    required this.text1,
    required this.text2,
    required this.ImagePath
  });

  @override
  State<ItemAccesoriesWidget> createState() => _ItemAccesoriesWidgetState();
}

class _ItemAccesoriesWidgetState extends State<ItemAccesoriesWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
              width: MediaQuery.sizeOf(context).width*0.5,height: MediaQuery.sizeOf(context).height*0.27,
              child: Image.asset(widget.ImagePath,fit: BoxFit.cover,)),
        ),
        Container(
          height: MediaQuery.sizeOf(context).height*0.6,
          width: MediaQuery.of(context).size.width,
          decoration:BoxDecoration(  borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
            color: MyTheme.BabyBlueLight,
          ),
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.text1,style: TextStyle(color: MyTheme.OrangeLight,fontSize:40 ),),
                    Text(widget.text2,style:  Theme.of(context).textTheme.titleLarge,),
                  ],),
                ListTile(
                  title:  Text(widget.Items[0],style: Theme.of(context).textTheme.titleLarge),
                  leading: Radio(
                    value:  widget.Items[0],
                    hoverColor: Colors.red,
                    activeColor: MyTheme.OrangeLight,
                    groupValue:  widget.currentoption,
                    onChanged: (value){
                      setState(() {
                        widget.currentoption = value.toString();
                      });
                    },),),
                ListTile(
                  title:  Text(widget.Items[1],style: Theme.of(context).textTheme.titleLarge),
                  leading: Radio(
                    value: widget.Items[1],
                    activeColor: MyTheme.OrangeLight,
                    groupValue: widget.currentoption,
                    onChanged: (value){
                      setState(() {
                        widget.currentoption = value.toString();
                      });
                    },),),
                ListTile(
                  title:  Text(widget.Items[2],style: Theme.of(context).textTheme.titleLarge),
                  leading: Radio(
                    value:  widget.Items[2],
                    activeColor: MyTheme.OrangeLight,
                    groupValue:  widget.currentoption,
                    onChanged: (value){
                      setState(() {
                        widget.currentoption = value.toString();
                      });
                    },),),
                ListTile(
                  title:  Text(widget.Items[3],style: Theme.of(context).textTheme.titleLarge),
                  leading: Radio(
                    value:  widget.Items[3],
                    activeColor: MyTheme.OrangeLight,
                    groupValue:  widget.currentoption,
                    onChanged: (value){
                      setState(() {
                        widget.currentoption = value.toString();
                      });
                    },),),
                ListTile(
                  title:  Text(widget.Items[4],style: Theme.of(context).textTheme.titleLarge,),
                  leading: Radio(
                    value:  widget.Items[4],
                    activeColor: MyTheme.OrangeLight,
                    groupValue:  widget.currentoption,
                    onChanged: (value){
                      setState(() {
                        widget.currentoption = value.toString();
                      });
                    },),),
                Spacer(),
                ElevatedButton(onPressed: (){

                }, child: Text('Buy',style: Theme.of(context).textTheme.titleMedium,),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        backgroundColor: MyTheme.OrangeLight,
                        padding: EdgeInsets.symmetric(horizontal:MediaQuery.sizeOf(context).width*0.3,vertical: 10)
                    )),
              ],
            ),
          ),

        ),
      ],

    );
  }
}
