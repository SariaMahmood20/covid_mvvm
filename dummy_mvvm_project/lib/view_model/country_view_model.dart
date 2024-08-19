
import 'package:flutter/foundation.dart';
import 'package:dummy_mvvm_project/data/response/api_response.dart';
import 'package:dummy_mvvm_project/model/CountriesModel.dart';
import 'package:dummy_mvvm_project/repository/country_repository.dart';

class CountriesViewModel with ChangeNotifier {
  ApiResponse<List<CountriesModel>> _countriesList = ApiResponse.loading();

  ApiResponse<List<CountriesModel>> get countriesList => _countriesList;

  final CountryRepository _myRepo = CountryRepository();

  void setList(ApiResponse<List<CountriesModel>> response) {
    _countriesList = response;
    notifyListeners();
  }

  Future<void> fetchData() async {
    setList(ApiResponse.loading());
    _myRepo.listApi().then((value){
      setList(ApiResponse.completed(value));
      if(kDebugMode){
        print('Response1234: ${value.toString()}');
      }
    }).onError((error, stackTrace){
      setList(ApiResponse.failed());
      if(kDebugMode){
        print('error1234: ${error.toString()}');
      }
    });
  }
}