import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planners_plan/providers/appProvider.dart';
import 'package:planners_plan/providers/auth/authenti_repo.dart';
import 'package:planners_plan/providers/profile_auth/user_profile_provider.dart';
import 'package:planners_plan/screens/Auth/signup_screen.dart';
import 'package:planners_plan/screens/bottomNavigation/bottom_navigation_screen.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:planners_plan/services/SharedPref/SharedPref.dart';
import 'package:planners_plan/widgets/custom_button.dart';
import 'package:planners_plan/widgets/text_field.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:planners_plan/services/SharedPref/globals.dart' as globals;

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  // bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            height: 50.h,
                            width: double.infinity,
                            child: Image.asset(
                              signUpBgImage,
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
                            padding: EdgeInsets.only(top: 5.h),
                            alignment: Alignment.topCenter,
                            width: double.infinity,
                            color: Colors.transparent,
                            child: Image.asset(
                              whiteLogo,
                              width: 12.h,
                              height: 12.h,
                            ),
                          ),
                          Positioned(
                            top: 20.h,
                            left: 12.h,
                            child: Center(
                                child: Text(
                              '     Welcome to Planners\nPrepare, book, and be ready\n            for the big day',
                              style: TextStyle(
                                  color: kPrimaryWhite,
                                  fontSize: 14.sp,
                                  fontFamily: 'museo'),
                            )),
                          ),
                          Positioned(
                            top: 33.h,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: kPrimaryWhite),
                              height: 100.h,
                              width: 100.w,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 5.h,
                                    bottom: 2.h,
                                    left: 2.h,
                                    right: 2.h),
                                child: Column(
                                  children: [
                                    Text("Welcome to Planners",
                                        style: TextStyle(
                                            color: kPrimaryGreen,
                                            fontSize: 16.sp,
                                            fontFamily: 'museo')),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      'Prepare, book, and be ready',
                                      style: TextStyle(
                                          color: kPrimaryBlack5,
                                          fontSize: 14.sp,
                                          fontFamily: 'museo'),
                                    ),
                                    Text(
                                      'for the big day',
                                      style: TextStyle(
                                          color: kPrimaryBlack5,
                                          fontSize: 14.sp,
                                          fontFamily: 'museo'),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    TextFieldInput(
                                        textInputAction: TextInputAction.next,
                                        error: 'please enter email to continue',
                                        textEditingController: appPro.emailC,
                                        hintText: 'email',
                                        textInputType: TextInputType.name),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    TextFieldInput(
                                        error: 'please enter password',
                                        textInputAction: TextInputAction.next,
                                        textEditingController: appPro.passwordC,
                                        hintText: 'Password',
                                        isPass: true,
                                        isShow: appPro.isShow,
                                        onTapIcon: () {
                                          appPro.isShowPass();
                                        },
                                        textInputType:
                                            TextInputType.visiblePassword),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    CustomButton(
                                      title: 'Sign in',
                                      onTap: () async {
                                        if (formKey.currentState!.validate()) {
                                          appPro.setLoadingTrue();
                                          var response = await AuthentiRepo()
                                              .userLogin(
                                                  appPro.emailC.text.trim(),
                                                  appPro.passwordC.text.trim());
                                          if (response != null) {
                                            appPro.setLoadingFalse();
                                            if (response['success'] == true) {
                                              await Sharedpref()
                                                  .setToken(response['token']);

                                              globals.token = response['token'];
                                              globals.userProfileObj =
                                                  await ProfileRepo()
                                                      .fetchUserProfile();

                                              appPro.clearController();
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (conetxt) =>
                                                          const BottomNavigationBarScreen()));
                                            } else {
                                              showSnackBar(
                                                "Error",
                                                response["status"],
                                              );
                                            }
                                          } else {
                                            appPro.setLoadingFalse();
                                            showSnackBar(
                                              "Error",
                                              "Something went wrong",
                                            );
                                          }
                                        }
                                      },
                                    ),
                                    SizedBox(height: 1.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          "Don't have an account?",
                                          style: TextStyle(fontFamily: 'museo'),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            appPro.clearController();

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const SignupScreen()));
                                          },
                                          child: Text(
                                            "Sign up",
                                            style: TextStyle(
                                                color: kPrimaryGreen,
                                                fontSize: 14.sp,
                                                fontFamily: 'museo'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 2.h),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                                onTap: () {},
                                                child: SvgPicture.asset(fb)),
                                            GestureDetector(
                                                onTap: () {},
                                                child:
                                                    SvgPicture.asset(twiter)),
                                            GestureDetector(
                                                onTap: () {},
                                                child:
                                                    SvgPicture.asset(google)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
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
