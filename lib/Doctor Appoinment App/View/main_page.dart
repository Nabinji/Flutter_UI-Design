import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'home_page.dart';
import 'schedule_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  final List pages = [
    const DoctorAppoinHomePage(),
    const Scaffold(),
    const SchedulePage(),
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
        selectedItemColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.home5,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.message,
            ),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Iconsax.calendar,
            ),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: "Setting",
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
