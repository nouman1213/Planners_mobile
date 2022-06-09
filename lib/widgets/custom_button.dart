import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  Function() onTap;
  final String? title;

  CustomButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 8.h,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Color(0xff7628A2),
                  Color(0xff27A49A),
                ],
              ),
              borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: Text(
              title!,
              style: TextStyle(
                  color: Colors.white, fontFamily: 'museo', fontSize: 14.sp),
            ),
          ),
        ),
      ),
    );
  }
}
