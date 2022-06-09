import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planners_plan/models/sub_category_service_detail.dart';
import 'package:planners_plan/models/sub_category_services_model.dart';
import 'package:planners_plan/screens/CheckOut/addto_cart_screen.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:planners_plan/services/SharedPref/globals.dart';
import 'package:sizer/sizer.dart';
import 'package:planners_plan/services/SharedPref/globals.dart' as globals;

class SubCategoryServicDetailScreen extends StatefulWidget {
  SubCategoryServicDetailScreen(
      {Key? key, required this.subCategoriesServiceDetail})
      : super(key: key);
  SubCategoriesServiceDetail subCategoriesServiceDetail;

  @override
  State<SubCategoryServicDetailScreen> createState() =>
      _SubCategoryServicDetailScreenState();
}

class _SubCategoryServicDetailScreenState
    extends State<SubCategoryServicDetailScreen> {
  List<String>? imageList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSliderImage();
    selectAddOns();
  }

  fetchSliderImage() async {
    for (int i = 0;
        i < widget.subCategoriesServiceDetail.subImages!.length;
        i++) {
      // debugPrint(widget.subCategoriesServiceDetail.subImages![i].imagePath.toString());
      imageList!.add(
          widget.subCategoriesServiceDetail.subImages![i].imagePath.toString());
      setState(() {});
    }
  }

  List selectAddons = [];
  List selectAddonsId = [];
  selectAddOns() {
    for (int i = 0;
        i < widget.subCategoriesServiceDetail.service!.add!.length;
        i++) {
      selectAddons.add(false);
      // debugPrint("i" + i.toString());
    }
    selectAddonsId.length = selectAddons.length;
    debugPrint("addons: " + selectAddons.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w),
        child: Column(
          children: [
            Container(
              height: 5.h,
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
            // imageList!.isEmpty
            //     ? SizedBox()
            //     :
            SizedBox(
                height: 40.h,
                child: CSlider(
                  appBarIcon:
                      widget.subCategoriesServiceDetail.category!.iconImage!,
                  rating: widget.subCategoriesServiceDetail.service!.rating,
                  imgList: imageList,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text(
                        '${widget.subCategoriesServiceDetail.service!.titleEn}',
                        style: TextStyle(
                          color: kPrimaryBlack5,
                          fontSize: 12.sp,
                          fontFamily: 'museo',
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        launchURL('tel:' +
                            widget.subCategoriesServiceDetail.service!
                                .mobileNumber!);
                      },
                      child: Image.asset(
                        phone,
                        width: 8.h,
                        height: 8.h,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        locationLogo,
                        height: 2.h,
                        color: kPrimaryblue,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        '${widget.subCategoriesServiceDetail.service!.address}',
                        style: TextStyle(
                          color: kPrimaryBlack5,
                          fontSize: 10.sp,
                          fontFamily: 'museo',
                        ),
                      ),
                      SizedBox(width: 2.w),
                      SvgPicture.asset(aadminLogo, color: kPrimaryblue),
                      SizedBox(width: 2.w),
                      Text(
                        '${widget.subCategoriesServiceDetail.service!.capicity}',
                        style: TextStyle(
                          color: kPrimaryBlack5,
                          fontSize: 10.sp,
                          fontFamily: 'museo',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                // ignore: prefer_const_constructors
                Divider(thickness: 1),
                SizedBox(height: 2.h),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Text(
                    '${widget.subCategoriesServiceDetail.service!.descriptionEn}',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: kPrimaryBlack5,
                      fontFamily: 'museo',
                    ),
                  ),
                ),
                SizedBox(height: 0.h),
                const Divider(
                  thickness: 1,
                ),
                SizedBox(height: 0.h),
                Container(
                  height: 20.h,
                  //color: Colors.red,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        widget.subCategoriesServiceDetail.service!.add!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20.0, left: 10),
                        child: InkWell(
                          onTap: () {
                            selectAddons[index] =
                                selectAddons[index] ? false : true;
                            setState(() {});
                          },
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                    globals.imageBaseUrl +
                                        widget.subCategoriesServiceDetail
                                            .service!.add![index].image
                                            .toString(),
                                    width: 8.h,
                                    height: 8.h,
                                    color: selectAddons[index]
                                        ? kPrimaryblue
                                        : Colors.grey),
                                SizedBox(height: 1.h),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      selectAddons[index] ? checkedICon : cross,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        selectAddons[index]
                                            ? 'Included'
                                            : "Excluded",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.grey,
                                          fontFamily: 'museo',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.h),
                                selectAddons[index]
                                    ? SizedBox()
                                    : Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        height: 5.h,
                                        decoration: BoxDecoration(
                                          color: kPrimaryblue,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Need " +
                                                widget
                                                    .subCategoriesServiceDetail
                                                    .service!
                                                    .add![index]
                                                    .title
                                                    .toString() +
                                                ' ?',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              color: kPrimaryWhite,
                                              fontFamily: 'museo',
                                            ),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => AddToCartScreen(
                                  selectAddons: selectAddons,
                                  selectAddonsId: selectAddonsId,
                                  subCategoriesServiceDetail:
                                      widget.subCategoriesServiceDetail)));
                    },
                    child: Container(
                      height: 7.h,
                      width: double.infinity.h,
                      decoration: BoxDecoration(
                        color: kPrimaryblue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Book Now for ${widget.subCategoriesServiceDetail.service!.amount}KWD',
                          style: TextStyle(
                            color: kPrimaryWhite,
                            fontSize: 12.sp,
                            fontFamily: 'museo',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class CSlider extends StatefulWidget {
  CSlider(
      {Key? key, required this.imgList, this.rating, required this.appBarIcon})
      : super(key: key);
  List<String>? imgList;
  String? rating;
  String appBarIcon;
  @override
  State<CSlider> createState() => _CSliderState();
}

class _CSliderState extends State<CSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  // final List<String> imgList = [
  //   // 'assets/images/downtown.png',
  //   // 'assets/images/downtown.png',
  //   // 'assets/images/downtown.png',
  //   // 'assets/images/downtown.png',
  //   // 'assets/images/downtown.png',
  // ];
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.imgList!
        .map((item) => Container(
              margin: EdgeInsets.only(bottom: 0.h, top: 0.h),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        imageBaseUrl + item,
                        fit: BoxFit.cover,
                        width: 100.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: kPrimaryBlack.withOpacity(0.1)),
                      ),
                      AppBar(
                        backgroundColor: Colors.transparent,
                        automaticallyImplyLeading: false,
                        elevation: 0,
                        title: SizedBox(
                          height: 7.h,
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
                                        color: Colors.transparent,
                                        height: 40,
                                        width: 40,
                                        child: SvgPicture.asset(backIcon))),
                                Text(
                                  '',
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                                Image.network(
                                    globals.imageBaseUrl + widget.appBarIcon,
                                    color: Colors.white)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 40.w,
                        bottom: 1.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              widget.imgList!.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 1.5.h,
                                height: 1.5.h,
                                margin: EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 1.w),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : kPrimaryWhite)
                                        .withOpacity(
                                            _current == entry.key ? 0.9 : 0.4)),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Positioned(
                        left: 80.w,
                        bottom: 1.h,
                        child: Container(
                          decoration: BoxDecoration(
                              color: kPrimaryWhite,
                              borderRadius: BorderRadius.circular(20)),
                          width: 12.w,
                          height: 4.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                widget.rating != null
                                    ? widget.rating.toString()
                                    : "0",
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
                        ),
                      )
                    ],
                  )),
            ))
        .toList();
    return Scaffold(
      body: Column(children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              viewportFraction: 1,
              aspectRatio: 10 / 7,
              enableInfiniteScroll: true,
              autoPlay: false,
              enlargeCenterPage: true,
              // aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ]),
    );
  }
}
