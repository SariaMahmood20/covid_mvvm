import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';

class Utilities{

  static void fieldFocusChange (BuildContext context, FocusNode current, FocusNode nextNode){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(msg: message);
  }

  static void flushBarErrorMessage (String message, BuildContext context, Color color){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          backgroundColor: color,
          duration: Duration(seconds: 3),
        )..show(context)
    );
  }


}