import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:planners_plan/models/todo_list_model.dart';
import 'package:planners_plan/providers/appProvider.dart';
import 'package:planners_plan/providers/todo_list_provider.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:planners_plan/widgets/calender_widget_2.dart';
import 'package:planners_plan/widgets/drawer_function.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool? error = false;
// ++++++++ Show Dialog Function ++++++++ //
  Future<dynamic> showDialogBox(
      BuildContext context, String date1, String date2) async {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: Divider.createBorderSide(context),
    );

    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setStates) {
            return Consumer<AppProvider>(builder: (context, appPro, child) {
              return SingleChildScrollView(
                child: Dialog(
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(20.0)), //this right here
                  child: SizedBox(
                    // height: 80.h,
                    width: double.infinity,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 10.h,
                            color: kPrimaryblue,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.h, horizontal: 0.1.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  SvgPicture.asset(menuIcon),
                                  SizedBox(
                                    width: 14.w,
                                  ),
                                  const Text(
                                    'Add new To do list',
                                    style: TextStyle(
                                      color: kPrimaryWhite,
                                      fontFamily: 'museo',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  InkWell(
                                      onTap: () => Navigator.pop(context),
                                      child: SvgPicture.asset(cancal)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.h),
                            child: TextFormField(
                              controller: appPro.nameC,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ' please enter title';
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Title',
                                border: inputBorder,
                                focusedBorder: inputBorder,
                                enabledBorder: inputBorder,
                                filled: true,
                                contentPadding: EdgeInsets.only(left: 6.w),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w),
                            // ignore: prefer_const_constructors
                            child: Padding(
                              padding: EdgeInsets.all(1.h),
                              child: const Text(
                                'Reminds me at',
                                style: TextStyle(
                                  color: kPrimaryblue,
                                  fontFamily: 'museo',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.grey[100],
                            height: 21.h,
                            child: CalenderWidget2(
                              title: "Today",
                              date: date1,
                              dateTimeOnChanged: (time) {
                                setState(() {
                                  setStates(() {
                                    appPro.dateTimeToday = time;
                                  });
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            color: Colors.grey[100],
                            height: 21.h,
                            child: CalenderWidget2(
                              title: "Tomorrow",
                              date: date2,
                              dateTimeOnChanged: (time) {
                                setState(() {
                                  setStates(() {
                                    appPro.dateTimeTomorrow = time;
                                  });
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w, right: 5.w),
                            child: SizedBox(
                              height: 3.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio<String>(
                                    activeColor: kPrimaryblue,
                                    value: 'alert',
                                    groupValue: appPro.alert,
                                    onChanged: (value) {
                                      setState(() {
                                        setStates(() {
                                          appPro.alert = value!;
                                        });
                                      });
                                    },
                                  ),
                                  SvgPicture.asset(yellowBel),
                                  const Text(
                                    'Alert Me',
                                    style: TextStyle(
                                      color: kPrimaryblue,
                                      fontFamily: 'museo',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Radio<String>(
                                    activeColor: kPrimaryblue,
                                    value: 'silent',
                                    groupValue: appPro.alert,
                                    onChanged: (value) {
                                      setState(() {
                                        setStates(() {
                                          appPro.alert = value!;
                                        });
                                      });
                                    },
                                  ),
                                  SvgPicture.asset(uncekbel),
                                  const Text(
                                    'Silent',
                                    style: TextStyle(
                                      color: kPrimaryblue,
                                      fontFamily: 'museo',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.h),
                            child: SizedBox(
                              height: 5.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.pop(context),
                                    child: Container(
                                      height: 15.h,
                                      width: 15.h,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                            color: kPrimaryWhite,
                                            fontFamily: 'museo',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        appPro.setLoadingTrue();
                                        Navigator.pop(context);

                                        var result = await TodoListProvider()
                                            .createTodo(
                                                appPro.nameC.text.trim(),
                                                appPro.dateTimeToday.toString(),
                                                appPro.dateTimeTomorrow
                                                    .toString(),
                                                appPro.alert == "silent"
                                                    ? "0"
                                                    : "1");
                                        if (result != null) {
                                          // if (result['success'] == true) {
                                          //   showSnackBar("Success", result["message"],
                                          //       Colors.grey, Colors.black);
                                          appPro.setLoadingFalse();
                                          appPro.nameC.clear();

                                          showSnackBar(
                                            "Success",
                                            "Task added successfully",
                                          );
                                          fetchToD();
                                          setState(() {
                                            setStates(() {});
                                          });
                                        } else {
                                          showSnackBar(
                                            "Error",
                                            "Something went wrong. Try again later",
                                          );
                                          appPro.setLoadingFalse();
                                          setState(() {
                                            setStates(() {});
                                          });
                                        }
                                        setState(() {
                                          setStates(() {});
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: 15.h,
                                      width: 15.h,
                                      decoration: BoxDecoration(
                                        color: kPrimaryblue,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Add",
                                          style: TextStyle(
                                            color: kPrimaryWhite,
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
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
          });
        });
  }

  TODOListViewModel? todoList;

  @override
  void initState() {
    super.initState();
    fetchToD();
  }

  fetchToD() async {
    loading = true;
    todoList = await TodoListProvider().fetchTodoList();
    loading = false;
    debugPrint("AAAAAA: ${todoList.toString()}");
    setState(() {});
  }

  bool? loading = false;
  bool _value = false;
  bool _value1 = false;
  var title = 'loading.....';
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTodayDate = DateFormat('EEE d MMM').format(now);
    String formattedTomorrowDate =
        DateFormat('EEE d MMM').format(now.add(const Duration(days: 1)));
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Scaffold(
        drawer: DrawerFunction(),
        key: scaffoldKey,
        backgroundColor: Colors.grey[200],
        floatingActionButton: DraggableFab(
          child: FloatingActionButton(
            backgroundColor: kPrimaryblue,
            onPressed: () {
              showDialogBox(context, formattedTodayDate, formattedTomorrowDate);
            },
            child: Icon(
              Icons.add,
              size: 30.sp,
            ),
          ),
        ),
        body: Column(children: [
          //CUstomeAppBar
          Container(
              color: Colors.amber,
              height: 15.h,
              child: Stack(
                children: [
                  Container(
                    height: 15.h,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xff1A83A5),
                        Color(0xff7628A2),
                      ],
                    )),
                    child: Padding(
                      padding: EdgeInsets.only(top: 3.h, left: 3.h),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                scaffoldKey.currentState?.openDrawer();
                              },
                              child: SvgPicture.asset(drawerIcon)),
                          SizedBox(
                            width: 30.w,
                          ),
                          Text(
                            'To do list',
                            style: TextStyle(
                                color: kPrimaryWhite,
                                fontSize: 10.sp,
                                fontFamily: 'museo'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
              // child: FutureBuilder(
              //   future: fetchToD(),
              //   builder: (context, snapshot) {
              child: Container(
            alignment: Alignment.center,

            // color: Colors.red,
            child: !loading!
                ? ListView.builder(
                    itemCount: todoList!.toDoList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var todolistTemp = todoList;
                      return Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 1.5.h),
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        width: 100.w,
                        height: 10.h,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${todolistTemp!.toDoList![index].title}",
                                    style: TextStyle(
                                        decoration: todolistTemp
                                                    .toDoList![index].status ==
                                                "1"
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none),
                                  )
                                ]),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // setState(() {
                                    //   _value1 = !_value1;
                                    // });
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        // shape: BoxShape.circle,
                                        ),
                                    child: Padding(
                                        padding: EdgeInsets.all(0.h),
                                        child: todolistTemp
                                                    .toDoList![index].alert ==
                                                "1"
                                            // ignore: prefer_const_constructors
                                            ? SvgPicture.asset(yellowBel)
                                            // ignore: prefer_const_constructors
                                            : SvgPicture.asset(
                                                yellowBel,
                                                color: Colors.grey[400],
                                              )),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                InkWell(
                                  onTap: () async {
                                    setState(() {
                                      loading = true;
                                    });
                                    await TodoListProvider().todoSatatus(
                                        todolistTemp.toDoList![index].id
                                            .toString());

                                    // setState(() {
                                    //   loading = false;
                                    // });
                                    fetchToD();
                                    setState(() {});
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: todolistTemp
                                                  .toDoList![index].status ==
                                              "1"
                                          // ignore: prefer_const_constructors
                                          ? SvgPicture.asset(checkedICon)
                                          // ignore: prefer_const_constructors
                                          : SvgPicture.asset(uncheckedButton)),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  )
                : loading!
                    ? const Center(
                        child: SpinKitChasingDots(
                          color: kPrimaryGreen,
                        ),
                      )
                    : const SizedBox(),
          )
              //   },
              // ),
              ),
        ]),
      );
    });
  }
}
