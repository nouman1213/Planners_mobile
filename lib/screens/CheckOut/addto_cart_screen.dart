import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:planners_plan/models/sub_category_service_detail.dart';
import 'package:planners_plan/models/sub_category_services_model.dart';
import 'package:planners_plan/providers/appProvider.dart';
import 'package:planners_plan/providers/auth/CartRepo/cartRepo.dart';
import 'package:planners_plan/providers/category/category_repo.dart';
import 'package:planners_plan/screens/CheckOut/proceed_to_payment.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:planners_plan/services/SharedPref/globals.dart';
import 'package:planners_plan/widgets/calender.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:planners_plan/services/SharedPref/globals.dart' as globals;

class AddToCartScreen extends StatefulWidget {
  AddToCartScreen(
      {Key? key,
      required this.subCategoriesServiceDetail,
      required this.selectAddonsId,
      required this.selectAddons})
      : super(key: key);
  List selectAddonsId = [];
  List selectAddons = [];
  SubCategoriesServiceDetail subCategoriesServiceDetail;

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  @override
  void initState() {
    // TODO: implement initState

    getAddonsId();
    super.initState();
  }

  String? commaAddonsIds = '';
  getAddonsId() {
    // DateTime now = DateTime.now();
    // var appPro = Provider.of<AppProvider>(context, listen: false);
    // appPro.setFormatedDate(now);

    print(widget.selectAddons);
    print(widget.selectAddonsId);

    for (int i = 0; i < widget.selectAddons.length; i++) {
      if (widget.selectAddons[i]) {
        widget.selectAddonsId[i] =
            widget.subCategoriesServiceDetail.service!.add![i].id.toString();
        commaAddonsIds =
            commaAddonsIds.toString() + widget.selectAddonsId[i] + ',';
        setState(() {});
      } else {
        widget.selectAddonsId[i] = null;
        setState(() {});
      }
    }
    // widget.selectAddonsId.removeWhere((element) => element == null);
    print("string id: ${widget.selectAddonsId}");
    print("string id: $commaAddonsIds");
    // print(widget.selectAddons);
    // print(widget.selectAddonsId);
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
          title: Container(
            height: 7.h,
            child: Padding(
              padding: EdgeInsets.all(1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(''),
                  Text(
                    ' Add to cart',
                    style: TextStyle(fontSize: 12.sp, fontFamily: 'museo'),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          width: 30,
                          height: 30,
                          color: Colors.transparent,
                          child: SvgPicture.asset(cancal)))
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(1.h),
                child: Column(
                  children: [
                    Container(
                        height: 16.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kPrimaryWhite,
                        ),
                        child: Row(
                          children: [
                            Container(
                                height: 20.h,
                                child: Padding(
                                  padding: EdgeInsets.all(1.h),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Image.network(
                                      imageBaseUrl +
                                          widget.subCategoriesServiceDetail
                                              .service!.coverImage
                                              .toString(),
                                      width: 20.w,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                )),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 5.h, left: 3.h),
                                    child: Text(
                                      widget.subCategoriesServiceDetail.service!
                                          .titleEn
                                          .toString(),
                                      style: TextStyle(
                                        color: kPrimaryBlack5,
                                        fontSize: 12.sp,
                                        fontFamily: 'museo',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 3.w),
                                      SvgPicture.asset(aadminLogo,
                                          color: kPrimaryblue),
                                      SizedBox(width: 2.w),
                                      Text(
                                        widget.subCategoriesServiceDetail
                                            .service!.capicity
                                            .toString(),
                                        style: TextStyle(
                                          color: kPrimaryBlack5,
                                          fontSize: 10.sp,
                                          fontFamily: 'museo',
                                        ),
                                      ),
                                      SizedBox(width: 2.w),
                                      Text(
                                        // ignore: prefer_if_null_operators
                                        widget.subCategoriesServiceDetail
                                                    .service!.rating !=
                                                null
                                            ? widget.subCategoriesServiceDetail
                                                .service!.rating
                                            : "0",
                                        style: TextStyle(
                                          color: kPrimaryBlack5,
                                          fontSize: 10.sp,
                                          fontFamily: 'museo',
                                        ),
                                      ),
                                      SizedBox(width: 2.w),
                                      SvgPicture.asset(
                                        yellowStar,
                                      ),
                                      SizedBox(width: 30.w),
                                      Text(
                                          '${widget.subCategoriesServiceDetail.service!.amount} KWD',
                                          style: TextStyle(
                                            color: kPrimaryblue,
                                            fontSize: 10.sp,
                                            fontFamily: 'museo',
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    SizedBox(height: 2.h),
                    Container(
                        height: 17.h,
                        child: CalenderWidget(
                            title: "From",
                            date: appPro.formattedDate!,
                            dateTimeOnChanged: (time) {
                              appPro.setTimeToday(time);
                              print(appPro.dateTimeToday);
                            },
                            datePickOnTap: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  maxTime: DateTime(2050, 12, 12),
                                  onChanged: (date) {}, onConfirm: (date) {
                                appPro.setFormatedDate(date);
                                print(appPro.formattedDate);
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en);
                            })),
                    SizedBox(height: 2.h),
                    SizedBox(
                        height: 17.h,
                        child: CalenderWidget(
                            title: "To",
                            date: appPro.formattedDate!,
                            dateTimeOnChanged: (time) {
                              appPro.setTimeTomorrow(time);
                              print(appPro.dateTimeTomorrow);
                            },
                            datePickOnTap: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  maxTime: DateTime(2050, 12, 12),
                                  onChanged: (date) {}, onConfirm: (date) {
                                appPro.setFormatedDate(date);
                                print(appPro.formattedDate);
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en);
                            })),
                    SizedBox(height: 2.h),
                    Container(
                      height: 15.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kPrimaryWhite,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(1.h),
                        child: Column(
                          children: [
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       'Total',
                            //       style: TextStyle(
                            //         fontSize: 8.sp,
                            //         color: kPrimaryBlack5,
                            //         fontFamily: 'museo',
                            //       ),
                            //     ),
                            //     Text(
                            //       '${subService!.amount} KWD',
                            //       style: TextStyle(
                            //         fontSize: 8.sp,
                            //         color: kPrimaryBlack5,
                            //         fontFamily: 'museo',
                            //       ),
                            //     )
                            //   ],
                            // ),
                            // SizedBox(height: 2.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Subtotal',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: kPrimaryBlack5,
                                    fontFamily: 'museo',
                                  ),
                                ),
                                Text(
                                  '${widget.subCategoriesServiceDetail.service!.amount} KWD',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: kPrimaryBlack5,
                                    fontFamily: 'museo',
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 1.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Discount',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: kPrimaryBlack5,
                                    fontFamily: 'museo',
                                  ),
                                ),
                                Text(
                                  '0 KWD',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: kPrimaryBlack5,
                                    fontFamily: 'museo',
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 1.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tax',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: kPrimaryBlack5,
                                    fontFamily: 'museo',
                                  ),
                                ),
                                Text(
                                  '0%',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: kPrimaryBlack5,
                                    fontFamily: 'museo',
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: kPrimaryblue,
                                    fontFamily: 'museo',
                                  ),
                                ),
                                Text(
                                  '${widget.subCategoriesServiceDetail.service!.amount} KWD',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: kPrimaryblue,
                                    fontFamily: 'museo',
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    GestureDetector(
                      onTap: () async {
                        appPro.setLoadingTrue();
                        var result = await CartRepo().addToCartApi(
                          globals.userProfileObj!.user!.id.toString(),
                          widget.subCategoriesServiceDetail.service!.id
                              .toString(),
                          widget.subCategoriesServiceDetail.service!.vendorId
                              .toString(),
                          commaAddonsIds!,
                          appPro.formattedDate.toString().split(" ")[0],
                          appPro.dateTimeToday
                              .toString()
                              .split(" ")[1]
                              .split(".")[0]
                              .substring(0, 5),
                          appPro.dateTimeTomorrow
                              .toString()
                              .split(" ")[1]
                              .split(".")[0]
                              .substring(0, 5),
                        );
                        if (result != null) {
                          appPro.setLoadingFalse();
                          if (result['status']) {
                            showSnackBar(
                              "Success",
                              result['message'],
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const ProceedToPayScreen()));
                          } else {
                            showSnackBar(
                              "Error",
                              result['message'],
                            );
                          }
                        }
                      },
                      child: Container(
                        height: 7.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kPrimaryblue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Add to my cart",
                            style: TextStyle(
                              color: kPrimaryWhite,
                              fontSize: 10.sp,
                              fontFamily: 'museo',
                            ),
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
