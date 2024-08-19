import 'package:dummy_mvvm_project/data/network/network_api_services.dart';
import 'package:dummy_mvvm_project/model/WorldStatsModel.dart';
import 'package:dummy_mvvm_project/data/network/base_api_service.dart';
import 'package:dummy_mvvm_project/resources/app_url.dart';

class WorldStatsRepository {

  final BaseApiService _apiService = NetworkApiServices();

  Future<WorldStatsModel> listApi() async {
    try{
      dynamic response = await _apiService.getGetApiResponse(AppUrl.worldStatesApi);
      print(response.toString()+"asdkjhasjkdhaks");
      return response = WorldStatsModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
}