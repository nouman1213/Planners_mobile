import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:planners_plan/models/category_model.dart';
import 'package:planners_plan/models/sub_category_model.dart';
import 'package:planners_plan/models/sub_category_service_detail.dart';
import 'package:planners_plan/models/sub_category_services_model.dart';
import 'package:planners_plan/services/services.dart';

class CategoryRepo extends ChangeNotifier {
  Services services = Services();

  Future fetchCategoryList() async {
    try {
      var response =
          await services.getResponse(url: "list-categories", formData: []);
      if (response != null) {
        // debugPrint(":::: $response");
        var finalList = CategoryList.fromJson(response);
        return finalList;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  // Future fetchSingleCategoryDetail() async {
  //   try {
  //     var response =
  //         await services.getResponse(url: "category/service", formData: []);
  //     if (response != null) {
  //       var finalList = CategoryList.fromJson(response);
  //       return finalList;
  //     }
  //     return null;
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     return false;
  //   }
  // }

  Future fetchSubCategory(String id) async {
    try {
      var formData = FormData.fromMap({"id": id});
      var response =
          await services.getResponse(url: "category", formData: formData);
      if (response != null) {
        debugPrint(":::: $response");
        var finalList = SubCategories.fromJson(response);
        return finalList;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  //fetchVenderServices api
  Future fetchSubCategoryServices(String id) async {
    print(id);
    try {
      var formData = FormData.fromMap({"id": id});
      var response = await services.getResponse(
          url: "category/service", formData: formData);
      if (response != null) {
        debugPrint(":::: $response");
        var finalList = SubCategoriesServices.fromJson(response);
        return finalList;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future fetchSubCategoryServiceDetail(String id) async {
    print(id);
    try {
      var formData = FormData.fromMap({"id": id});
      var response = await services.getResponse(
          url: "category/service-details", formData: formData);
      if (response != null) {
        debugPrint(":::: $response");
        var finalList = SubCategoriesServiceDetail.fromJson(response);
        return finalList;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // fetch Filter Category api
  Future fetchSearchCategory(search) async {
    try {
      var formData = FormData.fromMap({"search": search});
      var response = await services.postResponse(
          url: "search-category", formData: formData);
      if (response != null) {
        debugPrint(":::: $response");
        var finalList = CategoryList.fromJson(response);
        return finalList;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // fetch booking api

  // fetch comment api
  Future commentApi(String comment, String serviceId, String rating) async {
    try {
      var formData = FormData.fromMap({
        "comment": comment,
        "service_id": serviceId,
        "rating": rating,
      });
      var response =
          await services.postResponse(url: "comment", formData: formData);
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
