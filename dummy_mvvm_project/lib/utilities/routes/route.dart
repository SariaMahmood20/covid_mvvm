
import 'package:dummy_mvvm_project/view/login_screen.dart';
import 'package:dummy_mvvm_project/view/signup_screen.dart';
import 'package:dummy_mvvm_project/view/splash_screen.dart';
import 'package:dummy_mvvm_project/view/world_stat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dummy_mvvm_project/utilities/routes/route_name.dart';
import 'package:dummy_mvvm_project/view/country_stat_screen.dart';
import 'package:dummy_mvvm_project/view/country_details.dart';

class Routes{

  static Route<dynamic> generateRoutes(RouteSettings settings){

    switch(settings.name){
      case RouteName.splash:
        return MaterialPageRoute(builder: (BuildContext context)=>const SplashScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (BuildContext context)=>const LoginScreen());
      case RouteName.signup:
        return MaterialPageRoute(builder: (BuildContext context)=>const SignupScreen());
      case RouteName.stats:
        return MaterialPageRoute(builder: (BuildContext context)=>const HomeScreen());
      case RouteName.country:
        return MaterialPageRoute(builder: (BuildContext context)=>const CountryStatScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text("NO Route Defined"),
            ),
          );
        });
    }
  }
}