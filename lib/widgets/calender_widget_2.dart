import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';
import 'package:planners_plan/providers/appProvider.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CalenderWidget2 extends StatefulWidget {
  CalenderWidget2(
      {Key? key,
      required this.title,
      required this.date,
      required this.dateTimeOnChanged})
      : super(key: key);
  String title;
  String date;
  Function(DateTime) dateTimeOnChanged;
  @override
  State<CalenderWidget2> createState() => _CalenderWidget2State();
}

class _CalenderWidget2State extends State<CalenderWidget2> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appPro, child) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(00),
          color: Colors.grey[200],
        ),
        height: 0.h,
        margin: EdgeInsets.only(left: 1.h, right: 1.h),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 0.w),
                  height: 15.h,
                  color: Colors.grey[200],
                  child: Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.title,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontFamily: 'museo',
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                widget.date,
                                style: TextStyle(
                                    color: kPrimaryBlack5,
                                    fontFamily: 'museo',
                                    fontSize: 10.sp),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TimePickerSpinner(
                    is24HourMode: false,
                    normalTextStyle: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: 'museo',
                        color: Colors.grey),
                    highlightedTextStyle: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: 'museo',
                        color: Colors.black),
                    spacing: 5.w,
                    itemHeight: 7.h,
                    isForce2Digits: true,
                    onTimeChange: widget.dateTimeOnChanged,
                  ),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
