import 'package:dummy_mvvm_project/view_model/country_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:dummy_mvvm_project/data/response/status.dart';
import 'package:dummy_mvvm_project/view/country_details.dart';
import 'package:shimmer/shimmer.dart';


class CountryStatScreen extends StatefulWidget {
  const CountryStatScreen({super.key});

  @override
  State<CountryStatScreen> createState() => _CountryStatScreenState();
}

class _CountryStatScreenState extends State<CountryStatScreen> {

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width*1;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Country Stats', style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: ChangeNotifierProvider<CountriesViewModel>(
            create: (BuildContext context) => CountriesViewModel(),
            child: Consumer<CountriesViewModel>(
                builder: (context, value, child){
                  switch(value.countriesList.status) {
                    case Status.LOADING:
                      return const Center(child: CircularProgressIndicator());
                    case Status.FAILED:
                      return Center(child: Text(value.countriesList.message.toString()));
                    case Status.COMPLETED:
                      return SafeArea(
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: _searchController,
                                  decoration: InputDecoration(
                                    hintText: "Search the country",
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )
                                  ),
                                ),

                              ),

                              FutureBuilder(
                                  future: value.fetchData(),
                                  builder: (context, AsyncSnapshot snapshot){
                                    if(snapshot.hasData){
                                        return ListView.builder(
                                            itemCount: value.countriesList!
                                                .data!
                                                .length,
                                            itemBuilder: (context, index) {
                                              if(_searchController==null){
                                              return InkWell(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              CountryDetails(
                                                                  countryName: value
                                                                      .countriesList
                                                                      .data![index]
                                                                      .country,
                                                                  image: value
                                                                      .countriesList
                                                                      .data![index]
                                                                      .countryInfo!
                                                                      .flag,
                                                                  totalCases: value
                                                                      .countriesList
                                                                      .data![index]
                                                                      .cases
                                                                      .toString(),
                                                                  totalDeaths: value
                                                                      .countriesList
                                                                      .data![index]
                                                                      .deaths
                                                                      .toString(),
                                                                  totalRecovered: value
                                                                      .countriesList
                                                                      .data![index]
                                                                      .recovered
                                                                      .toString(),
                                                                  active: value
                                                                      .countriesList
                                                                      .data![index]
                                                                      .active
                                                                      .toString(),
                                                                  critical: value
                                                                      .countriesList
                                                                      .data![index]
                                                                      .critical
                                                                      .toString(),
                                                                  test: value
                                                                      .countriesList
                                                                      .data![index]
                                                                      .tests
                                                                      .toString(),
                                                                  today: value
                                                                      .countriesList
                                                                      .data![index]
                                                                      .todayRecovered
                                                                      .toString())));
                                                },
                                                child: ListTile(
                                                  leading: Image(
                                                    image: NetworkImage(
                                                      value.countriesList!
                                                          .data![index]
                                                          .countryInfo!.flag
                                                          .toString(),
                                                    ),
                                                    height: 50,
                                                    width: 50,
                                                  ),
                                                  title: Text(
                                                      value.countriesList
                                                          .data![index].country!
                                                          .toString()),
                                                  subtitle: Text(
                                                      value.countriesList
                                                          .data![index].cases
                                                          .toString()),
                                                ),
                                              );
                                              }else if(value.countriesList.data![index].country!.contains(_searchController.text.toLowerCase())){
                                                return InkWell(
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                CountryDetails(
                                                                    countryName: value
                                                                        .countriesList
                                                                        .data![index]
                                                                        .country,
                                                                    image: value
                                                                        .countriesList
                                                                        .data![index]
                                                                        .countryInfo!
                                                                        .flag,
                                                                    totalCases: value
                                                                        .countriesList
                                                                        .data![index]
                                                                        .cases
                                                                        .toString(),
                                                                    totalDeaths: value
                                                                        .countriesList
                                                                        .data![index]
                                                                        .deaths
                                                                        .toString(),
                                                                    totalRecovered: value
                                                                        .countriesList
                                                                        .data![index]
                                                                        .recovered
                                                                        .toString(),
                                                                    active: value
                                                                        .countriesList
                                                                        .data![index]
                                                                        .active
                                                                        .toString(),
                                                                    critical: value
                                                                        .countriesList
                                                                        .data![index]
                                                                        .critical
                                                                        .toString(),
                                                                    test: value
                                                                        .countriesList
                                                                        .data![index]
                                                                        .tests
                                                                        .toString(),
                                                                    today: value
                                                                        .countriesList
                                                                        .data![index]
                                                                        .todayRecovered
                                                                        .toString())));
                                                  },
                                                  child: ListTile(
                                                    leading: Image(
                                                      image: NetworkImage(
                                                        value.countriesList!
                                                            .data![index]
                                                            .countryInfo!.flag
                                                            .toString(),
                                                      ),
                                                      height: 50,
                                                      width: 50,
                                                    ),
                                                    title: Text(
                                                        value.countriesList
                                                            .data![index].country!
                                                            .toString()),
                                                    subtitle: Text(
                                                        value.countriesList
                                                            .data![index].cases
                                                            .toString()),
                                                  ),
                                                );
                                              }else{
                                                return Container();
                                              }
                                            }
                                        );


                                    }
                                    else{
                                      return ListView.builder(
                                        itemCount: 4,
                                        itemBuilder: (context, index){
                                          return Shimmer.fromColors(
                                              child: ListTile(
                                                leading: Container(
                                                  height: 50,
                                                  width: 50,
                                                  color: Colors.white,
                                                ),
                                                title: Container(
                                                  height: 10,
                                                  width: 80,
                                                  color: Colors.white,
                                                ),
                                                subtitle: Container(
                                                  height: 10,
                                                  width: 80,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              baseColor: Colors.grey.shade200,
                                              highlightColor: Colors.grey.shade700
                                          );
                                        },
                                      );
                                    }
                                  }
                              ),
                            ],
                          )

                      );
                    default:
                      return const Center(child: Text("Unexpected status"));
                  }
                }
            )
        )
    );

  }
}
