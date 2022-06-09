import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:planners_plan/providers/appProvider.dart';
import 'package:planners_plan/providers/auth/authenti_repo.dart';
import 'package:planners_plan/screens/Auth/login_screen.dart';
import 'package:planners_plan/screens/Auth/number_verification_screen.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:planners_plan/widgets/custom_button.dart';
import 'package:planners_plan/widgets/text_field.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
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
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 3,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
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
                                          builder: (_) => LoginScreen()));
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
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (_) => PhoneVerifyScreen()));
                                },
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
                  Expanded(
                    child: Form(
                      key: formKey,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: kPrimaryWhite,
                        ),
                        height: 70.h,
                        width: 100.w,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0.h, bottom: 2.h, left: 2.h, right: 2.h),
                          child: ListView(
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              TextFieldInput(
                                  textInputAction: TextInputAction.next,
                                  error: 'name is required',
                                  textEditingController: appPro.nameC,
                                  hintText: 'Name',
                                  textInputType: TextInputType.name),
                              SizedBox(
                                height: 3.h,
                              ),
                              TextFieldInput(
                                  textInputAction: TextInputAction.next,
                                  error: 'last name is required',
                                  textEditingController: appPro.lastNameC,
                                  hintText: 'Last Name',
                                  textInputType: TextInputType.name),
                              SizedBox(height: 2.h),
                              TextFieldInput(
                                  textInputAction: TextInputAction.next,
                                  error: 'password is required',
                                  textEditingController: appPro.passwordC,
                                  hintText: 'Password',
                                  // isPass: true,
                                  isShow: appPro.isShow,
                                  // onTapIcon: () {
                                  //   appPro.isShowPass();
                                  // },
                                  textInputType: TextInputType.name),
                              SizedBox(height: 2.h),
                              TextFieldInput(
                                  textInputAction: TextInputAction.next,
                                  error: 'verify password is required',
                                  textEditingController: appPro.verifyPasswordC,
                                  hintText: 'Verify Password',
                                  isPass: true,
                                  isShow: appPro.isShow,
                                  onTapIcon: () {
                                    appPro.isShowPass();
                                  },
                                  textInputType: TextInputType.name),
                              SizedBox(height: 2.h),
                              TextFieldInput(
                                  textInputAction: TextInputAction.next,
                                  error: 'email is required',
                                  textEditingController: appPro.emailC,
                                  hintText: 'Email',
                                  textInputType: TextInputType.emailAddress),
                              SizedBox(height: 2.h),
                              CustomButton(
                                title: 'Sign up',
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    if (appPro.passwordC.text.trim() ==
                                        appPro.verifyPasswordC.text.trim()) {
                                      appPro.setLoadingTrue();
                                      var result = await AuthentiRepo()
                                          .checkEmail(
                                              appPro.emailC.text.trim());
                                      if (result != null) {
                                        if (result['success'] == true) {
                                          // showSnackBar("Success", result["message"],
                                          //     Colors.grey, Colors.black);
                                          appPro.setLoadingFalse();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      NumberVerifyScreen()));
                                        } else {
                                          showSnackBar(
                                            "Alert",
                                            result["message"],
                                          );
                                          appPro.setLoadingFalse();
                                        }
                                      } else {
                                        showSnackBar(
                                          "Error",
                                          "Something went wrong. Try again later",
                                        );
                                        appPro.setLoadingFalse();
                                      }

                                      // if (appPro.passwordC.text.trim() !=
                                      //     appPro.verifyPasswordC.text.trim()) {
                                      //   print("password not matched");
                                      // } else {
                                      //   Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //           builder: (_) =>
                                      //               NumberVerifyScreen()));
                                      // }

                                    } else {
                                      showSnackBar(
                                        "Error",
                                        "password not matched",
                                      );
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
      );
    });
  }
}
