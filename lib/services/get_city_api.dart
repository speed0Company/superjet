
import 'package:dio/dio.dart';
import 'package:superjet/consts/consts.dart';


class GetCitiesApi {
  final Dio _dio=Dio();
  GetCitiesApi() {
    // Set default options if needed
    _dio.options.baseUrl = baseUrl;
    _dio.options.headers = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Future<Map<String,dynamic>> getCities() async {
    try {
      final response = await _dio.get(
        '/index'
      );

      return response.data;

      // Handle successful response
    } on DioException catch (e) {
      throw (e.response?.data['message']);
    }
  }
}
