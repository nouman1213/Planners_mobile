import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planners_plan/providers/appProvider.dart';
import 'package:planners_plan/screens/bottomNavigation/ToDo/todo_list.dart';
import 'package:planners_plan/screens/bottomNavigation/Home/home_screen.dart';
import 'package:planners_plan/screens/bottomNavigation/profile_screen.dart';

import 'package:planners_plan/screens/const/colors.dart';
import 'package:planners_plan/screens/const/images.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  // static TextStyle optionStyle = const TextStyle(
  //     fontSize: 30, fontWeight: FontWeight.bold, color: kPrimaryBlack);

  static final List<Widget> _widgetOptions = <Widget>[
    //MainHomeScreen(),
    const HomeScreen(),
    TodoListScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    print(index);
    var appPro = Provider.of<AppProvider>(context, listen: false);
    setState(() {
      appPro.setBottomIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Consumer<AppProvider>(builder: (context, appPro, _) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          body: Center(
            child: _widgetOptions.elementAt(appPro.selectedIndex!),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  dotIcon,
                  color:
                      appPro.selectedIndex! == 0 ? kPrimaryGreen : Colors.grey,
                ),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  menuIcon,
                  color: kPrimaryGreen,
                ),
                icon: SvgPicture.asset(
                  bottomicon,
                  color:
                      appPro.selectedIndex! == 1 ? kPrimaryGreen : Colors.grey,
                ),
                label: 'To do list',
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(colorAdminLogo),
                icon: SvgPicture.asset(
                  profileIcon,
                  //color: _selectedIndex == 2 ? kPrimaryGreen : Colors.grey,
                ),
                label: 'profile',
              ),
            ],
            currentIndex: appPro.selectedIndex!,
            selectedItemColor: kPrimaryGreen,
            onTap: _onItemTapped,
          ),
        );
      }),
    );
  }
}
