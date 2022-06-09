import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:planners_plan/screens/CheckOut/add_new_payment.dart';
import 'package:planners_plan/screens/CheckOut/addto_cart_screen.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:sizer/sizer.dart';

class ProceedToPayScreen extends StatefulWidget {
  const ProceedToPayScreen({Key? key}) : super(key: key);

  @override
  State<ProceedToPayScreen> createState() => _ProceedToPayScreenState();
}

class _ProceedToPayScreenState extends State<ProceedToPayScreen> {
  bool _visa = false;
  bool _master = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 12.h,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              // ignore: unnecessary_const
              gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xff1A83A5),
              Color(0xff7628A2),
            ],
          )),
        ),
        title: Container(
          height: 5.h,
          child: Padding(
            padding: EdgeInsets.all(1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(''),
                Text(
                  'Checkout',
                  style: TextStyle(fontSize: 12.sp, fontFamily: "museo"),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddToCartScreen(subService: subService, venderServices: venderServices)));
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        // color: Colors.red,
                        child: SvgPicture.asset(cancal)))
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(1.5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: kPrimaryWhite,
                    borderRadius: BorderRadius.circular(10)),
                height: 13.h,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                              child: InkWell(
                            onTap: () {
                              setState(() {
                                _visa = !_visa;
                                _master = false;
                              });
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(1.h),
                                  child: _visa
                                      // ignore: prefer_const_constructors
                                      ? SvgPicture.asset(checkedICon)
                                      // ignore: prefer_const_constructors
                                      : SvgPicture.asset(uncheckedButton)),
                            ),
                          )),
                          Text(
                            '**** **** ***6567',
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: 'museo',
                                color: kPrimaryBlack5),
                          ),
                          Image.asset(visaImage),
                        ],
                      ),
                      Text(
                        '02/20',
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: 'museo',
                            color: kPrimaryBlack5),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Container(
                decoration: BoxDecoration(
                    color: kPrimaryWhite,
                    borderRadius: BorderRadius.circular(10)),
                height: 12.h,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.h, horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                              child: InkWell(
                            onTap: () {
                              setState(() {
                                _visa = false;
                                _master = !_master;
                              });
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(1.h),
                                  child: _master
                                      // ignore: prefer_const_constructors
                                      ? SvgPicture.asset(checkedICon)
                                      // ignore: prefer_const_constructors
                                      : SvgPicture.asset(uncheckedButton)),
                            ),
                          )),
                          Text(
                            '**** **** ***8872',
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: 'museo',
                                color: kPrimaryBlack5),
                          ),
                          Image.asset(masterLogo),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        '03/21',
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: 'museo',
                            color: kPrimaryBlack5),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Add new payment',
                style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: 'museo',
                    color: kPrimaryBlack5),
              ),
              SizedBox(height: 2.h),
              Container(
                decoration: BoxDecoration(
                    color: kPrimaryWhite,
                    borderRadius: BorderRadius.circular(10)),
                height: 39.h,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.h, horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(visaImage),
                          Text(
                            'Add visa card',
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: 'museo',
                                color: kPrimaryBlack5),
                          ),
                          SvgPicture.asset(nextIcon),
                        ],
                      ),
                      const Divider(thickness: 1),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(masterLogo),
                          Text(
                            'Add Master card',
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: 'museo',
                                color: kPrimaryBlack5),
                          ),
                          SvgPicture.asset(nextIcon),
                        ],
                      ),
                      const Divider(thickness: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(knetImg),
                          Text(
                            'Add K-neet',
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: 'museo',
                                color: kPrimaryBlack5),
                          ),
                          SvgPicture.asset(nextIcon),
                        ],
                      ),
                      const Divider(thickness: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(applePayLogo),
                          Text(
                            'Add Apple pay',
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: 'museo',
                                color: kPrimaryBlack5),
                          ),
                          SvgPicture.asset(nextIcon),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AddNewPayment()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 7.h,
                    width: double.infinity.h,
                    decoration: BoxDecoration(
                      color: kPrimaryblue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Proceed",
                        style: TextStyle(
                            color: kPrimaryWhite,
                            fontFamily: 'museo',
                            fontSize: 10.sp),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
