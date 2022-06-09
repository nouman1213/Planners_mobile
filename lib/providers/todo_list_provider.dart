import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:planners_plan/models/todo_list_model.dart';
import 'package:planners_plan/services/services.dart';

class TodoListProvider extends ChangeNotifier {
  Services services = Services();

//createApi
  Future createTodo(
      String title, String todayTime, String tomorowTime, String alert) async {
    debugPrint(title);
    debugPrint(todayTime);
    debugPrint(tomorowTime);
    debugPrint(alert);
    try {
      var formData = FormData.fromMap({
        "title": title,
        "today_time": todayTime,
        "tomorow_time": tomorowTime,
        "alert": alert,
      });
      var response =
          await services.postResponse(url: "toDoList", formData: formData);
      if (response != null) {
        return response;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

//statusApi
  Future todoSatatus(
    String id,
  ) async {
    try {
      var formData = FormData.fromMap({"id": id});
      var response =
          await services.postResponse(url: "list-status", formData: formData);
      if (response != null) {
        return response;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future fetchTodoList() async {
    try {
      var response = await services.getResponse(url: "show-list", formData: []);
      if (response != null) {
        // debugPrint(":::: $response");
        var finalList = TODOListViewModel.fromJson(response);
        return finalList;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
