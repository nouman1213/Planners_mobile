import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planners_plan/models/sub_category_service_detail.dart';
import 'package:planners_plan/models/sub_category_services_model.dart';
import 'package:planners_plan/providers/appProvider.dart';
import 'package:planners_plan/providers/category/category_repo.dart';
import 'package:planners_plan/screens/bottomNavigation/Home/vender_services_details.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:planners_plan/services/SharedPref/globals.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SubCatgoryServicesScreen extends StatelessWidget {
  SubCatgoryServicesScreen(
      {Key? key, required this.subCategoriesServices, this.parentTitle})
      : super(key: key);
  SubCategoriesServices? subCategoriesServices;
  String? parentTitle;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Scaffold(
        backgroundColor: kPrimaryWhite,
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
          title: SizedBox(
            height: 6.h,
            child: Padding(
              padding: EdgeInsets.all(1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          alignment: Alignment.centerLeft,
                          height: 40,
                          width: 40,
                          color: Colors.transparent,
                          child: SvgPicture.asset(backIcon))),
                  Text(
                    '$parentTitle(${subCategoriesServices!.category!.title})',
                    style: TextStyle(
                        color: kPrimaryWhite,
                        fontSize: 12.sp,
                        fontFamily: 'museo'),
                  ),
                  Image.network(
                    imageBaseUrl + subCategoriesServices!.category!.iconImage!,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: subCategoriesServices!.subService!.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () async {
                    appPro.setLoadingTrue();
                    SubCategoriesServiceDetail? subCategoriesServiceDetail =
                        await CategoryRepo().fetchSubCategoryServiceDetail(
                            subCategoriesServices!.subService![index].id
                                .toString());
                    if (subCategoriesServiceDetail != null) {
                      // print(specificCategoryServices);
                      appPro.setLoadingFalse();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SubCategoryServicDetailScreen(
                                    subCategoriesServiceDetail:
                                        subCategoriesServiceDetail,
                                  )));
                    } else {
                      appPro.setLoadingFalse();
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Center(
                      child: Stack(
                        children: [
                          Stack(
                            children: <Widget>[
                              Container(
                                //height: 40.h,
                                width: 100.w,
                                // color:Colors.red,
                                child: Image.network(
                                  imageBaseUrl +
                                      subCategoriesServices!
                                          .subService![index].coverImage!,
                                ),
                              ),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  height: 7.5.h,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                        kPrimaryGreen.withOpacity(1),
                                        kPrimaryBlack.withOpacity(0.2),
                                      ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight)),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h, horizontal: 1.h),
                                  child: Padding(
                                    padding: EdgeInsets.all(0.2.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              '${subCategoriesServices!.subService![index].titleEn}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8.sp,
                                                fontFamily: 'museo',
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  locationLogo,
                                                  height: 2.h,
                                                  color: kPrimaryWhite,
                                                ),
                                                SizedBox(width: 1.w),
                                                Text(
                                                  '${subCategoriesServices!.subService![index].address}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 8.sp,
                                                    fontFamily: 'museo',
                                                  ),
                                                ),
                                                SizedBox(width: 1.w),
                                                SvgPicture.asset(aadminLogo),
                                                SizedBox(width: 1.w),
                                                Text(
                                                  '${subCategoriesServices!.subService![index].capicity}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 8.sp,
                                                    fontFamily: 'museo',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: kPrimaryWhite,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          width: 7.h,
                                          height: 7.h,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                subCategoriesServices!
                                                    .subService![index].rating
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 8.sp,
                                                  fontFamily: 'museo',
                                                ),
                                              ),
                                              SvgPicture.asset(
                                                yellowStar,
                                                height: 2.h,
                                                width: 2.h,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
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
