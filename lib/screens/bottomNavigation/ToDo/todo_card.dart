import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:sizer/sizer.dart';

class TodoCard extends StatefulWidget {
  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        // color: Colors.amber,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 1.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "",
              ),
              Row(
                children: [
                  Center(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        _value = !_value;
                      });
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: _value
                              // ignore: prefer_const_constructors
                              ? SvgPicture.asset(yellowBel)
                              // ignore: prefer_const_constructors
                              : SvgPicture.asset(uncekbel)),
                    ),
                  )),
                  SizedBox(width: 8.w),
                  Center(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        _value = !_value;
                      });
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: _value
                              // ignore: prefer_const_constructors
                              ? SvgPicture.asset(checkedICon)
                              // ignore: prefer_const_constructors
                              : SvgPicture.asset(uncheckedButton)),
                    ),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DoCard extends StatefulWidget {
  @override
  State<DoCard> createState() => _DoCardState();
}

class _DoCardState extends State<DoCard> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      onTap: () {
        setState(() {
          _value = !_value;
        });
      },
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Padding(
            padding: EdgeInsets.all(1.h),
            child: _value
                // ignore: prefer_const_constructors
                ? SvgPicture.asset(checkedICon)
                // ignore: prefer_const_constructors
                : SvgPicture.asset(uncheckedButton)),
      ),
    ));
  }
}
