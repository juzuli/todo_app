import 'dart:convert';

import 'package:http/http.dart';
import 'package:to_do_app/src/models/api_response.dart';

class ApiHelper {
  static final ApiHelper _instance = ApiHelper.internal();

  factory ApiHelper() => _instance;

  ApiHelper.internal();

  // ignore: constant_identifier_names
  static const _BASE_URL = "https://alpha.classaccess.io/api/challenge/v1/";

  Future<ApiResponse> getData(String route) async {
    String url = _BASE_URL + route;
    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        return ApiResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Something went wrong');
      }
    } catch (ex) {
      throw Exception('Something went wrong');
    }
  }

  Future<ApiResponse> postData(String route, Map data) async {
    String url = _BASE_URL + route;
    try {
      Response response = await post(Uri.parse(url),
          body: jsonEncode(data),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });
      if (response.statusCode == 200) {
        return ApiResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('error');
      }
    } catch (ex) {
      throw Exception('Failed to create todo');
    }
  }

  Future<ApiResponse> updateData(String route, Map data) async {
    String url = _BASE_URL + route;
    try {
      Response response = await put(Uri.parse(url), body: jsonEncode(data));
      if (response.statusCode == 200) {
        return ApiResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Something went wrong');
      }
    } catch (ex) {
      throw Exception('Something went wrong');
    }
  }
}
