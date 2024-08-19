
import 'package:dummy_mvvm_project/view_model/country_view_model.dart';
import 'package:dummy_mvvm_project/view_model/world_stats_view_model.dart';
import 'package:flutter/material.dart';
import 'package:dummy_mvvm_project/utilities/routes/route_name.dart';
import 'package:dummy_mvvm_project/utilities/routes/route.dart';
import 'package:provider/provider.dart';
import 'package:dummy_mvvm_project/view_model/auth_view_model.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AuthViewModel()),
        ChangeNotifierProvider(create: (_)=>WorldStatsViewModel()),
        ChangeNotifierProvider(create: (_)=>CountriesViewModel())
      ],
      child: MaterialApp(
        title: "Covid-19 App",
       debugShowCheckedModeBanner: false,
       initialRoute: RouteName.stats,
          onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
