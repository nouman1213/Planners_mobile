import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planners_plan/models/category_model.dart';
import 'package:planners_plan/providers/appProvider.dart';
import 'package:planners_plan/providers/category/category_Repo.dart';
import 'package:planners_plan/providers/category/category_repo.dart' as catRepo;
import 'package:planners_plan/screens/bottomNavigation/Home/home_screen_items.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:planners_plan/widgets/cs_slider.dart';
import 'package:planners_plan/widgets/drawer_function.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchC = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  CategoryList? categoryList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchCatgoryList();
  }

  fetchCatgoryList() async {
    categoryList = await CategoryRepo().fetchCategoryList();
    // debugPrint("AAAAAA: {categoryList.toString()}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Scaffold(
        // backgroundColor: Colors.red,
        key: scaffoldKey,
        appBar: AppBar(
          toolbarHeight: 12.h,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff1A83A5),
                  Color(0xff7628A2),
                ],
              ),
            ),
          ),
          title: Container(
            decoration: BoxDecoration(
                color: kPrimaryWhite, borderRadius: BorderRadius.circular(30)),
            height: 6.h,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(gradientLogo),
                  SizedBox(width: 8.w),
                  Container(
                    height: 30,
                    width: 120,
                    child: Center(
                        child: TextFormField(
                      onChanged: (value) async {
                        if (value.isEmpty) {
                          fetchCatgoryList();
                        } else if (value.isNotEmpty) {
                          categoryList = await catRepo.CategoryRepo()
                              .fetchSearchCategory(value);
                          setState(() {});
                        }
                        setState(() {});
                      },
                      controller: appPro.searchC,
                      decoration: const InputDecoration(
                          hintText: 'Search Planners',
                          contentPadding: EdgeInsets.symmetric(vertical: 4),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    )),
                  ),
                ],
              ),
            ),
          ),
          leading: IconButton(
            icon: SvgPicture.asset(drawerIcon),
            onPressed: () async {
              scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        drawer: DrawerFunction(),
        body: SizedBox(
          // height: double.infinity,
          // width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(height: 42.h, child: const CSlider()),
                Container(
                  color: Colors.white,
                  height: 38.h,
                  child: categoryList != null
                      ? HomeScreenItems(
                          categoryList: categoryList,
                        )
                      : const Center(
                          child: SpinKitChasingDots(
                            color: kPrimaryGreen,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
