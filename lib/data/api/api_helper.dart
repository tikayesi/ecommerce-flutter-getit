import 'package:dio/dio.dart';
import 'package:flutter_proj/data/api/common_response.dart';

class ApiHelper {
  late Dio _dio;

  ApiHelper({Dio? client}) {
    _dio = client ?? Dio();
  }

  Future<CommonResponse> postData(
      String path, Map<String, dynamic> data) async {
    try {
      print("API HELPER");
      Response response = await _dio.post(path, data: data);
      print(response.data);
      final apiResponse = CommonResponse.fromJson(response.data);
      print(apiResponse);
      return apiResponse;
    } on DioError catch (e) {
      throw Exception('Failed POST Data');
    }
  }

  Future<CommonResponse> getData(String path,
      {Map<String, dynamic>? queryParameter}) async {
    try {
      Response response = await _dio.get(path, queryParameters: queryParameter);
      final apiResponse = CommonResponse.fromJson(response.data);
      return apiResponse;
    } on DioError catch (e) {
      throw Exception('Failed GET Data');
    }
  }
}
