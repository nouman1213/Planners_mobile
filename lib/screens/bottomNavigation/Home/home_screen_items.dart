import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:planners_plan/models/category_model.dart';
import 'package:planners_plan/models/sub_category_model.dart';
import 'package:planners_plan/providers/appProvider.dart';
import 'package:planners_plan/providers/category/category_repo.dart';
import 'package:planners_plan/screens/bottomNavigation/Home/subCategor_screen.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/services/SharedPref/globals.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreenItems extends StatelessWidget {
  HomeScreenItems({Key? key, this.categoryList}) : super(key: key);
  CategoryList? categoryList;
  // SubCategoryServices? specificCategoryServices;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Stack(
        children: [
          categoryList!.category!.isNotEmpty
              ? GridView.builder(
                  shrinkWrap: true,
                  itemCount: categoryList!.category!.length,
                  itemBuilder: (BuildContext context, int index) =>
                      CatgoryListWidget(
                    category: categoryList!.category![index],
                    onTap: () async {
                      //call categiory detail here
                      appPro.setLoadingTrue();
                      SubCategories subCategories =
                          await CategoryRepo().fetchSubCategory(
                              categoryList!.category![index].id.toString());
                      if (subCategories != null) {
                        // print(subCategoryServices);
                        appPro.setLoadingFalse();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SubCategoryScreen(
                                    subCategories: subCategories)));
                      } else {
                        appPro.setLoadingFalse();
                      }
                    },
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                  ),
                )
              : const Center(
                  child: Text("No Catgeory Found"),
                ),
          appPro.isLoading
              ? const Center(
                  child: SpinKitChasingDots(
                    color: kPrimaryGreen,
                  ),
                )
              : const SizedBox()
        ],
      );
    });
  }
}

//   return InkWell(
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: kPrimaryWhite,
//           ),
//           height: 17.h,
//           width: 17.h,
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(height: 8.h, width: 8.h, child: Image),
//                 Padding(
//                   padding: EdgeInsets.only(top: 1.h, left: 1.h, right: 1.h),
//                   child: Text(
//                     title,
//                     style: TextStyle(fontSize: 10.sp),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
class CatgoryListWidget extends StatelessWidget {
  final category;
  final Function() onTap;
  const CatgoryListWidget(
      {Key? key, required this.category, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Card(
          color: Colors.white,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      image: DecorationImage(
                    image: NetworkImage(imageBaseUrl + category.iconImage!),
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "${category.title}",
                  style: TextStyle(fontSize: 1.5.h, fontFamily: 'museo'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
