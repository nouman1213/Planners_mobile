import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:planners_plan/models/user_cart_items_model.dart';
import 'package:planners_plan/services/services.dart';

class CartRepo extends ChangeNotifier {
  Services services = Services();

  Future addToCartApi(String userId, String serviceId, String venderId,
      String addOns, String bookingDate, String timeFrom, String timeTo) async {
    print(userId);
    print(serviceId);
    print(venderId);
    print(bookingDate);
    print(timeFrom);
    print(timeTo);
    print(addOns);
    try {
      var formData = FormData.fromMap({
        "user_id": userId,
        "service_id": serviceId, 
        "vendor_id": venderId,
        "booking_date": bookingDate,
        "time_from": timeFrom,
        "time_to": timeTo,
        'addons': addOns
      });
      var response =
          await services.postResponse(url: "booking", formData: formData);
      if (response != null) {
        print(response);
        return response;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future fetchCartItemList() async {
    try {
      var response =
          await services.getResponse(url: "user/chart", formData: []);
      if (response != null) {
        // debugPrint(":::: $response");
        var finalList = UserCartItemsModel.fromJson(response);
        return finalList;
      }
      return null;
    } catch (e) {
      debugPrint("exceptio: ${e.toString()}");
      return null;
    }
  }

  Future deleteCartItem(String cartItemId) async {
    try {
      var formData = FormData.fromMap({'id': cartItemId});
      var response =
          await services.postResponse(url: "chart-delete", formData: formData);
      if (response != null) {
        debugPrint(":::: $response");
        // var finalList = UserCartItemsModel.fromJson(response);
        return response;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future checkOut() async {
    try {
      var response = await services.getResponse(url: "checkout", formData: []);
      if (response != null) {
        return response;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
