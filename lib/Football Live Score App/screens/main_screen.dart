import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Football%20Live%20Score%20App/Screens/app_home_screen.dart';
import 'package:flutter_ui_design/Football%20Live%20Score%20App/constants.dart';
import 'package:iconsax/iconsax.dart'; // this is a package you need to add first

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int currentTab = 0;
  final List<Widget> screens = [
    const AppHomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];
  final icons = [
    Iconsax.home,
    Iconsax.calendar_1,
    Iconsax.chart,
    Icons.person_outline
  ];
  final titles = [
    "Home",
    "Calendar",
    "Standing",
    "Account",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.015),
              blurRadius: 8,
              spreadRadius: 5,
            ),
          ],
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            return MyBottomNavBarItems(
              title: titles[index],
              icon: icons[index],
              isActive: currentTab == index,
              onTab: () => setState(() => currentTab = index),
            );
          }),
        ),
      ),
      body:  screens[currentTab],
    );
  }
}

class MyBottomNavBarItems extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function() onTab;
  final IconData icon;
  const MyBottomNavBarItems({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTab,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive ? kprimaryColor : Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : Colors.grey.shade400,
            ),
            if (isActive)
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              )
          ],
        ),
      ),
    );
  }
}
