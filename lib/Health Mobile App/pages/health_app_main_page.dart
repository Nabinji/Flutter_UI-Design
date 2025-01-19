import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Health%20Mobile%20App/pages/doctor_schude_screen.dart';
import 'package:flutter_ui_design/Health%20Mobile%20App/pages/health_app_home_page.dart';
import 'package:flutter_ui_design/Health%20Mobile%20App/utils/color.dart';
import 'package:iconsax/iconsax.dart';

class HealthAppMainPage extends StatefulWidget {
  const HealthAppMainPage({super.key});

  @override
  State<HealthAppMainPage> createState() => _HealthAppMainPageState();
}

class _HealthAppMainPageState extends State<HealthAppMainPage> {
  int selectedIndex = 0;
  final List pages = [
    const HealthAppHomePage(),
    const DoctorScheduleScreen(),
    const Scaffold(),
    const Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black26,
        selectedItemColor:kPrimaryColor,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home5),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.calendar_1),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.message),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "",
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
