import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:planners_plan/providers/appProvider.dart';
import 'package:planners_plan/providers/auth/CartRepo/cartRepo.dart';
import 'package:planners_plan/screens/bottomNavigation/Home/home_screen.dart';
import 'package:planners_plan/screens/bottomNavigation/bottom_navigation_screen.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PaymentStatus extends StatelessWidget {
  const PaymentStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          toolbarHeight: 12.h,
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Payment Status',
                    style: TextStyle(fontSize: 12.sp, fontFamily: "museo"),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(1.h),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.h),
                    Center(child: Image.asset(successLogo)),
                    SizedBox(height: 5.h),
                    Text(
                      "Payment Success",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: kPrimaryBlack5,
                        fontFamily: 'museo',
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "When an unknown printer took a galley of type and scrambled it to make a type specimen book, it has survived not only five centuries,",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: kPrimaryBlack5,
                        fontFamily: 'museo',
                      ),
                    ),
                    SizedBox(height: 15.h),
                    InkWell(
                      onTap: () async {
                        appPro.setLoadingTrue();
                        var result = await CartRepo().checkOut();
                        if (result != null) {
                          appPro.setLoadingFalse();
                          if (result['status']) {
                            showSnackBar(
                              "Success",
                              result['message'],
                            );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        BottomNavigationBarScreen()));
                          } else {
                            showSnackBar(
                              "Error",
                              result['message'],
                            );
                          }
                        } else {
                          showSnackBar(
                            "Error",
                            'Something went wrong please try again later.',
                          );
                        }
                      },
                      child: Container(
                        height: 7.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kPrimaryblue,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            'Finish',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'museo',
                                fontSize: 10.sp),
                          ),
                        ),
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
