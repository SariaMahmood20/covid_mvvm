import 'package:flutter/material.dart';

class ReuseableRow extends StatelessWidget {



  ReuseableRow({super.key, @required this.message1, @required this.message2});

  String? message1;
  String? message2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget> [
        Text(
          message1.toString(),
          style: TextStyle(
            fontSize: 16,
            color: Colors.white
          )
        ),
        Text(
          message2.toString(),
          style: TextStyle(
            fontSize: 16,
            color: Colors.white
          )
        ),
      ]
    );
  }
}
