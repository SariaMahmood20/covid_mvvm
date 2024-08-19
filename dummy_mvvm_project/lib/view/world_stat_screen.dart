import 'package:flutter/material.dart';
import 'package:dummy_mvvm_project/view_model/world_stats_view_model.dart';
import 'package:provider/provider.dart';
import 'package:dummy_mvvm_project/resources/components/reuseable_row.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:dummy_mvvm_project/utilities/routes/route_name.dart';
import 'package:dummy_mvvm_project/data/response/status.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WorldStatsViewModel worldStatsViewModel = WorldStatsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    worldStatsViewModel.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('World Stats', style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: ChangeNotifierProvider<WorldStatsViewModel>(
            create: (BuildContext context) => WorldStatsViewModel(),
            child: Consumer<WorldStatsViewModel>(
                builder: (context, value, child){
                  switch(value.list.status){
                    case Status.LOADING:
                      return Center(child: CircularProgressIndicator());
                    case Status.FAILED:
                      return Text(value.list.status.toString());
                    case Status.COMPLETED:
                      return SafeArea(
                          child: Column(
                            children: [
                              PieChart(
                                dataMap: {
                                  "Total": value.list.data!.cases!.toDouble(),
                                  "Recovered": double.parse(value.list.data!.recovered!.toString()),
                                  "Deaths": double.parse(value.list.data!.deaths.toString())
                                },
                                animationDuration: Duration(milliseconds: 1200),
                                chartValuesOptions: ChartValuesOptions(
                                    showChartValuesInPercentage: true
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.06),
                                child: Card(
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    child: Column(
                                      children: <Widget> [

                                        ReuseableRow(message1: "Total", message2: value.list.data!.cases.toString()),
                                        Divider(),
                                        ReuseableRow(message1: "Recovered", message2: value.list.data!.recovered.toString()),
                                        Divider(),
                                        ReuseableRow(message1: "Deaths", message2: value.list.data!.deaths.toString()),
                                        Divider(),
                                        ReuseableRow(message1: "Active", message2: value.list.data!.active.toString()),
                                        Divider(),
                                        ReuseableRow(message1: "Critical", message2: value.list.data!.critical.toString()),
                                        Divider(),
                                        ReuseableRow(message1: "Today Death", message2: value.list.data!.todayDeaths.toString()),
                                        Divider(),
                                        ReuseableRow(message1: "Today Recovered", message2: value.list.data!.todayRecovered.toString()),
                                        SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                                        InkWell(
                                          onTap: (){
                                            Navigator.pushReplacementNamed(context, RouteName.detail);
                                          },
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],

                          )

                      );
                    default:
                      return Container();
                  }

                }

            )
        )
    );
  }
}