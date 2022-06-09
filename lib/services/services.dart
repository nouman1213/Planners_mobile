import 'package:dio/dio.dart';

import 'package:planners_plan/services/SharedPref/globals.dart' as globals;

class Services {
  Dio dio = Dio(BaseOptions(
    // baseUrl: globals.localHost,
    baseUrl: globals.baseurl,
    connectTimeout: 60000,
    receiveTimeout: 60000,
  ));

  Future getResponse({required String url, required dynamic formData}) async {
    try {
      final response = await dio.post(url,
          data: formData,
          options: Options(headers: { 
            'Authorization': 'Bearer ${globals.token}',
          }));
      if (response.statusCode == 200) {
        // print("...................$response");
        return response.data;
      }
    } catch (e) {
      print(e);
    }
  }

  Future postResponse({required String url, required dynamic formData}) async {
    try {
      final response = await dio.post(url,
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer ${globals.token}',
          }));
      if (response.statusCode == 200) {
        // print("......200.............$response");
        return response.data;
      } else if (response.statusCode == 400) {
        // print(".........400..........$response");
        return response.data;
      }
      return null;
    } catch (e) {
      print(".................e..$e");
      return null;
    }
  }
}
