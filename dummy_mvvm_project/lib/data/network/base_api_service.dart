abstract class BaseApiService{

  Future<dynamic> getPostApiResponse(String url, dynamic data);
  Future<dynamic> getGetApiResponse(String url);
}