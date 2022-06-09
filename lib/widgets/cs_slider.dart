import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:sizer/sizer.dart';

class CSlider extends StatefulWidget {
  const CSlider({Key? key}) : super(key: key);

  @override
  State<CSlider> createState() => _CSliderState();
}

class _CSliderState extends State<CSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    'assets/images/sliderImage.png',
    'assets/images/sliderImage.png',
    'assets/images/sliderImage.png',
    'assets/images/sliderImage.png',
    'assets/images/sliderImage.png',
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              // color: Colors.red,
              margin: const EdgeInsets.all(0.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item, fit: BoxFit.cover, width: 50.h),
                      Positioned(
                        bottom: 0.0,
                        left: 0.h,
                        right: 0,
                        child: Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          alignment: Alignment.centerLeft,
                          height: 60,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                kPrimaryGreen.withOpacity(0.7),
                                kPrimaryBlack.withOpacity(0.2),
                              ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight)),
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Book the best Catering\nin Town for your wedding',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontFamily: 'museo',
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: Column(children: [
          CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                // reverse: true,
                // height: 250,

                enlargeCenterPage: true,
                aspectRatio: 2,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : kPrimaryGreen)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ]),
      ),
    );
  }
}
