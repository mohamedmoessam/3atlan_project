import 'package:flutter/material.dart';
import '../../Theme.dart';

class CategoryServiceWidget extends StatelessWidget {
  final String name;
  final String phone;

  CategoryServiceWidget({
    required this.name,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.19,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: MyTheme.OrangeLight,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: MyTheme.PrimaryLight,
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: MyTheme.BlackLight,
                ),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Row(
                    children: [
                      Text(
                        phone,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle booking action
                    },
                    child: Text(
                      'Book',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(110.0, 35.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: MyTheme.BabyBlueLight,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
