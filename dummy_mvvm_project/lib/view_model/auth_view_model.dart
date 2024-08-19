import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:dummy_mvvm_project/repository/auth_repository.dart';
import 'package:dummy_mvvm_project/utilities/routes/route_name.dart';
import 'package:dummy_mvvm_project/utilities/utilities.dart';
import 'package:dummy_mvvm_project/model/user_model.dart';
import 'package:flutter/material.dart';

class AuthViewModel with ChangeNotifier{

  final _myRepo = AuthRepository();

  Future<void> LoginApi (dynamic data, BuildContext context) async{

    _myRepo.LoginApi(data).then((value)async{

      String token = value["token"];
      print("2");
      Navigator.pushReplacementNamed(context, RouteName.stats);

    }).onError((error, stackTrace){

      Utilities.flushBarErrorMessage("Error", context, Colors.red);

    });
  }

  Future<void> RegisterApi (dynamic data, BuildContext context) async{
    _myRepo.RegisterApi(data).then((value) async{
      String token = value["token"];
      print("Hello World");
      Navigator.pushReplacementNamed(context, RouteName.stats);
    }).onError((error, stackTrace){
      Utilities.flushBarErrorMessage("Error", context, Colors.red);
    });
  }

}