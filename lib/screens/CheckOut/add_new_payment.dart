import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planners_plan/screens/CheckOut/payment_status.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:planners_plan/widgets/text_field2.dart';
import 'package:sizer/sizer.dart';

class AddNewPayment extends StatelessWidget {
  AddNewPayment({Key? key}) : super(key: key);
  TextEditingController nameC = TextEditingController();
  TextEditingController numberC = TextEditingController();
  TextEditingController expC = TextEditingController();
  TextEditingController ccvC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
          height: 12.h,
          child: Padding(
            padding: EdgeInsets.all(1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  'Add New Payment',
                  style: TextStyle(fontSize: 12.sp, fontFamily: "museo"),
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(1.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 5.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kPrimaryWhite,
                ),
                height: 40.h,
                width: 100.w,
                child: Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Column(
                    children: [
                      TextFieldInput2(
                          textEditingController: nameC,
                          hintText: 'Card Holder Full Name',
                          textInputType: TextInputType.name),
                      SizedBox(height: 2.h),
                      TextFieldInput2(
                          textEditingController: numberC,
                          hintText: 'Credit Card Number',
                          textInputType: TextInputType.number),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Expanded(
                            child: TextFieldInput2(
                                textEditingController: expC,
                                hintText: 'Exp date',
                                textInputType: TextInputType.number),
                          ),
                          Expanded(
                            child: TextFieldInput2(
                                textEditingController: ccvC,
                                hintText: 'CCV',
                                textInputType: TextInputType.number),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const PaymentStatus()));
                },
                child: Container(
                  height: 7.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kPrimaryblue,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      'Done',
                      style: TextStyle(
                        color: Colors.white,
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
    );
  }
}
