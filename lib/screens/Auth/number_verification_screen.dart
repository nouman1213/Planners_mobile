import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:planners_plan/providers/appProvider.dart';
import 'package:planners_plan/providers/auth/authenti_repo.dart';
import 'package:planners_plan/screens/Auth/otp_verification_screen.dart';
import 'package:planners_plan/screens/Auth/signup_screen.dart';

import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:planners_plan/widgets/custom_button.dart';
import 'package:planners_plan/widgets/text_field.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

import 'login_screen.dart';

class NumberVerifyScreen extends StatelessWidget {
  NumberVerifyScreen({Key? key}) : super(key: key);
  String? sCountryCode;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (conetxt, appPro, _) {
      return Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: 100.h,
            width: 100.w,
            // color: Colors.red,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
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
                                        builder: (_) => const SignupScreen()));
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
                              'Verify your Number',
                              style: TextStyle(
                                  color: kPrimaryWhite,
                                  fontSize: 12.sp,
                                  fontFamily: 'museo'),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => OtpVerifyScreen()));
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
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.h,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 18.w,
                              margin: const EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(30)),
                              child: CountryCodePicker(
                                onChanged: (value) {
                                  sCountryCode = value.toString();
                                },
                                showFlag: false,
                                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                initialSelection: 'IT',
                                favorite: const ['+39', 'FR'],
                                // optional. Shows only country name and flag
                                showCountryOnly: false,
                                // optional. Shows only country name and flag when popup is closed.
                                showOnlyCountryWhenClosed: false,
                                // optional. aligns the flag and the Text left
                                alignLeft: false,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFieldInput(
                                  textInputAction: TextInputAction.next,
                                  error: 'Please input phone number',
                                  textEditingController: appPro.phoneC,
                                  hintText: 'Enter your Number',
                                  textInputType: TextInputType.phone),
                            ),
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
                  title: 'Send confirmation code',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
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
                          "Alert",
                          "Something went wrong. Try again later",
                        );
                        appPro.setLoadingFalse();
                      }
                    }
                  },
                ),
                SizedBox(height: 20),
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
        ),
      );
    });
  }
}
