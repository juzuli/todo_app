import 'package:to_do_app/src/models/api_response.dart';
import 'package:to_do_app/src/web_service/api_helper.dart';

class TodosRepository {
  Future<ApiResponse> fetchTodos() async {
    String route = "schedule";
    ApiResponse response = await ApiHelper.internal().getData(route);
    return response;
  }

  Future<ApiResponse> addTodos(
      String name, String startTime, String endTime, String date) async {
    String route = "save/schedule";
    Map sendData = {
      'name': name,
      'startTime': startTime,
      'endTime': endTime,
      'date': date,
    };
    ApiResponse response = await ApiHelper.internal().postData(route, sendData);
    return response;
  }
}
