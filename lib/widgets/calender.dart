import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:sizer/sizer.dart';

class CalenderWidget extends StatefulWidget {
  CalenderWidget(
      {Key? key,
      required this.title,
      required this.date,
      required this.datePickOnTap,
      required this.dateTimeOnChanged})
      : super(key: key);
  String title;
  DateTime date;
  Function() datePickOnTap;
  Function(DateTime) dateTimeOnChanged;
  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  DateTime? _dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(00),
        color: Colors.white,
      ),
      height: 0.h,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 0.w),
                height: 15.h,
                color: Colors.white,
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
                            InkWell(
                              onTap: widget.datePickOnTap,
                              child: Text(
                                DateFormat('EEE d MMM').format(widget.date),
                                style: TextStyle(
                                    color: kPrimaryBlack5,
                                    fontFamily: 'museo',
                                    fontSize: 10.sp),
                              ),
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
                      fontSize: 12.sp, fontFamily: 'museo', color: Colors.grey),
                  highlightedTextStyle: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'museo',
                      color: Colors.black),
                  spacing: 7.w,
                  itemHeight: 5.h,
                  isForce2Digits: true,
                  onTimeChange: widget.dateTimeOnChanged,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
