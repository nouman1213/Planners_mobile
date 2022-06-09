import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:planners_plan/providers/appProvider.dart';
import 'package:planners_plan/providers/auth/authenti_repo.dart';
import 'package:planners_plan/providers/profile_auth/user_profile_provider.dart';
import 'package:planners_plan/screens/Auth/number_verification_screen.dart';
import 'package:planners_plan/screens/bottomNavigation/bottom_navigation_screen.dart';

import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:planners_plan/services/SharedPref/SharedPref.dart';
import 'package:planners_plan/widgets/custom_button.dart';
import 'package:planners_plan/widgets/text_field.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:planners_plan/services/SharedPref/globals.dart' as globals;

class OtpVerifyScreen extends StatelessWidget {
  OtpVerifyScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: 35.h,
                    width: double.infinity,
                    child: Image.asset(
                      signUpBg2,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 8.h,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xff1A83A5),
                        Color(0xff7628A2),
                      ],
                    )),
                    child: Padding(
                      padding: EdgeInsets.all(2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => NumberVerifyScreen()));
                            },
                            child: Text(
                              'Back',
                              style: TextStyle(
                                  color: kPrimaryWhite,
                                  fontSize: 12.sp,
                                  fontFamily: 'museo'),
                            ),
                          ),
                          Text(
                            'Sign up',
                            style: TextStyle(
                                color: kPrimaryWhite,
                                fontSize: 12.sp,
                                fontFamily: 'museo'),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  color: kPrimaryWhite,
                                  fontSize: 12.sp,
                                  fontFamily: 'museo'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 0.h,
                  right: 0.h,
                  top: 5.h,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFieldInput(
                                textInputAction: TextInputAction.next,
                                error:
                                    'Enter OTP which is send to ${appPro.emailC.text.trim()}',
                                textEditingController: appPro.otpC,
                                hintText: 'Enter code',
                                textInputType: TextInputType.number),
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (_) => NumberVerifyScreen()));
                          //   },
                          //   child: Container(
                          //     height: 7.h,
                          //     width: 17.w,
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(30),
                          //       color: kPrimaryGreen,
                          //     ),
                          //     child: const Center(
                          //         child: Text(
                          //       'Resend Code',
                          //       style: TextStyle(color: kPrimaryWhite),
                          //     )),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              CustomButton(
                title: 'Verify code',
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    appPro.setLoadingTrue();
                    var result = await AuthentiRepo().verifyOTP(
                        appPro.emailC.text.trim(), appPro.otpC.text.trim(),);
                    if (result != null) {
                      if (result["success"] == true) {
                        showSnackBar(
                          "Success",
                          result["message"],
                        );
                        var response = await AuthentiRepo().userRegister(
                          appPro.nameC.text.trim(),
                          appPro.lastNameC.text.trim(),
                          appPro.phoneC.text.trim(),
                          appPro.emailC.text.trim(),
                          appPro.passwordC.text.trim(),
                          appPro.verifyPasswordC.text.trim(),
                        );

                        if (response != null) {
                          // print(response['error']);
                          // print(response['error']['user_email']);
                          if (response['success'] == true) {
                            await Sharedpref().setToken(response['token']);
                            globals.token = response['token'];
                            appPro.clearController();

                            globals.userProfileObj =
                                await ProfileRepo().fetchUserProfile();

                            showSnackBar(
                              "Success",
                              "Register Successfully",
                            );
                            appPro.setLoadingFalse();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (conetxt) =>
                                        const BottomNavigationBarScreen()));
                          } else {
                            appPro.setLoadingFalse();
                            showSnackBar(
                              "Error",
                              response['message'],
                            );
                          }
                        }
                      } else {
                        showSnackBar(
                          "Success",
                          result["message"],
                        );
                        appPro.setLoadingFalse();
                      }
                    } else {
                      showSnackBar(
                        "Success",
                        "Something went wrong. Try again later",
                      );
                      appPro.setLoadingFalse();
                    }
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () async {
                          print("45");
                          appPro.setLoadingTrue();
                          var result = await AuthentiRepo()
                              .sendOTP(appPro.emailC.text.trim());
                          if (result != null) {
                            if (result["success"] == true) {
                              showSnackBar(
                                "Success",
                                result["message"],
                              );
                              appPro.setLoadingFalse();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (conetxt) => OtpVerifyScreen()));
                            } else {
                              showSnackBar(
                                "Success",
                                result["message"],
                              );
                              appPro.setLoadingFalse();
                            }
                          } else {
                            showSnackBar(
                              "Success",
                              "Something went wrong. Try again later",
                            );
                            appPro.setLoadingFalse();
                          }
                        },
                        child: const Text("Resend Code",
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline))),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              appPro.isLoading
                  ? const Center(
                      child: SpinKitChasingDots(
                        color: kPrimaryGreen,
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      );
    });
  }
}
