import 'package:flutter/foundation.dart';
import 'package:dummy_mvvm_project/data/response/api_response.dart';
import 'package:dummy_mvvm_project/model/WorldStatsModel.dart';
import 'package:dummy_mvvm_project/repository/world_stats_repository.dart';

class WorldStatsViewModel with ChangeNotifier{

  final _myRepo = WorldStatsRepository();

  ApiResponse<WorldStatsModel> list = ApiResponse.loading();

  setList(ApiResponse<WorldStatsModel> response){
    list = response;
    notifyListeners();
  }

  Future<void> fetchData()async{
    setList(ApiResponse.loading());
    _myRepo.listApi().then((value){
      print(value.todayCases.toString()+"asdkljalkdas");
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