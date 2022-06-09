import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planners_plan/models/sub_category_services_model.dart';
import 'package:planners_plan/models/sub_category_model.dart';
import 'package:planners_plan/providers/appProvider.dart';
import 'package:planners_plan/providers/category/category_repo.dart';
import 'package:planners_plan/screens/bottomNavigation/Home/venders_service_screen.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:planners_plan/services/SharedPref/globals.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SubCategoryScreen extends StatelessWidget {
  SubCategoryScreen({
    Key? key,
    required this.subCategories,
  }) : super(key: key);
  SubCategories? subCategories;

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
            title: Container(
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
                            width: 40,
                            height: 70,
                            color: Colors.transparent,
                            child: SvgPicture.asset(backIcon))),
                    Text(
                      '${subCategories!.category!.title}',
                      style: TextStyle(
                          color: kPrimaryWhite,
                          fontSize: 12.sp,
                          fontFamily: 'museo'),
                    ),
                    Image.network(
                      imageBaseUrl + subCategories!.category!.iconImage!,
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
                itemCount: subCategories!.sub!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      appPro.setLoadingTrue();
                      SubCategoriesServices? subCategoriesServices =
                          await CategoryRepo().fetchSubCategoryServices(
                              subCategories!.sub![index].id.toString());
                      if (subCategoriesServices != null) {
                        // print(specificCategoryServices);
                        appPro.setLoadingFalse();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SubCatgoryServicesScreen(
                                      parentTitle:
                                          subCategories!.category!.title,
                                      subCategoriesServices:
                                          subCategoriesServices,
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
                                  // height: 40.h,
                                  // width: 100.w,
                                  // color: Colors.red,
                                  child: Image.network(
                                    imageBaseUrl +
                                        subCategories!.sub![index].headerImage!,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                          kPrimaryGreen.withOpacity(0.8),
                                          kPrimaryBlack.withOpacity(0.5),
                                        ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight)),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${subCategories!.sub![index].title}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 8.sp,
                                                  fontFamily: 'museo'),
                                            ),
                                            Text(
                                              "${subCategories!.sub![index].description}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            // Text(
                                            //   "\$${subCategoryServices!.price}",
                                            //   style: TextStyle(
                                            //       color: Colors.white,
                                            //       fontSize: 8.sp,
                                            //       fontFamily: 'museo'),
                                            // ),
                                            // const SizedBox(
                                            //   width: 10,
                                            // ),
                                            SvgPicture.asset(
                                              nextIcon,
                                              color: kPrimaryWhite,
                                            ),
                                          ],
                                        )
                                      ],
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
          ));
    });
  }
}
