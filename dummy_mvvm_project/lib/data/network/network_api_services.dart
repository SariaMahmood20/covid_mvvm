import 'dart:io';
import 'dart:convert';

import 'package:dummy_mvvm_project/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;
import '../app_exceptions.dart';

class NetworkApiServices implements BaseApiService{



  @override
  Future<dynamic> getPostApiResponse(String url, dynamic data) async{
    dynamic responseJson;
    try{
      http.Response response = await http.post(Uri.parse(url), body: data).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);

    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future<dynamic> getGetApiResponse(String url) async{
    dynamic responseJson;
    try{
      final response  = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException("Check internet connectivity");
    }
    return responseJson;
  }

  dynamic returnResponse (http.Response response){

    switch (response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        return FetchBadRequestException();
      case 404:
        return FetchUnauthorisedAccess();
      default:
        return  FetchDataException("Error while communicating with the server");

    }

  }

}