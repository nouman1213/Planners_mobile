import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedpref {
  setToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('token', token);
  }

  removeToke() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('token');
  }

  Future<String> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('token') ?? '';
  }

//..................................
  setLanguage(String lang) async {
    final pref = await SharedPreferences.getInstance();

    await pref.setString('lang', lang);
  }

  removeLanguage() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('lang');
  }

  Future<String> getLanguage() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('lang') ?? '';
  }

//....................................

  //.......................................

}
