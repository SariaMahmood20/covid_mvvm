import 'package:dummy_mvvm_project/model/CountriesModel.dart';
import 'package:dummy_mvvm_project/resources/app_url.dart';
import 'package:dummy_mvvm_project/data/network/base_api_service.dart';
import 'package:dummy_mvvm_project/data/network/network_api_services.dart';

class CountryRepository{

  final BaseApiService _apiService = NetworkApiServices();

  List<CountriesModel> countriesList = [];

  Future<List<CountriesModel>> listApi() async {
    try {
      dynamic response = await _apiService.getGetApiResponse(AppUrl.worldStatesApi);
      countriesList = (response as List)
          .map((countryJson) => CountriesModel.fromJson(countryJson))
          .toList();

      return countriesList;
    } catch (e) {
      rethrow;
    }
  }

}