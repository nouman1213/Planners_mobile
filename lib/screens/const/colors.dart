import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

const kPrimaryGreen = Color(0xff2383A3);
const kPrimaryPurpal = Color(0xff7628A2);
const kPrimaryBlack = Color(0xff000007);
const kPrimaryBlack5 = Color(0xff555555);
const kPrimaryWhite = Colors.white;
const kPrimaryblue = Color(0xff1CA8D3);

showSnackBar(
  String title,
  String message,
) {
  Get.snackbar("", message,
      backgroundColor: Colors.white,
      titleText: Text(
        title,
        style: TextStyle(color: Colors.black),
      ));
}

void launchURL(String? url) async {
  if (!await launch(url!)) throw 'Could not launch $url';
}
