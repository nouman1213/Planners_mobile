import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planners_plan/models/user_profile.dart';
import 'package:planners_plan/providers/profile_auth/user_profile_provider.dart';
import 'package:planners_plan/screens/Auth/login_screen.dart';
import 'package:planners_plan/screens/bottomNavigation/bottom_navigation_screen.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:planners_plan/screens/select_country.dart';
import 'package:planners_plan/services/SharedPref/SharedPref.dart';
import 'package:sizer/sizer.dart';
import 'package:planners_plan/services/SharedPref/globals.dart' as globals;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    getLanguage();
    _startTimer();
  }

  fetchUserProfile() async {
    globals.userProfileObj = await ProfileRepo().fetchUserProfile();
    debugPrint("AAAAAA: ${globals.userProfileObj!.toString()}");
  }

  getLanguage() async {
    // globals.language = await Sharedpref().getLanguage();
    globals.token = await Sharedpref().getToken();

    debugPrint(globals.token);

    setState(() {});
  }

  void _startTimer() {
    Timer(const Duration(seconds: 3), () async {
      if (globals.token != '') {
        fetchUserProfile();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigationBarScreen(),
            ));
      } else {
        if (globals.language == '' || globals.language!.isEmpty) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SelectCountry(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff7628A2),
              Color(0xff27A49A),
            ],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(whiteLogo),
              SizedBox(
                height: 7.h,
              ),
              Text(
                'Planners',
                style: TextStyle(
                    color: Colors.white, fontSize: 22.sp, fontFamily: 'museo'),
              )
            ],
          )),
    );
  }
}
