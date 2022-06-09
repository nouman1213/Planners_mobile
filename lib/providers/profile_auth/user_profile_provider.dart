import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:planners_plan/models/user_profile.dart';
import 'package:planners_plan/services/services.dart';

class ProfileRepo extends ChangeNotifier {
  Services services = Services();

  TextEditingController nameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  TextEditingController addressC = TextEditingController();
  TextEditingController locationC = TextEditingController();

  Future fetchUserProfile() async {
    try {
      var response = await services.getResponse(url: "profile", formData: []);
      if (response != null) {
        debugPrint(":::: $response");
        var user = UserProfile.fromJson(response);
        return user;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  ///UpdateProfile method
  Future updateUserProfile(
    String fName,
    String lName,
    String phone,
    String address,
    String location,
  ) async {
    try {
      var formData = FormData.fromMap({
        "f_name": fName,
        "l_name": lName,
        "phone": phone,
        "address": address,
        "location": location
      });
      var response = await services.postResponse(
          url: "profile-update", formData: formData);
      if (response != null) {
        debugPrint(response['success']);

        return response;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  ///imageUpload
  Future imageUpload(
    File image,
  ) async {
    debugPrint(image.toString());
    try {
      var bodyData = FormData.fromMap({
        "image": await MultipartFile.fromFile(image.path),
      });

      var response =
          await services.postResponse(url: "image", formData: bodyData);
      if (response != null) {
        debugPrint(response['success']);
        return response;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
