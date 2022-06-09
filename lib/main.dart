import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planners_plan/providers/appProvider.dart';
import 'package:planners_plan/providers/auth/authenti_repo.dart';
import 'package:planners_plan/providers/profile_auth/user_profile_provider.dart';
import 'package:planners_plan/providers/social_auth/google_signin.dart';
import 'package:planners_plan/providers/todo_list_provider.dart';

import 'package:planners_plan/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();

  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AppProvider()),
            ChangeNotifierProvider(create: (_) => AuthentiRepo()),
            ChangeNotifierProvider(create: (_) => ProfileRepo()),
            ChangeNotifierProvider(create: (_) => TodoListProvider()),
            ChangeNotifierProvider(create: (_) => SocailAuth()),
          ],
          child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Planners',
              theme: ThemeData.light(),
              home: const SplashScreen()),
        );
      },
    );
  }
}
