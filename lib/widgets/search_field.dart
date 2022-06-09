import 'package:flutter/material.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:sizer/sizer.dart';

class SearchField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  const SearchField({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: Divider.createBorderSide(context),
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.h),
      child: Row(
        children: [
          Container(
            height: 10.h,
            width: 70.w,
            child: TextFormField(
              controller: textEditingController,
              decoration: InputDecoration(
                fillColor: kPrimaryWhite,
                hintText: hintText,
                border: inputBorder,
                focusedBorder: inputBorder,
                enabledBorder: inputBorder,
                filled: true,
                contentPadding: EdgeInsets.all(2.h),
              ),
              keyboardType: textInputType,
              obscureText: isPass,
            ),
          ),
        ],
      ),
    );
  }
}
