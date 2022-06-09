import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planners_plan/models/user_profile.dart';
import 'package:planners_plan/providers/appProvider.dart';
import 'package:planners_plan/providers/auth/authenti_repo.dart';
import 'package:planners_plan/providers/profile_auth/user_profile_provider.dart';

import 'package:planners_plan/screens/Auth/login_screen.dart';
import 'package:planners_plan/screens/CheckOut/show_addtocart_items.dart';
import 'package:planners_plan/screens/bottomNavigation/ToDo/todo_list.dart';
import 'package:planners_plan/screens/bottomNavigation/bottom_navigation_screen.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:planners_plan/services/SharedPref/SharedPref.dart';
import 'package:planners_plan/services/SharedPref/globals.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:planners_plan/services/SharedPref/globals.dart' as globals;

class DrawerFunction extends StatefulWidget {
  DrawerFunction({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerFunction> createState() => _DrawerFunctionState();
}

class _DrawerFunctionState extends State<DrawerFunction> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Drawer(
        backgroundColor: Colors.grey[200],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: kPrimaryGreen,
              ),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Image.asset(
                        imgBg,
                        height: 23.h,
                        width: 23.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 1.5.h),
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
                      Container(
                        margin: EdgeInsets.only(left: 17.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                    color: kPrimaryWhite,
                                    fontSize: 12.sp,
                                    fontFamily: 'museo',
                                  ),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  globals.userProfileObj != null
                                      ? globals.userProfileObj!.user!.lName
                                          .toString()
                                      : 'Morrison',
                                  style: TextStyle(
                                    color: kPrimaryWhite,
                                    fontSize: 12.sp,
                                    fontFamily: 'museo',
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              globals.userProfileObj != null
                                  ? globals.userProfileObj!.user!.phone
                                      .toString()
                                  : '+965 55 676 6651',
                              style: TextStyle(
                                color: kPrimaryWhite,
                                fontSize: 12.sp,
                                fontFamily: 'museo',
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ListTile(
                  title: const Text('My Bookings',
                      style: TextStyle(
                        fontFamily: 'museo',
                      )),
                  trailing: SvgPicture.asset(nextIcon),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ShowAddToCartItemsScreen()));
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('My To do list',
                      style: TextStyle(
                        fontFamily: 'museo',
                      )),
                  trailing: SvgPicture.asset(nextIcon),
                  onTap: () {
                    Navigator.pop(context);
                    appPro.setBottomIndex(1);
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Settings',
                      style: TextStyle(
                        fontFamily: 'museo',
                      )),
                  trailing: SvgPicture.asset(nextIcon),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('About Plannners',
                      style: TextStyle(
                        fontFamily: 'museo',
                      )),
                  trailing: SvgPicture.asset(nextIcon),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Share App',
                      style: TextStyle(
                        fontFamily: 'museo',
                      )),
                  trailing: SvgPicture.asset(nextIcon),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(),
                InkWell(
                  onTap: () async {
                    await Sharedpref().removeToke();
                    var result = await AuthentiRepo().logout();
                    if (result != null) {
                      showSnackBar(
                        '',
                        '${result["message"]}',
                      );
                      appPro.setLoadingTrue();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginScreen()));
                      appPro.setLoadingFalse();
                    }
                  },
                  child: ListTile(
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                        fontFamily: 'museo',
                      ),
                    ),
                    trailing: SvgPicture.asset(nextIcon),
                    // onTap: () {
                    //   Navigator.pop(context);
                    // },
                  ),
                ),
                const Divider(),
              ],
            ),
          ],
        ),
      );
    });
  }
}
