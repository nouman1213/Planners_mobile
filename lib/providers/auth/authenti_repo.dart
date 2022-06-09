import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:planners_plan/services/services.dart';

class AuthentiRepo extends ChangeNotifier {
  Services services = Services();

  ///userRegister method
  Future userRegister(String fName, String lName, String phone, String email,
      String password, String passwordVerify) async {
    debugPrint(phone);
    try {
      var bodyData = FormData.fromMap({
        "f_name": fName,
        "l_name": lName,
        "user_email": email,
        "user_password": password,
        'user_password_confirmation': passwordVerify,
        "phone": phone,
      });

      var response =
          await services.postResponse(url: "register", formData: bodyData);
      if (response != null) {
        return response;
      }
      return null;
    } catch (e) {
      print(e);
      return false;
    }
  }

  ///sendOTP method
  Future sendOTP(String email) async {
    try {
      var formData = FormData.fromMap({"user_email": email});

      var response =
          await services.postResponse(url: "send-otp", formData: formData);
      if (response != null) {
        return response;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  ///verifyOTP method
  Future verifyOTP(String email, String otp) async {
    try {
      var formData = FormData.fromMap({
        "user_email": email,
        "otp": otp,
      });

      var response =
          await services.postResponse(url: "verify-otp", formData: formData);
      if (response != null) {
        return response;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  ///checkEmail method
  Future checkEmail(String email) async {
    try {
      var formData = FormData.fromMap({
        "user_email": email,
      });

      var response =
          await services.postResponse(url: "verify-email", formData: formData);
      if (response != null) {
        return response;
      }
      return null; 
    } catch (e) {
      print(e);
      return null;
    }
  }

  ///Login method
  Future userLogin(String email, String password) async {
    try {
      var bodyData = FormData.fromMap({
        "email": email,
        "password": password,
      });

      var response =
          await services.postResponse(url: "login", formData: bodyData);
      if (response != null) {
        return response;
      }
      return null;
    } catch (e) {
      print(e);
      return false;
    }
  }

  ///Logout method
  Future logout() async {
    try {
      var bodyData = FormData.fromMap({});

      var response =
          await services.postResponse(url: "logout", formData: bodyData);
      if (response != null) {
        return response;
      }
      return null;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
