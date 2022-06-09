import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planners_plan/models/user_profile.dart';
import 'package:planners_plan/providers/appProvider.dart';
import 'package:planners_plan/providers/profile_auth/user_profile_provider.dart';
import 'package:planners_plan/screens/bottomNavigation/bottom_navigation_screen.dart';
import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/widgets/custom_button.dart';
import 'package:planners_plan/widgets/text_field.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:planners_plan/services/SharedPref/globals.dart' as globals;

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  UserProfile? userProfile;

  var formKey = GlobalKey<FormState>();

  void imagePickerOption() {
    var aapPro = Provider.of<ProfileRepo>(context, listen: false);
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 35.h,
            child: Padding(
              padding: EdgeInsets.all(2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 12.sp, fontFamily: 'museo'),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryGreen)),
                    onPressed: () async {
                      await getFromCamera(context);
                      var result = await ProfileRepo().imageUpload(image!);

                      print(' uploadImageRespose ${result}');
                      setState(() async {
                        globals.userProfileObj =
                            await ProfileRepo().fetchUserProfile();
                      });
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text(
                      "CAMERA",
                      style: TextStyle(fontFamily: 'museo'),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryGreen)),
                    onPressed: () async {
                      await getFromGallery(context);
                      var result = await ProfileRepo().imageUpload(image!);
                      setState(() async {
                        globals.userProfileObj =
                            await ProfileRepo().fetchUserProfile();
                      });
                      print(' uploadImageRespose ${result}');
                      setState(() {});
                    },
                    icon: const Icon(Icons.image),
                    label: const Text(
                      "GALLERY",
                      style: TextStyle(
                        fontFamily: 'museo',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryGreen)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                    label: const Text(
                      "CANCEL",
                      style: TextStyle(fontFamily: 'museo'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Get from gallery
  File? image;
  final _picker = ImagePicker();
  XFile? pickedImage;
  Future getFromGallery(BuildContext context) async {
    pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage!.path);
    }

    Navigator.pop(context);
    setState(() {});
  }

  /// Get from Camera
  Future getFromCamera(BuildContext context) async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
    Navigator.pop(context);
    setState(() {});
  }

  @override
  void initState() {
    var aapPro = Provider.of<ProfileRepo>(context, listen: false);
    // TODO: implement initState
    super.initState();
    aapPro.nameC.text = globals.userProfileObj!.user!.fName.toString();
    aapPro.lastNameC.text = globals.userProfileObj!.user!.lName.toString();
    aapPro.phoneC.text = globals.userProfileObj!.user!.phone.toString();
    aapPro.addressC.text = globals.userProfileObj!.user!.address.toString();
    aapPro.locationC.text = globals.userProfileObj!.user!.location.toString();
  }

  @override
  Widget build(BuildContext context) {
    var aapPro = Provider.of<ProfileRepo>(context, listen: false);
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Update Profile',
              style: TextStyle(
                  color: kPrimaryWhite, fontSize: 12.sp, fontFamily: 'museo'),
            ),
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
          ),
          body: Stack(
            children: [
              Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //ImagePicker
                      Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: kPrimaryGreen, width: 1.w),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 65,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  backgroundColor: kPrimaryPurpal,
                                  radius: 69,
                                  backgroundImage: image == null
                                      ? null
                                      : FileImage(
                                          image!,
                                        ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 1.h,
                              child: IconButton(
                                onPressed: () {
                                  imagePickerOption();
                                },
                                icon: Icon(
                                  Icons.add_a_photo_outlined,
                                  color: Colors.white,
                                  size: 4.h,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      ///TextFields
                      Padding(
                        padding: EdgeInsets.only(top: 4.h),
                        child: TextFieldInput(
                            textEditingController: aapPro.nameC,
                            hintText: 'enter your first name',
                            textInputType: TextInputType.name,
                            error: 'name is required',
                            textInputAction: TextInputAction.next),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: TextFieldInput(
                            textEditingController: aapPro.lastNameC,
                            hintText: 'enter your last name',
                            textInputType: TextInputType.name,
                            error: 'last name is required',
                            textInputAction: TextInputAction.next),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: TextFieldInput(
                            textEditingController: aapPro.phoneC,
                            hintText: 'enter your phone number',
                            textInputType: TextInputType.number,
                            error: 'phone number is required',
                            textInputAction: TextInputAction.next),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: TextFieldInput(
                            textEditingController: aapPro.addressC,
                            hintText: 'enter your address',
                            textInputType: TextInputType.name,
                            error: 'address is required',
                            textInputAction: TextInputAction.next),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: TextFieldInput(
                            textEditingController: aapPro.locationC,
                            hintText: 'enter your location',
                            textInputType: TextInputType.name,
                            error: 'location is required',
                            textInputAction: TextInputAction.next),
                      ),
                      SizedBox(height: 2.h),
                      CustomButton(
                          title: 'Update Profile',
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              appPro.setLoadingTrue();

                              var result = await ProfileRepo()
                                  .updateUserProfile(
                                      aapPro.nameC.text.trim(),
                                      aapPro.lastNameC.text.trim(),
                                      aapPro.phoneC.text.trim(),
                                      aapPro.addressC.text.trim(),
                                      aapPro.locationC.text.trim());
                              if (result != null) {
                                if (result['status']) {
                                  appPro.setLoadingFalse();
                                  globals.userProfileObj =
                                      await ProfileRepo().fetchUserProfile();
                                  showSnackBar(
                                    "Success",
                                    result["success"],
                                  );

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const BottomNavigationBarScreen()));
                                } else {
                                  showSnackBar(
                                    "Success",
                                    result["message"],
                                  );
                                  appPro.setLoadingFalse();
                                }
                              } else {
                                showSnackBar(
                                  "Error",
                                  "Something went wrong. Try again later",
                                );
                                appPro.setLoadingFalse();
                              }
                            }
                          })
                    ],
                  ),
                ),
              ),
              appPro.isLoading
                  ? const Center(
                      child: SpinKitChasingDots(
                        color: kPrimaryGreen,
                      ),
                    )
                  : const SizedBox()
            ],
          ));
    }); // ignore: prefer_const_constructors
  }
}
