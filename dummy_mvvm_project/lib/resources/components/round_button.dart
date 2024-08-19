import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton(this.message, this.onPress );
  final String? message;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            message.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
