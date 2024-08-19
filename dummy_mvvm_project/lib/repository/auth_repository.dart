import 'package:dummy_mvvm_project/data/network/base_api_service.dart';
import 'package:dummy_mvvm_project/data/network/network_api_services.dart';

import '../resources/app_url.dart';


class AuthRepository{

  BaseApiService _apiService = NetworkApiServices();

  Future<dynamic> LoginApi(dynamic data) async{
    try{

      dynamic response = await _apiService.getPostApiResponse(AppUrl.LoginURL, data);
      print('$response');
      return response;
    }catch(e){
      print('5');
      throw e;
    }
  }

  Future<dynamic> RegisterApi(dynamic data) async {
    try{
      dynamic response = await _apiService.getPostApiResponse(AppUrl.RegisterURL, data);
      return response;
    }catch(e){
      throw e;
    }
  }




}