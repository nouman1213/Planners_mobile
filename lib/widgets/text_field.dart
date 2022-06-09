import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextFieldInput extends StatelessWidget {
  final String error;
  final TextEditingController textEditingController;
  final bool isPass;
  final bool isShow;
  final String hintText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Function()? onTapIcon;
  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    this.isShow = false,
    this.onTapIcon,
    required this.hintText,
    required this.textInputType,
    required this.error,
    required this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: Divider.createBorderSide(context),
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 5.h),
      child: Container(
        child: TextFormField(
          controller: textEditingController,
          validator: (value) {
            if (value!.isEmpty) {
              return error;
            }
          },
      
          decoration: InputDecoration(
            suffixIcon: isPass
                ? InkWell(
                    onTap: onTapIcon,
                    child:
                        Icon(isShow ? Icons.visibility_off : Icons.visibility))
                : null,
            hintText: hintText,
            border: inputBorder,
            focusedBorder: inputBorder,
            enabledBorder: inputBorder,
            filled: true,
            contentPadding: EdgeInsets.only(left: 5.w, top: 2.h, bottom: 1.h),
          ),
          keyboardType: textInputType,
          obscureText: isShow,
        ),
      ),
    );
  }
}
