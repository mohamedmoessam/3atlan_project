
import 'package:flutter/material.dart';

import '../Theme.dart';

class FormWidget extends StatelessWidget {
  TextEditingController controller;
  String title;
  FormWidget({required this.title,required this.controller});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: Theme.of(context).textTheme.titleLarge
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
              filled: true,
              fillColor: MyTheme.DarkGreyLight,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30)
              )
          ),
        )
      ],
    );
  }
}
