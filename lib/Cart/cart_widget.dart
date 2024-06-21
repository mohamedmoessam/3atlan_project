import 'package:final_one/Theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api_Manager.dart';

class CartWidg extends StatefulWidget {
  final String image;
  final String Name;
  final String Type;
  final String Price;

  const CartWidg({
    required this.image,
    required this.Name,
    required this.Type,
    required this.Price,
    Key? key,
  }) : super(key: key);

  @override
  State<CartWidg> createState() => _CartWidgState();
}

class _CartWidgState extends State<CartWidg> {
  final ApiManager apiManager = ApiManager();
  String _userid = '';

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userid = prefs.getString('id')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.24,
        width: MediaQuery.sizeOf(context).width * 1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.0),
          color: MyTheme.WhiteLight,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.25,
                  height: MediaQuery.sizeOf(context).height,
                  child: Image.network(widget.image),
                ),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.Name,
                    style: TextStyle(
                      color: MyTheme.OrangeLight,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    widget.Type,
                    style: TextStyle(
                      color: MyTheme.BlackLight,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.Price.toString(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Icon(
                        Icons.currency_pound,
                        size: 15,
                        color: MyTheme.BlackLight,
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  FloatingActionButton.small(
                    onPressed: () {
                      apiManager.DeleteFromCart(id: _userid);
                      setState(() {});
                    },
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    child: Icon(
                      Icons.delete,
                      size: 27,
                      color: MyTheme.OrangeLight,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
