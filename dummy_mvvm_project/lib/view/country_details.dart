import 'package:flutter/material.dart';
import 'package:dummy_mvvm_project/resources/components/reuseable_row.dart';

class CountryDetails extends StatelessWidget {
  CountryDetails({required this.countryName, required this.image, required this.totalCases, required this.totalDeaths, required this.totalRecovered,  required this.active, required this.critical, required this.test, required this.today});

  final String? countryName;
  final String? image;
  final String? totalCases;
  final String? totalDeaths;
  final String? totalRecovered;
  final String? active;
  final String? critical;
  final String? test;
  final String? today;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(countryName.toString(), style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.black,

        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.03, vertical: MediaQuery.of(context).size.height * 0.025 ),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.025),
                      child: Column(
                        children: <Widget> [
                          ReuseableRow(message1: "Cases", message2: totalCases),
                          Divider(),
                          ReuseableRow(message1: "Recovered", message2: totalRecovered),
                          Divider(),
                          ReuseableRow(message1: "Death", message2: totalDeaths),
                          Divider(),
                          ReuseableRow(message1: "Critical", message2: critical),
                          Divider(),
                          ReuseableRow(message1: "Today Recovered", message2: today),
                          SizedBox(height: MediaQuery.of(context).size.height*0.02,)
                        ]
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(image.toString()),
                )
              ],
            )
          ],
        )
    );
  }
}
