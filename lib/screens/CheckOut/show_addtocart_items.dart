import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planners_plan/models/user_cart_items_model.dart';
import 'package:planners_plan/providers/appProvider.dart';
import 'package:planners_plan/providers/auth/CartRepo/cartRepo.dart';
import 'package:planners_plan/screens/CheckOut/proceed_to_payment.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:planners_plan/services/SharedPref/globals.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ShowAddToCartItemsScreen extends StatefulWidget {
  const ShowAddToCartItemsScreen({Key? key}) : super(key: key);

  @override
  State<ShowAddToCartItemsScreen> createState() =>
      _ShowAddToCartItemsScreenState();
}

class _ShowAddToCartItemsScreenState extends State<ShowAddToCartItemsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getCartItems();
    super.initState();
  }

  UserCartItemsModel? userCartItemsModel;
  getCartItems() async {
    var appPro = Provider.of<AppProvider>(context, listen: false);
    // appPro.setLoadingTrue();
    userCartItemsModel = await CartRepo().fetchCartItemList();
    debugPrint(userCartItemsModel!.bookings!.isEmpty ? "0" : "1");
    // appPro.setLoadingFalse();

    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          toolbarHeight: 12.h,
          backgroundColor: Colors.grey,
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
          title: SizedBox(
            height: 5.h,
            child: Padding(
              padding: EdgeInsets.all(1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(''),
                  Text(
                    ' Cart Items',
                    style: TextStyle(fontSize: 10.sp, fontFamily: 'museo'),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(cancal))
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            userCartItemsModel != null
                ? userCartItemsModel!.bookings!.isNotEmpty
                    ? ListView.builder(
                        itemCount: userCartItemsModel!.bookings!.length,
                        itemBuilder: (BuildContext context, int index) {
                          var listItem = userCartItemsModel!.bookings;

                          return Padding(
                            padding: EdgeInsets.all(1.h),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const ProceedToPayScreen()));
                                  },
                                  child: Container(
                                      height: 18.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: kPrimaryWhite,
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(1.h),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: Image.network(
                                                imageBaseUrl +
                                                    userCartItemsModel!
                                                        .service![index]
                                                        .coverImage
                                                        .toString(),
                                                // width: 20.w,
                                                //fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 2.h, left: 3.h),
                                                  child: Text(
                                                    '${userCartItemsModel!.service![index].titleEn}',
                                                    // subService!.titleEn.toString(),
                                                    style: TextStyle(
                                                      color: kPrimaryBlack5,
                                                      fontSize: 10.sp,
                                                      fontFamily: 'museo',
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 2.h, left: 3.h),
                                                      child: Text(
                                                        'From Time:',
                                                        // subService!.titleEn.toString(),
                                                        style: TextStyle(
                                                          color: kPrimaryBlack5,
                                                          fontSize: 10.sp,
                                                          fontFamily: 'museo',
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 1.h, left: 3.h),
                                                      child: Text(
                                                        '${userCartItemsModel!.bookings![index].timeFrom}',
                                                        // subService!.titleEn.toString(),
                                                        style: TextStyle(
                                                          color: kPrimaryBlack5,
                                                          fontSize: 10.sp,
                                                          fontFamily: 'museo',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 2.h, left: 3.h),
                                                      child: Text(
                                                        'To Time:',
                                                        // subService!.titleEn.toString(),
                                                        style: TextStyle(
                                                          color: kPrimaryBlack5,
                                                          fontSize: 10.sp,
                                                          fontFamily: 'museo',
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 1.h, left: 3.h),
                                                      child: Text(
                                                        '${userCartItemsModel!.bookings![index].timeTo}',
                                                        // subService!.titleEn.toString(),
                                                        style: TextStyle(
                                                          color: kPrimaryBlack5,
                                                          fontSize: 10.sp,
                                                          fontFamily: 'museo',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 2.h, left: 3.h),
                                                      child: Text(
                                                        'Date:',
                                                        // subService!.titleEn.toString(),
                                                        style: TextStyle(
                                                          color: kPrimaryBlack5,
                                                          fontSize: 10.sp,
                                                          fontFamily: 'museo',
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 1.h, left: 3.h),
                                                      child: Text(
                                                        '${userCartItemsModel!.bookings![index].bookingDate}',
                                                        // subService!.titleEn.toString(),
                                                        style: TextStyle(
                                                          color: kPrimaryBlack5,
                                                          fontSize: 10.sp,
                                                          fontFamily: 'museo',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          InkWell(
                                              onTap: () async {
                                                appPro.setLoadingTrue();
                                                var result = await CartRepo()
                                                    .deleteCartItem(
                                                        userCartItemsModel!
                                                            .bookings![index].id
                                                            .toString());
                                                if (result != null) {
                                                  appPro.setLoadingFalse();

                                                  if (result['status']) {
                                                    setState(() {
                                                      listItem!.removeAt(index);
                                                    });

                                                    showSnackBar(
                                                      "Success",
                                                      result["message"],
                                                    );
                                                  } else {
                                                    showSnackBar(
                                                      "Error",
                                                      result["message"],
                                                    );
                                                  }
                                                } else {
                                                  appPro.setLoadingFalse();
                                                  showSnackBar(
                                                    "Error",
                                                    'Something went wrong please try again later',
                                                  );
                                                }
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 8.h,
                                                width: 12.w,
                                                // color: Colors.red,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 1.h),
                                                  child:
                                                      const Icon(Icons.cancel),
                                                ),
                                              ))
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : Container(
                        height: 100.h,
                        width: 100.w,
                        // color: Colors.red,
                        child: Center(
                            child: Text("No Item Found",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12.sp))),
                      )
                : const Center(
                    child: SpinKitChasingDots(
                      color: kPrimaryGreen,
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

  datePicker(BuildContext context) {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2018, 3, 5),
        maxTime: DateTime(2019, 6, 7), onChanged: (date) {
      print('change $date');
    }, onConfirm: (date) {
      print('confirm $date');
    }, currentTime: DateTime.now(), locale: LocaleType.zh);
  }
}
