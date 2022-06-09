import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:planners_plan/screens/CheckOut/show_addtocart_items.dart';
import 'package:planners_plan/screens/bottomNavigation/Home/update_profile.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:planners_plan/services/SharedPref/globals.dart' as globals;
import 'package:planners_plan/services/SharedPref/globals.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                // color: Colors.amber,
                height: 15.h,
                child: Stack(
                  children: [
                    Container(
                      height: 15.h,
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
                        padding:
                            EdgeInsets.only(right: 3.h, left: 3.h, top: 3.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(adminLogo),
                            Text(
                              'My Profile',
                              style: TextStyle(
                                  color: kPrimaryWhite,
                                  fontSize: 12.sp,
                                  fontFamily: 'museo'),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const ShowAddToCartItemsScreen()));
                                    },
                                    child: const Icon(
                                      Icons.add_shopping_cart_rounded,
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  width: 2.h,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const UpdateProfile()));
                                    },
                                    child: SvgPicture.asset(editLogo)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(2.h),
                            child: Image.asset(
                              imgBg,
                              height: 25.h,
                              width: 23.h,
                            ),
                          ),
                          Positioned(
                            left: 3.5.h,
                            child: CircleAvatar(
                              radius: 6.h,
                              backgroundColor: Colors.transparent,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(300),
                                  child: globals.userProfileObj != null
                                      ? Image.network(imageBaseUrl +
                                          globals.userProfileObj!.user!.image
                                              .toString())
                                      : Image.asset(
                                          profileImg,
                                          height: 12.h,
                                          width: 12.h,
                                        )),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  globals.userProfileObj != null
                                      ? globals.userProfileObj!.user!.fName
                                          .toString()
                                      : 'Johan',
                                  style: TextStyle(
                                    color: kPrimaryblue,
                                    fontSize: 12.sp,
                                    fontFamily: 'museo',
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  globals.userProfileObj != null
                                      ? globals.userProfileObj!.user!.lName
                                          .toString()
                                      : 'Morrison',
                                  style: TextStyle(
                                    color: kPrimaryblue,
                                    fontSize: 12.sp,
                                    fontFamily: 'museo',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(locationLogo),
                                Text(
                                    '${globals.userProfileObj!.user!.location}',
                                    style: TextStyle(
                                      color: kPrimaryBlack5,
                                      fontSize: 12.sp,
                                      fontFamily: 'museo',
                                    ))
                              ],
                            ),
                            Text(
                              globals.userProfileObj != null
                                  ? globals.userProfileObj!.user!.phone
                                      .toString()
                                  : '+965 55 676 6651',
                              style: TextStyle(
                                color: kPrimaryblue,
                                fontSize: 12.sp,
                                fontFamily: 'museo',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 17.h,
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 3.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              globals.userProfileObj != null
                                  ? globals.userProfileObj!.user!.fName
                                      .toString()
                                  : 'Johan',
                              style: TextStyle(
                                color: kPrimaryblue,
                                fontSize: 12.sp,
                                fontFamily: 'museo',
                              ),
                            ),
                            SizedBox(height: 2.h),
                            const Divider(height: 2, thickness: 3),
                            SizedBox(height: 3.h),
                            Text(
                              globals.userProfileObj != null
                                  ? globals.userProfileObj!.user!.lName
                                      .toString()
                                  : 'Morrison',
                              style: TextStyle(
                                color: kPrimaryblue,
                                fontSize: 12.sp,
                                fontFamily: 'museo',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    height: 9.h,
                    width: double.infinity,
                    color: kPrimaryWhite,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                      child: Text(
                        globals.userProfileObj != null
                            ? globals.userProfileObj!.user!.phone.toString()
                            : '+965 55 676 6651',
                        style: TextStyle(
                          color: kPrimaryblue,
                          fontSize: 12.sp,
                          fontFamily: 'museo',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    height: 17.h,
                    width: double.infinity,
                    color: kPrimaryWhite,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            globals.userProfileObj!.user!.address.toString(),
                            style: const TextStyle(
                              fontFamily: 'museo',
                            ),
                          ),
                          SizedBox(height: 2.5.h),
                          const Divider(height: 1, thickness: 3),
                          // SizedBox(height: 1.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                globals.userProfileObj!.user!.address
                                    .toString(),
                                style: const TextStyle(
                                  fontFamily: 'museo',
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(nextIcon)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
