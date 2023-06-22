import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:n8_default_project/ui/home/home_screen.dart';
import 'package:n8_default_project/ui/profile/profile_screen.dart';
import 'package:n8_default_project/ui/settings/settings_screen.dart';

class TabsBox extends StatefulWidget {
  const TabsBox({Key? key}) : super(key: key);

  @override
  State<TabsBox> createState() => _TabsBoxState();
}

class _TabsBoxState extends State<TabsBox> {
  int currentTabIndex = 0;

  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(HomeScreen());
    screens.add(SettingsScreen());
    screens.add(ProfileScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentTabIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                spreadRadius: 20,
                blurRadius: 25,
                color: Colors.grey.shade200,
              ),
            ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            elevation: 20,
            type: BottomNavigationBarType.fixed,
            // backgroundColor: Colors.black,
            // selectedIconTheme: IconThemeData(size: 50, color: Colors.yellow),
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            iconSize: 36,
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            // showSelectedLabels: true,
            onTap: (index) {
              setState(() {
                currentTabIndex = index;
              });
              print(index);
            },
            currentIndex: currentTabIndex,
            items: [
              getBottomNavItem(
                icon: Icons.home,
                label: "Home",
              ),
              getBottomNavItem(
                icon: Icons.settings,
                label: "Settings",
              ),
              getBottomNavItem(
                icon: Icons.person,
                label: "Profile",
              )
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   child: Icon(Icons.add),
      // ),
    );
  }

  BottomNavigationBarItem getBottomNavItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.red,
      activeIcon: Icon(
        icon,
        color: Colors.green,
      ),
      icon: Icon(icon),
      label: label,
    );
  }
}
