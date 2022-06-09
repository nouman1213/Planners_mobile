import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planners_plan/screens/Auth/login_screen.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:planners_plan/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  String? sCountryCode;

  String selectedValue = "kuwait";
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    // TODO: implement initState
    super.initState();
  }

  bool isLanEnSelect = false;
  bool isLanArSelect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: 20.h,
                    width: 26.w,
                    child: SvgPicture.asset(gradientLogo),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'Planners',
                  style: TextStyle(
                      color: kPrimaryBlack5,
                      fontSize: 20.sp,
                      fontFamily: 'museo'),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  height: 9.h,
                  decoration: BoxDecoration(
                      color: kPrimaryWhite,
                      border: Border.all(color: kPrimaryGreen),
                      borderRadius: BorderRadius.circular(30)),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      CountryCodePicker(
                        flagDecoration: BoxDecoration(
                            border: Border.all(color: kPrimaryBlack5)),
                        textStyle: TextStyle(fontSize: 14.sp),
                        onChanged: (value) {
                          sCountryCode = value.toString();
                        },
                        showFlag: true,
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'الكويت',
                        favorite: const ['+965', 'الكويت'],
                        // optional. Shows only country name and flag
                        showCountryOnly: true,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: true,
                        // optional. aligns the flag and the Text left
                        alignLeft: true,
                      ),
                      Container(
                        height: 4.h,
                        width: 4.w,
                        margin: EdgeInsets.only(right: 5.h),
                        child: SvgPicture.asset(downArrow),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          isLanEnSelect = true;
                          isLanArSelect = false;
                          setState(() {});
                        },
                        child: Container(
                          height: 9.h,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [
                                  isLanEnSelect
                                      ? const Color(0xff7628A2)
                                      : kPrimaryWhite,
                                  isLanEnSelect
                                      ? const Color(0xff27A49A)
                                      : kPrimaryWhite,
                                ],
                              ),
                              border: Border.all(color: kPrimaryGreen),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text(
                            "English",
                            style: TextStyle(
                                fontFamily: 'museo',
                                color: isLanEnSelect
                                    ? kPrimaryWhite
                                    : kPrimaryBlack),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          isLanEnSelect = false;
                          isLanArSelect = true;
                          setState(() {});
                        },
                        child: Container(
                          height: 9.h,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [
                                  isLanArSelect
                                      ? const Color(0xff7628A2)
                                      : kPrimaryWhite,
                                  isLanArSelect
                                      ? const Color(0xff27A49A)
                                      : kPrimaryWhite,
                                ],
                              ),
                              border: Border.all(color: kPrimaryGreen),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text(
                            "عربي",
                            style: TextStyle(
                                fontFamily: 'museo',
                                color: isLanArSelect
                                    ? kPrimaryWhite
                                    : kPrimaryBlack),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7.h),
                CustomButton(
                  title: 'Next',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
