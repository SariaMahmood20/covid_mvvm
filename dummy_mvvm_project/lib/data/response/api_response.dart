import 'package:dummy_mvvm_project/data/response/status.dart';
import 'package:dummy_mvvm_project/model/WorldStatsModel.dart';

class ApiResponse<T>{

 String? message;
 Status? status;
 T? data;

 ApiResponse(this.data, this.message, this.status);

 ApiResponse.loading(): status = Status.LOADING;
 ApiResponse.completed( value): status = Status.COMPLETED;
 ApiResponse.failed(): status = Status.FAILED;

 @override
  String toString(){
   return "Message: $message Status: $status Data: $data";
 }

}